<%@ Page Title="" Language="C#" MasterPageFile="~/DeveloperView.master" AutoEventWireup="true" CodeFile="WebsiteKeys.aspx.cs" Inherits="WebsiteKeys" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-4"></label>
        </div>
    </div>

    Website Name    <asp:TextBox ID="WebsiteName" runat="server" ></asp:TextBox><br />
    Category <asp:DropDownList ID="Category" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="Category_Name" DataValueField="Category_Id"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
    <br />
    <asp:Button ID="ButtonAdd" Text="Add Website Key" runat="server" OnClick="ButtonAdd_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Key_Id" DataSourceID="SqlDataSourceWebsiteKeys">
        <Columns>
            <asp:BoundField DataField="Key_Id" HeaderText="Key_Id" ReadOnly="True" SortExpression="Key_Id" />
            <asp:BoundField DataField="Key" HeaderText="Key" SortExpression="Key" />
            <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Key_Id") %>' OnCommand="Button1_Command" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceWebsiteKeys" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" InsertCommand="INSERT INTO Website_Keys([Key], Website, Developer_Id, Category_Id) VALUES ( @Key , @Website, @Developer_Id, @Category_Id)" SelectCommand="SELECT * FROM [Website_Keys] WHERE ([Developer_Id] = @Developer_Id)" DeleteCommand="DELETE FROM Website_Keys WHERE (Key_Id = @Key_Id)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="HiddenFieldKeyId" Name="Key_Id" PropertyName="Value" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="HiddenFieldKey" Name="Key" PropertyName="Value" />
            <asp:ControlParameter ControlID="WebsiteName" Name="Website" PropertyName="Text" />
            <asp:SessionParameter Name="Developer_Id" SessionField="did" />
            <asp:ControlParameter ControlID="Category" Name="Category_Id" PropertyName="SelectedValue" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Developer_Id" SessionField="did" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldKey" runat="server" />
    <asp:HiddenField ID="HiddenFieldKeyId" runat="server" />
</asp:Content>

