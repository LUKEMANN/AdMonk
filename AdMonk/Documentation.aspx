<%@ Page Title="" Language="C#" MasterPageFile="~/PublicVIew.master" AutoEventWireup="true" CodeFile="Documentation.aspx.cs" Inherits="Documentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header text-center">
        <h2>How to display our ads in your website</h2>
    </div>

    <ol type="number">
        <li>Download jQuery from <a href="https://code.jquery.com/jquery-3.3.1.min.js" target="_blank">here</a>.</li>
        <li>Download our script file from <a href="API/script.js" target="_blank">here</a></li>
        <li>Add jquery and our script in &lt;head&gt; &lt;/head&gt; tag.</li>
        <li>Add your api key in GetAds function<br />
         <pre>&lt;script src=&quot;js/jquery-*.js&quot;&gt;&lt;/script&gt;<br />
&lt;script src=&quot;js/script.js&quot;&gt;&lt;/script&gt;<br />
&lt;script&gt;<br />
getAds(&quot;your ApiKey&quot;);<br />
&lt;/script&gt;<br />
        </pre>
        <li>Add the following div where you want to display your ads.<br />
        <pre>&lt;div id=&quot;admonk&quot;&gt;&lt;/div&gt;</pre></li>
    </ol>
</asp:Content>

