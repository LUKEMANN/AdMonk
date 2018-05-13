<%@ Page Title="" Language="C#" MasterPageFile="~/PublicView.master" AutoEventWireup="true" CodeFile="LoginDeveloper.aspx.cs" Inherits="LoginAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
        <div class="page-header text-center">
            <a><span class="glyphicon glyphicon-user" style="font-size: 75px"></span></a>
            <h2>Developer Login</h2>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Email</label>
            <div class="col-sm-6">
                <asp:TextBox ID="emailid" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="*field is mandatory" ControlToValidate="emailid"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="password" CssClass="red" Display="Dynamic" ErrorMessage="*minimum 8 characters required" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{8,10}$"></asp:RegularExpressionValidator>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="*password needed" ControlToValidate="password"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="Button1_Click" />

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Developer]"></asp:SqlDataSource>

            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">
                    <asp:Label runat="server" ID="msg" CssClass="control-label" text-capitalize="Label"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

