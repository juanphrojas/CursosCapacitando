using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCursosCapacitando
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        int intCodigoEmpleado, intAntiguedadEmpleado, intCargoEmpleado;
        string strDocuemtoEmpleado, strNombreEmpleado, strApellidoEmpleado, strUsuarioEmpleado, strContrasenaEmpleado;
        static string strApp;
        static int intOpcion = -1;

        protected void ibtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            if (!Buscar())
                return;
            
            if (intOpcion == 2)
            {
                txtCodigo.ReadOnly = true;
                txtAntiguedad.ReadOnly = false;
                txtApellido.ReadOnly = false;
                txtConfContra.ReadOnly = false;
                txtContra.ReadOnly = false;
                txtNombre.ReadOnly = false;
                txtNroDoc.ReadOnly = false;
                txtUsuario.ReadOnly = false;
                ddlCargo.Enabled = true;
                btnModEmpleado.Visible = true;
            }
            if(intOpcion ==3)
            {
                PanelInfo.Enabled = true;
            }

        }

        protected void btnAddEmpleado_Click(object sender, EventArgs e)
        {
            try
            {
                if (!VerificarContraseñas())
                {
                    Mensaje("Las contraseñas no coinciden");
                    return;
                }
                    
                intAntiguedadEmpleado = Convert.ToInt16(txtAntiguedad.Text);
                intCargoEmpleado = Convert.ToInt16(ddlCargo.SelectedValue);
                strDocuemtoEmpleado = txtNroDoc.Text.Trim();
                strNombreEmpleado = txtNombre.Text.Trim(); 
                strApellidoEmpleado = txtApellido.Text.Trim();
                strUsuarioEmpleado = txtUsuario.Text.Trim();
                strContrasenaEmpleado = txtContra.Text.Trim();
                

                clsEmpleado objEMP = new clsEmpleado(strApp, strDocuemtoEmpleado, strNombreEmpleado,strApellidoEmpleado,strUsuarioEmpleado,strContrasenaEmpleado,intCargoEmpleado,intAntiguedadEmpleado);

                if (!objEMP.Insertar())
                {
                    Mensaje(objEMP.strError);
                    objEMP = null;
                    return;
                }
                else

                    LlenarGridEmpleado();
                Limpiar();
                objEMP = null;


            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
            }
        }

        protected void mnuOpc_MenuItemClick(object sender, MenuEventArgs e)
        {
            Limpiar();
            ibtnBuscar.Visible = false;
            btnAddEmpleado.Visible = false;
            btnModEmpleado.Visible = false;
            txtAntiguedad.ReadOnly = true;
            txtApellido.ReadOnly = true;
            txtCodigo.ReadOnly = true;
            txtConfContra.ReadOnly = true;
            txtContra.ReadOnly = true;
            txtNombre.ReadOnly = true;
            txtNroDoc.ReadOnly = true;
            txtUsuario.ReadOnly = true;
            switch(mnuOpc.SelectedValue.ToLower())
            {
                case "opcagregar":
                    intOpcion = 1;
                    txtAntiguedad.ReadOnly = false;
                    txtApellido.ReadOnly = false;
                    txtConfContra.ReadOnly = false;
                    txtContra.ReadOnly = false;
                    txtNombre.ReadOnly = false;
                    txtNroDoc.ReadOnly = false;
                    txtUsuario.ReadOnly = false;
                    ddlCargo.Enabled = true;
                    btnAddEmpleado.Visible = true;
                    break;

                case "opcmodificar":
                    intOpcion = 2;
                    ibtnBuscar.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;

                case "opcbscar":
                    intOpcion = 3;
                    ibtnBuscar.Visible = true;
                    txtCodigo.ReadOnly = true;
                    break;

            }

        }

        protected void btnModEmpleado_Click(object sender, EventArgs e)
        {
            try
            {
                Mensaje(string.Empty);
                clsEmpleado objEMP = new clsEmpleado(strApp);
                objEMP.Antiguedad = Convert.ToInt16(txtAntiguedad.Text);
                objEMP.idCargo = Convert.ToInt32(ddlCargo.SelectedValue);
                objEMP.Cedula = txtNroDoc.Text.Trim();
                objEMP.Nombre = txtNombre.Text.Trim();
                objEMP.Apellido = txtApellido.Text.Trim();
                objEMP.Usuario = txtUsuario.Text.Trim();
                objEMP.Contrasena = txtContra.Text.Trim();
                objEMP.Codigo = Convert.ToInt32(txtCodigo.Text);

                if (!objEMP.Modificar())
                {
                    Mensaje(objEMP.strError);
                    objEMP = null;
                    this.txtCodigo.Focus();
                    return;
                }


                PanelInfo.Enabled = false;
                this.Limpiar();
                this.LlenarGridEmpleado();
                objEMP = null;
            }
            catch (Exception ex)
            {

                Mensaje(ex.Message);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strApp = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
                LlenarGridEmpleado();
                LlenarComboCargo();
            }
        }

        #region Metodos perzonalizados
        private void Limpiar()
        {
            txtAntiguedad.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtCodigo.Text = string.Empty;
            txtConfContra.Text = string.Empty;
            txtContra.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtNroDoc.Text = string.Empty;
            txtUsuario.Text = string.Empty;
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
                intCodigoEmpleado = Convert.ToInt32(txtCodigo.Text.Trim());
                if (intCodigoEmpleado <= 0)
                {
                    Mensaje("Codigo del empleado no valido");
                    this.txtCodigo.Focus();
                    return false;
                }

                clsEmpleado objEMP = new clsEmpleado(strApp);

                if (!objEMP.BuscarEmpleado(intCodigoEmpleado))
                {
                    Mensaje(objEMP.strError);
                    objEMP = null;
                    this.txtCodigo.Focus();
                    return false;
                }
                this.txtCodigo.Text = objEMP.Codigo.ToString();
                this.txtNombre.Text = objEMP.Nombre;
                this.txtApellido.Text = objEMP.Apellido;
                this.txtNroDoc.Text = objEMP.Cedula;
                this.txtUsuario.Text = objEMP.Usuario;
                this.txtConfContra.Text = string.Empty;
                this.txtContra.Text = objEMP.Contrasena;
                this.ddlCargo.SelectedValue = objEMP.idCargo.ToString();
                this.txtAntiguedad.Text = objEMP.Antiguedad.ToString();
                objEMP = null;
                return true;

            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
                return false;
            }
        }

        private void LlenarGridEmpleado()
        {
            clsEmpleado objEMP = new clsEmpleado(strApp);
            objEMP.LlenarGrid(grvEmpleados);
            objEMP = null;
        }

        private bool VerificarContraseñas()
        {
            return (txtContra.Text.Equals(txtConfContra.Text));
        }

        private void LlenarComboCargo()
        {
            clsEmpleado objEMP = new clsEmpleado(strApp);
            if (!objEMP.LlenarComboCargo(ddlCargo))
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