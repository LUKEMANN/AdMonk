<%@ Page Title="" Language="C#" MasterPageFile="~/DeveloperView.master" AutoEventWireup="true" CodeFile="ChangePassDev.aspx.cs" Inherits="ChangePassDev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" >
    <div class="form-horizontal">
         
          <div class="form-group">
            <label class="control-label col-sm-4">E-Mail</label>
            <div class="col-sm-6">
                <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email" CssClass="red" Display="Dynamic" ErrorMessage="*invalid e-mail address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Old Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="oldpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="oldpass" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">New Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="newpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="newpass" CssClass="red" Display="Dynamic" ErrorMessage="*minimum lenght is 8 characters" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{8,10}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="*enter new password" ControlToValidate="newpass"></asp:RequiredFieldValidator>
            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Confirm Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="confirmpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="confirmpass" CssClass="red" Display="Dynamic" ErrorMessage="*re-enter password"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newpass" ControlToValidate="confirmpass" CssClass="red" Display="Dynamic" ErrorMessage="password doesn't match "></asp:CompareValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">

                <asp:Button ID="changepass" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="changepass_Click" />

                <asp:SqlDataSource ID="SqlDataSourceDeveloper" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT [Password], [Developer_Id], [Email] FROM [Developer]" DeleteCommand="DELETE FROM [Developer] WHERE [Developer_Id] = @Developer_Id" InsertCommand="INSERT INTO [Developer] ([Password], [Email]) VALUES (@Password, @Email)" UpdateCommand="UPDATE [Developer] SET [Password] = @Password, [Email] = @Email WHERE [Developer_Id] = @Developer_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Developer_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="newpass" Name="Password" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="email" Name="Email" PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="Developer_Id" SessionField="did" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                </div>
            </div>
         <div class="form-group">
             <div class="col-sm-offset-4 col-sm-3">

                 

             </div>
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

