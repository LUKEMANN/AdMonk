<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="ViewCompany.aspx.cs" Inherits="ViewCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="table-responsive">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Company_Id" DataSourceID="SqlDataSource1" AllowSorting="True" CssClass="table table-hover" Width="702px" style="margin-top: 47px">
            <Columns>
                <asp:BoundField DataField="Company_Id" HeaderText="Company_Id" InsertVisible="False" ReadOnly="True" SortExpression="Company_Id" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:HyperLinkField DataNavigateUrlFields="Company_Id" DataNavigateUrlFormatString="EditCompany.aspx?id={0}" HeaderText="Edit" Text="Edit/Delete" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Company] WHERE [Company_Id] = @Company_Id" InsertCommand="INSERT INTO [Company] ([Contact], [Name], [Email]) VALUES (@Contact, @Name, @Email)" SelectCommand="SELECT [Company_Id], [Contact], [Name], [Email] FROM [Company]" UpdateCommand="UPDATE [Company] SET [Contact] = @Contact, [Name] = @Name, [Email] = @Email WHERE [Company_Id] = @Company_Id">
            <DeleteParameters>
                <asp:Parameter Name="Company_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Company_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>

