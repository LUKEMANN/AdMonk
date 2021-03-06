﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="EditCompany.aspx.cs" Inherits="EditCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="page-header text-center">
            <h2>Edit Company Profile</h2>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Company Name</label>
            <div class="col-sm-6">
        <asp:TextBox ID="username" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
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
            <label class="control-label col-sm-4">Email Id</label>
            <div class="col-sm-6">
        <asp:TextBox ID="emailid" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*field mandatory"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*invalid mail id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="password" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
             <div class="col-sm-offset-4 col-sm-3">

                 <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="Button1_Click" />
                 <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="Button2_Click1" />

                 <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Company] WHERE [Company_Id] = @Company_Id" InsertCommand="INSERT INTO [Company] ([Name], [Email], [Contact], [Password]) VALUES (@Name, @Email, @Contact, @Password)" SelectCommand="SELECT [Company_Id], [Name], [Email], [Contact], [Password] FROM [Company]" UpdateCommand="UPDATE [Company] SET [Name] = @Name, [Email] = @Email, [Contact] = @Contact WHERE [Company_Id] = @Company_Id">
                     <DeleteParameters>
                         <asp:SessionParameter Name="Company_Id" SessionField="cid" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="Name" Type="String" />
                         <asp:Parameter Name="Email" Type="String" />
                         <asp:Parameter Name="Contact" Type="String" />
                         <asp:Parameter Name="Password" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:ControlParameter ControlID="username" Name="Name" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="emailid" Name="Email" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="mobile" Name="Contact" PropertyName="Text" Type="String" />
                         <asp:SessionParameter Name="Company_Id" SessionField="cid" Type="Int32" />
                     </UpdateParameters>
                 </asp:SqlDataSource>

                 </div>
             </div>
        <div class="form-group">
             <div class="col-sm-offset-6 col-sm-3">

               

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

