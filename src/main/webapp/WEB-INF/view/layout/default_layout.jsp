<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<title>${title }</title>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- jQuery && Bootstrap -->
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	
	<!-- navbar -->
	<link href="/css/navbar.css" rel="stylesheet" type="text/css"/>
	
	<!-- login -->
	<link href="/css/login.css" rel="stylesheet" type="text/css"/>
	
	<!-- timetable -->
	<link href="/css/timetable.css" rel="stylesheet" type="text/css"/>
	
	<style>
		#navb {
		position: absolute;
		width: 100%;
		z-index: 3000;
}
	</style>

</head>
<body style="min-height: 500px;">

	<div id="navb">
		<tiles:insertAttribute name="navbar"/>	
	</div>
	<div class="container">
		<tiles:insertAttribute name="indexUI"/>
		<c:if test="${sessionScope.memberVo eq null }">
			<tiles:insertAttribute name="loginUI"/>
		</c:if>
	</div>
	
	
	<!-- https://bootsnipp.com/snippets/56A0W 
	<div id="particles-js"></div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
	<script src="/js/loginAnimation.js"></script>
	-->
	

</body>
</html>