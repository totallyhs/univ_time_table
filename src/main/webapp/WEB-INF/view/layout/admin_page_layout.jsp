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
	
	<!-- admin -->
	<link href="/css/admin.css" rel="stylesheet" type="text/css"/>
	
	<!-- classes adding -->
	<c:if test="${content eq 'classes' }">
	<link href="/css/admin-classes-adding.css" rel="stylesheet" type="text/css"/>
	</c:if>
	<c:if test="${content eq 'subjects' }">
	<link href="/css/admin-classes-adding.css" rel="stylesheet" type="text/css"/>
	</c:if>

</head>
<body style="min-height: 500px; background: rgba(48, 46, 45, 1);">

	<div id="navb">
		<tiles:insertAttribute name="navbar"/>	
	</div>
	<tiles:insertAttribute name="admin_header"/>
	<div class="container">
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<tiles:insertAttribute name="admin_left_menu"/>
					</div>
					<div class="col-md-9">
						<c:choose>
							<c:when test="${content eq 'dashboard' }">
								<tiles:insertAttribute name="dashboard"/>
							</c:when>
							<c:when test="${content eq 'subjects' }">
								<tiles:insertAttribute name="subjects_adding"/>
							</c:when>
							<c:when test="${content eq 'classes' }">
								<tiles:insertAttribute name="classes_adding"/>
							</c:when>
						</c:choose>
					
					</div>
				</div>
			</div>
		</section>
	</div>
					
	
	
	

</body>
</html>