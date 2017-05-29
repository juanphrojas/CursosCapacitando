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
        public DateTime FechaMatricula { get; set; }
        public List<int> ListaProgramacion  { get; set; }
        public int idProgramacion { get; set; }
        public int idEmpleadoMatricula { get; set; }
        public int CodPago { get; set; }
        public DateTime FechaPago { get; set; }
        public int idEmpleadoPago { get; set; }
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
            ListaProgramacion = new List<int>();
            CodPago = 0;
            FechaPago = new DateTime();
            idEmpleadoPago = 0;
            idFormaPago = 0;
            MontoPago = 0;

            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }

        public clsMatricula(string Aplicacion,  int _idEmpleado, int _idCLiente, DateTime _FechaMatricula, List<int> _ListaProgramacion)
        {
            Codigo = 0;
            idEmpleadoMatricula = _idEmpleado;
            idCliente = _idCLiente;
            FechaMatricula = _FechaMatricula;
            idProgramacion = 0;
            ListaProgramacion = _ListaProgramacion;
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
                if (idEmpleadoMatricula <= 0)
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

        private bool ValidarCodigoMatricula()
        {
            if (Codigo <= 0)
            {
                strError = "El codigo no es valido";
                return false;
            }
            return true;
        }

        private bool ValidarProgrmacion()
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
                    idEmpleadoMatricula = Convert.ToInt32(dr[3]);
                    CodPago = Convert.ToInt32(dr[4]);
                    FechaPago = Convert.ToDateTime(dr[5]);
                    idEmpleadoPago = Convert.ToInt32(dr[6]);
                    idFormaPago = Convert.ToInt32(dr[7]);
                    MontoPago = Convert.ToSingle(dr[8]);
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
                    strSQL = "exec USP_MATricula_GrabarProgramacion '" + Codigo + "','" + ListaProgramacion[i] + "','" + idEmpleadoMatricula + "';";
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
                if (!ValidarCodigoMatricula())
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
                objXX.CampoTexto = "Nombre";
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
