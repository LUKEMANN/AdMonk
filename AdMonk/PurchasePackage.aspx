<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="PurchasePackage.aspx.cs" Inherits="PurchasePackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
        <div class="page-header text-center">
            <a href="#"><span class="glyphicon glyphicon-user" style="font-size: 75px"></span></a>
            <h2>Purchase Package</h2>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Select Package</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="DropDownListPackage" runat="server" CssClass="form-control" DataSourceID="SqlDataSourcePackage" DataTextField="Package_Name" DataValueField="Package_Id" AppendDataBoundItems="True">
                    <asp:ListItem>--SELECT--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="--SELECT--" runat="server" ControlToValidate="DropDownListPackage" CssClass="red" Display="Dynamic" ErrorMessage="*select a package"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSourcePackage" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Package]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Select Advertisement</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="DropDownListAdvertisement" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceAdvertisement" DataTextField="Redirect_Link" DataValueField="Advertisement_Id" AppendDataBoundItems="True">
                    <asp:ListItem>--SELECT--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="--SELECT--" runat="server" ControlToValidate="DropDownListAdvertisement" CssClass="red" Display="Dynamic" ErrorMessage="*select advertisement"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSourceAdvertisement" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Advertisement] WHERE ([Company_Id] = @Company_Id)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Company_Id" SessionField="cid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Purchase Package" OnClick="Button1_Click" />

                <asp:SqlDataSource ID="SqlDataSourcePurchasedPackage" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [PurchasedPackages]" DeleteCommand="DELETE FROM [PurchasedPackages] WHERE [Purchase_Id] = @Purchase_Id" InsertCommand="INSERT INTO [PurchasedPackages] ([Package_Id], [Advertisement_Id], [Date_Of_Purchase]) VALUES (@Package_Id, @Advertisement_Id, @Date_Of_Purchase)" OnInserting="SqlDataSourcePurchasedPackage_Inserting" UpdateCommand="UPDATE [PurchasedPackages] SET [Package_Id] = @Package_Id, [Advertisement_Id] = @Advertisement_Id, [Date_Of_Purchase] = @Date_Of_Purchase WHERE [Purchase_Id] = @Purchase_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Purchase_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownListPackage" Name="Package_Id" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownListAdvertisement" Name="Advertisement_Id" PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="Date_Of_Purchase" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Package_Id" Type="Int32" />
                        <asp:Parameter Name="Advertisement_Id" Type="Int32" />
                        <asp:Parameter Name="Date_Of_Purchase" Type="DateTime" />
                        <asp:Parameter Name="Purchase_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>

        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
               
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

