<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SWDV_235_Project.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--Cr5eates dropdown boxes and data sources for borrowers and disks and a button to run checkout--%>

    <p>
        &nbsp;</p>
    <p>
        Select a disk:
</p>
    <asp:DropDownList ID="ddlDisk" runat="server" DataSourceID="SqlDataSource1" DataTextField="diskName" DataValueField="diskID">
        </asp:DropDownList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryTHConnectionString %>" SelectCommand="SELECT [diskName], [diskID] FROM [Disks] WHERE ([statusID] = @statusID) ORDER BY [diskName]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="statusID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <br />
    <br />
    <p>Select a borrower:
    </p>
    <asp:DropDownList ID="ddlBorrower" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="borrowerName" DataValueField="borrowerID">
        </asp:DropDownList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryTHConnectionString %>" SelectCommand="SELECT [borrowerID], ([borrowerLastName] + ', ' + [borrowerFirstName]) AS borrowerName FROM [Borrowers]"></asp:SqlDataSource>
    <br />
    <br />
    <p>
        &nbsp;</p>
    <p>
        Select a Checkout Date:</p>
    <p>
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btnCheckout" runat="server" OnClick="btnCheckout_Click" Text="Checkout" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    &nbsp;</p>


</asp:Content>
