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

namespace WebCursosCapacitando
{
    class clsCurso
    {
        #region propiedades

        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public float Costo  { get; set; }
        public DateTime Fecha { get; set; }
        public int Horas { get; set; }
        public int idEmpleado { get; set; }
        public int idTema { get; set; }
        public string NombreEmpleado { get; set; }
        private string strApp;
        private string strSQL;
        public string strError { get; private set; }
        private DataSet Myds;
        private DataTable Mydt;
        private SqlDataReader MyReader;
        #endregion

        #region constructor
        public clsCurso(string Aplicacion)
        {
            Codigo = 0;
            Nombre = string.Empty;
            Costo = 0;
            Fecha = new DateTime();
            Horas = 0;
            idEmpleado = 0;
            idTema = 0;
            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }

        public clsCurso(string Aplicacion,  string _Nombre, float _Costo, int _Horas, int _Empleado, int _idTema)
        {
            Codigo = 0;
            Nombre = _Nombre;
            Costo = _Costo;
            Fecha = new DateTime();
            Horas = _Horas;
            idEmpleado = _Empleado;
            idTema = _idTema;
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

                
                if (idEmpleado <= 0)
                {
                    strError = "El empleado seleccionado no es valido";
                    return false;
                }
        
                if (Costo <= 0)
                {
                    strError = "El csoto no es valido";
                    return false;
                }
               
                if (Horas <= 0)
                {
                    strError = "El numero de horas no es valido";
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

        private bool ValidarAgregarTema()
        {
            if (idTema <= 0)
            {
                strError = "El tema no es valido";
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
        public bool BuscarCurso(int _Codigo, GridView grid)
        {
            try
            {
                strSQL = "exec USP_CURso_BuscarXCodigo '" + _Codigo + "';";
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
                    strError = "No existe el curso con codigo: " + _Codigo;
                    Myds.Clear();
                    Myds = null;
                    return false;

                }
                //Recuperar info desde el Primer DataTable
                foreach (DataRow dr in Mydt.Rows)
                {
                    Codigo = Convert.ToInt32(dr[0]);
                    Nombre = dr[1].ToString();
                    Fecha = Convert.ToDateTime(dr[2]);
                    Costo = Convert.ToSingle( dr[3]);
                    Horas = Convert.ToInt32(dr[4]);
                    idEmpleado = Convert.ToInt32(dr[5]);
                    NombreEmpleado = dr[6].ToString();
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

        public bool Insertar()
        {
            try
            {
                if (!ValidarDatos())
                    return false;
                if (!ValidarAgregarTema())
                    return false;

                strSQL = "exec USP_CURso_Grabar '" + Nombre + "','" + Costo + "','" + Horas + "','" + idEmpleado + "';";

                if (!Grabar())
                    return false;

                AgregarTema();              

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
                if (!ValidarModificar())
                    return false;
                
                strSQL = "exec USP_CURso_Modificar '" + Codigo + "','" + Nombre + "','"  + Costo + "','" + Horas + "','" + idEmpleado + "';";
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
                if (!ValidarModificar())
                    return false;
                if (!ValidarAgregarTema())
                    return false;

                strSQL = "exec USP_CURso_GrabarTema '" + Codigo + "','" + idTema +  "';";

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

        public bool LlenarCombo(DropDownList Combo)
        {
            try
            {
                if (!ValidarAplicacion())
                    return false;
                if (Combo == null)
                {
                    strError = "Sin Combo a Llenar";
                    return false;
                }
                strSQL = "exec USP_CURso_LlenarCombo;";
                clsLlenarCombos objXX = new clsLlenarCombos(strApp);
                objXX.SQL = strSQL;
                objXX.CampoID = "Clave";
                objXX.CampoTexto = "Dato";
                if (!objXX.LlenarCombo_Web(Combo))
                {
                    strError = objXX.Error;
                    objXX = null;
                    return false;
                }
                objXX = null;
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
