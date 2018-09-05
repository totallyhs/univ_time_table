<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<title></title>
</head>
<body>
	<div class="container" style="padding-top: 60px;">
  <h1 class="page-header">회원정보 수정</h1>
      </div>
      <form action="edit" class="form-horizontal" method="post">
        <div class="form-group">
          <label class="col-lg-3 control-label">ID:</label>
          <div class="col-lg-8">
            <input class="form-control" value="${memberinfo.id }" type="text" readonly="readonly">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">이름:</label>
          <div class="col-lg-8">
            <input class="form-control" value="${memberinfo.name }" type="text" readonly="readonly">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">NickName:</label>
          <div class="col-md-8">
            <input class="form-control" name="nickname" type="text" placeholder="사용할 닉네임을 입력 해주세요"
            required="required">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Password:</label>
          <div class="col-md-8">
            <input class="form-control" id="pass" name="pass" type="password" placeholder="비밀번호를 입력 해주세요"
            required="required">
            <span id="pattensMsg" style="color: red;"></span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Confirm password:</label>
          <div class="col-md-8">
            <input class="form-control" id="passCheck" type="password" placeholder="비밀번호를 입력 해주세요"
            required="required">
          <span id="passmsg" style="color: red;"></span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Email:</label>
          <div class="col-lg-8">
            <input class="form-control" id="emailtext" name="email" type="text" placeholder="이메일을 입력 해주세요"
            required="required">
            <span id="emailcheck" style="color: red;"></span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">학과:</label>
          <div class="col-lg-8">
            <div class="ui-select">
              <select name="department" class="form-control" required="required">
             	<option value="">학과를 선택해주세요</option>
             		<c:forEach var="dt" items="${department }">
						<option value="${dt.name }" >${dt.name }</option>
					</c:forEach>
              </select>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-md-8">
            <input class="btn btn-primary" id="button" value="수정" type="submit">
            <span></span>
            <input class="btn btn-default" id="resetbt" value="취소" type="reset">
          </div>
        </div>
        <input type="hidden" name="no" value="${memberinfo.no }">
      </form>
</body>
<script>
$("#pass").on("change", function() {
	var pass = $("#pass").val();
	var pattensMsg = document.getElementById("pattensMsg");
	var button = document.getElementById("button");
	var pattern = /^([a-zA-Z0-9])(?=.*\d\S)(?=.*[a-zA-Z]).{7,16}/
	
	if (!pattern.test(pass)) {
		pattensMsg.innerHTML = "8~16자 영문 대 소문자, 숫자를 포함해서 사용하세요.";
		button.disabled = true;
	}else {
		pattensMsg.innerHTML = "";
		
		if(button.disabled){
			button.disabled=true;
		}else{
			button.disabled=false;
		}
	}
});
// 비번과 비번 확인 같은지 체크
$("#passCheck").on("change", function() {
	var pass = $("#pass").val();
	var passCheck = $("#passCheck").val();
	var passmsg = document.getElementById("passmsg");
	var button = document.getElementById("button");
	
	if (pass != passCheck) {
		passmsg.innerHTML ="비밀번호를 다시 확인 해주세요.";
		button.disabled = true;
	} else {
		passmsg.innerHTML = "";
		if(button.disabled){
			button.disabled=true;
		}else{
			button.disabled=false;
		}
	}
});

// 이메일 정규식 스크립트
$("#emailtext").on("change", function() {
	var emailtext = $("#emailtext").val();
	var emailcheck = document.getElementById("emailcheck");
	var emailpattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var button = document.getElementById("button");
	if (!emailpattern.test(emailtext)) {
		emailcheck.innerHTML="이메일 형식이 맞지 않습니다.";
		button.disabled = true;
	}else {
		emailcheck.innerHTML = "";
		if(button.disabled){
			button.disabled=true;
		}else{
			button.disabled=false;
		}
	}
});

//가입취소 눌렀을때 뒤로가기
$("#resetbt").on("click", function(){
	window.history.back();
});

</script>
</html>
