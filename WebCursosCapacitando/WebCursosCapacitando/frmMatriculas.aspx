<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmMatriculas.aspx.cs" Inherits="WebCursosCapacitando.Formulario_web14" %>
<asp:Content ID="Content4" ContentPlaceHolderID="Cuerpo" runat="server">
    <table cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">MATRICULAS</td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr style="background-color: #FFF5CE">
            <td>&nbsp;</td>
            <td>
                        <asp:Menu ID="mnuOpc" runat="server" CssClass="nuevoEstilo7" Orientation="Horizontal" RenderingMode="Table" Width="100%" OnMenuItemClick="mnuOpc_MenuItemClick">
                            <Items>
                                <asp:MenuItem Text="Agregar" Value="opcAgregar"></asp:MenuItem>
                                <asp:MenuItem Text="Modificar" Value="opcModificar"></asp:MenuItem>
                                <asp:MenuItem Text="Agregar Programacion" Value="opcAddPrograma"></asp:MenuItem>
                                <asp:MenuItem Text="Buscar" Value="opcBuscar"></asp:MenuItem>
                                <asp:MenuItem Text="Registrar Pago" Value="opcPago"></asp:MenuItem>
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
                <table align="center" cellpadding="0" cellspacing="0" class="auto-style4">
                    <tr>
                        <td><strong>Código:</strong></td>
                        <td>
                            <asp:TextBox ID="txtCodigo" runat="server" Height="20px" Width="296px" ReadOnly="True"></asp:TextBox>
                            <asp:ImageButton ID="ibtnBuscarXCodigo" runat="server" Height="25px" ImageUrl="~/imagenes/buscar.png" OnClick="ibtnBuscarXCodigo_Click" Visible="False" />
                        </td>
                        <td><strong>Código Cleinte:</strong></td>
                        <td>
                            <asp:TextBox ID="txtCodCliente" runat="server" Height="20px" Width="296px" ReadOnly="True"></asp:TextBox>
                            <asp:ImageButton ID="ibtnBuscarXCliente" runat="server" Height="25px" ImageUrl="~/imagenes/buscar.png" OnClick="ibtnBuscarXCliente_Click" Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td><strong>Doc. Cliente:</strong></td>
                        <td>
                            <asp:TextBox ID="txtDocCliente" runat="server" Height="20px" Width="296px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td><strong style="text-align: center">&nbsp;Nombre:</strong></td>
                        <td>
                            <asp:TextBox ID="txtNombreCliente" runat="server" Height="20px" Width="300px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><strong>Fecha:</strong></td>
                        <td>
                            <asp:TextBox ID="txtFechaMat" runat="server" Height="20px" Width="296px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td><strong>Empleado:</strong></td>
                        <td>
                            <asp:TextBox ID="txtEmpleadoMat" runat="server" Height="20px" Width="296px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Panel ID="PanelProgramas" runat="server" Visible="False">
                                <table cellpadding="0" cellspacing="0" class="auto-style1">
                                    <tr>
                                        <td>PROGRAMAS</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td style="text-align: right">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Curso:</strong></td>
                                        <td>
                                            <asp:DropDownList ID="ddlCursos" runat="server" Height="25px" Width="296px" OnSelectedIndexChanged="ddlCursos_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                        <td><strong>Programa:</strong></td>
                                        <td>
                                            <asp:DropDownList ID="ddlPrograma" runat="server" Height="25px" Width="100%">
                                            </asp:DropDownList>
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
                                        <td colspan="2">&nbsp;</td>
                                        <td style="text-align: right">
                                            <asp:Button ID="btnAddPrograma" runat="server" BackColor="#CCFF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Agregar Programa" Width="200px" OnClick="btnAddPrograma_Click" Visible="False" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                                            <asp:Panel ID="PanelPago" runat="server" Visible="False">
                                                <table cellpadding="0" cellspacing="0" class="auto-style1">
                                                    <tr>
                                                        <td>PAGOS</td>
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
                                                        <td><strong>Codigo</strong>:</td>
                                                        <td>
                                                            <asp:TextBox ID="txtCodPag" runat="server" ReadOnly="True" Width="296px"></asp:TextBox>
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
                                                        <td><strong>Forma de pago:</strong></td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlFormaPago0" runat="server" Width="296px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td><strong>Fecha:</strong></td>
                                                        <td>
                                                            <asp:TextBox ID="txtFechaPag" runat="server" Width="296px" ReadOnly="True"></asp:TextBox>
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
                                                        <td><strong>Empleado:</strong></td>
                                                        <td>
                                                            <asp:TextBox ID="txtEmpleadoPag" runat="server" Width="296px" ReadOnly="True"></asp:TextBox>
                                                        </td>
                                                        <td class="nuevoEstilo7"><strong>Monto:</strong></td>
                                                        <td>
                                                            <asp:TextBox ID="txtMontoPag" runat="server" Width="296px"></asp:TextBox>
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
                                                        <td>
                                                            <asp:Button ID="btnAddPago" runat="server" BackColor="#0099FF" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="White" Height="47px" Text="Resgistrar Pago" Width="200px" OnClick="btnAddPago_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnAddMatricula" runat="server" BackColor="#00FF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Resgistrar Matricula" Width="200px" OnClick="btnAddMatricula_Click" Visible="False" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnModMatricula" runat="server" BackColor="#FFCC66" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Modificar" Width="200px" OnClick="btnModMatricula_Click" Visible="False" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="nuevoEstilo7">
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                        <asp:GridView ID="grvMariculas" runat="server" CellPadding="10" Width="100%">
                            <AlternatingRowStyle BackColor="#FFF4C1" />
                            <HeaderStyle BackColor="#FEDC7B" ForeColor="#2F3065" />
                        </asp:GridView>
                    </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .nuevoEstilo7 {
            text-align: center;
        }
    </style>
</asp:Content>


