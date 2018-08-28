<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>


<c:choose>
	<c:when test="${sessionScope.memberVo eq null }">
		<h2>로그인을 부탁드립니다.</h2>
	</c:when>
	<c:otherwise>
			<form action="/boardwrite" method="post" 
			enctype="multipart/form-data" autocomplete="off">
		<div class="container">
			<h2>${board }</h2>
			<div class="form-group">
			<input type="hidden" name="boardNo" value="${boardNo }">
				<label for="subject">제목</label> <input type="text"
					class="form-control" id="subject" maxlength="50" name="subject"
					placeholder="제목을 입력하세요.">
			</div>			
			
			<div class="form-group">
				<label for="content">내용</label>
				  <textarea class="form-control" id="content" name="content" rows="20"
					onkeyup="fnChkByte(this, '2000')" required="required"></textarea>
				<span id="byteInfo">0</span>/2000Byte
			</div>

			<button type="submit" class="btn btn-primary">작성</button>
			</div><br/>
			
			<!-- 파일 -->
			<b>첨부파일</b> 
			<input type="file" name="fileupload" multiple style="width: 430px;"/>
			
			
			
			</form>
			

	</c:otherwise>
</c:choose>

<script>
function fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
	one_char = str.charAt(i);
	if(escape(one_char).length > 4){
	    rbyte += 2;                                         //한글2Byte
	}else{
	    rbyte++;                                            //영문 등 나머지 1Byte
	}

	if(rbyte <= maxByte){
	    rlen = i+1;                                          //return할 문자열 갯수
		}
	}

	if(rbyte > maxByte){
	    alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	    str2 = str.substr(0,rlen);                                  //문자열 자르기
	    obj.value = str2;
	    fnChkByte(obj, maxByte);
	}else{
	    document.getElementById('byteInfo').innerText = rbyte;
		}
	}

</script>