<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>너의 계획표가 필요해: 회원가입</title>
<!-- 최신 JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form role="form" action="joinadd" method="post">
				<div class="form-group">
					<label for="inputId">아이디</label> <input type="text"
						class="form-control" id="inputId" name="id"
						placeholder="아이디를 입력해 주세요" required="">
				</div>
				<samp id="IdCheck" style="color: blue;"></samp>
				<div class="form-group">
					<label for="pass">비밀번호</label> <input type="password"
						class="form-control" id="pass" name="pass"
						placeholder="비밀번호를 입력해주세요" required="">
				</div>
				<span id="pattensMsg" style="color: red;"></span>
				<div class="form-group">
					<label for="passCheck">비밀번호 확인</label> <input type="password"
						class="form-control" id="passCheck"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required="">
				</div>
				<span id="passmsg" style="color: red;"></span>
				<div class="form-group">
					<label for="InputName">이름</label> <input type="text"
						class="form-control" id="InputName" name="name"
						placeholder="이름을 입력해 주세요" required="">
				</div>
				<div class="form-group">
					<label for="InputNickName">닉네임</label> <input type="text"
						class="form-control" id="InputNickName" name="nickname"
						placeholder="닉네임을 입력해 주세요" required="">
				</div>
				<span id="nickmsg"></span>
				<div class="form-group">
					<label for="input">학과</label> <select name="department">
						<option>선택하세요</option>
						<c:forEach var="dt" items="${department }">
							<option value="${dt.name }">${dt.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group text-center">
					<button type="submit" id="joinbt" class="btn btn-primary">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="submit" class="btn btn-warning">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</article>

	<script>
		// ID중복체크 스크립트
		$("#inputId").on("change", function() {
			$.ajax({
				url : "/joinIdCheck", // 중복체크할 경로
				type : "POST",
				data : {
					id : $(this).val()
				},
				success : function(data) {
					console.log(data); //데이터 확인용
					// 데이터에 널값이 들어오면 아이디 사용가능 가입버튼 활성화
					// 아니면 아이디 사용 불가능 가입버튼 비활성화
					var sid = document.getElementById("IdCheck");
					var button = document.getElementById("joinbt");
					if (data == null) {
						sid.style.color = "blue";
						sid.innerHTML = "사용 가능";
						button.disabled = false;
					} else {
						sid.style.color = "red";
						sid.innerHTML = "사용 불가능";
						button.disabled = true;
					}
				}
			})
		});
		$("#InputNickName").on("change", function() {
			$.ajax({
				url : "/joinNickCheck", // 중복체크할 페이지
				type : "POST",
				data : {
					nickname : $(this).val()
				},
				success : function(data) {
					console.log(data);
					// 데이터에 널값이 들어오면 닉네임 사용가능 가입버튼 활성화
					// 아니면 닉네임 사용 불가능 가입버튼 비활성화
					var nickName = document.getElementById("nickmsg");
					var button = document.getElementById("joinbt");
					if (data == null) {
						nickName.style.color = "blue";
						nickName.innerHTML = "사용가능";
						button.disabled = false;
					} else {
						nickName.style.color = "red";
						nickName.innerHTML = "사용불가능";
						button.disabled = true;
					}
				}
			})
		});

		// 패스워드 패턴 체크
		$("#pass").on("change", function() {
			var pattensMsg = document.getElementById("pattensMsg");
			var button = document.getElementById("joinbt");
			var pattern = /^([a-zA-Z0-9])(?=.*\d\S)(?=.*[a-zA-Z]).{7,16}/
			
			if (!pattern.test(pass)) {
				pattensMsg.innerHTML = "비밀번호는 영문, 숫자 조합으로 8~16자리를 사용해야 합니다.";
				button.disabled = true;
			}else {
				pattensMsg.innerHTML = "";
				button.disabled = false;
			}
			
		});
		// 비번과 비번 확인 같은지 체크
		$("#passCheck").on("change", function() {
			var pass = $("#pass").val();
			var passCheck = $("#passCheck").val();
			var passmsg = document.getElementById("passmsg");
			var button = document.getElementById("joinbt");
			if (pass != passCheck) {
				passmsg.innerHTML ="비밀번호를 다시 확인 해주세요.";
				button.disabled = true;
			} else {
				passmsg.innerHTML = "";
				button.disabled = false;
			}
		});
	</script>
</body>
</html>