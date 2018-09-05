<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
</html>


<c:choose>
	<c:when test="${sessionScope.memberVo eq null }">
		<h2>로그인을 부탁드립니다.</h2>
	</c:when>
	<c:otherwise>
		<div class="container">
			<c:if test="${sessionScope.memberVo.nickname eq  PostVo.writer}">
 			<a href="/circlepostdelete?no=${boardno }&postno=${PostVo.no}"><button type="submit" class="[ btn btn-success ]">개시글 삭제</button></a><br/><br/>
 			<a href="/circlerewrite?boardno=${boardno }&postno=${PostVo.no}"><button type="submit" class="[ btn btn-success ]">개시글 수정</button></a>
 			</c:if>
	<h2>게시글 No : ${PostVo.no }</h2>
  	<h2>작성자 ID : ${PostVo.writer }</h2> <br/>
  	작성일 : <fmt:formatDate value="${PostVo.writtenDate }" pattern="yyyy-MM-dd"/>
  	<h2>제목  </h2> <h4>${PostVo.subject }</h4>
 		 <div class="panel panel-default">
   		 		<div class="panel-body" style="height:500px;">
					${PostVo.content }
				</div>
 			</div>
		</div> 
		<br/>
		
		<c:forEach var="file" items="${flist }">
			<a href="${file.filePath }" download>${file.fileName }</a><br/>
		</c:forEach>
		<br/>
		


<button>
<span onclick="like();" id="like" class="glyphicon btn-glyphicon glyphicon-thumbs-up img-circle text-primary">
${postlike }
</span>
</button><br/>

<script>
	function like(){
				var xhr = new XMLHttpRequest();
			 	 xhr.open("get", "/postlike?no=${PostVo.no}&id=${sessionScope.memberVo.id}",true);
				xhr.onreadystatechange =function() {
					if(xhr.readyState==4) {
						var result = JSON.parse(xhr.responseText);
						if(result.result){
							$("#like").html(result.cnt);
						}else{
							$("#like").html(result.cnt);
						}
						
					}
				}
				xhr.send();  
	}
</script>
			
		
		
		
		
		
		
		
	
	<form action="/circleboardview" method="post">
	<div class="container">
    <div class="row">       
        <div class="panel panel-default widget">
        	
            <div class="panel-heading">
                <span class="glyphicon glyphicon-comment"></span>
                <h3 class="panel-title">Reply</h3>
            
                    
            </div>
            <c:forEach var="reply" items="${replylist }">
            <c:if test="${reply.published eq 'y' }">
            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-xs-2 col-md-1">
                                <img src="http://placehold.it/80" class="img-circle img-responsive" alt="" /></div>
                            <div class="col-xs-10 col-md-11">
                                <div>${reply.commentator }
                                    <div class="mic-info">
                        <fmt:formatDate value="${reply.writtenDate }" pattern="yyyy-MM-dd [HH:MM]"/>
                                    </div>
                                </div>
                                <div class="comment-text"> ${reply.content }
                                </div>
                                
                                <c:if test="${sessionScope.memberVo.nickname eq reply.commentator }">
                                	<a href="/circlereplydelete?no=${reply.no }&postno=${reply.postNo}">삭제</a>
                                </c:if>
                            </div>
                        </div>
                    </li>         
                </ul>
            </div>
            </c:if>
            </c:forEach>
            <div class="col">
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
    <textarea class="form-control" name="content" rows="3" placeholder="댓글을 입력해주세요." onkeyup="fnReplyByte(this,'1000')" required="댓글을 입력해주세요."></textarea>
 		<span id="byteInfo">0</span>/1000Byte <br/><br/>

                                </div>
                                
                            <input type="hidden" name="postno" value="${PostVo.no }">
                        <button type="submit" class="[ btn btn-success ]" data-loading-text="Loading...">댓글작성</button>
                            </fieldset>
                        </form>
                    </div>
                        </div>
                </div>
</div>
        </div>
</form>	
<a href="circleboard?no=${boardno }"><button type="submit" class="[ btn btn-success ]">목록으로</button></a>



	<script>
function fnReplyByte(obj, maxByte){
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
	</c:otherwise>
</c:choose>