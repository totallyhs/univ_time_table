<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="navbar-collapse-2">
  <ul class="nav navbar-nav navbar-right">
    <li><a href="index">home</a></li>
    <li><a href="bulletinboard?no=10">자유게시판</a></li>
    <li><a href="#">Services</a></li>
    <li><a href="#">Works</a></li>
    <li><a href="#">News</a></li>
    <li><a href="#">Contact</a></li>
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
         <form class="navbar-form navbar-right form-inline" role="form">
           <div class="form-group">
             <label class="sr-only" for="Email">Email</label>
             <input type="email" class="form-control" id="Email" placeholder="Email" autofocus required />
           </div>
           <div class="form-group">
             <label class="sr-only" for="Password">Password</label>
             <input type="password" class="form-control" id="Password" placeholder="Password" required />
           </div>
           <button type="submit" class="btn btn-success">Sign in</button>
         </form>
       </div>
     </c:when>
     <c:otherwise>
       <ul class="collapse nav navbar-nav nav-collapse slide-down" role="search" id="nav-collapse2">
         <li><a href="#">Support</a></li>
         <li class="dropdown">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><img class="img-circle" src="https://pbs.twimg.com/profile_images/588909533428322304/Gxuyp46N.jpg" alt="maridlcrmn" width="20" /> Maridlcrmn <span class="caret"></span></a>
           <ul class="dropdown-menu" role="menu">
             <li><a href="#">My profile</a></li>
             <li><a href="#">Favorite</a></li>
             <li><a href="#">Settings</a></li>
             <li class="divider"></li>
             <li><a href="#">Logout</a></li>
           </ul>
        </li>
      </ul>
    </c:otherwise>          
  </c:choose>
            
</div><!-- /.navbar-collapse -->
         
         
            	
            	
          
          
            