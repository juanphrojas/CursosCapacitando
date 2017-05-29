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
    class clsMatricula
    {
        #region propiedades

        public int Codigo { get; set; }
        public int idCliente { get; set; }
        public string DocCLiente { get; set; }
        public string NombreCliente { get; set; }
        public DateTime FechaMatricula { get; set; }
        public int idProgramacion { get; set; }
        public int idEmpleadoMatricula { get; set; }
        public string NombreEmpleadoMatricula { get; set; }
        public int CodPago { get; set; }
        public DateTime FechaPago { get; set; }
        public int idEmpleadoPago { get; set; }
        public string NombreEmpleadoPago { get; set; }
        public int idFormaPago { get; set; }
        public float MontoPago { get; set; }
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
            idEmpleadoMatricula = 0;
            idCliente = 0;
            FechaMatricula = new DateTime();
            idProgramacion = 0;
            CodPago = 0;
            FechaPago = new DateTime();
            idEmpleadoPago = 0;
            idFormaPago = 0;
            MontoPago = 0;

            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }

        public clsMatricula(string Aplicacion,  int _idEmpleado, int _idCLiente,int _idProgramacion)
        {
            Codigo = 0;
            idEmpleadoMatricula = _idEmpleado;
            idCliente = _idCLiente;
            FechaMatricula = new DateTime();
            idProgramacion = _idProgramacion;
            CodPago = 0;
            FechaPago = new DateTime();
            idEmpleadoPago = 0;
            idFormaPago = 0;
            MontoPago = 0;

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
                if (idCliente <= 0)
                {
                    strError = "Cliente no valido";
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

        private bool ValidarCodigoMatricula()
        {
            if (Codigo <= 0)
            {
                strError = "El codigo no es valido";
                return false;
            }
            return true;
        }

        private bool ValidarProgramacion()
        {
            if (idEmpleadoMatricula <= 0)
            {
                strError = "Empleado de matricula no valido";
                return false;
            }
            if (idProgramacion <= 0)
            {
                strError = "Empleado de matricula no valido";
                return false;
            }
            return true;
        }

        private bool ValidarPago()
        {
            try
            {
                if (idEmpleadoPago <= 0)
                {
                    strError = "Empleado de pago no valido";
                    return false;
                }
                if (idFormaPago <= 0)
                {
                    strError = "Codigo de matricula no valido";
                    return false;
                }
                if (MontoPago <= 0)
                {
                    strError = "Monto de matricula no valido";
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
        public bool BuscarMatricula(int _Codigo, GridView grid)
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
                    strError = "No existe la matricula con codigo: " + _Codigo;
                    Myds.Clear();
                    Myds = null;
                    return false;

                }
                //Recuperar info desde el Primer DataTable
                foreach (DataRow dr in Mydt.Rows)
                {
                    Codigo = Convert.ToInt32(dr[0]);
                    DocCLiente = dr[1].ToString();
                    NombreCliente = dr[2].ToString();
                    FechaMatricula = Convert.ToDateTime(dr[3]);
                    NombreEmpleadoMatricula = dr[4].ToString();
                    
                }
                Mydt.Clear();
                Mydt = Myds.Tables[1];
                foreach (DataRow dr in Mydt.Rows)
                {
                    CodPago = Convert.ToInt32(dr[0]);
                    FechaPago = Convert.ToDateTime(dr[1]);
                    NombreEmpleadoPago = dr[2].ToString();
                    idFormaPago = Convert.ToInt32(dr[3]);
                    MontoPago = Convert.ToSingle(dr[4]);
                }
                if(Mydt.Rows.Count <= 0)
                {
                    idFormaPago = 1;
                    NombreEmpleadoPago = string.Empty;
                }
                Mydt.Clear();
                //Llenar el Grid
                Mydt = Myds.Tables[2];
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

        public bool BuscarClienteMatricula(int _Cliente, GridView grid)
        {
            try
            {
                strSQL = "exec USP_MATricula_BuscarXCliente '" + _Cliente + "';";
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
                    strError = "No existe el cliente con codigo: " + _Cliente;
                    Myds.Clear();
                    Myds = null;
                    return false;

                }
                //Recuperar info desde el Primer DataTable
                foreach (DataRow dr in Mydt.Rows)
                {
                    idCliente = Convert.ToInt32(dr[0]);
                    DocCLiente = dr[1].ToString();
                    NombreCliente = dr[2].ToString();
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
                if (!ValidarProgramacion())
                    return false;

                strSQL = "exec USP_MATricula_Grabar '" + idCliente + "';";

                if (!Grabar())
                    return false;


                strSQL = "exec USP_MATricula_GrabarProgramacion '" + Codigo + "','" + idProgramacion + "','" + idEmpleadoMatricula + "';";
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
                if (!ValidarCodigoMatricula())
                    return false;
                strSQL = "exec USP_CURso_Modificar '" + Codigo + "','" + idCliente +"';";
                return Grabar();
            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return false;
            }
        }

        public bool AgregarProgramacion()
        {
            try
            {
                if (!ValidarCodigoMatricula())
                    return false;

                strSQL = "exec USP_MATricula_GrabarProgramacion '" + Codigo + "','" + idProgramacion + "','" + idEmpleadoMatricula + "';";

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

        public bool AgregarPago()
        {
            try
            {
                if (!ValidarCodigoMatricula())
                    return false;
                if (!ValidarPago())
                    return false;

                strSQL = "exec USP_MATricula_GrabarPago '" + idEmpleadoPago + "','" + Codigo + "','" + idFormaPago + "','" + MontoPago + "';";

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

                strSQL = "exec USP_MATricula_BuscarGeneral;";
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

        public bool LlenarComboFromaPago(DropDownList Combo)
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
                strSQL = "exec USP_MATricula_LlenarComboFormaPago;";
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
