<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Project_3_DEVELOPMENT.home" %>
<%-- 
    CHANGE LOG
------------------------------------------------------------

    Version 2
----------------
        Updated Add Borrower to use a List View
        Updated Add Artist and Add Disk to use List Views
        Added keys to Add Artist and Add Disk to make clear fields that use stand in numbers
        Adjusted Add Artist, Add Borrower, and Add Disk to use stored procedures for Insert, Update, and Delete using diskUserTH as the database user
        Replaced Homepage with a non-placeholder page


    Version 1
----------------
        Initial deployment Disk Inventory pages
        Basic version of Add Borrower
        Added placeholder pages for Add Artist, Add Disk, and Home
--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Home</h1>
    <p>Welcome to the homepage for Disk Inventory. Use the pages to the left to add, edit, or delete the related data from the related tables.</p>
</asp:Content>
