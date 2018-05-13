<%@ Page Title="" Language="C#" MasterPageFile="~/PublicView.master" AutoEventWireup="true" CodeFile="AddDeveloper.aspx.cs" Inherits="AddDeveloper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
        <div class="page-header text-center">
            <a href="#"><span class="glyphicon glyphicon-user" style="font-size: 75px"></span></a>
            <h2>Developer Sign Up</h2>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label" style="height: 20px">Profile Photo</label>
            <div class="col-sm-6">
                <asp:fileupload id="Photo" runat="server" cssclass="form-control" />

                <asp:hiddenfield id="HiddenFieldPhoto" runat="server" />

                <asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" controltovalidate="Photo" cssclass="red" display="Dynamic" errormessage="* Please upload photo"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Username</label>
            <div class="col-sm-6">
                <asp:textbox id="username" runat="server" cssclass="form-control"></asp:textbox>
                <asp:regularexpressionvalidator id="RegularExpressionValidator5" runat="server" controltovalidate="username" cssclass="red" display="Dynamic" errormessage="*only alphabets and numbers are allowed" validationexpression="^[a-zA-Z0-9''-'\s]{1,40}$"></asp:regularexpressionvalidator>
                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" cssclass="red" display="Dynamic" errormessage="* field mandatory" controltovalidate="username"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Password</label>
            <div class="col-sm-6">
                <asp:textbox id="Password" runat="server" cssclass="form-control" textmode="Password"></asp:textbox>
                <asp:regularexpressionvalidator id="RegularExpressionValidator4" runat="server" controltovalidate="Password" cssclass="red" display="Dynamic" errormessage="*password must  be atleast 8 character long" validationexpression="^[a-zA-Z0-9'@&amp;#.\s]{8,10}$"></asp:regularexpressionvalidator>
                <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" controltovalidate="Password" cssclass="red" display="Dynamic" errormessage="*Field Mandatory"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Confirm Password</label>
            <div class="col-sm-6">
                <asp:textbox id="confirmpass" runat="server" cssclass="form-control" textmode="Password"></asp:textbox>
                <asp:requiredfieldvalidator id="RequiredFieldValidator8" runat="server" controltovalidate="confirmpass" cssclass="red" display="Dynamic" errormessage="*re-enter password"></asp:requiredfieldvalidator>
                <asp:comparevalidator id="CompareValidator1" runat="server" controltocompare="Password" controltovalidate="confirmpass" cssclass="red" errormessage="* invalid password"></asp:comparevalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Fullname</label>
            <div class="col-sm-6">
                <asp:textbox id="fullname" runat="server" cssclass="form-control"></asp:textbox>
                <asp:regularexpressionvalidator id="RegularExpressionValidator6" runat="server" controltovalidate="fullname" cssclass="red" display="Dynamic" errormessage="*enter valid fullname" validationexpression="^[a-zA-Z''-'\s]{1,40}$"></asp:regularexpressionvalidator>
                <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" controltovalidate="fullname" cssclass="red" display="Dynamic" errormessage="* mandatory field"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Gender</label>
            <div class="col-sm-6">
                <asp:radiobuttonlist id="RadioButtonList1" runat="server" repeatdirection="Horizontal" cssclass="FormatRBList" datatextfield="Gender">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:radiobuttonlist>
                <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" controltovalidate="RadioButtonList1" cssclass="red" display="Dynamic" errormessage="*mandatory field"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Contact</label>
            <div class="col-sm-6">
                <asp:textbox id="mobile" runat="server" cssclass="form-control"></asp:textbox>
                <asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" controltovalidate="mobile" cssclass="red" display="Dynamic" errormessage="* mandatory field"></asp:requiredfieldvalidator>
                <asp:regularexpressionvalidator id="RegularExpressionValidator2" runat="server" controltovalidate="mobile" cssclass="red" display="Dynamic" errormessage="* invalid contact" validationexpression="\d{10}"></asp:regularexpressionvalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Email Id</label>
            <div class="col-sm-6">
                <asp:textbox id="emailid" runat="server" cssclass="form-control"></asp:textbox>
                <asp:requiredfieldvalidator id="RequiredFieldValidator7" runat="server" controltovalidate="emailid" cssclass="red" display="Dynamic" errormessage="*e-mail is mandatory"></asp:requiredfieldvalidator>
                <asp:regularexpressionvalidator id="RegularExpressionValidator3" runat="server" controltovalidate="emailid" cssclass="red" display="Dynamic" errormessage="*invalid mail id" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-6 col-sm-3">

                <asp:button id="Button1" runat="server" cssclass="btn btn-primary" onclick="Button1_Click" text="Register" />
                <asp:sqldatasource id="SqlDataSourceDeveloper" runat="server" connectionstring="<%$ ConnectionStrings:connect %>" selectcommand="SELECT [Developer_Id], [Name], [Phone], [Photo], [Email], [Password], [Gender], [Fullname] FROM [Developer]" deletecommand="DELETE FROM [Developer] WHERE [Developer_Id] = @Developer_Id" insertcommand="INSERT INTO [Developer] ([Name], [Phone], [Photo], [Email], [Password], [Gender], [Fullname]) VALUES (@Name, @Phone, @Photo, @Email, @Password, @Gender, @Fullname)" updatecommand="UPDATE [Developer] SET [Name] = @Name, [Phone] = @Phone, [Photo] = @Photo, [Email] = @Email, [Password] = @Password, [Gender] = @Gender, [Fullname] = @Fullname WHERE [Developer_Id] = @Developer_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Developer_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="username" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="mobile" Name="Phone" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="HiddenFieldPhoto" Name="Photo" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="emailid" Name="Email" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="Gender" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="fullname" Name="Fullname" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Photo" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Fullname" Type="String" />
                        <asp:Parameter Name="Developer_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:sqldatasource>

            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">
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
                        <asp:label id="msg" runat="server" cssclass="control-label"></asp:label>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

