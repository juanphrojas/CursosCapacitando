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
    class clsEmpleado
    {
        #region propiedades
        public int Codigo { get; set; }
        public string Cedula { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Usuario { get; set; }
        public string Contrasena { get; set; }
        public int idCargo { get; set; }
        public float Antiguedad { get; set; }
        private string strApp;
        private string strSQL;
        public string strError { get; private set; }
        private DataSet Myds;
        private DataTable Mydt;
        private SqlDataReader MyReader;
        #endregion

        #region constructor
        public clsEmpleado(string Aplicacion)
        {
            Codigo = 0;
            Cedula = string.Empty;
            Nombre = string.Empty;
            Apellido = string.Empty;
            Usuario = string.Empty;
            Contrasena = string.Empty;
            idCargo = 0;
            Antiguedad = 0;
            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }

        public clsEmpleado(string Aplicacion, string _Cedula, string _Nombre, string _Apellido,  
            string _Usuario, string _Contrasena, int _Cargo, int _Antiguedad)
        {
            Codigo = 0;
            Cedula = _Cedula;
            Nombre = _Nombre;
            Apellido = _Apellido;
            Usuario = _Usuario;
            Contrasena = _Contrasena;
            idCargo = _Cargo;
            Antiguedad = _Antiguedad; 

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
                if (string.IsNullOrEmpty(Cedula))
                {
                    strError = "Falta el numero de la cedula";
                    return false;
                }

                if (string.IsNullOrEmpty(Nombre))
                {
                    strError = "Falta el nombre";
                    return false;
                }

                if (string.IsNullOrEmpty(Apellido))
                {
                    strError = "Falta el apellido";
                    return false;
                }
                if (string.IsNullOrEmpty(Usuario))
                {
                    strError = "Falta el usuario";
                    return false;
                }
                if (string.IsNullOrEmpty(Contrasena))
                {
                    strError = "Falta la contraseña";
                    return false;
                }

                if (idCargo <= 0)
                {
                    strError = "El cargo no es valido";
                    return false;
                }
                
                if (Antiguedad <= 0)
                {
                    strError = "La antiguedad no es valida";
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
        public bool BuscarEmpleado(int _Codigo)
        {
            try
            {
                strSQL = "exec USP_EMPleado_BuscarXCodigo '" + _Codigo + "';";
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
                Cedula = MyReader.GetString(1);
                Nombre = MyReader.GetString(2);
                Apellido = MyReader.GetString(3);
                idCargo = MyReader.GetInt32(4);
                Usuario = MyReader.GetString(5);
                Contrasena = MyReader.GetString(6);
                Antiguedad = MyReader.GetFloat(7);
                MyReader.Close();
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
                
                strSQL = "exec USP_EMPleado_Grabar '" + Cedula + "','" + Nombre + "','" + Apellido + "','" + Usuario + "','" + Contrasena + "','" + idCargo + "','" + Antiguedad + "';";
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
                if (!ValidarModificar())
                    return false;
                strSQL = "exec USP_EMPleado_Modificar '" + Codigo + "','" + Cedula + "','" + Nombre + "','" + Apellido + "','" + Usuario + "','" + Contrasena + "','" + idCargo + "','" + Antiguedad + "';";
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

                strSQL = "exec USP_EMPleado_BuscarGeneral;";
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

        public bool LlenarComboCargo(DropDownList Combo)
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
                strSQL = "exec USP_EMPleado_LlenarComboCargo;";
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

        public bool LlenarComboDocente(DropDownList Combo)
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
                strSQL = "exec USP_EMPleado_LlenarComboDocente;";
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
