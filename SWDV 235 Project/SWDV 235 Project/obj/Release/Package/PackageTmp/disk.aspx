<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="disk.aspx.cs" Inherits="SWDV_235_Project.disk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%-- Disk page creates a list view displaying the current disks and allows for the use of stored procedures to insert, update, and delete disks --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Disks</h1>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="diskID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="diskIDLabel" runat="server" Text='<%# Eval("diskID") %>' />
                </td>
                <td>
                    <asp:Label ID="diskNameLabel" runat="server" Text='<%# Eval("diskName") %>' />
                </td>
                <td>
                    <asp:Label ID="releaseDateLabel" runat="server" Text='<%# Eval("releaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="genreIDLabel" runat="server" Text='<%# Eval("genreID") %>' />
                </td>
                <td>
                    <asp:Label ID="statusIDLabel" runat="server" Text='<%# Eval("statusID") %>' />
                </td>
                <td>
                    <asp:Label ID="diskTypeIDLabel" runat="server" Text='<%# Eval("diskTypeID") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <%-- Edit disk setings. Uses stored procedure sp_UpdateDisk2. Runs validations on all required fields --%>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="edit" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="diskIDLabel1" runat="server" Text='<%# Eval("diskID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="diskNameTextBox" ValidationGroup="edit" MaxLength="164" runat="server" Text='<%# Bind("diskName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="edit" ControlToValidate="diskNameTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Disk name is required"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="releaseDateTextBox" ValidationGroup="edit" runat="server" Text='<%# Bind("releaseDate") %>' />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="edit" ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d" ControlToValidate="releaseDateTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Release date must be in mm/dd/yyyy format"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Release date is required" ValidationGroup="edit" ControlToValidate="releaseDateTextBox" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="genreIDTextBox" ValidationGroup="edit" runat="server" Text='<%# Bind("genreID") %>' />
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Genere ID must be a number between 1 and 11" Type="Integer" ValidationGroup="edit" MinimumValue="1" MaximumValue="11" ControlToValidate="genreIDTextBox" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="edit" ControlToValidate="genreIDTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Genre ID is required"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="statusIDTextBox" ValidationGroup="edit" runat="server" Text='<%# Bind("statusID") %>' />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ValidationGroup="edit" ValidationExpression="([1-4])" ControlToValidate="statusIDTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Status ID must be a number between 1 and 4"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Status ID is required" ValidationGroup="edit" ControlToValidate="statusIDTextBox" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="diskTypeIDTextBox" ValidationGroup="edit" runat="server" Text='<%# Bind("diskTypeID") %>' />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Status ID must be a number between 1 and 6" ValidationExpression="([1-6])" ValidationGroup="edit" ControlToValidate="diskTypeIDTextBox" CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Disk type ID is required" ValidationGroup="edit" ControlToValidate="diskTypeIDTextBox" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
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
        <%-- Uses stored procedure sp_InsertDisk to add disks. Runs validations for required fields and data types. --%>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="diskNameTextBox" MaxLength="164" runat="server" Text='<%# Bind("diskName") %>' ValidationGroup="insert" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="insert" ControlToValidate="diskNameTextBox" CssClass="text-danger" Display="Dynamic" ErrorMessage="Disk name is required"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="releaseDateTextBox" runat="server" Text='<%# Bind("releaseDate") %>' ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Release date must be in mm/dd/yyyy format" ValidationGroup="insert" ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d" ControlToValidate="releaseDateTextBox" CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Release date is required" ValidationGroup="insert" ControlToValidate="releaseDateTextBox" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="genreIDTextBox" runat="server" Text='<%# Bind("genreID") %>' ValidationGroup="insert" />
                    <asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic" ErrorMessage="Genere ID must be a number between 1 and 11" ValidationGroup="insert" MinimumValue="1" MaximumValue="11" Type="Integer" ControlToValidate="genreIDTextBox" CssClass="text-danger"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Genre ID is required" CssClass="text-danger" Display="Dynamic" ControlToValidate="genreIDTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="statusIDTextBox" runat="server" Text='<%# Bind("statusID") %>' ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Status ID must be a number between 1 and 4" ValidationGroup="insert" ValidationExpression="([1-4])" ControlToValidate="statusIDTextBox" CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Status ID is required" ValidationGroup="insert" ControlToValidate="statusIDTextBox" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="diskTypeIDTextBox" runat="server" Text='<%# Bind("diskTypeID") %>' ValidationGroup="insert" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Disk type ID must be a number between 1 and 6" CssClass="text-danger" Display="Dynamic" ControlToValidate="diskTypeIDTextBox" ValidationGroup="insert" ValidationExpression="([1-6])"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Disk type ID is required" ValidationGroup="insert" ControlToValidate="diskTypeIDTextBox" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    <asp:Label ID="diskIDLabel" runat="server" Text='<%# Eval("diskID") %>' />
                </td>
                <td>
                    <asp:Label ID="diskNameLabel" runat="server" Text='<%# Eval("diskName") %>' />
                </td>
                <td>
                    <asp:Label ID="releaseDateLabel" runat="server" Text='<%# Eval("releaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="genreIDLabel" runat="server" Text='<%# Eval("genreID") %>' />
                </td>
                <td>
                    <asp:Label ID="statusIDLabel" runat="server" Text='<%# Eval("statusID") %>' />
                </td>
                <td>
                    <asp:Label ID="diskTypeIDLabel" runat="server" Text='<%# Eval("diskTypeID") %>' />
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
                                <th runat="server">diskID</th>
                                <th runat="server">diskName</th>
                                <th runat="server">releaseDate</th>
                                <th runat="server">genreID</th>
                                <th runat="server">statusID</th>
                                <th runat="server">diskTypeID</th>
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
                    <asp:Label ID="diskIDLabel" runat="server" Text='<%# Eval("diskID") %>' />
                </td>
                <td>
                    <asp:Label ID="diskNameLabel" runat="server" Text='<%# Eval("diskName") %>' />
                </td>
                <td>
                    <asp:Label ID="releaseDateLabel" runat="server" Text='<%# Eval("releaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="genreIDLabel" runat="server" Text='<%# Eval("genreID") %>' />
                </td>
                <td>
                    <asp:Label ID="statusIDLabel" runat="server" Text='<%# Eval("statusID") %>' />
                </td>
                <td>
                    <asp:Label ID="diskTypeIDLabel" runat="server" Text='<%# Eval("diskTypeID") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryTHUserDisk %>" DeleteCommand="sp_DeleteDisk2" InsertCommand="sp_InsertDisk" SelectCommand="SELECT [diskID], [diskName], [releaseDate], [genreID], [statusID], [diskTypeID] FROM [Disks] ORDER BY [diskName]" UpdateCommand="sp_UpdateDisk2" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="diskID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="genreID" Type="Int32" />
            <asp:Parameter Name="diskName" Type="String" />
            <asp:Parameter DbType="Date" Name="releaseDate" />
            <asp:Parameter Name="statusID" Type="Int32" />
            <asp:Parameter Name="diskTypeID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="diskID" Type="Int32" />
            <asp:Parameter Name="genreID" Type="Int32" />
            <asp:Parameter Name="diskName" Type="String" />
            <asp:Parameter DbType="Date" Name="releaseDate" />
            <asp:Parameter Name="statusID" Type="Int32" />
            <asp:Parameter Name="diskTypeID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<%-- Creates a set of Keys for fields that would otherwise be hard to assign --%>
    <div class="row">
        <h6>Genre ID Key</h6>
        <ol>
            <li>Rock</li>
            <li>Electronic</li>
            <li>R&B</li>
            <li>Funk</li>
            <li>Jazz</li>
            <li>Folk</li>
            <li>Pop</li>
            <li>Classical</li>
            <li>Blues</li>
            <li>Country</li>
            <li>Film</li>
        </ol>
        <h6>Disk Status Key</h6>
        <ol>
            <li>Checked In</li>
            <li>Checked Out</li>
            <li>Missing</li>
            <li>Damaged</li>
        </ol>
        <h6>Disk Type Key</h6>
        <ol>
            <li>CD</li>
            <li>Vinyl Record</li>
            <li>DVD</li>
            <li>BluRay</li>
            <li>HD-DVD</li>
            <li>Laser Disk</li>
        </ol>
    </div>
    
</asp:Content>