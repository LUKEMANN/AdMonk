<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="AddAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="form-horizontal">
         <div class="form-group">
            <label class="control-label col-sm-4">Username</label>
            <div class="col-sm-6">
        <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="* field mandatory" ControlToValidate="username"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Password" CssClass="red" Display="Dynamic" ErrorMessage="*minimum length is 8 characters" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{8,10}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="red" Display="Dynamic" ErrorMessage="*Field Mandatory"></asp:RequiredFieldValidator>
                </div>
    </div>
     <div class="form-group">
            <label class="control-label col-sm-4">Confirm Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="confirmpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="confirmpass" CssClass="red" ErrorMessage="* invalid password"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="confirmpass" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4" >Fullname</label>
            <div class="col-sm-6">
        <asp:TextBox ID="fullname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fullname" CssClass="red" Display="Dynamic" ErrorMessage="* mandatory field"></asp:RequiredFieldValidator>
                </div>
    </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Gender</label>
            <div class="col-sm-6">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellSpacing="-1" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass="FormatRBList">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" CssClass="red" Display="Dynamic" ErrorMessage="*Select from given options"></asp:RequiredFieldValidator>
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
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*invalid mail id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*email is mandatory"></asp:RequiredFieldValidator>
                </div>
    </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Type</label>
            <div class="col-sm-6">
                <asp:RadioButtonList ID="type" runat="server" RepeatDirection="Horizontal" CssClass="FormatRBList">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Poweruser</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="type" CssClass="red" Display="Dynamic" ErrorMessage="*Choose from given options"></asp:RequiredFieldValidator>
                </div>
    </div>
        <div class="form-group">
            <div class="col-sm-offset-6 col-sm-3">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="Button1_Click" />
                <asp:SqlDataSource ID="SqlDataSourceAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Admin] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Admin] ([Username], [Password], [Fullname], [Contactno], [Gender], [Emailid], [Type]) VALUES (@Username, @Password, @Fullname, @Contactno, @Gender, @Emailid, @Type)" SelectCommand="SELECT [Username], [Password], [Fullname], [Contactno], [Gender], [Emailid], [Type] FROM [Admin]" UpdateCommand="UPDATE [Admin] SET [Password] = @Password, [Fullname] = @Fullname, [Contactno] = @Contactno, [Gender] = @Gender, [Emailid] = @Emailid, [Type] = @Type WHERE [Username] = @Username" OnSelecting="SqlDataSourceAdmin_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="Username" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="username" Name="Username" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="fullname" Name="Fullname" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="mobile" Name="Contactno" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="Gender" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="emailid" Name="Emailid" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="type" Name="Type" PropertyName="SelectedValue" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Fullname" Type="String" />
                        <asp:Parameter Name="Contactno" Type="String" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Emailid" Type="String" />
                        <asp:Parameter Name="Type" Type="String" />
                        <asp:Parameter Name="Username" Type="String" />
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

