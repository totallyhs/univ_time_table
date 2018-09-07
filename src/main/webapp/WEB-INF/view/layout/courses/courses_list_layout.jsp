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
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

	<!-- navbar -->
	<link href="/css/navbar.css" rel="stylesheet" type="text/css"/>
	
	<!-- list css and js -->
	<link href="/css/subjects-classes-list.css" rel="stylesheet" type="text/css"/>
	<script src="/js/subjects-classes-list.js"></script>

</head>
<body style="min-height: 500px;">

	<div id="navb">
		<tiles:insertAttribute name="navbar"/>	
	</div>
	<div class="container">
		<c:choose>
			<c:when test="${content eq 'subjects' }">
				<tiles:insertAttribute name="subjects_list"/>
			</c:when>
			<c:when test="${content eq 'classes' }">
				<tiles:insertAttribute name="classes_list"/>
			</c:when>
		</c:choose>
	
	</div>

</body>
</html>