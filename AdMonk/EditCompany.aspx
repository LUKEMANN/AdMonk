<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="EditCompany.aspx.cs" Inherits="EditCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
         <div class="form-group">
            <label class="control-label col-sm-4">Company Name</label>
            <div class="col-sm-6">
        <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="* field mandatory" ControlToValidate="username"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Contact</label>
            <div class="col-sm-6">
        <asp:TextBox ID="mobile" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mobile" CssClass="red" Display="Dynamic" ErrorMessage="* mandatory field"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="mobile" CssClass="red" Display="Dynamic" ErrorMessage="* invalid contact" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Emailid</label>
            <div class="col-sm-6">
        <asp:TextBox ID="emailid" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*invalid mail id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*invalid password" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
    </div>
         <div class="form-group">
             <div class="col-sm-offset-4 col-sm-3">

                 <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="Button1_Click" />
                 <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="Button2_Click1" />

                 <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Company] WHERE [Company_Id] = @Company_Id" InsertCommand="INSERT INTO [Company] ([Name], [Email], [Contact]) VALUES (@Name, @Email, @Contact)" SelectCommand="SELECT [Company_Id], [Name], [Email], [Contact] FROM [Company]" UpdateCommand="UPDATE [Company] SET [Name] = @Name, [Email] = @Email, [Contact] = @Contact WHERE [Company_Id] = @Company_Id">
                     <DeleteParameters>
                         <asp:QueryStringParameter Name="Company_Id" QueryStringField="id" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="Name" Type="String" />
                         <asp:Parameter Name="Email" Type="String" />
                         <asp:Parameter Name="Contact" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:ControlParameter ControlID="username" Name="Name" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="emailid" Name="Email" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="mobile" Name="Contact" PropertyName="Text" Type="String" />
                         <asp:QueryStringParameter Name="Company_Id" QueryStringField="id" Type="Int32" />
                     </UpdateParameters>
                 </asp:SqlDataSource>

                 </div>
             </div>
        <div class="form-group">
             <div class="col-sm-offset-6 col-sm-3">

                 <asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label>

             </div>
         </div>
    </div>
</asp:Content>

