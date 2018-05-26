<%@ Page Title="" Language="C#" MasterPageFile="~/DeveloperView.master" AutoEventWireup="true" CodeFile="WebsiteKeys.aspx.cs" Inherits="WebsiteKeys" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
          <div class="page-header text-center">
            <h2>Add Website</h2>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Website Name</label>
            <div class="col-sm-6">
                <asp:TextBox ID="WebsiteName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="WebsiteName" CssClass="red" Display="Dynamic" ErrorMessage="*enter website name"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Website URL</label>
            <div class="col-sm-6">
                <asp:TextBox ID="url" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="url" CssClass="red" Display="Dynamic" ErrorMessage="*enter a valid url "></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="url" CssClass="red" Display="Dynamic" ErrorMessage="*invalid url" ValidationExpression="^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&amp;'\(\)\*\+,;=.]+$"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Category</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="Category" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="Category_Name" DataValueField="Category_Id" CssClass="form-control" AppendDataBoundItems="True">
                    <asp:ListItem>--SELECT--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Category" CssClass="red" Display="Dynamic" ErrorMessage="*select appropriate category for your website" InitialValue="--SELECT--"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                <br />
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">
                <asp:Button ID="ButtonAdd" Text="Generate Website Key" runat="server" OnClick="ButtonAdd_Click" CssClass="btn btn-primary" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">
               
            </div>
        </div>

    </div>
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Key_Id" DataSourceID="SqlDataSourceWebsiteKeys" CssClass="table table-hover" Style="margin-left: 49px; margin-right: 0px; margin-top: 46px;" Width="779px">
            <Columns>
                <asp:BoundField DataField="Key_Id" HeaderText="Key_Id" ReadOnly="True" SortExpression="Key_Id" />
                <asp:BoundField DataField="Key" HeaderText="Key" SortExpression="Key" />
                <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                <asp:BoundField DataField="Website_Url" HeaderText="Website Url" SortExpression="Website_Url" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Key_Id") %>' OnCommand="Button1_Command" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceWebsiteKeys" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" InsertCommand="INSERT INTO Website_Keys([Key], Website, Developer_Id, Category_Id, Website_Url) VALUES ( @Key , @Website, @Developer_Id, @Category_Id, @Website_Url)" SelectCommand="SELECT * FROM [Website_Keys] WHERE ([Developer_Id] = @Developer_Id)" DeleteCommand="DELETE FROM Website_Keys WHERE (Key_Id = @Key_Id)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="HiddenFieldKeyId" Name="Key_Id" PropertyName="Value" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="HiddenFieldKey" Name="Key" PropertyName="Value" />
            <asp:ControlParameter ControlID="WebsiteName" Name="Website" PropertyName="Text" />
            <asp:SessionParameter Name="Developer_Id" SessionField="did" />
            <asp:ControlParameter ControlID="Category" Name="Category_Id" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="url" Name="Website_Url" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Developer_Id" SessionField="did" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldKey" runat="server" />
    <asp:HiddenField ID="HiddenFieldKeyId" runat="server" />

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <p><asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

