<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="MonthlyHitsFromDev.aspx.cs" Inherits="MonthlyHitsFromDev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            margin-top: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header">
    <h2 class="text-center">Monthly Hits From Website to Advertisements</h2></div>
    <div class="form-horizontal">

        <br />
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
        <%--<div class="form-group">
            <label class="col-sm-4 control-label">From :</label>
            <div class="col-sm-6">
                <asp:TextBox ID="FromDate" runat="server" TextMode="Date" CssClass="form-control" /><br />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">To :</label>
            <div class="col-sm-6">
                <asp:TextBox ID="ToDate" runat="server" TextMode="Date" CssClass="form-control" /><br />

            </div>
        </div>--%>
        <div class="form-group">
            <label class="col-sm-4 control-label">Select Advertisement:</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="DropDownListWebsite" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceAdvertisement" DataTextField="Redirect_Link" DataValueField="Advertisement_Id" CssClass="form-control" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListWebsite" CssClass="red" Display="Dynamic" ErrorMessage="*select advertisement" InitialValue="0"></asp:RequiredFieldValidator>
                <br />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">
                <asp:Button ID="Button1" runat="server" Text="View" CssClass="btn btn-primary" />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceAdvertisement" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Advertisement] WHERE ([Company_Id] = @Company_Id)">
            <SelectParameters>
                <asp:SessionParameter Name="Company_Id" SessionField="cid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div class="container-fluid">
            <div class="col-sm-12">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceHits" Width="950px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="Website" YValueMembers="Hits">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceHits" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT Website_Keys.Website, ISNULL(COUNT(Advertisement_Hits.Hit_Id), 0) AS Hits FROM Advertisement_Hits INNER JOIN Website_Keys ON Advertisement_Hits.Key_Id = Website_Keys.Key_Id WHERE (Advertisement_Hits.Advertisement_Id = @Advertisement_Id) AND (CONVERT (date, Advertisement_Hits.Date_Of_Hit) BETWEEN CONVERT (date, @from ) AND CONVERT (date, @to )) GROUP BY Website_Keys.Website">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListWebsite" Name="Advertisement_Id" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="FromDate" Name="from" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="ToDate" Name="to" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

