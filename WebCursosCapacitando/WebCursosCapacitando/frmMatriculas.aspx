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
                        <asp:Menu ID="mnuOpc" runat="server" CssClass="nuevoEstilo7" Orientation="Horizontal" RenderingMode="Table" Width="100%">
                            <Items>
                                <asp:MenuItem Text="Agregar" Value="opcAgregar"></asp:MenuItem>
                                <asp:MenuItem Text="Modificar" Value="opcModificar"></asp:MenuItem>
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
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtCodigo" runat="server" Height="20px" Width="296px"></asp:TextBox>
                            <asp:ImageButton ID="ibtnBuscarXCodigo" runat="server" Height="25px" ImageUrl="~/imagenes/buscar.png" ImageAlign="Top" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
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
                            <asp:TextBox ID="txtDocCliente" runat="server" Height="20px" Width="296px"></asp:TextBox>
                            <asp:ImageButton ID="ibtnBuscarXDocCliente" runat="server" Height="25px" ImageUrl="~/imagenes/buscar.png" ImageAlign="Top" />
                        </td>
                        <td><strong style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nombre:</strong></td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtNombre" runat="server" Height="20px" Width="300px"></asp:TextBox>
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
                        <td class="auto-style5">
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtFecha" runat="server" Height="20px" Width="296px"></asp:TextBox>
                        </td>
                        <td class="auto-style4"><strong>Empleado:</strong></td>
                        <td>
                            <asp:TextBox ID="txtEmpleado" runat="server" Height="20px" Width="296px"></asp:TextBox>
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
                            <asp:Panel ID="PanelProgramas" runat="server">
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
                                        <td class="auto-style5">
                                            &nbsp;&nbsp;
                                            <asp:DropDownList ID="ddlCurso" runat="server" Height="25px" Width="296px">
                                            </asp:DropDownList>
                                        </td>
                                        <td><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Programa:&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
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
                                            <asp:Button ID="btnAddPrograma" runat="server" BackColor="#CCFF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Agregar Programa" Width="200px" />
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
                                                        <td><strong>Forma de pago:</strong></td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlFormaPago" runat="server" Width="296px">
                                                            </asp:DropDownList>
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
                                                        <td><strong>Código:</strong></td>
                                                        <td>
                                                            <asp:TextBox ID="txtCodigoPago" runat="server" Width="296px"></asp:TextBox>
                                                        </td>
                                                        <td class="nuevoEstilo7"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fecha:</strong></td>
                                                        <td>
                                                            <asp:TextBox ID="txtFechaPago" runat="server" Width="296px"></asp:TextBox>
                                                        </td>
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
                                                            <asp:TextBox ID="txtEmpleadoPago" runat="server" Width="296px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style4"><strong>Monto:</strong></td>
                                                        <td>
                                                            <asp:TextBox ID="txtMonto" runat="server" Width="296px"></asp:TextBox>
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
                                                            <asp:Button ID="btnAddMatricula0" runat="server" BackColor="#0099FF" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="White" Height="47px" Text="Resgistrar Pago" Width="200px" />
                                                        </td>
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
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnAddMatricula" runat="server" BackColor="#00FF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Resgistrar Matricula" Width="200px" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnModEmpleado" runat="server" BackColor="#FFCC66" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Modificar" Width="200px" />
                        </td>
                    </tr>
                </table>
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
        .auto-style4 {
            text-align: right;
        }
        .auto-style5 {
            text-align: left;
        }
    </style>
</asp:Content>


