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
	<!-- timetable -->
	<link href="/css/timetable.css" rel="stylesheet" type="text/css"/>
	<!-- navbar -->
	<link href="/css/navbar.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="navb">
		<tiles:insertAttribute name="navbar"/>	
	</div>
	
	<div class="container" id="timetable" style="margin: 0px;">
	<c:choose>
		<c:when test="${content eq 'search' }">
			<tiles:insertAttribute name="searchtimetableUI"/>
		</c:when>
		<c:when test="${content eq 'culture.combined' }">
			<tiles:insertAttribute name="afterCultureCombinedUI"/>
		</c:when>	
	</c:choose>
	</div>
</body>
</html>