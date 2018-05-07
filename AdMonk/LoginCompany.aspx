﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PublicView.master" AutoEventWireup="true" CodeFile="LoginCompany.aspx.cs" Inherits="LoginCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-4">Company E-Mail</label>
            <div class="col-sm-6">
                <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field" ControlToValidate="email"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Password</label>
            <div class="col-sm-6">
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="red" Display="Dynamic" ErrorMessage="*provide correct password" ControlToValidate="password"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
             <div class="col-sm-offset-4 col-sm-6">
                 <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="Button1_Click" />
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Company]"></asp:SqlDataSource>
                 </div>
            </div>
         <div class="form-group">
             <div class="col-sm-offset-4 col-sm-6">
                 <asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label>
                 </div>
             </div>
    </div>
</asp:Content>

