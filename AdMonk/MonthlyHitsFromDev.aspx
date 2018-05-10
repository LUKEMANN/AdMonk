<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="MonthlyHitsFromDev.aspx.cs" Inherits="MonthlyHitsFromDev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="text-center">Monthly Hits From Website to Advertisements</h2>
    Select Advertisement:
    <asp:DropDownList ID="DropDownListWebsite" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceAdvertisement" DataTextField="Redirect_Link" DataValueField="Advertisement_Id"></asp:DropDownList><br />
    <asp:Button ID="Button1" runat="server" Text="View" />
    <br />
    From : <asp:TextBox ID="FromDate" runat="server" TextMode="Date" /><br />
    To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="ToDate" runat="server" TextMode="Date" /><br />
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
    <asp:SqlDataSource ID="SqlDataSourceHits" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT Website_Keys.Website, ISNULL(COUNT(Advertisement_Hits.Hit_Id), 0) AS Hits FROM Advertisement_Hits INNER JOIN Website_Keys ON Advertisement_Hits.Key_Id = Website_Keys.Key_Id WHERE (Advertisement_Hits.Advertisement_Id = @Advertisement_Id) AND (CONVERT (date, Advertisement_Hits.Date_Of_Hit) BETWEEN CONVERT (date, @from ) AND CONVERT (date, @to )) GROUP BY Website_Keys.Website">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListWebsite" Name="Advertisement_Id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="FromDate" Name="from" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDate" Name="to" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

