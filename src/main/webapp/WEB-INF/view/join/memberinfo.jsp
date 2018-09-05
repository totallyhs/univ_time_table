<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>
<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>회원 정보</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ID">ID</label>  
  <div class="col-md-4">
  <input id="ID" type="text" value="${info.id }" class="form-control input-md" disabled>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="name">name</label>  
  <div class="col-md-4">
  <input id="name" type="text" value="${info.name }" class="form-control input-md" disabled>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="NickName">NickName</label>  
  <div class="col-md-4">
  <input id="NickName" type="text" value="${info.nickname }" class="form-control input-md" disabled>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="department">학과</label>  
  <div class="col-md-4">
  <input id="department" type="text" value="${info.department }" class="form-control input-md" disabled>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Emali">Emali</label>  
  <div class="col-md-4">
  <input id="Emali" type="text" value="${info.email }" class="form-control input-md" disabled>
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="button"></label>
  <div class="col-md-4">
    <input class="btn btn-primary" id="button" value="수정" type="submit">
  </div>
</div>

</fieldset>
</form>
</body>
</html>