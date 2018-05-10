<%@ Page Title="" Language="C#" MasterPageFile="~/DeveloperView.master" AutoEventWireup="true" CodeFile="MonthlyHitsGraphDev.aspx.cs" Inherits="MonthlyHitsGraphDev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h2 class="text-center">Monthly Hits From Website to Advertisements</h2>
    From : <asp:TextBox ID="FromDate" runat="server" TextMode="Date" /><br />
    To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="ToDate" runat="server" TextMode="Date" /><br />
    Select Website: <asp:DropDownList ID="DropDownListWebsite" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceWebisteKeys" DataTextField="Website" DataValueField="Key_Id"></asp:DropDownList><br />
    <asp:Button ID="Button1" runat="server" Text="View" />
    <asp:SqlDataSource ID="SqlDataSourceWebisteKeys" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Website_Keys] WHERE ([Developer_Id] = @Developer_Id)">
        <SelectParameters>
            <asp:SessionParameter Name="Developer_Id" SessionField="did" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceHits">
        <Series>
            <asp:Series Name="Series1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceHits" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT Advertisement.Redirect_Link, ISNULL(COUNT(Advertisement_Hits.Hit_Id), 0) AS Hits FROM Advertisement_Hits INNER JOIN Advertisement ON Advertisement_Hits.Advertisement_Id = Advertisement.Advertisement_Id WHERE (Advertisement_Hits.Key_Id = @Key_Id) AND (CONVERT (date, Advertisement_Hits.Date_Of_Hit) BETWEEN CONVERT (date, @from ) AND CONVERT (date, @to )) GROUP BY Advertisement.Redirect_Link">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListWebsite" Name="Key_Id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="FromDate" Name="from" PropertyName="Text" />
            <asp:ControlParameter ControlID="ToDate" Name="to" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

