<%@ Page Title="" Language="C#" MasterPageFile="~/DeveloperView.master" AutoEventWireup="true" CodeFile="ViewDeveloper.aspx.cs" Inherits="ViewDeveloper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="table-responsive">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" DataKeyNames="Developer_Id" DataSourceID="SqlDataSource1" style="margin-left: 50px" AllowSorting="True" Width="1026px">
        <Columns>
            <asp:BoundField DataField="Developer_Id" HeaderText="Developer_Id" ReadOnly="True" SortExpression="Developer_Id" InsertVisible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:HyperLinkField DataNavigateUrlFields="Developer_Id" DataNavigateUrlFormatString="EditDeveloper.aspx?id={0}" HeaderText="Edit" Text="Edit/Delete" />
        </Columns>
    </asp:GridView>
    </div>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Developer] WHERE [Developer_Id] = @Developer_Id" InsertCommand="INSERT INTO [Developer] ([Name], [Phone], [Email], [Password], [Gender]) VALUES (@Name, @Phone, @Email, @Password, @Gender)" SelectCommand="SELECT [Developer_Id], [Name], [Phone], [Email], [Password], [Gender] FROM [Developer]" UpdateCommand="UPDATE [Developer] SET [Name] = @Name, [Phone] = @Phone, [Email] = @Email, [Password] = @Password, [Gender] = @Gender WHERE [Developer_Id] = @Developer_Id" OnSelecting="SqlDataSource1_Selecting">
         <DeleteParameters>
             <asp:Parameter Name="Developer_Id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Name" Type="String" />
             <asp:Parameter Name="Phone" Type="String" />
             <asp:Parameter Name="Email" Type="String" />
             <asp:Parameter Name="Password" Type="String" />
             <asp:Parameter Name="Gender" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Name" Type="String" />
             <asp:Parameter Name="Phone" Type="String" />
             <asp:Parameter Name="Email" Type="String" />
             <asp:Parameter Name="Password" Type="String" />
             <asp:Parameter Name="Gender" Type="String" />
             <asp:Parameter Name="Developer_Id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>

