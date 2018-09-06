<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="navbar-collapse-2">
  <ul class="nav navbar-nav navbar-right">
    <li><a href="${pageContext.servletContext.contextPath }/index">home</a></li>
    <c:if test="${sessionScope.memberVo.id eq 'admin' }">
    	<li><a href="${pageContext.servletContext.contextPath }/admin/dashboard">관리자</a></li>
    </c:if>
    <li><a href="/timetable/search">시간표 만들기</a></li>
    <li><a href="${pageContext.servletContext.contextPath }/bulletinboard?no=10">자유게시판</a></li>
    <li><a href="${pageContext.servletContext.contextPath }/circleboard?no=40">동아리게시판</a></li>
    <li><a href="${pageContext.servletContext.contextPath }/courses/subject/list">과목</a></li> 	
    <li>
    	<a href="${pageContext.servletContext.contextPath }/mail/inbox">
    		쪽지
    		<span id="mailAlarm"></span>
    	</a>
    </li>
    <li>
    <c:choose>
      <c:when test="${sessionScope.memberVo eq null }">
        <a class="btn btn-default btn-outline btn-circle collapsed"  data-toggle="collapse" href="#nav-collapse2" aria-expanded="false" aria-controls="nav-collapse2">Sign in</a>
      </c:when>
      <c:otherwise>
        <a class="btn btn-default btn-outline btn-circle collapsed"  data-toggle="collapse" href="#nav-collapse2" aria-expanded="false" aria-controls="nav-collapse2">Profile <i class=""></i> </a>
      </c:otherwise>
    </c:choose>
    </li>
  </ul>
         
  <c:choose>
    <c:when test="${sessionScope.memberVo eq null }">
       <div class="collapse nav navbar-nav nav-collapse slide-down" id="nav-collapse2">
         <form class="navbar-form navbar-right form-inline" role="form" action="/login/login" method="post" autocomplete="off">
           <div class="form-group">
             <label class="sr-only" for="Email">Id</label>
             <input type="text" class="form-control" id="id" name="id" placeholder="User Id" autofocus required />
           </div>
           <div class="form-group">
             <label class="sr-only" for="Password">Password</label>
             <input type="password" class="form-control" id="pass" name="pass" placeholder="Password" required />
           </div>
           <button type="submit" class="btn btn-success">Sign in</button>
           <a href="/join"><button type="button" class="btn btn-link">Sign up</button></a>
         </form>
       </div>
     </c:when>
     <c:otherwise>
       <ul class="collapse nav navbar-nav nav-collapse slide-down" role="search" id="nav-collapse2">
             <li><a href="/login/logout">Logout</a></li>
             <li><a href="/memberinfo">My profile</a></li>
             <li><a href="/editview?id=">Settings</a></li>
      </ul>
    </c:otherwise>          
  </c:choose>
            
</div><!-- /.navbar-collapse -->
         
         
            	
            	
          
          
            