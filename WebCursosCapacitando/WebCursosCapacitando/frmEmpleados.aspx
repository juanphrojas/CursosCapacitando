<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmEmpleados.aspx.cs" Inherits="WebCursosCapacitando.Formulario_web12" %>
<asp:Content ID="Content4" ContentPlaceHolderID="Cuerpo" runat="server">
    <table cellpadding="0" cellspacing="0" class="auto-style1">
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">EMPLEADOS&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td style="background-color: #FFF5CE">&nbsp;</td>
        <td style="background-color: #FFF5CE" class="auto-style3">
                        <asp:Menu ID="mnuOpc" runat="server" CssClass="nuevoEstilo7" Orientation="Horizontal" RenderingMode="Table" Width="100%" OnMenuItemClick="mnuOpc_MenuItemClick">
                            <Items>
                                <asp:MenuItem Text="Agregar" Value="opcAgregar"></asp:MenuItem>
                                <asp:MenuItem Text="Modificar" Value="opcModificar"></asp:MenuItem>
                                <asp:MenuItem Text="Buscar" Value="opcBuscar"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#FFFF99" />
                            <StaticMenuItemStyle ForeColor="#838383" HorizontalPadding="20px" VerticalPadding="10px" />
                        </asp:Menu>
                    </td>
        <td style="background-color: #FFF5CE">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Panel ID="PanelInfo" runat="server">
                <table align="center" cellpadding="0" cellspacing="0" class="auto-style4">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><strong>Código:</strong></td>
                        <td>
                            <asp:TextBox ID="txtCodigo" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="ibtnBuscar" runat="server" Height="25px" ImageUrl="~/imagenes/buscar.png" OnClick="ibtnBuscar_Click" Visible="False" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><strong>Nombre:</strong></td>
                        <td>
                            <asp:TextBox ID="txtNombre" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td><strong>Apellido:</strong></td>
                        <td>
                            <asp:TextBox ID="txtApellido" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><strong>Nro. Docuento: </strong></td>
                        <td>
                            <asp:TextBox ID="txtNroDoc" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td><strong>Usuario:</strong></td>
                        <td>
                            <asp:TextBox ID="txtUsuario" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="font-weight: 700">Contraseña:</td>
                        <td>
                            <asp:TextBox ID="txtContra" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td><strong>Confirmar Contraseña:</strong></td>
                        <td>
                            <asp:TextBox ID="txtConfContra" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="font-weight: 700">Cargo:</td>
                        <td>
                            <asp:DropDownList ID="ddlCargo" runat="server" Height="25px" Width="269px" Enabled="False">
                            </asp:DropDownList>
                        </td>
                        <td><strong>Antigüedad:</strong></td>
                        <td>
                            <asp:TextBox ID="txtAntiguedad" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
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
                            <asp:Button ID="btnAddEmpleado" runat="server" BackColor="#00FF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Resgistrar Empleado" Width="200px" OnClick="btnAddEmpleado_Click" Visible="False" />
                        </td>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnModEmpleado" runat="server" BackColor="#FFCC66" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Modificar" Width="200px" OnClick="btnModEmpleado_Click" Visible="False" />
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
        <td colspan="3" class="auto-style3">
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
                        <asp:GridView ID="grvEmpleados" runat="server" CellPadding="10" Width="100%">
                            <AlternatingRowStyle BackColor="#FFF4C1" />
                            <HeaderStyle BackColor="#FEDC7B" ForeColor="#2F3065" />
                        </asp:GridView>
                    </td>
    </tr>
</table>
</asp:Content>

