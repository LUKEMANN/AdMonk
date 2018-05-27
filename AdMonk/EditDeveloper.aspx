<%@ Page Title="" Language="C#" MasterPageFile="~/DeveloperView.master" AutoEventWireup="true" CodeFile="EditDeveloper.aspx.cs" Inherits="EditDeveloper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
        <div class="page-header text-center">
            <h2>Edit Profile</h2>
        </div>
        <div class="form-group">
            <div class="col-md-offset-5">
                <asp:Image ID="Image1" runat="server" CssClass="img-circle img-responsive" Height="90px" Width="90px"></asp:Image>
                <asp:FileUpload ID="Photo" runat="server" CssClass="auto-style1" />
                <asp:HiddenField ID="HiddenFieldPhoto" runat="server" />
            </div>

        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Username</label>
            <div class="col-sm-6">
                <asp:TextBox ID="username" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="* Field mandatory" ControlToValidate="username"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="red" Display="Dynamic" ErrorMessage="*Field Mandatory"></asp:RequiredFieldValidator>
            </div>
        </div>
        <%--<div class="form-group">
            <label class="control-label col-sm-4">Confirm Password</label>
            <div class="col-sm-6">
        <asp:TextBox ID="confirmpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="confirmpass" CssClass="red" ErrorMessage="* invalid password"></asp:CompareValidator>
                </div>
    </div>--%>
        <div class="form-group">
            <label class="control-label col-sm-4">Fullname</label>
            <div class="col-sm-6">
                <asp:TextBox ID="fullname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="fullname" CssClass="red" Display="Dynamic" ErrorMessage="*only alphabets are allowed" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fullname" CssClass="red" Display="Dynamic" ErrorMessage="*Field mandatory "></asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mobile" CssClass="red" Display="Dynamic" ErrorMessage="*Field mandatory "></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="mobile" CssClass="red" Display="Dynamic" ErrorMessage="* invalid contact" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Email Id</label>
            <div class="col-sm-6">
                <asp:TextBox runat="server" ID="email" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="email" CssClass="red" Display="Dynamic" ErrorMessage="*email is mandatory"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="email" CssClass="red" Display="Dynamic" ErrorMessage="*invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            &nbsp;
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-3">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Update" />
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" OnClick="Button2_Click" Text="Delete" />
                <asp:SqlDataSource ID="SqlDataSourceDeveloper" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Developer] WHERE [Developer_Id] = @Developer_Id" InsertCommand="INSERT INTO [Developer] ([Name], [Phone], [Email], [Password], [Gender], [Fullname]) VALUES (@Name, @Phone, @Email, @Password, @Gender, @Fullname)" SelectCommand="SELECT * FROM [Developer]" UpdateCommand="UPDATE Developer SET Name = @Name, Phone = @Phone, Email = @Email, Password = @Password, Gender = @Gender, Fullname = @Fullname, Photo = @Photo WHERE (Developer_Id = @Developer_Id)">
                    <DeleteParameters>
                        <asp:SessionParameter Name="Developer_Id" SessionField="did" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Fullname" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="username" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="mobile" Name="Phone" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="email" Name="Email" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="password" Name="Password" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="Gender" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="fullname" Name="Fullname" PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="Developer_Id" SessionField="did" Type="Int32" />
                        <asp:ControlParameter ControlID="HiddenFieldPhoto" Name="Photo" PropertyName="Value" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-3">
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
                    <p>
                        <asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

