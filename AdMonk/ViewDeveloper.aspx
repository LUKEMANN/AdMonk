<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="ViewDeveloper.aspx.cs" Inherits="ViewDeveloper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="table-responsive">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" DataKeyNames="Id" DataSourceID="SqlDataSource1" style="margin-left: 0px" AllowSorting="True" Width="1026px">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="EditDeveloper.aspx?id={0}" HeaderText="Edit" Text="Edit/Delete" />
        </Columns>
    </asp:GridView>
    </div>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Developer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Developer] ([Email], [Password], [Gender], [Phone], [Name]) VALUES (@Email, @Password, @Gender, @Phone, @Name)" SelectCommand="SELECT [Id], [Email], [Password], [Gender], [Phone], [Name] FROM [Developer]" UpdateCommand="UPDATE [Developer] SET [Email] = @Email, [Password] = @Password, [Gender] = @Gender, [Phone] = @Phone, [Name] = @Name WHERE [Id] = @Id" OnSelecting="SqlDataSource1_Selecting">
         <DeleteParameters>
             <asp:Parameter Name="Id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Email" Type="String" />
             <asp:Parameter Name="Password" Type="String" />
             <asp:Parameter Name="Gender" Type="String" />
             <asp:Parameter Name="Phone" Type="String" />
             <asp:Parameter Name="Name" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Email" Type="String" />
             <asp:Parameter Name="Password" Type="String" />
             <asp:Parameter Name="Gender" Type="String" />
             <asp:Parameter Name="Phone" Type="String" />
             <asp:Parameter Name="Name" Type="String" />
             <asp:Parameter Name="Id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>

