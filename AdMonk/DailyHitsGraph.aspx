<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="DailyHitsGraph.aspx.cs" Inherits="DailyHitsGraph" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="text-center">Daily Hits on Advertisement</h2>
    <div class="form-horizontal">
        <div class="form-group">
    <label class="col-sm-4 control-label">Select Advertisement Url:</label>
        <div class="col-sm-6">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceAdvertisements" DataTextField="Redirect_Link" DataValueField="Advertisement_Id" AutoPostBack="True" CssClass="form-control" AppendDataBoundItems="True">
        <asp:ListItem Value="0">--SELECT--</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" CssClass="red" Display="Dynamic" ErrorMessage="*Select url" InitialValue="0"></asp:RequiredFieldValidator>
            <br />
   </div>
            </div>
         <div class="form-group">
        <div class="col-sm-offset-4 col-sm-6">
            <asp:Button ID="Button1" runat="server" Text="View" CssClass="btn btn-primary" />
            </div>
             </div>
    <asp:SqlDataSource ID="SqlDataSourceAdvertisements" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT * FROM [Advertisement] WHERE company_id = @company_id ">
        <SelectParameters>
            <asp:SessionParameter Name="company_id" SessionField="cid" />
        </SelectParameters>
</asp:SqlDataSource>
    <br />
        <div class="container">    
            <div class="text-center">
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceDailyHits">
    <series>
        <asp:Series Name="Series1" XValueMember="Date_Of_Hit" YValueMembers="Hits">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
</asp:Chart>
                </div>
            </div>
<asp:SqlDataSource ID="SqlDataSourceDailyHits" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT Date_Of_Hit, ISNULL(COUNT(Hit_Id), 0) AS Hits FROM Advertisement_Hits WHERE (Advertisement_Id = @Advertisement_Id) AND (CONVERT (date, Date_Of_Hit) = @Date_Of_Hit) GROUP BY Date_Of_Hit">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="Advertisement_Id" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="HiddenFieldDate" Name="Date_Of_Hit" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenFieldDate" runat="server" />
        </div>
</asp:Content>

