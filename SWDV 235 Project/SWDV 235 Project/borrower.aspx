<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="borrower.aspx.cs" Inherits="SWDV_235_Project.borrower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%--Sets a heading for the page--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Borrower</h1>
<%--Generates a ListView for viewing, updating, deleting, and inserting using the Borrowers table of disk_inventoryTH--%>
&nbsp;<asp:ListView ID="ListView1" runat="server" DataKeyNames="borrowerID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="borrowerIDLabel" runat="server" Text='<%# Eval("borrowerID") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerLastNameLabel" runat="server" Text='<%# Eval("borrowerLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerFirstNameLabel" runat="server" Text='<%# Eval("borrowerFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerPhoneLabel" runat="server" Text='<%# Eval("borrowerPhone") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
    <%-- Allows for updating Borrowers using sp_UpdateBorrower2. Runs validation of required fileds and data types --%>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="borrowerIDLabel1" runat="server" Text='<%# Eval("borrowerID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="borrowerLastNameTextBox" ValidationGroup="edit" MaxLength="32" runat="server" Text='<%# Bind("borrowerLastName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Last name is Required" Display="Dynamic" CssClass="text-danger" ValidationGroup="edit" ControlToValidate="borrowerLastNameTextBox"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrowerFirstNameTextBox" ValidationGroup="edit" MaxLength="32" runat="server" Text='<%# Bind("borrowerFirstName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="First Name is Required" ValidationGroup="edit" ControlToValidate="borrowerFirstNameTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrowerPhoneTextBox" ValidationGroup="edit" runat="server" Text='<%# Bind("borrowerPhone") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Phone number is required" ValidationGroup="edit" ControlToValidate="borrowerPhoneTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone number must be in the correct format (Ex. 555-555-5555)" CssClass="text-danger" ControlToValidate="borrowerPhoneTextBox" Display="Dynamic" ValidationGroup="edit" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
    <%-- Allows for adding Borrowers using sp_InsertBorrower. Runs validation of required fileds and data types --%>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="false" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="borrowerLastNameTextBox" ValidationGroup="insert" MaxLength="32" runat="server" Text='<%# Bind("borrowerLastName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Last name is required" CssClass="text-danger" ControlToValidate="borrowerLastNameTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrowerFirstNameTextBox" ValidationGroup="insert" MaxLength="32" runat="server" Text='<%# Bind("borrowerFirstName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="First name is required" CssClass="text-danger" ControlToValidate="borrowerFirstNameTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrowerPhoneTextBox" ValidationGroup="insert" runat="server" Text='<%# Bind("borrowerPhone") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ErrorMessage="Phone number is required" CssClass="text-danger" ControlToValidate="borrowerPhoneTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ErrorMessage="Please enter the phone number in to correct format (Ex. 555-555-5555)" CssClass="text-danger" ControlToValidate="borrowerPhoneTextBox" ValidationGroup="insert"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="borrowerIDLabel" runat="server" Text='<%# Eval("borrowerID") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerLastNameLabel" runat="server" Text='<%# Eval("borrowerLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerFirstNameLabel" runat="server" Text='<%# Eval("borrowerFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerPhoneLabel" runat="server" Text='<%# Eval("borrowerPhone") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">borrowerID</th>
                                <th runat="server">borrowerLastName</th>
                                <th runat="server">borrowerFirstName</th>
                                <th runat="server">borrowerPhone</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="False" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="False" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" CausesValidation="false" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" CausesValidation="false" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="borrowerIDLabel" runat="server" Text='<%# Eval("borrowerID") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerLastNameLabel" runat="server" Text='<%# Eval("borrowerLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerFirstNameLabel" runat="server" Text='<%# Eval("borrowerFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="borrowerPhoneLabel" runat="server" Text='<%# Eval("borrowerPhone") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryTHUserBorrower %>" DeleteCommand="sp_DeleteBorrower2" InsertCommand="sp_InsertBorrower" SelectCommand="SELECT [borrowerID], [borrowerLastName], [borrowerFirstName], [borrowerPhone] FROM [Borrowers] ORDER BY [borrowerLastName], [borrowerFirstName]" UpdateCommand="sp_UpdateBorrower2" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="borrowerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="borrowerFirstName" Type="String" />
            <asp:Parameter Name="borrowerLastName" Type="String" />
            <asp:Parameter Name="borrowerPhone" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="borrowerID" Type="Int32" />
            <asp:Parameter Name="borrowerFirstName" Type="String" />
            <asp:Parameter Name="borrowerLastName" Type="String" />
            <asp:Parameter Name="borrowerPhone" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
&nbsp;
</asp:Content>