﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PublicView.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="form-horizontal">
          <div class="page-header text-center">
     <a href="#"><span class="glyphicon glyphicon-briefcase" style="font-size:75px"></span></a>   
            <h2>Company Sign Up</h2>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Company Name</label>
            <div class="col-sm-6">
        <asp:TextBox ID="company_name" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="company_name" CssClass="red" Display="Dynamic" ErrorMessage="*only alphabets and numbers allowed " ValidationExpression="^[a-zA-Z0-9''-'&amp;\s]{1,40}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="* field mandatory" ControlToValidate="company_name"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Password" CssClass="red" Display="Dynamic" ErrorMessage="*minimum length is 8 characters" ValidationExpression="^[a-zA-Z0-9'@.,&amp;#.\s]{8,50}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="red" Display="Dynamic" ErrorMessage="*Field Mandatory"></asp:RequiredFieldValidator>
                </div>
    </div>
     <div class="form-group">
            <label class="control-label col-sm-4">Confirm Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="confirmpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="confirmpass" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="confirmpass" CssClass="red" ErrorMessage="* invalid password"></asp:CompareValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*email-id is mandatory"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*invalid mail id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
    </div>
        
        <div class="form-group">
            <div class="text-center">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Add Company" OnClick="Button1_Click" />

                <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Company] WHERE [Company_Id] = @Company_Id" InsertCommand="INSERT INTO [Company] ([Contact], [Email], [Name], [Password]) VALUES (@Contact, @Email, @Name, @Password)" SelectCommand="SELECT [Company_Id], [Contact], [Email], [Name], [Password] FROM [Company]" UpdateCommand="UPDATE [Company] SET [Contact] = @Contact, [Email] = @Email, [Name] = @Name, [Password] = @Password WHERE [Company_Id] = @Company_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Company_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="mobile" Name="Contact" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="emailid" Name="Email" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="company_name" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Contact" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Company_Id" Type="Int32" />
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

