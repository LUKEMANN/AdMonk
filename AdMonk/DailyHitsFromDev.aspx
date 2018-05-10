<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="DailyHitsFromDev.aspx.cs" Inherits="DailyHitsFromDev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="text-center">Daily Hits From Website to Advertisements</h2>
    Select Advertisement:
    <asp:DropDownList ID="DropDownListWebsite" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceAdvertisement" DataTextField="Redirect_Link" DataValueField="Advertisement_Id"></asp:DropDownList><br />
    <asp:Button ID="Button1" runat="server" Text="View" />
    <asp:SqlDataSource ID="SqlDataSourceAdvertisement" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Advertisement] WHERE ([Company_Id] = @Company_Id)">
        <SelectParameters>
            <asp:SessionParameter Name="Company_Id" SessionField="cid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceHits">
        <Series>
            <asp:Series Name="Series1" XValueMember="Website" YValueMembers="Hits">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceHits" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT Website_Keys.Website, ISNULL(COUNT(Advertisement_Hits.Hit_Id), 0) AS Hits FROM Advertisement_Hits INNER JOIN Website_Keys ON Advertisement_Hits.Key_Id = Website_Keys.Key_Id WHERE (Advertisement_Hits.Advertisement_Id = @Advertisement_Id) AND (CONVERT (date, Advertisement_Hits.Date_Of_Hit) = @Date_Of_Hit) GROUP BY Website_Keys.Website">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListWebsite" Name="Advertisement_Id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="HiddenFieldDate" DbType="Date" Name="Date_Of_Hit" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldDate" runat="server" />
</asp:Content>

