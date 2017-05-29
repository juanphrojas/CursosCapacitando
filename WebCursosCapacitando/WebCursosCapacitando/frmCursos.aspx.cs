using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCursosCapacitando
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        int intCodigoCurso, intHorasCurso, intidTema;
        string strNombreCurso, strNombreEmpleado;
        float fltCosto;
        DateTime dtmFechaCurso;

        static string strApp;
        static int intOpcion = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strApp = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
                txtFecha.Text = DateTime.Now.ToShortDateString();
                dtmFechaCurso = new DateTime();
                LlenarGridCurso();
                LlenarComboTema();
            }
            txtFecha.Text = DateTime.Now.ToShortDateString();
        }

        protected void mnuOpciones_MenuItemClick(object sender, MenuEventArgs e)
        {
            Limpiar();
            PanelInfo.Enabled = true;
            PanelTemas.Visible = false;
            txtCodigo.ReadOnly = true;
            txtNombre.ReadOnly = true;
            txtFecha.ReadOnly = true;
            txtCosto.ReadOnly = true;
            txtHoras.ReadOnly = true;
            txtEmpleado.ReadOnly = true;
            ibtnBuscar.Visible = false;
            btnAddCurso.Visible = false;
            btnModCurso.Visible = false;
            switch(mnuOpciones.SelectedValue.ToLower())
            {
                case "opcagregar":
                    intOpcion = 1;
                    PanelTemas.Visible = true;
                    btnAddCurso.Visible = true;
                    btnAddTema0.Visible = false;
                    txtNombre.ReadOnly = false;
                    txtCosto.ReadOnly = false;
                    txtHoras.ReadOnly = false;
                    break;

                case "opcmodificar":
                    intOpcion = 2;
                    ibtnBuscar.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;

                case "opcbuscar":
                    intOpcion = 3;
                    ibtnBuscar.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;

                case "opcagregartema":
                    intOpcion = 4;
                    PanelTemas.Visible = true;
                    btnAddTema0.Visible = true;
                    ibtnBuscar.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;
            }
        }

        protected void ibtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            if (!Buscar())
                return;

            if(intOpcion == 2)
            {
                btnModCurso.Visible = true;
                txtNombre.ReadOnly = false;
                txtCosto.ReadOnly = false;
                txtHoras.ReadOnly = false;
            }
            if (intOpcion == 3)
                PanelInfo.Enabled = false;

            if(intOpcion ==4)
            {
                PanelTemas.Visible = true;
                txtCodigo.ReadOnly = true;
            }
        }

        #region Metodos perzonalizados
        private void Limpiar()
        {
            txtCodigo.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtCosto.Text = string.Empty;
            txtHoras.Text = string.Empty;
        }

        private void Mensaje(string Mensaje)
        {
            lblMensaje.Text = Mensaje;
        }

        protected void btnAddCurso_Click(object sender, EventArgs e)
        {
            try
                {
                    intidTema = Convert.ToInt32( ddlTema.SelectedValue);
                    strNombreCurso = txtNombre.Text;
                    fltCosto = Convert.ToSingle(txtCosto.Text);
                    intHorasCurso = Convert.ToInt32(txtHoras.Text);
                

                    clsCurso objCUR = new clsCurso(strApp, strNombreCurso, fltCosto, intHorasCurso, 3, intidTema);

                    if (!objCUR.Insertar())
                    {
                        Mensaje(objCUR.strError);
                        objCUR = null;
                        return;
                        
                    }

                    LlenarGridCurso();
                    Limpiar();
                     objCUR = null;

                }
                catch (Exception ex)
                {
                    Mensaje(ex.Message);
                }
        }

        protected void btnModCurso_Click(object sender, EventArgs e)

        {
            try
            {
                Mensaje(string.Empty);
                clsCurso objCUR = new clsCurso(strApp);
                objCUR.Codigo = Convert.ToInt32(txtCodigo.Text);
                objCUR.Nombre = txtNombre.Text.Trim();
                objCUR.Costo = Convert.ToSingle(txtCosto.Text);
                objCUR.Horas = Convert.ToInt32(txtHoras.Text);
                objCUR.idEmpleado = 3;

                if (!objCUR.Modificar())
                {
                    Mensaje(objCUR.strError);
                    objCUR = null;
                    this.txtCodigo.Focus();
                    return;
                }


                PanelInfo.Enabled = false;
                this.Limpiar();
                this.LlenarGridCurso();
                objCUR = null;
            }
            catch (Exception ex)
            {

                Mensaje(ex.Message);
            }
        }

        protected void btnAddTema0_Click(object sender, EventArgs e)
        {
            if(intOpcion == 4)
            {

                clsCurso objCUR = new clsCurso(strApp);
                objCUR.idTema = Convert.ToInt32(ddlTema.SelectedValue);
                objCUR.Codigo = Convert.ToInt32(txtCodigo.Text);
                if (!objCUR.AgregarTema())
                {
                    Mensaje(objCUR.strError);
                    objCUR = null;
                    return;
                }
                Buscar();
                objCUR = null;
            }
        }

        private bool Buscar()
        {
            try
            {

                Mensaje(string.Empty);
                intCodigoCurso  = Convert.ToInt32(txtCodigo.Text.Trim());
                if (intCodigoCurso <= 0)
                {
                    Mensaje("Codigo del curso no valido");
                    this.txtCodigo.Focus();
                    return false;
                }

                clsCurso objCUR = new clsCurso(strApp);

                if (!objCUR.BuscarCurso(intCodigoCurso, grvCursos))
                {
                    Mensaje(objCUR.strError);
                    objCUR = null;
                    this.txtCodigo.Focus();
                    return false;
                }
                this.txtCodigo.Text = objCUR.Codigo.ToString();
                this.txtNombre.Text = objCUR.Nombre;
                this.txtFecha.Text = objCUR.Fecha.ToShortDateString();
                this.txtCosto.Text = objCUR.Costo.ToString();
                this.txtHoras.Text = objCUR.Horas.ToString();
                this.txtEmpleado.Text = objCUR.NombreEmpleado;
                objCUR = null;
                return true;

            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
                return false;
            }
        }

        private void LlenarGridCurso()
        {
            clsCurso objCUR = new clsCurso(strApp);
            objCUR.LlenarGrid(grvCursos);
            objCUR = null;
        }

        

        private void LlenarComboTema()
        {
            clsTema objTEM = new clsTema(strApp);
            if (!objTEM.LlenarCombo(ddlTema))
            {
                Mensaje(objTEM.strError);
                objTEM = null;
                return;
            }
            objTEM = null;
        }
        #endregion
    }
}