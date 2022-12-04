<%@ Page Title="" Language="C#" MasterPageFile="~/TaskTracker.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
        .form__input {
            width: 180px;
            height: 30px;
            margin: 4px 0;
            padding-left: 25px;
            font-size: 13px;
            letter-spacing: 0.15px;
            border: none;
            outline: none;
            font-family: 'Montserrat', sans-serif;
            transition: 0.25s ease;
            border-radius: 8px;
            box-shadow: inset 2px 2px 4px #d1d9e6, inset -2px -2px 4px #f9f9f9;
        }

        .button1 {
            width: 180px;
            height: 30px;
            background-color: #4CAF50; /* Green */
            border: none;
            outline: none;
            color: white;
            
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            border-radius: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="breadcrumbs">
        <div class="col-sm-4">
            <div class="page-header float-left">
                <div class="page-title">
                    <h1>Customer Details</h1>
                </div>
            </div>
        </div>

    </div>
    <form id="form1" runat="server">
        <div>
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Customer Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="customername" runat="server" CssClass="form__input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="customername" ErrorMessage="*" ForeColor="#DB0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Mobile no."></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="customermobno" runat="server" CssClass="form__input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="customermobno" ForeColor="#DB0000"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Use 10 number only" ValidationExpression="[0-9]{10}" ForeColor="#DB0000" ControlToValidate="customermobno"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="customeraddress" runat="server" CssClass="form__input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Email id"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="customeremail" runat="server" CssClass="form__input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="customeremail" ForeColor="#DB0000"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="customeremail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ForeColor="#DB0000"> Wrong format</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="passtxt" runat="server" TextMode="Password" CssClass="form__input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="passtxt" ForeColor="#DB0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Company Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="companyname" runat="server" CssClass="form__input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="companyname" ForeColor="#DB0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Contact no."></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="professionalno" runat="server" CssClass="form__input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="professionalno" ErrorMessage="*" ForeColor="#DB0000"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3"  runat="server" ErrorMessage="Use 10 number only" ForeColor="#DB0000" ControlToValidate="professionalno" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Branch Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="branchname" runat="server" CssClass="form__input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Branch Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="branchaddress" runat="server" CssClass="form__input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                <asp:Button ID="custsubmit" runat="server" OnClick="custsubmit_Click" Text="Submit" CssClass="button1" />
            </td>
            </center>
        </tr>
    </table>
    <table class="auto-style1">
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView2" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False" Width="870px" DataKeyNames="Id" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="customername" HeaderText="Customer Name" />
                        <asp:BoundField DataField="companyname" HeaderText="Company Name" />
                        <asp:BoundField DataField="customeremail" HeaderText="Email id" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click" CausesValidation="false"><img src="images/delete.png" height="20px" width="20px" /></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkedit" runat="server" OnClick="lnkedit_Click" CausesValidation="false"><img src="images/edit.png" height="20px" width="20px" /></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <sortedascendingcellstyle backcolor="#E9E7E2" />
                    <sortedascendingheaderstyle backcolor="#506C8C" />
                    <sorteddescendingcellstyle backcolor="#FFFDF8" />
                    <sorteddescendingheaderstyle backcolor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
     </div>
    </form>
</asp:Content>

