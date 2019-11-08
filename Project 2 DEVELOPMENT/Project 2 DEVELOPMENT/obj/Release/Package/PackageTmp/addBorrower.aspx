<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addBorrower.aspx.cs" Inherits="Project_2_DEVELOPMENT.addBorrower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Borrower</h1>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that the field is required" CssClass="text-danger" />
    <asp:Label ID="lblFirstName" runat="server" Text="First Name: "></asp:Label>
&nbsp;<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
    &nbsp;<asp:RequiredFieldValidator ID="reqFirst" runat="server" ControlToValidate="txtFirstName" CssClass="text-danger">*</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblLastName" runat="server" Text="Last Name: "></asp:Label>
&nbsp;<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="reqLast" runat="server" ControlToValidate="txtLastName" CssClass="text-danger">*</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblPhone" runat="server" Text="Phone Number: "></asp:Label>
&nbsp;<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="reqPhone" runat="server" ControlToValidate="txtPhone" CssClass="text-danger">*</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="valPhone" runat="server" ControlToValidate="txtPhone" CssClass="text-danger" ErrorMessage="Please enter a valid phone number EX. (555-555-5555)" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" CssClass="btn-info" Text="Submit" OnClick="btnSubmit_Click" />
&nbsp;&nbsp;
<asp:Label ID="lblSuccess" runat="server" CssClass="text-success"></asp:Label>
</asp:Content>
