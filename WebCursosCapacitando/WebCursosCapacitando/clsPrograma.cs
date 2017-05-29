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
    class clsPrograma
    {
        #region propiedades
        public int Codigo { get; set; }
        public int idCurso { get; set; }
        public int idEmpleado { get; set; }
        public int idDocente { get; set; }
        public DateTime FechaInicio { get; set; }
        public string Estado { get; set; }
        public int Cupos { get; set; }
        private string strApp;
        private string strSQL;
        public string strError { get; private set; }
        private DataSet Myds;
        private DataTable Mydt;
        private SqlDataReader MyReader;
        #endregion

        #region constructor
        public clsPrograma(string Aplicacion)
        {
            Codigo = 0;
            idCurso = 0;
            idEmpleado = 0;
            idDocente = 0;
            FechaInicio = new DateTime();
            Estado = string.Empty;
            Cupos = 0;
            strApp = Aplicacion;
            strSQL = string.Empty;
            strError = string.Empty;
        }

        public clsPrograma(string Aplicacion, int _idCurso, int _idEmpleado, int _idDocente, DateTime _FechaInicio, string _Estado, int _Cupos)
        {
            Codigo = 0;
            idCurso = _idCurso;
            idEmpleado = _idEmpleado;
            idDocente = _idDocente;
            FechaInicio = _FechaInicio;
            Estado = _Estado;
            Cupos = _Cupos;
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
                if (string.IsNullOrEmpty(Estado))
                {
                    strError = "El estado no es valido";
                    return false;
                }
                if (Cupos <= 0)
                {
                    strError = "la cantidad de cupos no es valida";
                    return false;
                }
                if (FechaInicio <= DateTime.Now)
                {
                    strError = "La fecha de incio no es valida";
                    return false;
                }
                if (idDocente <= 0)
                {
                    strError = "El docente seleccionado no es valido";
                    return false;
                }
                if (idEmpleado <= 0)
                {
                    strError = "El enpleado no es valido";
                    return false;
                }
                if (idCurso <= 0)
                {
                    strError = "El curso seleccionado no es valido";
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

        private string GenerarFecha()
        {
            string fecha;
            fecha = FechaInicio.ToShortDateString().Split('/')[2]+ FechaInicio.ToShortDateString().Split('/')[1]+ FechaInicio.ToShortDateString().Split('/')[0];
            return fecha; 
        }
        #endregion

        #region metodos publicos
        public bool BuscarPrograma(int _Codigo, GridView grid)
        {
            try
            {
                strSQL = "exec USP_PROgramacion_BuscarXCodigo '" + _Codigo + "';";
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
                    strError = "No existe la programacion con codigo: " + _Codigo;
                    Myds.Clear();
                    Myds = null;
                    return false;

                }
                //Recuperar info desde el Primer DataTable
                foreach (DataRow dr in Mydt.Rows)
                {
                    Codigo = Convert.ToInt32(dr[0]);
                    idCurso = Convert.ToInt32(dr[1]);
                    Cupos = Convert.ToInt32(dr[2]);
                    FechaInicio = Convert.ToDateTime(dr[3]);
                    Estado = dr[4].ToString();
                    idDocente = Convert.ToInt32(dr[5]);
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
                strSQL = "exec USP_PROgramacion_Grabar '" + idCurso + "','" + idEmpleado + "','" + GenerarFecha() + "','" + Estado + "','" + Cupos + "','" + idDocente + "';";
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
                strSQL = "exec USP_PROgramacion_Modificar '" + Codigo + "','" + idCurso + "','" + idEmpleado + "','" + GenerarFecha() + "','" + Estado + "','" + Cupos + "','" + idDocente + "';";
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

                strSQL = "exec USP_PROgramacion_BuscarGeneral;";
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

        public bool LlenarComboProgramacionCurso(DropDownList Combo, int _Curso)
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
                if(_Curso<=0)
                {
                    strError = "Codigo de curso no valido";
                    return false;
                }
                strSQL = "exec USP_PROgramacion_LlenarComboXCurso "+_Curso+";";
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
