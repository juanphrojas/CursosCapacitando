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

        string Usuario, Pass;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                    Usuario = Session["Usuario"].ToString();
                    Pass = Session["password"].ToString();

                    if (string.IsNullOrEmpty(Usuario) || string.IsNullOrEmpty(Pass))
                    {
                        Response.Redirect("~/frmBienvenida.aspx");
                    }

                    txtEmpleado.Text = Usuario;

                }
                catch (Exception ex)
                {
                    Response.Redirect("~/frmBienvenida.aspx");
                }
            }
        }
    }
}