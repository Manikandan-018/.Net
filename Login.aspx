<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DemoPRoject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table align="center">
                <caption> Login Page </caption>
                <tr>
                    <td>User Name</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="Right">
                        <asp:Button ID="Button1" runat="server" Text="Login" OnClick ="Button1_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Reset" OnClick="Button2_Click" />

                    </td>
                       
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblstatus" runat="server" ForeColor="Red" />
                    </td>
            </table>

        </div>
    </form>
</body>
</html>
