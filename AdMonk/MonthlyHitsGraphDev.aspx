<%@ Page Title="" Language="C#" MasterPageFile="~/DeveloperView.master" AutoEventWireup="true" CodeFile="MonthlyHitsGraphDev.aspx.cs" Inherits="MonthlyHitsGraphDev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="text-center">Monthly Hits From Website to Advertisements</h2>
    <div class="form-horizontal">
        <%--<div class="form-group">
            <label class="col-sm-4 control-label">From : </label>
            <div class="col-sm-6">
                <asp:TextBox ID="FromDate" runat="server" TextMode="Date" CssClass="form-control" /><br />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">To : </label>
            <div class="col-sm-6">
                <asp:TextBox ID="ToDate" runat="server" TextMode="Date" CssClass="form-control" /><br />
            </div>
        </div>--%>
        <div class="form-group">
            <div class="col-md-6">
                <label>From :</label>
                <asp:Calendar ID="FromDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnDayRender="FromDate_DayRender" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </div>
            <div class="col-md-6">
                <label>To :</label>
                <asp:Calendar ID="ToDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnDayRender="ToDate_DayRender">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Select Website : </label>
            <div class="col-sm-6">
                <asp:DropDownList ID="DropDownListWebsite" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceWebisteKeys" DataTextField="Website" DataValueField="Key_Id" CssClass="form-control" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListWebsite" CssClass="red" Display="Dynamic" ErrorMessage="*Select website" InitialValue="0"></asp:RequiredFieldValidator>
                <br />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">
                <asp:Button ID="Button1" runat="server" Text="View" CssClass="btn btn-primary" />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceWebisteKeys" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Website_Keys] WHERE ([Developer_Id] = @Developer_Id)">
            <SelectParameters>
                <asp:SessionParameter Name="Developer_Id" SessionField="did" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="container">
            <div class="text-center">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceHits" CssClass="form-control">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="Redirect_Link" YValueMembers="Hits">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceHits" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT Advertisement.Redirect_Link, ISNULL(COUNT(Advertisement_Hits.Hit_Id), 0) AS Hits FROM Advertisement_Hits INNER JOIN Advertisement ON Advertisement_Hits.Advertisement_Id = Advertisement.Advertisement_Id WHERE (Advertisement_Hits.Key_Id = @Key_Id) AND (CONVERT (date, Advertisement_Hits.Date_Of_Hit) BETWEEN CONVERT (date, @from ) AND CONVERT (date, @to )) GROUP BY Advertisement.Redirect_Link">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListWebsite" Name="Key_Id" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="FromDate" Name="from" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="ToDate" Name="to" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

