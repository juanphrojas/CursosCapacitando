using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCursosCapacitando
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            string Usuario, Pass, Acceso;

            Usuario = this.txtNombreUsuario.Text.Trim();
            Pass = this.txtPass.Text.Trim();

            Acceso = "granted"; // accesa:granted, no accesa: denied

            if (Acceso == "granted")
            {
                Session["Usuario"] = Usuario;
                Session["Password"] = Pass;
                Response.Redirect("~/frmProgramaciones.aspx");
            }
            else
            {
                Response.Redirect("~/frmLogin.aspx");
            }
        }
    }
}