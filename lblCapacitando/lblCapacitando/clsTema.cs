using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Web;

using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibLlenarCombos;
using LibConexionBD;
using LibLlenarGrids;
using System.Data;

namespace lblCapacitando
{
    class clsTema
    {
        #region propiedades
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        private string strApp;
        private string strSQL;
        public string strError { get; private set; }
        private DataSet Myds;
        private DataTable Mydt;
        private SqlDataReader MyReader;
        #endregion

        #region constructor
        public clsTema(string Aplicacion)
        {
            Codigo = 0;
            Nombre = string.Empty;
            Descripcion = string.Empty;
            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }

        public clsTema(string Aplicacion, int _Codigo, string _Nombre, string _Descripcion)
        {
            Codigo = _Codigo;
            Nombre = _Nombre;
            Descripcion = _Descripcion;
            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }
        #endregion

        #region metodos privados
        private bool ValidarAplicacion()
        {
            if (string.IsNullOrEmpty(strApp))
            {
                strError = "Falta el nombre de la aplicacion";
                return false;
            }
            return true;
        }

        private bool ValidarDatos()
        {
            try
            {
                if (string.IsNullOrEmpty(Nombre))
                {
                    strError = "Falta el nombre";
                    return false;
                }


                if (string.IsNullOrEmpty(Descripcion))
                {
                    strError = "Falta la descripcion";
                    return false;
                }


                return true;

            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return false;
            }
        }

        private bool Grabar()
        {
            try
            {
                if (!ValidarAplicacion())
                    return false;
                clsConexionBD objCnx = new clsConexionBD(strApp);
                objCnx.SQL = strSQL;

                if (!objCnx.ConsultarValorUnico(false))
                {
                    strError = objCnx.Error;
                    objCnx.CerrarCnx();
                    objCnx = null;
                    return false;
                }

                Codigo = Convert.ToInt32(objCnx.VrUnico);
                objCnx.CerrarCnx();
                objCnx = null;
                return true;
            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return false;
            }
        }
        #endregion

        #region metodos publicos
        public bool BuscarTema(string _Codigo)
        {
            try
            {
                strSQL = "exec USP_TIpoMAscota_BuscarXCodigo '" + _Codigo + "';";
                clsConexionBD cnb = new clsConexionBD(strApp);
                cnb.SQL = strSQL;
                if (!cnb.Consultar(false))
                {
                    strError = cnb.Error;
                    cnb.CerrarCnx();
                    cnb = null;
                    return false;
                }

                MyReader = cnb.DataReader_Lleno;
                if (!MyReader.HasRows)// el hasrows es para decir si tiene o no tiene registro
                {
                    strError = "No existe registro para el codigo: " + _Codigo;
                    cnb.CerrarCnx();
                    cnb = null;
                    return false;
                }

                MyReader.Read();
                Codigo = MyReader.GetInt32(0);
                Nombre = MyReader.GetString(1);
                Descripcion = MyReader.GetString(2);
                MyReader.Close();
                return true;
            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return false;
            }
        }

        public bool insertar()
        {
            try
            {
                if (!ValidarDatos())
                    return false;
                strSQL = "exec USP_TIpoMAscota_Grabar '" + Tipo + "','" + idEmpleado + "';";
                if (!Grabar())
                    return false;

                return true;
            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return false;
            }
        }

        public bool Modificar()
        {
            try
            {
                if (!ValidarDatos())
                    return false;
                strSQL = "exec USP_TIpoMAscota_Modificar '" + Codigo + "','" + Tipo + "','" + idEmpleado + "';";
                return Grabar();
            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return false;
            }
        }

        public bool LlenarGrid(GridView grid)
        {
            try
            {
                if (!ValidarAplicacion())
                    return false;
                if (grid == null)
                {
                    strError = "Sin grid  a llenar";
                    return false;
                }

                strSQL = "exec USP_TIpoMAscota_BuscarGeneral;";
                clsLlenarGrids objxx = new clsLlenarGrids(strApp);
                objxx.SQL = strSQL;
                if (!objxx.LlenarGrid_Web(grid))
                {
                    strError = objxx.Error;
                    objxx = null;
                    return false;
                }

                objxx = null;
                return true;
            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return false;
            }
        }
        #endregion
    }
}
