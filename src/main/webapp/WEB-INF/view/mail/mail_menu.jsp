<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<a href="#" class="btn btn-danger btn-sm btn-block" role="button">COMPOSE</a>
<hr />
<ul class="nav nav-pills nav-stacked">
	<li class="active"><a href="#"><span class="badge pull-right">42</span>
			Inbox </a></li>
	<li><a href="http://www.jquery2dotnet.com">Starred</a></li>
	<li><a href="http://www.jquery2dotnet.com">Important</a></li>
	<li><a href="http://www.jquery2dotnet.com">Sent Mail</a></li>
	<li><a href="http://www.jquery2dotnet.com"><span
			class="badge pull-right">3</span>Drafts</a></li>
</ul>
