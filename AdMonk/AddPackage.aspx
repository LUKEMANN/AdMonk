<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="AddPackage.aspx.cs" Inherits="AddPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
          <div class="page-header text-center">
            <h2>Add Package</h2>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Package Name</label>
            <div class="col-sm-6">
                <asp:TextBox ID="pkgname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="pkgname" CssClass="red" Display="Dynamic" ErrorMessage="*only alphabets are allowed" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pkgname" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Number of Hits</label>
            <div class="col-sm-6">
                <asp:TextBox ID="nohits" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="nohits" CssClass="red" Display="Dynamic" ErrorMessage="*enter valid value" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nohits" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Price</label>
            <div class="col-sm-6">
                <asp:TextBox ID="price" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="price" CssClass="red" Display="Dynamic" ErrorMessage="*enter a valid price value" ValidationExpression="^\d+(\.\d\d)?$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="price" CssClass="red" Display="Dynamic" ErrorMessage="*please enter a value(*prices in INR)"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <asp:Button ID="Button1" runat="server" Text="Add Package" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <asp:SqlDataSource ID="SqlDataSourcePackage" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Package] WHERE [Package_Id] = @Package_Id" InsertCommand="INSERT INTO [Package] ([Package_Name], [Number_of_Hits], [Price]) VALUES (@Package_Name, @Number_of_Hits, @Price)" SelectCommand="SELECT * FROM [Package]" UpdateCommand="UPDATE [Package] SET [Package_Name] = @Package_Name, [Number_of_Hits] = @Number_of_Hits, [Price] = @Price WHERE [Package_Id] = @Package_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Package_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="pkgname" Name="Package_Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="nohits" Name="Number_of_Hits" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="price" Name="Price" PropertyName="Text" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Package_Name" Type="String" />
                        <asp:Parameter Name="Number_of_Hits" Type="Decimal" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="Package_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
         <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
               
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

