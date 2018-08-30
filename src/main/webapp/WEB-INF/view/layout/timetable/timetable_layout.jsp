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
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<!-- timetable -->
	<link href="/css/timetable.css" rel="stylesheet" type="text/css"/>
	<!-- navbar -->
	<link href="/css/navbar.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="navb">
		<tiles:insertAttribute name="navbar"/>	
	</div>
	
	<c:choose>
	<c:when test="${content eq 'result' }">
	<div class="container" id="timetable">
		<tiles:insertAttribute name="resulttimetableUI"/>
	</div>
	</c:when>
	<c:when test="${content eq 'search' }">
	<div class="container" id="timetable">
		<tiles:insertAttribute name="searchtimetableUI"/>
	</div>
	</c:when>
	

	</c:choose>
</body>
</html>