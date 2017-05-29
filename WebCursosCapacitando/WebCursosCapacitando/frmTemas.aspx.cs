using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data.SqlClient;
using LibConexionBD;
using LibLlenarGrids;

namespace WebCursosCapacitando
{
    public partial class Formulario_web2 : System.Web.UI.Page
    {
        static string strApp;
        static int intOpcion = -1;

        int intCodigoTema;
        string strNombreTema, strDescripcionTema;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strApp = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
                LlenarGridTema();
            }
            
        }

        protected void mnuOpc_MenuItemClick(object sender, MenuEventArgs e)
        {
            this.Limpiar();
            PanelInfo.Enabled = true;
            imbtnBuscar.Visible = false;
            btnAddTema.Visible = false;
            btnModTema.Visible = false;
            txtCodigo.ReadOnly = true;
            txtDescripcion.ReadOnly = true;
            txtNombre.ReadOnly = true;
            switch(mnuOpc.SelectedValue.ToLower())
            {
                case "opcagregar":
                    intOpcion = 1;
                    btnAddTema.Visible = true;
                    txtCodigo.ReadOnly = true;
                    txtDescripcion.ReadOnly = false;
                    txtNombre.ReadOnly = false;
                    break;

                case "opcmodificar":
                    intOpcion = 2;
                    imbtnBuscar.Visible = true;
                    txtCodigo.ReadOnly = false;
                    btnModTema.Visible = true;
                    break;

                case "opcbuscar":
                    intOpcion = 3;
                    imbtnBuscar.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;
            }
        }

        protected void imbtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            if (!Buscar())
                return;
            
            if (intOpcion == 2)
            {
                txtCodigo.ReadOnly = true;
                txtNombre.ReadOnly = false;
                txtDescripcion.ReadOnly = false;
            }
            
        }

        protected void btnAddTema_Click(object sender, EventArgs e)
        {
            try
            {
                strNombreTema = txtNombre.Text.Trim();
                strDescripcionTema = txtDescripcion.Text.Trim();

                clsTema objTEM = new clsTema(strApp, strNombreTema, strDescripcionTema);

                if (!objTEM.Insertar())
                {
                    Mensaje(objTEM.strError);
                    objTEM = null;
                    return;
                }
                else

                LlenarGridTema();
                Limpiar();
                objTEM = null;


            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
            }
        }

        protected void btnModTema_Click(object sender, EventArgs e)
        {
            try
            {
                Mensaje(string.Empty);
                clsTema objTEM = new clsTema(strApp);

                objTEM.Codigo = Convert.ToInt32(txtCodigo.Text);
                objTEM.Nombre = txtNombre.Text;
                objTEM.Descripcion = txtDescripcion.Text;

                if (!objTEM.Modificar())
                {
                    Mensaje(objTEM.strError);
                    objTEM = null;
                    this.txtCodigo.Focus();
                    return;
                }


                PanelInfo.Enabled = false;
                this.Limpiar();
                this.LlenarGridTema();
                objTEM = null;
            }
            catch (Exception ex)
            {

                Mensaje(ex.Message);
            }
        }

        #region Metodos perzonalizados
        private void Limpiar()
        {
            txtCodigo.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtNombre.Text = string.Empty;
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
                intCodigoTema = Convert.ToInt32(txtCodigo.Text.Trim());
                if (intCodigoTema <= 0)
                {
                    Mensaje("Codigo del tema no valido");
                    this.txtCodigo.Focus();
                    return false;
                }

                clsTema objTEM = new clsTema(strApp);

                if (!objTEM.BuscarTema(intCodigoTema))
                {
                    Mensaje(objTEM.strError);
                    objTEM = null;
                    this.txtCodigo.Focus();
                    return false;
                }
                this.txtCodigo.Text = objTEM.Codigo.ToString();
                this.txtNombre.Text = objTEM.Nombre;
                this.txtDescripcion.Text = objTEM.Descripcion;
                objTEM = null;
                return true;

            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
                return false;
            }
        }

        private void LlenarGridTema()
        {
            clsTema objTEM = new clsTema(strApp);
            objTEM.LlenarGrid(grvTemas);
            objTEM = null;
        }
        #endregion
    }
}