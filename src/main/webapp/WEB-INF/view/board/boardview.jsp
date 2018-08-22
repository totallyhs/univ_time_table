<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
</html>


<c:choose>
	<c:when test="${sessionScope.memberVo eq null }">
		<h2>로그인을 부탁드립니다.</h2>
	</c:when>
	<c:otherwise>
		<div class="container">
  	<h2>${PostVo.writer }</h2>
  	<p>${PostVo.subject }</p>
 		 <div class="panel panel-default">
   		 		<div class="panel-body" style="height:500px;">
					${PostVo.content }
				</div>
 			</div>
 			
 			${PostVo.writtenDate }
		</div>
		
	</c:otherwise>
</c:choose>