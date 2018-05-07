<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="ViewPackage.aspx.cs" Inherits="ViewPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive" DataKeyNames="Package_Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Package_Id" HeaderText="Package_Id" InsertVisible="False" ReadOnly="True" SortExpression="Package_Id" />
                <asp:BoundField DataField="Package_Name" HeaderText="Package_Name" SortExpression="Package_Name" />
                <asp:BoundField DataField="Number_of_Hits" HeaderText="Number_of_Hits" SortExpression="Number_of_Hits" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:HyperLinkField DataNavigateUrlFields="Package_Id" DataNavigateUrlFormatString="EditPackage.aspx?id={0}" HeaderText="Edit" Text="Edit/Delete"></asp:HyperLinkField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Package]"></asp:SqlDataSource>
</asp:Content>

