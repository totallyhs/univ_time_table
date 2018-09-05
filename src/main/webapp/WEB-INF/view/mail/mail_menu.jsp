<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- https://bootsnipp.com/snippets/ORaE8 -->
<!-- https://bootsnipp.com/snippets/featured/gmail-inbox -->

<div class="btn-group">
	<button type="button" class="btn btn-primary dropdown-toggle"
		data-toggle="dropdown">
		Mail <span class="caret"></span>
	</button>
	<ul class="dropdown-menu" role="menu">
		<li><a href="#">Mail</a></li>
		<li><a href="#">Contacts</a></li>
		<li><a href="#">Tasks</a></li>
	</ul>
</div>
<hr />
<a href="/mail/compose" class="btn btn-danger btn-sm btn-block" role="button">쪽지보내기</a>
<hr />
<ul class="nav nav-pills nav-stacked">
	<li class="active">
		<a href="/mail/inbox"><span class="badge pull-right">${mailCount }</span>쪽지함 </a>
	</li>
	
</ul>




