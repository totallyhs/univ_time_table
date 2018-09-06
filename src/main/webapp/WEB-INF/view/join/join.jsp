<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<article class="container">
		<div class="col-sm-6 col-md-offset-3">
			<form role="form" action="joinadd" method="post">
				<div class="form-group">
					<label for="inputId">아이디</label> <input type="text"
						class="form-control" id="inputId" name="id"
						placeholder="아이디를 입력해 주세요" required>
				</div>
				<samp id="IdCheck" style="color: blue;"></samp>
				<div class="form-group">
					<label for="pass">비밀번호</label> <input type="password"
						class="form-control" id="pass" class= "passch" name="pass"
						placeholder="비밀번호를 입력해주세요" required>
				</div>
				<span id="pattensMsg" style="color: red;"></span>
				<div class="form-group">
					<label for="passCheck">비밀번호 확인</label> <input type="password"
						class="form-control" id="passCheck" class= "passch"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required>
				</div>
				<span id="passmsg" style="color: red;"></span>
				<div class="form-group">
					<label for="InputName">이름</label> <input type="text"
						class="form-control" id="InputName" name="name"
						placeholder="이름을 입력해 주세요" required>
				</div>
				<div class="form-group">
					<label for="InputNickName">닉네임</label> <input type="text"
						class="form-control" id="InputNickName" name="nickname"
						placeholder="닉네임을 입력해 주세요" required>
				</div>
				<span id="nickmsg"></span>
				<div class="form-group">
					<label for="input">학과</label> <select required name="department" class="form-control">
						<option value="">선택하세요</option>
						<c:forEach var="dt" items="${department }">
							<option value="${dt.name }" >${dt.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group text-center">
					<button type="submit" id="joinbt" class="btn btn-primary">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button" id="cancelBtn" class="btn btn-primary">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</article>

	<script>
	var idcheck = false;
	var passcheck1 = false;
	var passcheck2 = false;
	var nickcheck = false;
	var button = document.getElementById("joinbt");
	function check(){
		if(idcheck==true&&passcheck1==true&&passcheck2==true&&nickcheck==true){
			button.disabled=false;
		}
	};
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
					var sidval = document.getElementById("inputId").value;
					if (data == 0&&sidval.length > 3) {
						sid.style.color = "blue";
						sid.innerHTML = "사용가능한 멋진 아이디 입니다!";
						idcheck=true;
						check();
					} else {
						if(sidval.length > 3){
							idcheck=false;	
						sid.style.color = "red";
						sid.innerHTML = "중복된 아이디가 존재 합니다.";
						button.disabled=true;
						}else{
							idcheck=false;
							sid.style.color = "red";
							sid.innerHTML = "ID는 4글자 이상으로 입력해주세요.";
							button.disabled=true;
						}
						
					}
					
				}
			})
		});
		
		
		
		$("#InputNickName").on("change", function() {
			$.ajax({
				url : "/joinNickCheck", // 중복체크할 경로
				type : "POST",
				data : {
					nickname : $(this).val()
				},
				success : function(data) {
					console.log(data); //데이터 확인용
					// 데이터에 널값이 들어오면 닉네임 사용가능 가입버튼 활성화
					// 아니면 닉네임 사용 불가능 가입버튼 비활성화
					var nickName = document.getElementById("nickmsg");
					if (data == 0) {
						nickName.style.color = "blue";
						nickName.innerHTML = "사용 가능한 멋진 닉네임 입니다.";
						nickcheck=true;
						check();
					} else {
						nickName.style.color = "red";
						nickName.innerHTML = "중복된 닉네임이 존재 합니다.";
						button.disabled=true;
						nickcheck=false;
					}
				}
			})
		});

		// 패스워드 패턴 체크
		$("#pass").on("change", function() {
			var pass = $("#pass").val();
			var pattensMsg = document.getElementById("pattensMsg");
			var pattern = /^([a-zA-Z0-9])(?=.*\d\S)(?=.*[a-zA-Z]).{7,16}/
			
			if (!pattern.test(pass)) {
				pattensMsg.innerHTML = "8~16자 영문 대 소문자, 숫자를 포함해서 사용하세요.";
				button.disabled=true;
				passcheck1=false;
			}else {
				pattensMsg.innerHTML = "";
				passcheck1=true;
				check();
			}
		});
		// 비번과 비번 확인 같은지 체크
		$("#passCheck").on("change", function() {
			var pass = $("#pass").val();
			var passCheck = $("#passCheck").val();
			var passmsg = document.getElementById("passmsg");
			
			if (pass != passCheck) {
				passmsg.innerHTML ="비밀번호를 다시 확인 해주세요.";
				passcheck2=false;
				button.disabled=true;
			} else {
				passmsg.innerHTML = "";
				passcheck2=true;
				check();
			}
		});
		
		// 가입취소 눌렀을때 뒤로가기
		$("#cancelBtn").on("click", function(){
			location.href="/index";
		});
		
	</script>
