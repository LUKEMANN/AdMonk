<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="ViewAdvertisement.aspx.cs" Inherits="ViewAdvertisement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="table responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" DataKeyNames="Advertisement_Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Advertisement_Id" HeaderText="Advertisement_Id" ReadOnly="True" SortExpression="Advertisement_Id" />
                <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" />
                <asp:BoundField DataField="Redirect_Link" HeaderText="Redirect_Link" SortExpression="Redirect_Link" />
                <asp:BoundField DataField="Company_Id" HeaderText="Company_Id" SortExpression="Company_Id" />
                <asp:BoundField DataField="Category_Id" HeaderText="Category_Id" SortExpression="Category_Id" />
                <asp:HyperLinkField DataNavigateUrlFields="Advertisement_Id" DataNavigateUrlFormatString="EditAdvertisement.aspx?id={0}" HeaderText="Edit" Text="Edit/Delete" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Advertisement] WHERE [Advertisement_Id] = @Advertisement_Id" InsertCommand="INSERT INTO [Advertisement] ([Photo], [Redirect_Link], [Company_Id], [Category_Id]) VALUES (@Photo, @Redirect_Link, @Company_Id, @Category_Id)" SelectCommand="SELECT * FROM [Advertisement]" UpdateCommand="UPDATE [Advertisement] SET [Photo] = @Photo, [Redirect_Link] = @Redirect_Link, [Company_Id] = @Company_Id, [Category_Id] = @Category_Id WHERE [Advertisement_Id] = @Advertisement_Id">
            <DeleteParameters>
                <asp:Parameter Name="Advertisement_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Photo" Type="String" />
                <asp:Parameter Name="Redirect_Link" Type="String" />
                <asp:Parameter Name="Company_Id" Type="Int32" />
                <asp:Parameter Name="Category_Id" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Photo" Type="String" />
                <asp:Parameter Name="Redirect_Link" Type="String" />
                <asp:Parameter Name="Company_Id" Type="Int32" />
                <asp:Parameter Name="Category_Id" Type="Decimal" />
                <asp:Parameter Name="Advertisement_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

