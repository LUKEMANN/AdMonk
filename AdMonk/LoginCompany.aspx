<%@ Page Title="" Language="C#" MasterPageFile="~/PublicView.master" AutoEventWireup="true" CodeFile="LoginCompany.aspx.cs" Inherits="LoginCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
         <div class="page-header text-center">
      <a ><span class="glyphicon glyphicon-log-in" style="font-size:75px"></span></a>  
            <h2>Company Login</h2>
        </div>
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
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="password" CssClass="red" Display="Dynamic" ErrorMessage="*minimum 8 characters required" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{8,10}$"></asp:RegularExpressionValidator>--%>
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
                        <asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

