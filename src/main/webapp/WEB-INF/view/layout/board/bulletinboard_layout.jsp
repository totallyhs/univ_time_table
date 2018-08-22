<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
<title>${title }</title>

  <!-- jQuery && Bootstrap -->
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	
	<!-- navbar -->
	<link href="/css/navbar.css" rel="stylesheet" type="text/css"/>
	
	<!-- inbox -->
	<link href="/css/inbox.css" rel="stylesheet" type="text/css"/>

</head>
<body>
	<c:choose>
		<c:when test="${logged }">
			<tiles:insertAttribute name="navprofile"/>
		</c:when>
		<c:otherwise>
			<tiles:insertAttribute name="navlogin"/>
		</c:otherwise>
	
	</c:choose>	
	
	<div class="container" id="bulletinboard">
		<tiles:insertAttribute name="bulletinboardUI"/>
	</div>
	

</body>
</html>