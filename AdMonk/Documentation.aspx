<%@ Page Title="" Language="C#" MasterPageFile="~/PublicVIew.master" AutoEventWireup="true" CodeFile="Documentation.aspx.cs" Inherits="Documentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
    <style>
        body {
  padding-top: 0.5rem;
  padding-bottom: 3rem;
  color: #5a5a5a;
}


/* CUSTOMIZE THE CAROUSEL
-------------------------------------------------- */

/* Carousel base class */
.carousel {
  margin-bottom: 4rem;
}
/* Since positioning the image, we need to help out the caption */
.carousel-caption {
  bottom: 3rem;
  z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel-item {
  height: 32rem;
  background-color: #777;
}
.carousel-item > img {
  position: absolute;
  top: 0;
  left: 0;
  min-width: 100%;
  height: 32rem;
}


/* MARKETING CONTENT
-------------------------------------------------- */

/* Center align the text within the three columns below the carousel */
.marketing .col-lg-4 {
  margin-bottom: 1.5rem;
  text-align: center;
}
.marketing h2 {
  font-weight: 400;
}
.marketing .col-lg-4 p {
  margin-right: .75rem;
  margin-left: .75rem;
}


/* Featurettes
------------------------- */

.featurette-divider {
  margin: 5rem 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
.featurette-heading {
  font-weight: 300;
  line-height: 1;
  letter-spacing: -.05rem;
}


/* RESPONSIVE CSS
-------------------------------------------------- */

@media (min-width: 40em) {
  /* Bump up size of carousel content */
  .carousel-caption p {
    margin-bottom: 1.25rem;
    font-size: 1.25rem;
    line-height: 1.4;
  }

  .featurette-heading {
    font-size: 50px;
  }
}

@media (min-width: 62em) {
  .featurette-heading {
    margin-top: 7rem;
  }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <%--<li data-target="#myCarousel" data-slide-to="0" class=""></li>--%>
          <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
        <%--  <li data-target="#myCarousel" data-slide-to="2" class=""></li>--%>
        </ol>
        <div class="carousel-inner">
         <%-- <div class="carousel-item">
            <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>Example headline.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
              </div>
            </div>
          </div>--%>
          <%--<div class="carousel-item active">
            <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>Another example headline.</h1>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
              </div>
            </div>
          </div>--%>
          <div class="carousel-item">
            <img class="third-slide" src="/pics/business-computer-contemporary-669996.jpg" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-right">
                <h1>One more for good measure.</h1>
                <p>Multi Website AD handling. Your ADs, our Services.</p>
                <%--<p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>--%>
              </div>
            </div>
          </div>
        </div>
      <%--  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>--%>
      </div>

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-sm-3">
            <img class="rounded-circle" src="/pics/ch1.png" alt="Generic placeholder image" width="140" height="140">
            <h2>Pay-as-you-go, <br />low prices</h2>
            <p>No costly monthly subscription, <br />pay only for what you need.</p>
           <%-- <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>--%>
          </div><!-- /.col-lg-4 -->
            <div class="col-sm-1"></div>
          <div class="col-sm-3">
            <img class="rounded-circle" src="/pics/ch2.png" alt="Generic placeholder image" width="140" height="140">
            <h2>Automated Upload</h2>
            <p>Get your ADs uploaded instantly on your click.</p>
<%--            <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>--%>
          </div><!-- /.col-lg-4 -->
             <div class="col-sm-1"></div>
          <div class="col-sm-3">
            <img class="rounded-circle" src="/pics/ch3.png" alt="Generic placeholder image" width="140" height="140">
            <h2>Go Global</h2>
            <p>Advertise on global level,<br />boost your business with us.</p>
<%--            <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>--%>
          </div><!-- /.col-lg-4 -->

            <%-- <div class="col-sm-3">
            <img class="rounded-circle" src="" alt="Generic placeholder image" width="140" height="140">
                 </div>--%>
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-5">
            <h2 class="featurette-heading">Boost Your Business. <span class="text-muted">It'll blow your mind.</span></h2>
            <p class="lead">Upload your advertisements, we will take them to the global network.Concentrate and grow your business.We do the rest.</p>
          </div>
          <div class="col-md-3">
            <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" style="width: 500px; height: 400px;" src="/pics/pexels-photo-1043506.jpeg" data-holder-rendered="true">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-5 order-md-2">
            <h2 class="featurette-heading">Analysis, it's that good. <span class="text-muted">See for yourself.</span></h2>
            <p class="lead">Our day-by day analysis reports help you understand the trends. We let you know, from where you recieve attraction for your business</p>
          </div>
          <div class="col-md-3 order-md-1">
            <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" src="/pics/crouselpic.jpeg" data-holder-rendered="true" style="width: 500px; height: 400px;">
          </div>
        </div>

        <hr class="featurette-divider">

       <%-- <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
            <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22500%22%20height%3D%22500%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20500%20500%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1639d76cd8c%20text%20%7B%20fill%3A%23AAAAAA%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1639d76cd8c%22%3E%3Crect%20width%3D%22500%22%20height%3D%22500%22%20fill%3D%22%23EEEEEE%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22185.125%22%20y%3D%22261.1%22%3E500x500%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 500px; height: 500px;">
          </div>
        </div>

        <hr class="featurette-divider">--%>

        <!-- /END THE FEATURETTES -->

      </div>
    
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

