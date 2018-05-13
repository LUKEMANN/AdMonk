<%@ Page Title="" Language="C#" MasterPageFile="~/PublicVIew.master" AutoEventWireup="true" CodeFile="ViewTestimonials.aspx.cs" Inherits="ViewTestimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Testimonial_Id" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="table table-hover" Width="774px">
    <ItemTemplate>
        <br />
        Name:
        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
        <br />
        <br />
        Title:
        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
        <br />
        Description:
        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
        <br />
        <br />
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT TOP(10) * FROM [Testimonials] ORDER BY [Testimonial_Id] DESC"></asp:SqlDataSource>
</div>
</asp:Content>

