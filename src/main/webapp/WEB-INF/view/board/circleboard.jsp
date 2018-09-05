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
  <h2>동아리 게시판</h2>
  <p>
  사용자 ID : ${memberVo.id }<br/>
  </p>
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
  		
		<c:forEach var="postlist" items="${postlist }">
		
  			<tr>
  				<th>${postlist.no }</th>
  				<th><a href="circleboardview?no=${postlist.no }">${postlist.subject } [${postlist.count }]</a></th>
  				<th>${postlist.writer }</th>
  				<th><fmt:formatDate value="${postlist.writtenDate }" pattern="yyyy-MM-dd [HH:MM]"/></th>
  				<th>${postlist.hit }</th>
  			</tr>
		</c:forEach>
  		</tbody>
        </table>
        
        <div>
        <form action="circleboardwrite">            
            <button class="btn btn-success">글쓰기</button>
        </form>
        </div>
          <ul class="pagination">
        <c:if test="${page-2 gt 1 }">
 		 <li><a href="circleboard?no=${no }&page=1">1</a></li>
 		 <li><a>.....</a></li>
 		 </c:if>
        <c:forEach var="p" begin="${pagebegin }" end="${pageend }" step="1">
        	<c:choose>
        	<c:when test="${p eq page }">
   			 <li class="active"><a href="circleboard?no=${no }&page=${p }">${p }</a></li>
   			 </c:when>
   			 <c:otherwise>
   			 <li><a href="circleboard?no=${no }&page=${p }">${p }</a></li>
 		 	</c:otherwise>
 		 	</c:choose>
 		 </c:forEach>
 		 <c:if test="${page+2 lt totalpage }">
 		 <li><a>.....</a></li>
 		 <li><a href="circleboard?no=${no }&page=${totalpage }">${totalpage }</a></li>
 		 </c:if>
 		 </ul>
</div>
</body>
</html>