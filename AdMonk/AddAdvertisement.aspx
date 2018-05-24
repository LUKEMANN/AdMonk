<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="AddAdvertisement.aspx.cs" Inherits="AddCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
          <div class="page-header text-center">
            <h2>Add Advertisement</h2>
        </div>
        <div class="form-group">
          <label class="col-sm-4 control-label" style="height: 20px">AD Photo</label>
            <div class="col-sm-6">
        <asp:FileUpload ID="Photo" runat="server" CssClass="form-control" />
            
            <asp:HiddenField ID="HiddenFieldPhoto" runat="server" />
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Photo" CssClass="red" Display="Dynamic" ErrorMessage="* Please upload photo"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Redirect Link</label>
            <div class="col-sm-6">
                <asp:TextBox ID="redirect_link" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="redirect_link" CssClass="red" Display="Dynamic" ErrorMessage="*Please provide a redirect link"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="redirect_link" CssClass="red" Display="Dynamic" ErrorMessage="*Enter valid URL" ValidationExpression="^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"></asp:RegularExpressionValidator>
            </div>
        </div>
         <div class="form-group">
             <label class="col-sm-4 control-label">Category</label> 
             <div class="col-sm-6">
                 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Category_Name" DataValueField="Category_Id" AppendDataBoundItems="True">
                     <asp:ListItem>--SELECT--</asp:ListItem>
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" CssClass="red" Display="Dynamic" ErrorMessage="*select valid category for your advertisement" InitialValue="--SELECT--"></asp:RequiredFieldValidator>
                 </div>
         </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <asp:Button ID="Button1" runat="server" Text="Add your AD" CssClass="btn btn-primary" OnClick="Button1_Click" />
        </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-6">
               
                </div>
                </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Category_Name], [Category_Id] FROM [Category]" ProviderName="<%$ ConnectionStrings:connect.ProviderName %>"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Advertisement] WHERE [Advertisement_Id] = @Advertisement_Id" InsertCommand="INSERT INTO [Advertisement] ([Photo], [Redirect_Link], [Company_Id], [Category_Id]) VALUES (@Photo, @Redirect_Link, @Company_Id, @Category_Id)" SelectCommand="SELECT * FROM [Advertisement]" UpdateCommand="UPDATE [Advertisement] SET [Photo] = @Photo, [Redirect_Link] = @Redirect_Link, [Company_Id] = @Company_Id, [Category_Id] = @Category_Id WHERE [Advertisement_Id] = @Advertisement_Id">
            <DeleteParameters>
                <asp:Parameter Name="Advertisement_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="HiddenFieldPhoto" Name="Photo" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="redirect_link" Name="Redirect_Link" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="Company_Id" SessionField="cid" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" Name="Category_Id" PropertyName="SelectedValue" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Photo" Type="String" />
                <asp:Parameter Name="Redirect_Link" Type="String" />
                <asp:Parameter Name="Company_Id" Type="Int32" />
                <asp:Parameter Name="Category_Id" Type="Decimal" />
                <asp:Parameter Name="Advertisement_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

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

