using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCursosCapacitando
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        int intCodigo, intCurso, intDocente, intEmpleado, intCupos; 
        string strEstado, strNombreEmpleado;
        DateTime dtmFechaInicio;
        static string strApp;
        static int intOpcion = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strApp = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
                LlenarGridPrograma();
                LlenarComboDocente();
                LlenarComboCursos();
            }
        }

        protected void mnuOpciones_MenuItemClick(object sender, MenuEventArgs e)
        {
            Limpiar();
            txtCodigo.ReadOnly = true;
            txtCupos.ReadOnly = true;
            ddlCurso.Enabled = false;
            ddlDocente.Enabled = false;
            rbtnEstado.Visible = false;
            Calendar1.Enabled = false;
            ibtnBuscar0.Visible = false;
            btnAddProgramacion.Visible = false;
            btnModProgramacion.Visible = false;
            txtEstado.Visible = false;

            switch(mnuOpciones.SelectedValue.ToLower())
            {
                case "opcagregar":
                    intOpcion = 1;
                    ddlCurso.Enabled = true;
                    ddlDocente.Enabled = true;
                    Calendar1.Enabled = true;
                    txtCupos.ReadOnly = false;
                    btnAddProgramacion.Visible = true;
                    rbtnEstado.Visible = true;
                    break;

                case "opcmodificar":
                    intOpcion = 2;
                    ibtnBuscar0.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;

                case "opcbuscar":
                    intOpcion = 3;
                    ibtnBuscar0.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;
            }
        }

        #region Metodos perzonalizados
        private void Limpiar()
        {
            txtCodigo.Text = string.Empty;
            txtCupos.Text = string.Empty;
            txtFecha.Text = string.Empty;
            rbtnEstado.SelectedValue = "opcActivo";
            txtEstado.Text = string.Empty;
            txtEmpleado.Text = string.Empty;
            Calendar1.SelectedDate = DateTime.Now;
        }

        protected void ibtnBuscar0_Click(object sender, ImageClickEventArgs e)
        {
            if (!Buscar())
                return;

            if(intOpcion == 2)
            {
                btnModProgramacion.Visible = true;
                txtCodigo.ReadOnly = true;
                ddlCurso.Enabled = true;
                ddlDocente.Enabled = true;
                Calendar1.Enabled = true;
                txtCupos.ReadOnly = false;
            }
            if (intOpcion == 3)
            {
                PanelInfo.Enabled = false;
                txtEstado.Visible = true;
            }
                
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtFecha.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void btnModProgramacion_Click(object sender, EventArgs e)

        {
            try
            {
                Mensaje(string.Empty);
                clsPrograma objPRO = new clsPrograma(strApp);
                objPRO.Codigo = Convert.ToInt32(txtCodigo.Text);
                objPRO.idCurso = Convert.ToInt32(ddlCurso.SelectedValue);
                objPRO.idEmpleado = 3;
                objPRO.idDocente = Convert.ToInt32(ddlDocente.SelectedValue);
                objPRO.FechaInicio = Calendar1.SelectedDate;
                objPRO.Estado = rbtnEstado.SelectedItem.ToString();
                objPRO.Cupos = Convert.ToInt32(txtCupos.Text);

                if (!objPRO.Modificar())
                {
                    Mensaje(objPRO.strError);
                    objPRO = null;
                    this.txtCodigo.Focus();
                    return;
                }


                PanelInfo.Enabled = false;
                this.Limpiar();
                this.LlenarGridPrograma();
                objPRO = null;
            }
            catch (Exception ex)
            {

                Mensaje(ex.Message);
            }
        }

        protected void btnAddProgramacion_Click(object sender, EventArgs e)

        {
            try
            {
                intCurso = Convert.ToInt32(ddlCurso.SelectedValue);
                intEmpleado = 3;
                dtmFechaInicio = Calendar1.SelectedDate;
                strEstado = rbtnEstado.SelectedItem.ToString();
                intCupos = Convert.ToInt32(txtCupos.Text);
                intDocente = Convert.ToInt32(ddlDocente.SelectedValue);


                clsPrograma objPRO = new clsPrograma(strApp, intCurso, intEmpleado, intDocente, dtmFechaInicio, strEstado, intCupos);

                if (!objPRO.Insertar())
                {
                    Mensaje(objPRO.strError);
                    objPRO = null;
                    return;
                }
                else

                    LlenarGridPrograma();
                Limpiar();
                objPRO = null;


            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
            }
        }

        private void Mensaje(string Mensaje)
        {
            lblMensaje.Text = Mensaje;
        }

        private bool Buscar()
        {
            try
            {

                Mensaje(string.Empty);
                intCodigo = Convert.ToInt32(txtCodigo.Text.Trim());
                if (intCodigo <= 0)
                {
                    Mensaje("Codigo del programa no valido");
                    this.txtCodigo.Focus();
                    return false;
                }

                clsPrograma objPRO = new clsPrograma(strApp);

                if (!objPRO.BuscarPrograma(intCodigo, grvProgramaciones))
                {
                    Mensaje(objPRO.strError);
                    objPRO = null;
                    this.txtCodigo.Focus();
                    return false;
                }
                this.txtCodigo.Text = objPRO.Codigo.ToString();
                this.ddlCurso.SelectedValue = objPRO.idCurso.ToString();
                this.ddlDocente.SelectedValue = objPRO.idDocente.ToString();
                this.txtEstado.Text = objPRO.Estado.ToString();
                this.txtFecha.Text = objPRO.FechaInicio.ToString();
                this.Calendar1.SelectedDate = objPRO.FechaInicio;
                this.txtEmpleado.Text = objPRO.idEmpleado.ToString();
                objPRO = null;
                return true;

            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
                return false;
            }
        }

        private void LlenarGridPrograma()
        {
            clsPrograma objPRO = new clsPrograma(strApp);
            objPRO.LlenarGrid(grvProgramaciones);
            objPRO = null;
        }

        private void LlenarComboCursos()
        {
            clsCurso objCUR = new clsCurso(strApp);
            if (!objCUR.LlenarCombo(ddlCurso))
            {
                Mensaje(objCUR.strError);
                objCUR = null;
                return;
            }
            objCUR = null;
        }

        private void LlenarComboDocente()
        {
            clsEmpleado objEMP = new clsEmpleado(strApp);
            if (!objEMP.LlenarComboDocente(ddlDocente))
            {
                Mensaje(objEMP.strError);
                objEMP = null;
                return;
            }
            objEMP = null;
        }
        #endregion

    }
}