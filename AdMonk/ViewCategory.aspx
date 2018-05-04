<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="ViewCategory.aspx.cs" Inherits="ViewCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <div class="table-responsive">
        <asp:GridView runat="server" AutoGenerateColumns="False" CssClass="table table-hover" DataKeyNames="Category_Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Category_Name" HeaderText="Category_Name" SortExpression="Category_Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Category_Id" HeaderText="Category_Id" InsertVisible="False" ReadOnly="True" SortExpression="Category_Id" />
                <asp:HyperLinkField DataNavigateUrlFields="Category_Id" DataNavigateUrlFormatString="EditCategory.aspx?id={0}" HeaderText="Edit" Text="Edit/Delete" />
            </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Category] WHERE [Category_Id] = @Category_Id" InsertCommand="INSERT INTO [Category] ([Category_Name], [Description]) VALUES (@Category_Name, @Description)" SelectCommand="SELECT [Category_Name], [Description], [Category_Id] FROM [Category]" UpdateCommand="UPDATE [Category] SET [Category_Name] = @Category_Name, [Description] = @Description WHERE [Category_Id] = @Category_Id">
             <DeleteParameters>
                 <asp:Parameter Name="Category_Id" Type="Decimal" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Category_Name" Type="String" />
                 <asp:Parameter Name="Description" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Category_Name" Type="String" />
                 <asp:Parameter Name="Description" Type="String" />
                 <asp:Parameter Name="Category_Id" Type="Decimal" />
             </UpdateParameters>
         </asp:SqlDataSource>
    </div>
</asp:Content>



