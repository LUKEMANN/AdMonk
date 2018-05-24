<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="EditAdmin.aspx.cs" Inherits="EditAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="form-horizontal">
          <div class="page-header text-center">
            <h2>Edit Profile</h2>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Username</label>
            <div class="col-sm-6">
        <asp:TextBox ID="username" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="* field mandatory" ControlToValidate="username"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="red" Display="Dynamic" ErrorMessage="*Field Mandatory"></asp:RequiredFieldValidator>
                </div>
    </div>
     
         <div class="form-group">
            <label class="control-label col-sm-4" >Fullname</label>
            <div class="col-sm-6">
        <asp:TextBox ID="fullname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="fullname" CssClass="red" Display="Dynamic" ErrorMessage="*enter valid fullname" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fullname" CssClass="red" Display="Dynamic" ErrorMessage="* mandatory field"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Gender</label>
            <div class="col-sm-6">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellSpacing="-1" RepeatDirection="Horizontal" CssClass="FormatRBList">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*invalid mail id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
    </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Type</label>
            <div class="col-sm-6">
                <asp:RadioButtonList ID="type" runat="server" RepeatDirection="Horizontal" CssClass="FormatRBList">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Poweruser</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="type" CssClass="red" Display="Dynamic" ErrorMessage="*select an option"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
             <div class="col-sm-offset-4 col-sm-3">

                 <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Update" />
                 <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" OnClick="Button2_Click" Text="Delete" />
                 <asp:SqlDataSource ID="SqlDataSourceAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Admin] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Admin] ([Username], [Fullname], [Gender], [Contactno], [Password], [Type], [Emailid]) VALUES (@Username, @Fullname, @Gender, @Contactno, @Password, @Type, @Emailid)" SelectCommand="SELECT [Username], [Fullname], [Gender], [Contactno], [Password], [Type], [Emailid] FROM [Admin]" UpdateCommand="UPDATE [Admin] SET [Fullname] = @Fullname, [Gender] = @Gender, [Contactno] = @Contactno, [Password] = @Password, [Type] = @Type, [Emailid] = @Emailid WHERE [Username] = @Username">
                     <DeleteParameters>
                         <asp:QueryStringParameter Name="Username" QueryStringField="id" Type="String" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="Username" Type="String" />
                         <asp:Parameter Name="Fullname" Type="String" />
                         <asp:Parameter Name="Gender" Type="String" />
                         <asp:Parameter Name="Contactno" Type="String" />
                         <asp:Parameter Name="Password" Type="String" />
                         <asp:Parameter Name="Type" Type="String" />
                         <asp:Parameter Name="Emailid" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:ControlParameter ControlID="fullname" Name="Fullname" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="RadioButtonList1" Name="Gender" PropertyName="SelectedValue" Type="String" />
                         <asp:ControlParameter ControlID="mobile" Name="Contactno" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="type" Name="Type" PropertyName="SelectedValue" Type="String" />
                         <asp:ControlParameter ControlID="emailid" Name="Emailid" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="username" Name="Username" PropertyName="Text" Type="String" />
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

