<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="ManageDevelopers.aspx.cs" Inherits="ManageDevelopers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Developer_Id" DataSourceID="SqlDataSourceDeveopler" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Developer_Id" HeaderText="Developer_Id" InsertVisible="False" ReadOnly="True" SortExpression="Developer_Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Fullname" HeaderText="Fullname" SortExpression="Fullname" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Developer_Id") %>' CommandName='<%# Eval("Status") %>' OnCommand="Button1_Command" Text="Block" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceDeveopler" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Developer]" UpdateCommand="UPDATE Developer SET Status = @Status WHERE (Developer_Id = @Developer_Id)">
        <UpdateParameters>
            <asp:ControlParameter ControlID="HiddenFieldStatus" Name="Status" PropertyName="Value" />
            <asp:ControlParameter ControlID="HiddenFieldId" Name="Developer_Id" PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldStatus" runat="server" />
    <asp:HiddenField ID="HiddenFieldId" runat="server" />
</asp:Content>

