﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyView.master" AutoEventWireup="true" CodeFile="DailyHitsFromDev.aspx.cs" Inherits="DailyHitsFromDev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header">
    <h2 class="text-center">Daily Hits From Website to Advertisements</h2></div>
    <div class="form-horizontal">
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
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceHits" CssClass="auto-style1" Width="950px" style="margin-top: 24px">
        <Series>
            <asp:Series Name="Number of Hits" XValueMember="Website" YValueMembers="Hits" Legend="Legend1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
                        <asp:Legend Name="Legend1">
                        </asp:Legend>
                    </Legends>
    </asp:Chart>
                </div>
            </div>
        </div>
    <asp:SqlDataSource ID="SqlDataSourceHits" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" SelectCommand="SELECT Website_Keys.Website, ISNULL(COUNT(Advertisement_Hits.Hit_Id), 0) AS Hits FROM Advertisement_Hits INNER JOIN Website_Keys ON Advertisement_Hits.Key_Id = Website_Keys.Key_Id WHERE (Advertisement_Hits.Advertisement_Id = @Advertisement_Id) AND (CONVERT (date, Advertisement_Hits.Date_Of_Hit) = @Date_Of_Hit) GROUP BY Website_Keys.Website">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListWebsite" Name="Advertisement_Id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="HiddenFieldDate" DbType="Date" Name="Date_Of_Hit" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldDate" runat="server" />
</asp:Content>

