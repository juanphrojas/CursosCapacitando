<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmPagos.aspx.cs" Inherits="WebCursosCapacitando.Formulario_web15" %>
<asp:Content ID="Content4" ContentPlaceHolderID="Cuerpo" runat="server">
    <table cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">PAGOS</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table align="center" cellpadding="0" cellspacing="0" class="auto-style4">
                    <tr>
                        <td><strong>Código:</strong></td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="296px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Width="296px"></asp:TextBox>
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
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                        <asp:GridView ID="grvPagos" runat="server" CellPadding="10" Width="100%">
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
            width: 90%;
        }
    </style>
</asp:Content>

