<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="CategorySelect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
          <div class="page-header text-center">
            <h2>Add Category</h2>
        </div>
    <div class="form-group">
        <label class="col-sm-4 control-label">Category Name</label>
        <div class="col-sm-6">
            <asp:TextBox ID="category" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="category" CssClass="red" Display="Dynamic" ErrorMessage="*only alphabets with '&amp;' are allowed" ValidationExpression="^[a-zA-Z''-'&amp;\s]{1,40}$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="category" CssClass="red" Display="Dynamic" ErrorMessage="* This field is mandatory"></asp:RequiredFieldValidator>
        </div>
    </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Description</label>
               <div class="col-sm-6">
                 <asp:TextBox ID="description" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="description" CssClass="red" Display="Dynamic" ErrorMessage="*description is mandatory"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="description" CssClass="red" Display="Dynamic" ErrorMessage="*atleast 20 characters required" ValidationExpression="^[a-zA-Z0-9'@,&amp;:;/&quot;#.\s]{20,250}$"></asp:RegularExpressionValidator>
        </div>
            </div>
         <div class="form-group">
             <div class="col-sm-offset-4  col-sm-6" style="position:relative">
                 <asp:button runat="server" text="Add Category" CssClass="btn btn-primary" OnClick="Unnamed1_Click" />
                 <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Category] WHERE [Category_Id] = @Category_Id" InsertCommand="INSERT INTO [Category] ([Category_Name], [Description]) VALUES (@Category_Name, @Description)" SelectCommand="SELECT [Category_Id], [Category_Name], [Description] FROM [Category]" UpdateCommand="UPDATE [Category] SET [Category_Name] = @Category_Name, [Description] = @Description WHERE [Category_Id] = @Category_Id">
                     <DeleteParameters>
                         <asp:Parameter Name="Category_Id" Type="Decimal" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:ControlParameter ControlID="category" Name="Category_Name" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="description" Name="Description" PropertyName="Text" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="Category_Name" Type="String" />
                         <asp:Parameter Name="Description" Type="String" />
                         <asp:Parameter Name="Category_Id" Type="Decimal" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
                 <br />
                 <span>
               </span>
                     
</div>
</div>
        </div>

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

