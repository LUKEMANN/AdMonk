<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="ViewAdmin.aspx.cs" Inherits="EditAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="table-responsive">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" DataKeyNames="Username" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-left: 0px" AllowSorting="True" Width="1026px">
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
            <asp:BoundField DataField="Fullname" HeaderText="Fullname" SortExpression="Fullname" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Contactno" HeaderText="Contactno" SortExpression="Contactno" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Emailid" HeaderText="Emailid" SortExpression="Emailid" />
            <asp:HyperLinkField DataNavigateUrlFields="Username" DataNavigateUrlFormatString="EditAdmin.aspx?id={0}" HeaderText="Edit" Text="Edit/Delete" />
        </Columns>
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Admin] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Admin] ([Username], [Password], [Fullname], [Gender], [Contactno], [Type], [Emailid]) VALUES (@Username, @Password, @Fullname, @Gender, @Contactno, @Type, @Emailid)" SelectCommand="SELECT [Username], [Password], [Fullname], [Gender], [Contactno], [Type], [Emailid] FROM [Admin]" UpdateCommand="UPDATE [Admin] SET [Password] = @Password, [Fullname] = @Fullname, [Gender] = @Gender, [Contactno] = @Contactno, [Type] = @Type, [Emailid] = @Emailid WHERE [Username] = @Username">
        <DeleteParameters>
            <asp:Parameter Name="Username" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Fullname" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Contactno" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Emailid" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Fullname" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Contactno" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Emailid" Type="String" />
            <asp:Parameter Name="Username" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

