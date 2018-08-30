<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
<title>${title }</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- jQuery && Bootstrap -->
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="/js/mail_compose.js"></script>
	
	<!-- navbar -->
	<link href="/css/navbar.css" rel="stylesheet" type="text/css"/>
	
	<!-- inbox -->
	<link href="/css/inbox.css" rel="stylesheet" type="text/css"/>
	
	<!-- compose
	<link href="/css/mail_compose.css" rel="stylesheet" type="text/css"/> -->
	
	<!-- fileupload -->
	<link href="/css/mail-fileupload.css" rel="stylesheet" type="text/css"/>
	<script src="/js/mail-fileupload.js"></script>

</head>
<body style="margin-top: 0px;">
<div class="container-fluid">
	<tiles:insertAttribute name="nav"/>
</div>
	
	<div class="container">
	<div class="row">
        <div class="col-sm-3 col-md-2">
       	  <tiles:insertAttribute name="mail_menu"/>
       	 </div>
		<!-- inbox or compose or view-->
		<div class="col-sm-9 col-md-10">
		<c:choose>
			<c:when test="${fn:endsWith(requestScope.uri, 'inbox') }">
				<tiles:insertAttribute name="inboxUI"/>
			</c:when>
			<c:when test="${fn:endsWith(requestScope.uri, 'compose') }">
				<tiles:insertAttribute name="compose"/>
			</c:when>	
			<c:when test="${fn:endsWith(requestScope.uri, 'view') }">
				<tiles:insertAttribute name="view"/>
			</c:when>
		</c:choose>
		</div>
      </div>
	</div>

</body>
</html>