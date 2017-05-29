<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmCliente.aspx.cs" Inherits="WebCursosCapacitando.Formulario_web11" %>
<asp:Content ID="Content4" ContentPlaceHolderID="Cuerpo" runat="server">
    <table cellpadding="0" cellspacing="0" class="auto-style1">
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">CLIENTES</td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr style="background-color: #FFF5CE">
        <td>&nbsp;</td>
        <td>
                        <asp:Menu ID="mnuOpciones" runat="server" CssClass="nuevoEstilo7" Orientation="Horizontal" RenderingMode="Table" Width="100%">
                            <Items>
                                <asp:MenuItem Text="Agregar" Value="opcAgregar"></asp:MenuItem>
                                <asp:MenuItem Text="Modificar" Value="opcModificar"></asp:MenuItem>
                                <asp:MenuItem Text="Buscar" Value="opcBuscar"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#FFFF99" />
                            <StaticMenuItemStyle ForeColor="#838383" HorizontalPadding="20px" VerticalPadding="10px" />
                        </asp:Menu>
                    </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Panel ID="PanelInfo" runat="server">
                <table align="center" cellpadding="0" cellspacing="0" class="auto-style4">
                    <tr>
                        <td class="auto-style5"><strong>Código:</strong></td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtCodigo" runat="server" Height="20px" Width="269px"></asp:TextBox>
                            <asp:ImageButton ID="ibtnBuscar" runat="server" Height="25px" ImageUrl="~/imagenes/buscar.png" ImageAlign="Top" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5"><strong>Nombre:</strong></td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtNombre" runat="server" Height="20px" Width="269px"></asp:TextBox>
                        </td>
                        <td class="auto-style5"><strong>Apellido:</strong></td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtApellido" runat="server" Height="20px" Width="269px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5"><strong>Nro. Docuento: </strong></td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtNroDoc" runat="server" Height="20px" Width="269px"></asp:TextBox>
                        </td>
                        <td class="auto-style5"><strong>Empleado:</strong></td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtEmpleado" runat="server" Height="20px" Width="269px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnAddCliente" runat="server" BackColor="#00FF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Resgistrar Cliente" Width="200px" />
                        </td>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnModCliente" runat="server" BackColor="#FFCC66" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Modificar" Width="200px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
                        <asp:GridView ID="grvClientes" runat="server" CellPadding="10" Width="100%">
                            <AlternatingRowStyle BackColor="#FFF4C1" />
                            <HeaderStyle BackColor="#FEDC7B" ForeColor="#2F3065" />
                        </asp:GridView>
                    </td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .auto-style4 {
        width: 80%;
    }
        .nuevoEstilo7 {
            text-transform: uppercase;
            font-weight: normal;
        text-align: center;
    }
    .nuevoEstilo2 {
        cursor: pointer;
    }
        .auto-style5 {
            text-align: right;
        }
        </style>
</asp:Content>

