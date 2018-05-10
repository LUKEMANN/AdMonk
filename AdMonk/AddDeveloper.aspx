<%@ Page Title="" Language="C#" MasterPageFile="~/PublicView.master" AutoEventWireup="true" CodeFile="AddDeveloper.aspx.cs" Inherits="AddDeveloper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="page-header text-center">
     <a href="#"><span class="glyphicon glyphicon-user" style="font-size:75px"></span></a>   
            <h2>Developer Sign Up</h2>
        </div>
        
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
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Password" CssClass="red" Display="Dynamic" ErrorMessage="*password must  be atleast 8 character long" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{8,10}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="red" Display="Dynamic" ErrorMessage="*Field Mandatory"></asp:RequiredFieldValidator>
                </div>
    </div>
     <div class="form-group">
            <label class="control-label col-sm-4">Confirm Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="confirmpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="confirmpass" CssClass="red" ErrorMessage="* invalid password"></asp:CompareValidator>
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
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="FormatRBList" DataTextField="Gender">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RadioButtonList1" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
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
                </div>
    </div>
        <div class="form-group">
            <div class="col-sm-offset-6 col-sm-3">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Register" />
                <asp:SqlDataSource ID="SqlDataSourceDeveloper" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Developer]" DeleteCommand="DELETE FROM [Developer] WHERE [Developer_Id] = @Developer_Id" InsertCommand="INSERT INTO [Developer] ([Name], [Phone], [Email], [Password], [Gender], [Fullname]) VALUES (@Name, @Phone, @Email, @Password, @Gender, @Fullname)" UpdateCommand="UPDATE [Developer] SET [Name] = @Name, [Phone] = @Phone, [Email] = @Email, [Password] = @Password, [Gender] = @Gender, [Fullname] = @Fullname WHERE [Developer_Id] = @Developer_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Developer_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="username" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="mobile" Name="Phone" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="emailid" Name="Email" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="Gender" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="fullname" Name="Fullname" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Fullname" Type="String" />
                        <asp:Parameter Name="Developer_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                </div>
            </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">
                 <asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label>
            </div>
        </div>
        </div>
</asp:Content>

