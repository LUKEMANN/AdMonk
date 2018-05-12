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
                <asp:DropDownList ID="DropDownListAdvertisement" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceAdvertisement" DataTextField="Redirect_Link" DataValueField="Advertisement_Id" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListAdvertisement" CssClass="red" Display="Dynamic" ErrorMessage="*select an advertisement" InitialValue="0"></asp:RequiredFieldValidator>
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
            <div class=" col-sm-12">
                
                <asp:Label runat="server" ID="msg" CssClass="control-label" text-capitalize="Label"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Purchase_Id" DataSourceID="SqlDataSourcePurchasedPackage" CssClass="table table-hover" style="margin-left: 45px; margin-top: 45px">
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
        <div class="form-group">
            <div class="col-sm-12">

                <asp:Chart ID="Chart1" runat="server" OnLoad="Chart1_Load">
                    <Series>
                        <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Name="Series1" XValueMember="Type" YValueMembers="Value">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend>

                        </asp:Legend>
                    </Legends>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSourceRemaining" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT (SELECT ISNULL(SUM(Package.Number_of_Hits), 0) AS Expr1 FROM PurchasedPackages INNER JOIN Package ON PurchasedPackages.Package_Id = Package.Package_Id WHERE (PurchasedPackages.Advertisement_Id = @AdvertisementId)) - (SELECT ISNULL(COUNT(Hit_Id), 0) AS Expr1 FROM Advertisement_Hits WHERE (Advertisement_Id = @AdvertisementId)) AS Remaining, (SELECT ISNULL(COUNT(Hit_Id), 0) AS Expr1 FROM Advertisement_Hits AS Advertisement_Hits_1 WHERE (Advertisement_Id = @AdvertisementId)) AS Used">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAdvertisement" Name="AdvertisementId" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

