<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="WebCursosCapacitando.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0px;
            padding: 0px;
            border: 0px;
            background: #fedc7b;
            color: #2f3065;
        }
        .full {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form {
            width: 350px;
        }
        .btn {
            padding: 10px;
            border: none;
            background: #0094ff;
            cursor: pointer;
            color: white;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <div class="full">
        <asp:Image ImageUrl="~/imagenes/logo.jpg" Height="250px" runat="server"/><br />
        <form id="formLogin" runat="server">
            <label>Nombre de usuario:</label>
            <asp:TextBox ID="txtNombreUsuario" Width="100%" Height="25px" runat="server"></asp:TextBox><br /><br />
            <label>Contraseña:</label><br />
            <asp:TextBox ID="txtPass" Width="100%" Height="25px" TextMode="Password" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="btnIniciar" Text="Iniciar Sesión" CssClass="btn" runat="server" OnClick="btnIniciar_Click"/>
        </form>
    </div>
</body>
