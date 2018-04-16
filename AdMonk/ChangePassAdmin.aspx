<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="ChangePassAdmin.aspx.cs" Inherits="ChangePassAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
          <div class="form-group">
            <label class="control-label col-sm-4">Username</label>
            <div class="col-sm-6">
                <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" CssClass="red" Display="Dynamic" ErrorMessage="mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Old Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="oldpass" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="oldpass" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">New Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="newpass" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="*enter new password"></asp:RequiredFieldValidator>
            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Confirm Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="confirmpass" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newpass" ControlToValidate="confirmpass" CssClass="red" Display="Dynamic" ErrorMessage="password doesn't match "></asp:CompareValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">

                <asp:Button ID="changepass" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="changepass_Click" />

                <asp:SqlDataSource ID="SqlDataSourceAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Admin] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Admin] ([Username], [Password]) VALUES (@Username, @Password)" SelectCommand="SELECT [Username], [Password] FROM [Admin]" UpdateCommand="UPDATE [Admin] SET [Password] = @Password WHERE [Username] = @Username">
                    <DeleteParameters>
                        <asp:Parameter Name="Username" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="newpass" Name="Password" PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="Username" SessionField="username" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
         <div class="form-group">
             <div class="col-sm-offset-4 col-sm-3">

                 <asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label>

             </div>
         </div>
    </div>
</asp:Content>

