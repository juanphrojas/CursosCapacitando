using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCursosCapacitando
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        int intCodigoCLiente, intidEmpleado;
        string strDocuemtoCliente, strNombreCliente, strApellidoCliente, strNombreEmpleado;
        static string strApp;
        static int intOpcion = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strApp = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
                LlenarGridCliente();
            }
        }

        protected void ibtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            if (!Buscar())
                return;
                
            if(intOpcion == 2)
            {
                btnModCliente.Visible = true;

                txtApellido.ReadOnly = false;
                txtNombre.ReadOnly = false;
                txtNroDoc.ReadOnly = false;
            }
            if(intOpcion == 3)
            {
                PanelInfo.Enabled = false;
            }
        }

        protected void mnuOpciones_MenuItemClick(object sender, MenuEventArgs e)
        {
            Limpiar();
            PanelInfo.Enabled = true;
            ibtnBuscar.Visible = false;
            btnAddCliente.Visible = false;
            btnModCliente.Visible = false;
            txtNroDoc.ReadOnly = true;
            txtNombre.ReadOnly = true;
            txtEmpleado.ReadOnly = true;
            txtCodigo.ReadOnly = true;
            txtApellido.ReadOnly = true;
            switch(mnuOpciones.SelectedValue.ToLower())
            {
                case "opcagregar":
                    intOpcion = 1;
                    btnAddCliente.Visible = true;
                    txtApellido.ReadOnly = false;
                    txtNombre.ReadOnly = false;
                    txtNroDoc.ReadOnly = false;
                    break;

                case "opcmodificar":
                    intOpcion = 2;
                    txtCodigo.ReadOnly = false;
                    ibtnBuscar.Visible = true;
                    break;

                case "opcbuscar":
                    intOpcion = 3;
                    txtCodigo.ReadOnly = false;
                    ibtnBuscar.Visible = true;
                    break;
            }
        }

        protected void btnAddCliente_Click(object sender, EventArgs e)
        {
            try
            {
                strApellidoCliente = txtApellido.Text;
                strNombreCliente = txtNombre.Text;
                strDocuemtoCliente = txtNroDoc.Text;

                clsCliente objCLI = new clsCliente(strApp, strDocuemtoCliente, strNombreCliente, strApellidoCliente, 3);

                if (!objCLI.Insertar())
                {
                    Mensaje(objCLI.strError);
                    objCLI = null;
                    return;
                }
                else

                    LlenarGridCliente();
                Limpiar();
                objCLI = null;


            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
            }
            
        }

        protected void btnModCliente_Click(object sender, EventArgs e)

        {
            try
            {
                Mensaje(string.Empty);
                clsCliente objCLI = new clsCliente(strApp);
                objCLI.Codigo = Convert.ToInt16(txtCodigo.Text);
                objCLI.Cedula = txtNroDoc.Text.Trim();
                objCLI.Nombre = txtNombre.Text.Trim();
                objCLI.Apellido = txtApellido.Text.Trim();
                objCLI.idEmpleado = 3;

                if (!objCLI.Modificar())
                {
                    Mensaje(objCLI.strError);
                    objCLI = null;
                    this.txtCodigo.Focus();
                    return;
                }


                PanelInfo.Enabled = false;
                this.Limpiar();
                this.LlenarGridCliente();
                objCLI = null;
            }
            catch (Exception ex)
            {

                Mensaje(ex.Message);
            }
        }

        #region Metodos Personalizados
        private void Limpiar()
        {
            txtApellido.Text = string.Empty;
            txtCodigo.Text = string.Empty;
            txtEmpleado.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtNroDoc.Text = string.Empty;
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
                intCodigoCLiente = Convert.ToInt32(txtCodigo.Text.Trim());
                if (intCodigoCLiente <= 0)
                {
                    Mensaje("Codigo del empleado no valido");
                    this.txtCodigo.Focus();
                    return false;
                }

                clsCliente objCLI = new clsCliente(strApp);

                if (!objCLI.BuscarCliente(intCodigoCLiente, grvClientes))
                {
                    Mensaje(objCLI.strError);
                    objCLI = null;
                    this.txtCodigo.Focus();
                    return false;
                }
                this.txtCodigo.Text = objCLI.Codigo.ToString();
                this.txtNombre.Text = objCLI.Nombre;
                this.txtApellido.Text = objCLI.Apellido;
                this.txtNroDoc.Text = objCLI.Cedula;
                this.txtEmpleado.Text = objCLI.NombreEmpleado;
                objCLI = null;
                return true;

            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
                return false;
            }
        }

        private void LlenarGridCliente()
        {
            clsCliente objCLI = new clsCliente(strApp);
            objCLI.LlenarGrid(grvClientes);
            objCLI = null;
        }
        #endregion
    }
}