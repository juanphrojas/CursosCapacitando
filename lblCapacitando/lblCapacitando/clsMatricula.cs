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
    class clsMatricula
    {
        #region propiedades

        public int Codigo { get; set; }
        public int idCliente { get; set; }
        public DateTime FechaMatricula { get; set; }
        public List<int> ListaProgramacion  { get; set; }
        public int idProgramacion { get; set; }
        public int idEmpleado { get; set; }
        private string strApp;
        private string strSQL;
        public string strError { get; private set; }
        private DataSet Myds;
        private DataTable Mydt;
        private SqlDataReader MyReader;
        #endregion

        #region constructor
        public clsMatricula(string Aplicacion)
        {
            Codigo = 0;
            idEmpleado = 0;
            idCliente = 0;
            FechaMatricula = new DateTime();
            idProgramacion = 0;
            ListaProgramacion = new List<int>();

            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }

        public clsMatricula(string Aplicacion,  int _idEmpleado, int _idCLiente, DateTime _FechaMatricula, List<int> _ListaProgramacion)
        {
            Codigo = 0;
            idEmpleado = _idEmpleado;
            idCliente = _idCLiente;
            FechaMatricula = _FechaMatricula;
            idProgramacion = 0;
            ListaProgramacion = _ListaProgramacion;

            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }
        #endregion

        #region metodos privados
        private bool ValidarDatos()
        {
            try
            {
                if (idEmpleado <= 0)
                {
                    strError = "Empleado no valido";
                    return false;
                }
                if (idCliente <= 0)
                {
                    strError = "Cliente no valido";
                    return false;
                }
                if (ListaProgramacion == null)
                {
                    strError = "Debe tener al menos un programa para matricular";
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

        private bool ValidarModificar()
        {
            if (Codigo <= 0)
            {
                strError = "El codigo no es valido";
                return false;
            }
            return true;
        }

        private bool ValidarAplicacion()
        {
            if (string.IsNullOrEmpty(strApp))
            {
                strError = "Falta el nombre de la aplicacion";
                return false;
            }
            return true;
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
        public bool BuscarMatricula(string _Codigo, GridView grid)
        {
            try
            {
                strSQL = "exec USP_MATricula_BuscarXCodigo '" + _Codigo + "';";
                clsConexionBD objCnx = new clsConexionBD(strApp);
                objCnx.SQL = strSQL;
                if (!objCnx.LlenarDataSet(false))
                {
                    strError = objCnx.Error;
                    objCnx.CerrarCnx();
                    objCnx = null;
                    return false;
                }

                Myds = objCnx.DataSet_Lleno;
                objCnx = null;
                //Leer desde el Primer DataTable
                Mydt = Myds.Tables[0];
                if (Mydt.Rows.Count <= 0)
                {
                    strError = "No existe el cliente con cedula: " + _Codigo;
                    Myds.Clear();
                    Myds = null;
                    return false;

                }
                //Recuperar info desde el Primer DataTable
                foreach (DataRow dr in Mydt.Rows)
                {
                    Codigo = Convert.ToInt32(dr[0]);
                    idCliente = Convert.ToInt32(dr[1]);
                    FechaMatricula = Convert.ToDateTime(dr[2]);
                    idEmpleado = Convert.ToInt32(dr[3]);
                }
                Mydt.Clear();
                //Llenar el Grid
                Mydt = Myds.Tables[1];
                grid.DataSource = Mydt;
                grid.DataBind();
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

                strSQL = "exec USP_MATricula_Grabar '" + idCliente + "','" + FechaMatricula + "';";

                if (!Grabar())
                    return false;


                for (int i = 0; i < ListaProgramacion.Count; i++)
                {
                    strSQL = "exec USP_MATricula_GrabarProgramacion '" + Codigo + "','" + ListaProgramacion[i] + "','" + idEmpleado + "';";
                    if (!Grabar())
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

        public bool Modificar()
        {
            try
            {
                if (!ValidarDatos())
                    return false;
                if (!ValidarModificar())
                    return false;
                strSQL = "exec USP_CURso_Modificar '" + Codigo + "','" + idCliente + "','" + FechaMatricula +"';";
                return Grabar();
            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return false;
            }
        }

        public bool AgregarTema()
        {
            try
            {
                if (!ValidarDatos())
                    return false;

                strSQL = "exec USP_MATricula_GrabarProgramacion '" + Codigo + "','" + idProgramacion + "','" + idEmpleado + "';";

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

                strSQL = "exec USP_CURso_BuscarGeneral;";
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
