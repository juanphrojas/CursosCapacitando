﻿<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmProgramaciones.aspx.cs" Inherits="WebCursosCapacitando.Formulario_web1" %>
<asp:Content ID="Content4" ContentPlaceHolderID="Cuerpo" runat="server">
    
    <table cellpadding="0" cellspacing="0" class="auto-style1">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3" colspan="4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3" colspan="4">PROGRAMACIONES</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="background-color: #FFF5CE">
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2" style="text-align: center">
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
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:Panel ID="PanelInfo" runat="server">
                            <table align="center" cellpadding="0" cellspacing="0" class="auto-style18">
                                <tr>
                                    <td class="auto-style19"><strong style="text-align: right">Curso:</strong></td>
                                    <td>&nbsp;&nbsp;&nbsp;
                                        <asp:DropDownList ID="ddlCurso" runat="server" Height="25px" Width="300px" style="text-align: left">
                                        </asp:DropDownList>
                                        <asp:ImageButton ID="ibtnBuscar" runat="server" Height="25px" ImageUrl="~/imagenes/buscar.png" ImageAlign="Top" />
                                    </td>
                                    <td class="auto-style19"><strong style="text-align: right">Docente a cargo:</strong></td>
                                    <td>&nbsp;&nbsp;&nbsp;
                                        <asp:DropDownList ID="ddlDocente" runat="server" Height="25px" Width="420px">
                                        </asp:DropDownList>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table cellpadding="0" cellspacing="0" class="auto-style1">
                                            <tr>
                                                <td class="auto-style3" colspan="3"><strong>Fecha de inicio</strong></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                                <td class="auto-style3">
                                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="10" CssClass="nuevoEstilo1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="60%">
                                                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                                        <NextPrevStyle VerticalAlign="Bottom" />
                                                        <OtherMonthDayStyle ForeColor="#808080" />
                                                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                                        <SelectorStyle BackColor="#CCCCCC" />
                                                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                                    </asp:Calendar>
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:TextBox ID="txtFecha" runat="server" BorderStyle="None" Height="40px" ReadOnly="True" Width="100%" BackColor="#FFFFCC" CssClass="nuevoEstilo8" style="text-align: center"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td colspan="2">
                                        <table cellpadding="0" cellspacing="0" class="auto-style1">
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Panel ID="PanelEstado" runat="server">
                                                        <div class="auto-style3">
                                                            <strong>Estado</strong></div>
                                                        <div class="auto-style3">
                                                            <asp:RadioButtonList ID="rbtnEstado" runat="server" CellSpacing="5" RepeatDirection="Horizontal" Width="100%">
                                                                <asp:ListItem Selected="True" Value="opcActivo">Activo</asp:ListItem>
                                                                <asp:ListItem Value="opcInactivo">Inactivo</asp:ListItem>
                                                                <asp:ListItem Value="opcCancelado">Cancelado</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style19"><strong>Cupos:</strong></td>
                                                <td>&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="txtCupos" runat="server" Height="20px" Width="231px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style19"><strong>Empleado: </strong></td>
                                                <td>&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="txtEmpleado" runat="server" Height="20px" Width="231px"></asp:TextBox>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Panel ID="PanelAccionesProgram" runat="server">
                                                        <div class="auto-style3">
                                                            <asp:Button ID="btnAddProgramacion" runat="server" BackColor="#00FF99" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Añadir a programación" Width="200px" />
                                                            <asp:Button ID="btnModProgramacion" runat="server" BackColor="#FFCC66" BorderColor="#00B96F" BorderStyle="None" CssClass="nuevoEstilo2" Font-Bold="True" ForeColor="#002847" Height="47px" Text="Añadir a programación" Width="200px" />
                                                        </div>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align: center">
                                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="grvProgramaciones" runat="server" CellPadding="10" Width="100%">
                            <AlternatingRowStyle BackColor="#FFF4C1" />
                            <HeaderStyle BackColor="#FEDC7B" ForeColor="#2F3065" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
    
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .titulo-encabezado {
        font-weight: bold;
        color: #2f3065;
    }
    .nuevoEstilo1 {
        margin: auto;
    }
    .nuevoEstilo2 {
        cursor: pointer;
    }
        .nuevoEstilo3 {
            margin: auto;
        }
        .nuevoEstilo4 {
            text-align: center;
            margin: auto;
            width: 100%;
        }
        .nuevoEstilo5 {
            position: fixed;
            top: 392px;
            left:107px;
            right: 1068px;
        width: 110px;
    }
    .nuevoEstilo6 {            font-weight: 700;
        }
        .nuevoEstilo7 {
            text-transform: uppercase;
            font-weight: normal;
        }
        .nuevoEstilo8 {
            margin: auto;
            width: 60%;
            text-align: center;
        }
        .auto-style18 {
            width: 90%;
        }
        .auto-style19 {
            text-align: right;
        }
    </style>
</asp:Content>
