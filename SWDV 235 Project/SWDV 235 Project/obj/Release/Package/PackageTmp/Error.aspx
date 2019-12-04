<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="SWDV_235_Project.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-danger">An error has occurred</h1>
    <div class="alert alert-danger">
        <p><asp:Label ID="lblError" runat="server"></asp:Label></p>
    </div>
    <asp:Button ID="btnReturn" runat="server" Text="Return to Home Page" 
        PostBackUrl="~/Default.aspx" CssClass="btn btn-danger" />
</asp:Content>
