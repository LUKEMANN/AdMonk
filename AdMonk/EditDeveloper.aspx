<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="EditDeveloper.aspx.cs" Inherits="EditDeveloper" %>

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
        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
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
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="emailid" CssClass="red" Display="Dynamic" ErrorMessage="*invalid mail id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
    </div>
        <div class="form-group">
            &nbsp;</div>
         <div class="form-group">
             <div class="col-sm-offset-4 col-sm-3">

                 <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Update" />
                 <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" OnClick="Button2_Click" Text="Delete" />
                 <asp:SqlDataSource ID="SqlDataSourceDeveloper" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Developer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Developer] ([Phone], [Email], [Password], [Gender], [Name]) VALUES (@Phone, @Email, @Password, @Gender, @Name)" SelectCommand="SELECT [Id], [Phone], [Email], [Password], [Gender], [Name] FROM [Developer]" UpdateCommand="UPDATE [Developer] SET [Phone] = @Phone, [Email] = @Email, [Password] = @Password, [Gender] = @Gender, [Name] = @Name WHERE [Id] = @Id">
                     <DeleteParameters>
                         <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="Phone" Type="String" />
                         <asp:Parameter Name="Email" Type="String" />
                         <asp:Parameter Name="Password" Type="String" />
                         <asp:Parameter Name="Gender" Type="String" />
                         <asp:Parameter Name="Name" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:ControlParameter ControlID="mobile" Name="Phone" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="emailid" Name="Email" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="password" Name="Password" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="RadioButtonList1" Name="Gender" PropertyName="SelectedValue" Type="String" />
                         <asp:ControlParameter ControlID="username" Name="Name" PropertyName="Text" Type="String" />
                         <asp:QueryStringParameter Name="Id" QueryStringField="id" />
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

