<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="PurchaseHistory.aspx.cs" Inherits="PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="page-header text-center">
            <a href="#"><span class="glyphicon glyphicon-user" style="font-size: 75px"></span></a>
            <h2>Purchase History</h2>
        </div>
        
        <div class="form-group">
            <label class="control-label col-sm-4">Select Advertisement</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="DropDownListAdvertisement" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceAdvertisement" DataTextField="Redirect_Link" DataValueField="Advertisement_Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceAdvertisement" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Advertisement] WHERE ([Company_Id] = @Company_Id)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Company_Id" SessionField="cid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="View History" OnClick="Button1_Click" />

                <asp:SqlDataSource ID="SqlDataSourcePurchasedPackage" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT PurchasedPackages.Purchase_Id, PurchasedPackages.Package_Id, PurchasedPackages.Advertisement_Id, PurchasedPackages.Date_Of_Purchase, Advertisement.Redirect_Link, Package.Package_Name, Package.Number_of_Hits, Package.Price FROM PurchasedPackages INNER JOIN Advertisement ON PurchasedPackages.Advertisement_Id = Advertisement.Advertisement_Id INNER JOIN Package ON PurchasedPackages.Package_Id = Package.Package_Id WHERE (PurchasedPackages.Advertisement_Id = @Advertisement_Id)" DeleteCommand="DELETE FROM [PurchasedPackages] WHERE [Purchase_Id] = @Purchase_Id" InsertCommand="INSERT INTO [PurchasedPackages] ([Package_Id], [Advertisement_Id], [Date_Of_Purchase]) VALUES (@Package_Id, @Advertisement_Id, @Date_Of_Purchase)" UpdateCommand="UPDATE [PurchasedPackages] SET [Package_Id] = @Package_Id, [Advertisement_Id] = @Advertisement_Id, [Date_Of_Purchase] = @Date_Of_Purchase WHERE [Purchase_Id] = @Purchase_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Purchase_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownListPackage" Name="Package_Id" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownListAdvertisement" Name="Advertisement_Id" PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="Date_Of_Purchase" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAdvertisement" Name="Advertisement_Id" PropertyName="SelectedValue" />
                    </SelectParameters>
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
                <asp:Label runat="server" ID="msg" CssClass="control-label" text-capitalize="Label"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Purchase_Id" DataSourceID="SqlDataSourcePurchasedPackage">
                    <Columns>
                        <asp:BoundField DataField="Advertisement_Id" HeaderText="Advertisement_Id" SortExpression="Advertisement_Id" />
                        <asp:BoundField DataField="Redirect_Link" HeaderText="Redirect_Link" SortExpression="Redirect_Link" />
                        <asp:BoundField DataField="Package_Name" HeaderText="Package_Name" SortExpression="Package_Name" />
                        <asp:BoundField DataField="Number_of_Hits" HeaderText="Number_of_Hits" SortExpression="Number_of_Hits" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Date_Of_Purchase" HeaderText="Date_Of_Purchase" SortExpression="Date_Of_Purchase" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

