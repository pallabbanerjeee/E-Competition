<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="compack.ConnectionProvider,java.io.*,java.util.*,java.sql.*,org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<jsp:useBean id="mybean" class="compack.EjavaBeans"/>
<jsp:setProperty name="mybean" property="*"/>
<html lang="en">
<head>
    <style>
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button1 {
    background-color: white; 
    color: black; 
    border: 2px solid #4CAF50;
}

.button1:hover {
    background-color: #4CAF50;
    color: white;
}

.button2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
}

.button2:hover {
    background-color: #008CBA;
    color: white;
}

.button3 {
    background-color: white; 
    color: black; 
    border: 2px solid #f44336;
}

.button3:hover {
    background-color: #f44336;
    color: white;
}

.button4 {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}

.button5 {
    background-color: white;
    color: black;
    border: 2px solid #555555;
}

.button5:hover {
    background-color: #555555;
    color: white;
}
</style>
<title>E-Competition: A way to success</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Drive Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">  
<link href="css/font-awesome.css" rel="stylesheet"> 			<!-- font-awesome icons --> 
<!-- //Custom Theme files -->  
<!-- js -->
<!--<script src="js/jquery-2.2.3.min.js"></script>-->
<script src="js/smoothscroll.min.js"></script>
<!-- //js -->
<!-- web-fonts -->  
<link href="//fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- //web-fonts --> 
</head>
<body>
	<!-- banner -->
	<div class="banner w3about">
		<!-- header -->
		<div class="header">
			<div class="container">
				<div class="header-w3lsrow"> 
					<div class="menu"> 
						<div class="toggle"></div> 
						<ul class="w3nav">
							<li><a href="index.jsp"> Home</a></li>
							<li><a href="about.jsp"> About</a></li> 
							<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Exams<span class="caret"></span></a>
								<ul class="dropdown-menu">
                                                                    <li><a href="tcs.jsp">TCS</a></li>
	<li><a href="hcl.jsp">HCL</a></li>
	<li><a href="capgemini.jsp">Capgemini</a></li>
        <li><a href="ibm.jsp">IBM</a></li>
	<li><a href="ibpspo.jsp">IBPS PO</a></li>
	<li><a href="ibpsclerk.jsp">IBPS Clerk</a></li>
	<li><a href="sbipo.jsp">SBI PO</a></li>
        <li><a href="sbiclerk.jsp">SBI Clerk</a></li>
								</ul>
							</li> 		
							
							<li><a href="contact.jsp"> Contact Us</a></li>
						</ul>
						<div class="clearfix"> </div>
					</div> 
					<div class="logo">
						<h1><a href="index.jsp">E-Competition</a></h1>
					</div>  
					<div class="header-right">   
						<ul><% String stname = (String)session.getAttribute("stname");
                                                        if(session.getAttribute("stname")!=null)
                                                    
                                                    {%>	<li><a>Welcome<%out.println("<h2> "+stname+"!</h2>");%></a></li>
							<li><a class="active" href="logout.jsp">Logout</a></li>
                                                        <% }
                                                            else
                                                            {%>
                                                        <li><a href="signin.jsp">SignIn</a></li>
							<li><a href="signup.jsp">SignUp</a></li>
                                                            <%}%> 
						</ul>
						<div class="clearfix"> </div> 
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!-- //header --> 
		<!-- banner-text -->
		<div class="banner-text"> 
			<div class="container"> 
				<div class="banner-w3lstext">
					<h2>New Question</h2>
				</div> 	 
			</div>
		</div>
		<!-- //banner-text --> 
	</div>
	<!-- //banner -->
     <%
    Connection con = null;
    ArrayList<String> list = new ArrayList();
    ArrayList<Integer> list1= new ArrayList();
    %>
    <%
        try
        {
        String name=(String)session.getAttribute("name");
        //out.println(name);
        }catch(Exception e)
        {
            e.printStackTrace();
        }

    %>  

<br>

<%      
    try
    {
        String qno;
     con = ConnectionProvider.getConnection();
     PreparedStatement pstmt3 = con.prepareStatement("select * from examname");
     ResultSet rset1 = pstmt3.executeQuery();
     while(rset1.next())
     { 
         list.add(rset1.getString(1));
     }  
     %> 
     <div class="about">
		<div class="container"> 
			<div class="login-form">
                               <form action="add.jsp" method="post">
                                   <div class="styled-input">
                                                 &nbsp;&nbsp;&nbsp;&nbsp;<label>Exam Type</label>
						<select name="quid" required="">
						<% Iterator<String> itr = list.iterator();
                                                while(itr.hasNext())
                                                { 
                                                 qno = itr.next();
                                                %>       
                                                 <option value="<%=qno%>"><%=qno%></option>
        
    
       </select> 
       
<%      
     con = ConnectionProvider.getConnection();
     PreparedStatement pstmt4 = con.prepareStatement("select max(qno) from question where quid=?");
     pstmt4.setString(1,qno);
     ResultSet rset2 = pstmt4.executeQuery();
     while(rset2.next())
     { 
         list.add(rset2.getString(2));
     }  
     %> 
     <div class="about">
		<div class="container"> 
			<div class="login-form">
                               <form action="add.jsp" method="post">
                                   <div class="styled-input">
                                                 &nbsp;&nbsp;&nbsp;&nbsp;<label>Q.No.</label>
						<select name="qno" required="">
						<% Iterator<Integer> itr1 = list1.iterator();
                                                while(itr1.hasNext())
                                                { 
                                                 int qno1 = itr1.next();
                                                %>       
                                                 <option value="<%=qno1+1%>"><%=qno1+1%></option>
        
    <%
     }
}
}catch(Exception e)
{
    e.printStackTrace();
}    
        
   %>     
       </select> 
     
       
           <div class="styled-input">
						<textarea rows="3" cols="94" name="ques" placeholder="Question"></textarea>
						<label>Question</label>
						<span></span>
					</div>

       <div class="styled-input">
						<textarea rows="3" cols="94" name="option1" placeholder="Option1"></textarea>
						<label>First Option</label>
						<span></span>
					</div>
 <div class="styled-input">
						<textarea rows="3" cols="94" name="option2" placeholder="Option2"></textarea>
						<label>Second Option</label>
						<span></span>
					</div>
                     <div class="styled-input">
						<textarea rows="3" cols="94" name="option3" placeholder="Option3"></textarea>
						<label>Third Option</label>
						<span></span>
					</div>    
 <div class="styled-input">
						<textarea rows="3" cols="94" name="option4" placeholder="Option4"></textarea>
						<label>Fourth Option</label>
						<span></span>
					</div> 
  <div class="styled-input">
						<textarea rows="3" cols="94" name="ans" placeholder="Answer"></textarea>
						<label>Answer</label>
						<span></span>
					</div>
<input class="button button1" type="submit" value="Save">&nbsp; <a href="admin.jsp"><input class="button button2" type="button" value="<< Back"></a>


</form>
             </div>
	 </div>
      </div>
       <!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-4 footer-grids">
				<h3>Review</h3>
				<p>Registration is required for appearing in any of the exams provided on our website. Once you passed then you are eligible to get admitted in many reputed companies and banks. Placement papers for various companies are provided for exam.</p>
			</div>
			<div class="col-md-3 footer-grids">
				<h3>Contact Us</h3>
				<p>Haldia Institute Of Technology,<br>Purba Medinipur, WB<br>
					<span>Office: 987654321</span>
				</p>
				<div class="footer-bottom">
					<a href="#"><i class="fa fa-facebook"> </i><span>Facebook</span></a>
					<a href="#"><i class="fa fa-twitter"> </i><span>Twitter</span></a>
					<a href="#"><i class="fa fa-google-plus"> </i><span>Google +</span></a>
					<a href="#"><i class="fa fa-dribbble"> </i><span>Dribbble</span></a>
				</div>
			</div>
			<div class="col-md-5 footer-grids">
				<h3>Flickr</h3>
				<a  class="footer-img" href=""><img src="images/i4.jpg" alt=""></a>
				<a class="footer-img" href=""><img src="images/i2.jpg" alt=""></a>
				<a class="footer-img" href=""><img src="images/i3.jpg" alt=""></a>
			</div>
			<div class="clearfix"> </div>
			<div class="footer-copy">
				<p>ï¿½ 2017 E-Competition. All rights reserved | Design by <a href="http://w3layouts.com">CodeIt</a></p>
			</div>
		</div>
	</div>
	<!-- //footer --> 
	<!-- menu js -->
	<script>
		$('.toggle').on('click', function() {
			$('.menu').toggleClass('open');  
			$('.w3nav').toggleClass('show-w3nav');  
			$('.w3nav a').toggleClass('show-w3nav-link');  
			$('.toggle').toggleClass('close');  
		});
	</script>
	<!-- //menu js -->
	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>	
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
			
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
	<!-- //end-smooth-scrolling -->
	<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			*/
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
	<!-- //smooth-scrolling-of-move-up --> 
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
</body>
</html>