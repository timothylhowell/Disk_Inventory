<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SWDV_235_Project._Default" %>
<%-- 
    CHANGE LOG
------------------------------------------------------------
    Version 3
----------------
    Changed to template to use user accounts and user validation
    Added user validation requirements on Artist, Borrower, and Disk
    Added additional formating on Disk to make releaseDate appear correctly
    Moved Artist, Borrower, and Disk to a Management folder in which pages can only be accessed by non-anonymous users



    Version 2.5
----------------
    Replaced RegEx for Disk page GenreID with rangeValidator
    Rearranged folder for long term use




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
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Home</h1>
    <p>Welcome to the homepage for Disk Inventory. Use the pages to the left to add, edit, or delete the related data from the related tables.</p>
</asp:Content>