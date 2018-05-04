<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="EditAdvertisement.aspx.cs" Inherits="EditAdvertisement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="form-horizontal">
        <div class="form-group">
   <label class="control-label col-sm-4">AD Photot</label>
            <div class="col-sm-6">
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            
            <asp:HiddenField ID="HiddenField1" runat="server" Value="&quot;/photos/&quot;+filename;" />
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" CssClass="red" Display="Dynamic" ErrorMessage="* Please upload photo"></asp:RequiredFieldValidator>
            </div>
            </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Redirect Link</label>
            <div class="col-sm-6">
                <asp:TextBox ID="redirect_link" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="redirect_link" CssClass="red" Display="Dynamic" ErrorMessage="*Please provide a redirect link"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="*invalid link" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
            </div>
        </div>
         <div class="form-group">
             <label class="col-sm-4 control-label">Category</label> 
             <div class="col-sm-6">
                 <asp:DropDownList ID="Category" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Category_Name" DataValueField="Category_Id"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Category_Id] FROM [Advertisement]"></asp:SqlDataSource>
                 </div>
              </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" OnClick="Button2_Click" Text="Delete" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Advertisement] WHERE [Advertisement_Id] = @Advertisement_Id" InsertCommand="INSERT INTO [Advertisement] ([Photo], [Redirect_Link], [Company_Id], [Category_Id]) VALUES (@Photo, @Redirect_Link, @Company_Id, @Category_Id)" SelectCommand="SELECT * FROM [Advertisement]" UpdateCommand="UPDATE [Advertisement] SET [Photo] = @Photo, [Redirect_Link] = @Redirect_Link, [Company_Id] = @Company_Id, [Category_Id] = @Category_Id WHERE [Advertisement_Id] = @Advertisement_Id">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="Advertisement_Id" QueryStringField="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="Photo" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="redirect_link" Name="Redirect_Link" PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="Company_Id" SessionField="cid" Type="Int32" />
                        <asp:ControlParameter ControlID="Category" Name="Category_Id" PropertyName="SelectedValue" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Photo" Type="String" />
                        <asp:Parameter Name="Redirect_Link" Type="String" />
                        <asp:Parameter Name="Company_Id" Type="Int32" />
                        <asp:Parameter Name="Category_Id" Type="Decimal" />
                        <asp:Parameter Name="Advertisement_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        </div>
            </div>
            <div class="form-group">
                <asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label>
                </div>
        </div>
</asp:Content>

