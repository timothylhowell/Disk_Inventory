<%@ Page Title="Artist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="SWDV_235_Project.Artist" %>
<%-- Artist page creates a list view displaying the current artists and allows for the use of stored procedures to insert, update, and delete artists --%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h1>Artists</h1>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="artistID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="artistIDLabel" runat="server" Text='<%# Eval("artistID") %>' />
                </td>
                <td>
                    <asp:Label ID="artistLastNameLabel" runat="server" Text='<%# Eval("artistLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistFirstNameLabel" runat="server" Text='<%# Eval("artistFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistGroupNameLabel" runat="server" Text='<%# Eval("artistGroupName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistTypeIDLabel" runat="server" Text='<%# Eval("artistTypeID") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <%-- Allows for updating Artist using sp_UpdateArtist2. Runs validation of required fileds and data types --%>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #000000;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="edit" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="artistIDLabel1" runat="server" Text='<%# Eval("artistID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artistLastNameTextBox" ValidationGroup="edit" MaxLength="32" runat="server" Text='<%# Bind("artistLastName") %>'  />
                </td>
                <td>
                    <asp:TextBox ID="artistFirstNameTextBox" ValidationGroup="edit" MaxLength="32" runat="server" Text='<%# Bind("artistFirstName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artistGroupNameTextBox" ValidationGroup="edit" MaxLength="32" runat="server" Text='<%# Bind("artistGroupName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artistTypeIDTextBox" ValidationGroup="edit" runat="server" Text='<%# Bind("artistTypeID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="edit" ControlToValidate="artistTypeIDTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Artist type is required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Artist Type ID must be a number between 1 and 4" ValidationExpression="([1-4])" ValidationGroup="edit" ControlToValidate="artistTypeIDTextBox" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <%-- Allows for adding Artists using sp_InsertArtist. Runs validation of required fileds and data types --%>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="artistLastNameTextBox" ValidationGroup="insert" MaxLength="32" runat="server" Text='<%# Bind("artistLastName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artistFirstNameTextBox" ValidationGroup="insert" MaxLength="32" runat="server" Text='<%# Bind("artistFirstName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artistGroupNameTextBox" ValidationGroup="insert" MaxLength="32" runat="server" Text='<%# Bind("artistGroupName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artistTypeIDTextBox" ValidationGroup="insert" runat="server" Text='<%# Bind("artistTypeID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Artist type is required" ControlToValidate="artistTypeIDTextBox" Display="Dynamic" CssClass="text-danger" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Artist Type ID must be a number between 1 and 4" ValidationExpression="([1-4])" ValidationGroup="insert" ControlToValidate="artistTypeIDTextBox" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="artistIDLabel" runat="server" Text='<%# Eval("artistID") %>' />
                </td>
                <td>
                    <asp:Label ID="artistLastNameLabel" runat="server" Text='<%# Eval("artistLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistFirstNameLabel" runat="server" Text='<%# Eval("artistFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistGroupNameLabel" runat="server" Text='<%# Eval("artistGroupName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistTypeIDLabel" runat="server" Text='<%# Eval("artistTypeID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">artistID</th>
                                <th runat="server">artistLastName</th>
                                <th runat="server">artistFirstName</th>
                                <th runat="server">artistGroupName</th>
                                <th runat="server">artistTypeID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
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
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="artistIDLabel" runat="server" Text='<%# Eval("artistID") %>' />
                </td>
                <td>
                    <asp:Label ID="artistLastNameLabel" runat="server" Text='<%# Eval("artistLastName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistFirstNameLabel" runat="server" Text='<%# Eval("artistFirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistGroupNameLabel" runat="server" Text='<%# Eval("artistGroupName") %>' />
                </td>
                <td>
                    <asp:Label ID="artistTypeIDLabel" runat="server" Text='<%# Eval("artistTypeID") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryTHUserArtist %>" DeleteCommand="sp_DeleteArtist2" InsertCommand="sp_InsertArtist" SelectCommand="SELECT [artistID], [artistLastName], [artistFirstName], [artistGroupName], [artistTypeID] FROM [Artists] ORDER BY [artistLastName], [artistFirstName], [artistGroupName]" UpdateCommand="sp_UpdateArtist2" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:Parameter Name="artistID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="artistTypeID" Type="Int32" />
        <asp:Parameter Name="artistFirstName" Type="String" />
        <asp:Parameter Name="artistLastName" Type="String" />
        <asp:Parameter Name="artistGroupName" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="artistID" Type="Int32" />
        <asp:Parameter Name="artistFirstName" Type="String" />
        <asp:Parameter Name="artistLastName" Type="String" />
        <asp:Parameter Name="artistGroupName" Type="String" />
        <asp:Parameter Name="artistTypeID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
        <%-- Creates a Key for artist type --%>
    <div class="row">
        <h6>Artist Type Key</h6>
        <ol>
            <li>Solo</li>
            <li>Group</li>
            <li>Collab</li>
            <li>Director</li>
        </ol>
    </div>

</asp:Content>
