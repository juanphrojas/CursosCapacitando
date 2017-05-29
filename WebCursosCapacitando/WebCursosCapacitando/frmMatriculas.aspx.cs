using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCursosCapacitando
{
    public partial class Formulario_web14 : System.Web.UI.Page
    {
        int intCodigoMatricula, intidCliente, intidCurso, intidPrograma, intidFormaPago, intidEmpleado;
        string strNombreCliente, strCedulaCliente, strNombreEmpleadoM, strNombreEmpleadoP;
        DateTime dtmFechaMatricula, dtmFechaPago;
        float fltMonto;

        static string strApp;
        static int intOpcion = -1;

        protected void ddlCursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            LlenarComboPrograma(Convert.ToInt32(ddlCursos.SelectedValue));
        }

        protected void ibtnBuscarXCodigo_Click(object sender, ImageClickEventArgs e)
        {
            if (!Buscar())
                return;
            txtCodigo.ReadOnly = true;
            ibtnBuscarXCodigo.Visible = false;
            if(intOpcion==2)
            {
                txtCodCliente.ReadOnly = false;
                ibtnBuscarXCliente.Visible = true;
            }
            if(intOpcion == 3)
            {
                PanelProgramas.Visible = true;
                btnAddPrograma.Visible = true;

            }
            if(intOpcion ==5)
            {
                PanelPago.Visible = true;
                PanelPago.Enabled = true;
            }
            if (!string.IsNullOrEmpty(txtCodPag.Text))
                PanelPago.Enabled = false;
                
        }

        protected void ibtnBuscarXCliente_Click(object sender, ImageClickEventArgs e)
        {
            if (!BuscarCliente())
                return;
            txtCodCliente.ReadOnly = true;
            ibtnBuscarXCliente.Visible = false;
            if(intOpcion == 2)
            {
                btnModMatricula.Visible = true;
                txtCodCliente.ReadOnly = true;
                txtDocCliente.ReadOnly = true;
                txtNombreCliente.ReadOnly = true;
            }
            if(intOpcion==1)
            {
                btnAddMatricula.Visible = true;
                PanelProgramas.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strApp = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
                LlenarComboCursos();
                LlenarComboFormaPago();
                LlenarGridMatricula();
            }
            txtFechaMat.Text = DateTime.Now.ToShortDateString();
            txtFechaPag.Text = DateTime.Now.ToShortDateString();
        }

        protected void btnAddMatricula_Click(object sender, EventArgs e)

        {
            try
            {
                intidCliente = Convert.ToInt32(txtCodCliente.Text);
                intidPrograma = Convert.ToInt32(ddlPrograma.SelectedValue);
                

                clsMatricula objMAT = new clsMatricula(strApp, 3, intidCliente, intidPrograma);

                if (!objMAT.Insertar())
                {
                    Mensaje(objMAT.strError);
                    objMAT = null;
                    return;

                }

                LlenarGridMatricula();
                Limpiar();
                objMAT = null;

            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
            }
        }

        protected void btnModMatricula_Click(object sender, EventArgs e)


        {
            try
            {
                Mensaje(string.Empty);
                clsMatricula objMAT = new clsMatricula(strApp);
                objMAT.Codigo = Convert.ToInt32(txtCodigo.Text);
                if (!objMAT.Modificar())
                {
                    Mensaje(objMAT.strError);
                    objMAT = null;
                    this.txtCodigo.Focus();
                    return;
                }


                
                this.Limpiar();
                this.LlenarGridMatricula();
                objMAT = null;
            }
            catch (Exception ex)
            {

                Mensaje(ex.Message);
            }
        }

        protected void btnAddPrograma_Click(object sender, EventArgs e)
        {

            
            if (intOpcion == 3)
            {

                clsMatricula objMAT = new clsMatricula(strApp);
                objMAT.Codigo = Convert.ToInt32(txtCodigo.Text);
                objMAT.idProgramacion = Convert.ToInt32(ddlPrograma.SelectedValue);
                objMAT.idEmpleadoMatricula = 3;
                if (!objMAT.AgregarProgramacion())
                {
                    Mensaje(objMAT.strError);
                    objMAT = null;
                    return;
                }
                Buscar();
                objMAT = null;
            }
            
        }

        protected void btnAddPago_Click(object sender, EventArgs e)
        {
            if (intOpcion == 5)
            {

                clsMatricula objMAT = new clsMatricula(strApp);
                objMAT.Codigo = Convert.ToInt32(txtCodigo.Text);
                objMAT.idFormaPago = Convert.ToInt32(ddlFormaPago0.SelectedValue);
                objMAT.idEmpleadoMatricula = 3;
                objMAT.MontoPago = Convert.ToSingle(txtMontoPag.Text);
                if (!objMAT.AgregarPago())
                {
                    Mensaje(objMAT.strError);
                    objMAT = null;
                    return;
                }
                Buscar();
                objMAT = null;
                

            }
        }

        protected void mnuOpc_MenuItemClick(object sender, MenuEventArgs e)
        {
            Limpiar();
            PanelPago.Visible = false;
            PanelProgramas.Visible = false;
            btnAddMatricula.Visible = false;
            btnAddPrograma.Visible = false;
            btnModMatricula.Visible = false;
            txtCodCliente.ReadOnly = true;
            txtCodigo.ReadOnly = true;
            txtDocCliente.ReadOnly = true;
            txtNombreCliente.ReadOnly = true;
            ibtnBuscarXCliente.Visible = false;
            ibtnBuscarXCodigo.Visible = false;
            switch(mnuOpc.SelectedValue.ToLower())
            {
                case "opcagregar":
                    intOpcion = 1;
                    ibtnBuscarXCliente.Visible = true;
                    txtCodCliente.ReadOnly = false;                    
                    break;

                case "opcmodificar":
                    intOpcion = 2;
                    ibtnBuscarXCodigo.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;

                case "opcaddprograma":
                    intOpcion = 3;
                    ibtnBuscarXCodigo.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;

                case "opcbuscar":
                    intOpcion = 4;
                    ibtnBuscarXCodigo.Visible = true;
                    txtCodigo.ReadOnly = false;
                    ibtnBuscarXCliente.Visible = true;
                    txtCodCliente.ReadOnly = false;
                    break;

                case "opcpago":
                    intOpcion = 5;

                    ibtnBuscarXCodigo.Visible = true;
                    txtCodigo.ReadOnly = false;
                    break;
            }
        }

        #region Metodos perzonalizados
        private void Limpiar()
        {
            txtCodigo.Text = string.Empty;
            txtCodCliente.Text = string.Empty;
            txtDocCliente.Text = string.Empty;
            txtEmpleadoMat.Text = string.Empty;
            txtEmpleadoPag.Text = string.Empty;
            txtFechaMat.Text = string.Empty;
            txtFechaPag.Text = string.Empty;
            txtMontoPag.Text = string.Empty;
            txtNombreCliente.Text = string.Empty;
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
                intCodigoMatricula = Convert.ToInt32(txtCodigo.Text.Trim());
                if (intCodigoMatricula <= 0)
                {
                    Mensaje("Codigo de la matricula no valido");
                    this.txtCodigo.Focus();
                    return false;
                }

                clsMatricula objMAT = new clsMatricula(strApp);

                if (!objMAT.BuscarMatricula(intCodigoMatricula, grvMariculas))
                {
                    Mensaje(objMAT.strError);
                    objMAT = null;
                    this.txtCodigo.Focus();
                    return false;
                }
                this.txtCodigo.Text = objMAT.Codigo.ToString();
                this.txtNombreCliente.Text = objMAT.NombreCliente.ToString();
                this.txtDocCliente.Text = objMAT.DocCLiente.ToString();
                this.txtFechaMat.Text = objMAT.FechaMatricula.ToString();
                this.txtEmpleadoMat.Text = objMAT.NombreEmpleadoMatricula.ToString();
                this.ddlFormaPago0.SelectedValue = objMAT.idFormaPago.ToString();
                this.txtFechaPag.Text = objMAT.FechaPago.ToString();
                this.txtEmpleadoPag.Text = objMAT.NombreEmpleadoPago.ToString();
                this.txtCodPag.Text = objMAT.CodPago.ToString();
                this.txtMontoPag.Text = objMAT.MontoPago.ToString();
                objMAT = null;
                return true;

            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
                return false;
            }
        }

        private bool BuscarCliente()

        {
            try
            {

                Mensaje(string.Empty);
                intidCliente = Convert.ToInt32(txtCodCliente.Text.Trim());
                if (intidCliente <= 0)
                {
                    Mensaje("Codigo de la matricula no valido");
                    this.txtCodigo.Focus();
                    return false;
                }

                clsMatricula objMAT = new clsMatricula(strApp);

                if (!objMAT.BuscarClienteMatricula(intidCliente, grvMariculas))
                {
                    Mensaje(objMAT.strError);
                    objMAT = null;
                    this.txtCodigo.Focus();
                    return false;
                }
                
                this.txtNombreCliente.Text = objMAT.NombreCliente.ToString();
                this.txtDocCliente.Text = objMAT.DocCLiente.ToString();
                this.txtCodCliente.Text = objMAT.idCliente.ToString();
                objMAT = null;
                return true;

            }
            catch (Exception ex)
            {
                Mensaje(ex.Message);
                return false;
            }
        }

        private void LlenarGridMatricula()
        {
            clsMatricula objMAT = new clsMatricula(strApp);
            objMAT.LlenarGrid(grvMariculas);
            objMAT = null;
        }

        private void LlenarComboCursos()
        {
            clsCurso objCUR = new clsCurso(strApp);
            if (!objCUR.LlenarCombo(ddlCursos))
            {
                Mensaje(objCUR.strError);
                objCUR = null;
                return;
            }
            objCUR = null;
        }

        private void LlenarComboFormaPago()
        {
            clsMatricula objMAT = new clsMatricula(strApp);
            if (!objMAT.LlenarComboFromaPago(ddlFormaPago0))
            {
                Mensaje(objMAT.strError);
                objMAT = null;
                return;
            }
            objMAT = null;
        }

        private void LlenarComboPrograma(int _Curso)

        {
            clsPrograma objPRO = new clsPrograma(strApp);
            if (!objPRO.LlenarComboProgramacionCurso(ddlPrograma, _Curso))
            {
                Mensaje(objPRO.strError);
                objPRO = null;
                return;
            }
            objPRO = null;
        }
        #endregion
    }
}