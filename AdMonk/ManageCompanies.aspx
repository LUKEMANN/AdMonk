<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="ManageCompanies.aspx.cs" Inherits="ManageCompanies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Company_Id" DataSourceID="SqlDataSourceCompany" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Company_Id" HeaderText="Company_Id" InsertVisible="False" ReadOnly="True" SortExpression="Company_Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Company_Id") %>' CommandName='<%# Eval("Status") %>' OnCommand="Button1_Command" Text="Block" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Company] WHERE [Company_Id] = @Company_Id" InsertCommand="INSERT INTO [Company] ([Name], [Contact], [Email], [Password], [Status]) VALUES (@Name, @Contact, @Email, @Password, @Status)" SelectCommand="SELECT * FROM [Company]" UpdateCommand="UPDATE [Company] SET  [Status] = @Status WHERE [Company_Id] = @Company_Id">
        <DeleteParameters>
            <asp:Parameter Name="Company_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Contact" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="HiddenFieldStatus" Name="Status" PropertyName="Value" />
            <asp:ControlParameter ControlID="HiddenFieldId" Name="Company_Id" PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldStatus" runat="server" />
    <asp:HiddenField ID="HiddenFieldId" runat="server" />
</asp:Content>

