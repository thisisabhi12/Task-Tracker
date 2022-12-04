<%@ Page Title="" Language="C#" MasterPageFile="~/TaskTracker.master" AutoEventWireup="true" CodeFile="AllocatedTask.aspx.cs" Inherits="AllocatedTask" %>

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
                    <h1>Allocate Task</h1>
                </div>
            </div>
        </div>

    </div>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Employee Name"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlemployeeid" runat="server" CssClass="form__input" AutoPostBack="True">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server">Type  of work</asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddltypeofwork" runat="server" CssClass="form__input" AutoPostBack="True">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Customer Name"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlcustomerid" runat="server" CssClass="form__input" AutoPostBack="True">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Target Date"></asp:Label>
                    </td>
                    <td>
                        <asp:Calendar ID="targetdate" runat="server" Height="190px" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Width="297px" BorderWidth="1px" NextPrevFormat="FullMonth">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" Font-Bold="True" BorderWidth="4px" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Target Time"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="targettime" runat="server" CssClass="form__input"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="targettime" ErrorMessage="*" ForeColor="#DB0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Description"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="description" runat="server" CssClass="form__input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="description" ErrorMessage="*" ForeColor="#DB0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="File Upload"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="photoupload" runat="server" Width="187px" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="photoupload" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Date" Visible="false"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="date" runat="server" CssClass="form__input" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <center>
                <asp:Button ID="AllocatedTaskSubmit" runat="server" Text="Submit" OnClick="AllocatedTaskSubmit_Click" CssClass="button1" />
                    </center>
                    </td>
                </tr>

            </table>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="870px" DataKeyNames="Id" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="employeename" HeaderText="Employee Name" />
                                <asp:BoundField DataField="tow" HeaderText="Type of Work" />
                                <asp:BoundField DataField="customername" HeaderText="Customer Name" />
                                <asp:BoundField DataField="targetdate" HeaderText="Target Date" />
                                <asp:BoundField DataField="targettime" HeaderText="Target Time" />
                                <asp:BoundField DataField="description" HeaderText="Description" />
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

