<%@ Page Title="" Language="C#" MasterPageFile="~/AdminView.master" AutoEventWireup="true" CodeFile="Menu1.aspx.cs" Inherits="Menu1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">
       <nav id="header-nav" class="navbar navbar-inverse">
   <div>
     <div class="navbar-header">    
         <h1 >AdMonitor</h1>
        <div class="navbar-brand "><a href="#"></a>
        <p><span>Right to Ease</span>
        </p>
     </div>
        
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapsable-nav" aria-expanded="false">
         <span class="sr-only">Toggle navigaton</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>      
      </button>  
     </div>

      <div id="collapsable-nav" class="collapse  navbar-collapse">
        <ul id="nav-list" class="nav navbar-nav navbar-right">
       
        	<li>
        		<a href="#">
        			<span class="glyphicon glyphicon-home" style="margin-right:2px"></span><br class="hidden-xs">Menu
        		</a>
        	</li>
        	<li>
        		<a href="#">
        			<span class="glyphicon glyphicon-info-sign"></span><br class="hidden-xs">About
        		</a>
        	</li>
        	<li>
        		<a href="#">
        			<span class="glyphicon glyphicon-certificate"></span>
        			<br class="hidden-xs">
        		</a>
        	</li>
        	
        </ul>
      	
      </div>
         </div>
    
  </nav>
    <div class="container">
       
    </div>
    </form>
</asp:Content>

