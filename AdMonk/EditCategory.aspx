<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="EditCategory.aspx.cs" Inherits="EditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-4">Category Name</label>
            <div class="col-sm-6">
            <asp:TextBox ID="category_name" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Description</label>
            <div class="col-sm-6">
            <asp:TextBox ID="description" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
         <div class="form-group">
           <div class="col-sm-offset-4 col-sm-6">
               <asp:Button ID="Button1" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="Button1_Click" />
               <asp:Button ID="Button2" runat="server" Text="Delete"  CssClass="btn btn-danger" OnClick="Button2_Click" />
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Category] WHERE [Category_Id] = @Category_Id" InsertCommand="INSERT INTO [Category] ([Category_Name], [Description]) VALUES (@Category_Name, @Description)" SelectCommand="SELECT [Category_Id], [Category_Name], [Description] FROM [Category]" UpdateCommand="UPDATE [Category] SET [Category_Name] = @Category_Name, [Description] = @Description WHERE [Category_Id] = @Category_Id">
                   <DeleteParameters>
                       <asp:QueryStringParameter Name="Category_Id" QueryStringField="id" Type="Decimal" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="Category_Name" Type="String" />
                       <asp:Parameter Name="Description" Type="String" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:ControlParameter ControlID="category_name" Name="Category_Name" PropertyName="Text" Type="String" />
                       <asp:ControlParameter ControlID="description" Name="Description" PropertyName="Text" Type="String" />
                       <asp:QueryStringParameter Name="Category_Id" QueryStringField="id" Type="Decimal" />
                   </UpdateParameters>
               </asp:SqlDataSource>
               </div>
    </div>
</asp:Content>

