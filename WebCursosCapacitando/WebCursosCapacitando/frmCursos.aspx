<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmCursos.aspx.cs" Inherits="WebCursosCapacitando.Formulario_web13" %>
<asp:Content ID="Content4" ContentPlaceHolderID="Cuerpo" runat="server">
    <table align="center" cellpadding="0" cellspacing="0" class="auto-style4">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">CURSOS</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr style="background-color: #FFF5CE">
            <td>
                        <asp:Menu ID="mnuOpciones" runat="server" CssClass="nuevoEstilo7" Orientation="Horizontal" RenderingMode="Table" Width="100%" OnMenuItemClick="mnuOpciones_MenuItemClick">
                            <Items>
                                <asp:MenuItem Text="Agregar" Value="opcAgregar"></asp:MenuItem>
                                <asp:MenuItem Text="Modificar" Value="opcModificar"></asp:MenuItem>
                                <asp:MenuItem Text="Agregar Tema" Value="opcAgregarTema"></asp:MenuItem>
                                <asp:MenuItem Text="Buscar" Value="opcBuscar"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#FFFF99" />
                            <StaticMenuItemStyle ForeColor="#838383" HorizontalPadding="20px" VerticalPadding="10px" />
                        </asp:Menu>
                    </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
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
                            <asp:ImageButton ID="ibtnBuscar" runat="server" Height="25px" ImageUrl="~/imagenes/buscar.png" OnClick="ibtnBuscar_Click" Visible="False" />
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
                        <td><strong>Nombre:</strong></td>
                        <td>
                            <asp:TextBox ID="txtNombre" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td><strong>Fecha:</strong></td>
                        <td>
                            <asp:TextBox ID="txtFecha" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5"><strong>Costo:</strong></td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtCosto" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="auto-style5"><strong>Horas:</strong></td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtHoras" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="font-weight: 700">Empleado:</td>
                        <td>
                            <asp:TextBox ID="txtEmpleado" runat="server" Height="20px" Width="269px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Panel ID="PanelTemas" runat="server" Visible="False">
                                <table cellpadding="0" cellspacing="0" class="auto-style1">
                                    <tr>
                                        <td colspan="4" style="text-align: left">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: left">TEMAS DEL CURSO</td>
                                        <td colspan="2" style="text-align: right">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td><strong style="text-align: center">Tema:</strong></td>
                                        <td colspan="2" style="text-align: center">
                                            <asp:DropDownList ID="ddlTema" runat="server" Height="25px" Width="500px">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Button ID="btnAddTema0" runat="server" BackColor="#CCFF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Agregar Tema" Width="200px" OnClick="btnAddTema0_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnAddCurso" runat="server" BackColor="#00FF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Resgistrar Curso" Width="200px" OnClick="btnAddCurso_Click" Visible="False" />
                        </td>
                        <td colspan="2" style="text-align: center">
                            <asp:Button ID="btnModCurso" runat="server" BackColor="#FFCC66" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Modificar" Width="200px" OnClick="btnModCurso_Click" Visible="False" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="nuevoEstilo2">
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                        <asp:GridView ID="grvCursos" runat="server" CellPadding="10" Width="100%">
                            <AlternatingRowStyle BackColor="#FFF4C1" />
                            <HeaderStyle BackColor="#FEDC7B" ForeColor="#2F3065" />
                        </asp:GridView>
                    </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style4 {
            width: 80%;
        }
        .nuevoEstilo2 {
            text-align: center;
        }
        .nuevoEstilo7 {
            text-transform: uppercase;
            font-weight: normal;
        text-align: center;
    }
        .auto-style5 {
            height: 25px;
        }
    </style>
</asp:Content>

