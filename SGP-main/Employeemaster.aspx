<%@ Page Title="" Language="C#" MasterPageFile="~/TaskTracker.master" AutoEventWireup="true" CodeFile="Employeemaster.aspx.cs" Inherits="Employeemaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 50%;
            margin-left: auto;
            margin-right: auto;
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
                    <h1>Employee Details</h1>
                </div>
            </div>
        </div>

    </div>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Employee Name"></asp:Label>
                    </td>
                    <td>

                        <asp:TextBox ID="empname" runat="server" CssClass="form__input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="empname" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="empname" runat="server" ErrorMessage="Use chaeacters only" ValidationExpression="^[a-zA-Z]+$" ForeColor="#DB0000"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Mob no"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="empmobno" runat="server" CssClass="form__input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="empmobno" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="empmobno" ErrorMessage="Use 10 characters only" ValidationExpression="^[0-9]{10}$" ForeColor="#DB0000"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="empmail" runat="server" CssClass="form__input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="empmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#DB0000" ControlToValidate="empmail"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddldepartment" runat="server" CssClass="form__input">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Designation"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddldesignation" runat="server" CssClass="form__input"></asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="empaddress" runat="server" CssClass="form__input"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="emppassword" runat="server" TextMode="Password" CssClass="form__input"></asp:TextBox>


                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emppassword" ErrorMessage="*" ForeColor="#DB0000"></asp:RequiredFieldValidator>


                    </td>
                </tr>
               
            </table>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <center>
                <asp:Button ID="empsubmit" runat="server" OnClick="empsubmit_Click" Text="Submit" CssClass="button1" />
                            </center>
                    </td>

                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="GridView1" runat="server" Width="870px" DataKeyNames="Id" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="employeename" HeaderText="Employee Name" />
                                <asp:BoundField DataField="email" HeaderText="Email Id" />
                                <asp:BoundField DataField="mobileno" HeaderText="Mobile no" />
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
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>

                    </td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>

