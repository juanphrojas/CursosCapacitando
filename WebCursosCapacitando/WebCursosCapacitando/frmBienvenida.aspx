<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmBienvenida.aspx.cs" Inherits="WebCursosCapacitando.frmBienvenida" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cursos Capacitandp</title>
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
        .btn {
            padding: 10px;
            border: none;
            background: #0094ff;
            cursor: pointer;
            color: white;
            border-radius: 3px;
        }
        h1 {
            font-weight: normal;
        }
        
    </style>
</head>
<body>
    
    <div class="full">
        <asp:Image ImageUrl="~/imagenes/logo.jpg" Height="250px" runat="server"/>
        <h1>SISTEMA DE CURSOS CAPACITANDO</h1>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Timer ID="Timer1" runat="server" Interval="2500" OnTick="Timer1_Tick1">
            </asp:Timer>
            <br />
        </form>
    </div>
</body>
</html>
