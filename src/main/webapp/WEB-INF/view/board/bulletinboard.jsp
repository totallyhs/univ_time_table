<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 
    <link rel="stylesheet" href="/css/bootstrap.css">	
	 -->
</head>
<body>
<div class="container">
  <h2>자유게시판</h2>
  <p>
  ${memberVo.id }<br/>
  </p>
  <h3>테스트중 입니다.</h3>  
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>번호</th>
                    <th style="width:600px;">제목</th>
                    <th style="width:200px">작성자</th>
                    <th style="width:1px;">날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
  		<tbody>
		<c:forEach var="posts" items="${list }">
		
  			<tr>
  				<th>${posts.no }</th>
  				<th><a href="boardview?no=${posts.no }">${posts.subject }</a></th>
  				<th>${posts.writer }</th>
  				<th>2018/8/22</th>
  				<th>11111</th>
  			</tr>
		
		</c:forEach>
  		</tbody>
        </table>
        
        <div>
        <form action="boardwrite">            
            <button class="btn btn-success">글쓰기</button>
        </form>            
        </div>
          <ul class="pager">
   			 <li><a href="#">1</a></li>
    		<li><a href="#">2</a></li>
    		<li><a href="#">3</a></li>
 		 </ul>
</div>

</body>
</html>