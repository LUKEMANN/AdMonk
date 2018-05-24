<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="DailyHitsGraph.aspx.cs" Inherits="DailyHitsGraph" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header">
    <h2 class="text-center">Daily Hits on Advertisement</h2></div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-4 control-label">Select Advertisement Url:</label>
            <div class="col-sm-6">
                <asp:dropdownlist id="DropDownList1" runat="server" datasourceid="SqlDataSourceAdvertisements" datatextfield="Redirect_Link" datavaluefield="Advertisement_Id" autopostback="True" cssclass="form-control" appenddatabounditems="True">
        <asp:ListItem Value="0">--SELECT--</asp:ListItem>
            </asp:dropdownlist>
                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" controltovalidate="DropDownList1" cssclass="red" display="Dynamic" errormessage="*Select url" initialvalue="0"></asp:requiredfieldvalidator>
                <br />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">
                <asp:button id="Button1" runat="server" text="View" cssclass="btn btn-primary" />
            </div>
        </div>
        <asp:sqldatasource id="SqlDataSourceAdvertisements" runat="server" connectionstring="<%$ ConnectionStrings:connect %>" selectcommand="SELECT * FROM [Advertisement] WHERE company_id = @company_id ">
        <SelectParameters>
            <asp:SessionParameter Name="company_id" SessionField="cid" />
        </SelectParameters>
</asp:sqldatasource>
        <br />
        <div class="container-fluid">
            <div class="col-sm-12">
                <asp:chart id="Chart1" runat="server" datasourceid="SqlDataSourceDailyHits" Width="950px">
    <series>
        <asp:Series Name="Series1" XValueMember="Date_Of_Hit" YValueMembers="Hits" Legend="Legend1">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
        <Legends>
            <asp:Legend Name="Legend1">
            </asp:Legend>
        </Legends>
</asp:chart>
            </div>
        </div>
        <asp:sqldatasource id="SqlDataSourceDailyHits" runat="server" connectionstring="<%$ ConnectionStrings:connect %>" selectcommand="SELECT Date_Of_Hit, ISNULL(COUNT(Hit_Id), 0) AS Hits FROM Advertisement_Hits WHERE (Advertisement_Id = @Advertisement_Id) AND (CONVERT (date, Date_Of_Hit) = @Date_Of_Hit) GROUP BY Date_Of_Hit">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="Advertisement_Id" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="HiddenFieldDate" Name="Date_Of_Hit" PropertyName="Value" />
    </SelectParameters>
</asp:sqldatasource>
        <asp:hiddenfield id="HiddenFieldDate" runat="server" />
    </div>
</asp:Content>

