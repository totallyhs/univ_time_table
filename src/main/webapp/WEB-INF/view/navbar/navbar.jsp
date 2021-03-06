<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${sessionScope.memberVo != null }">
	<script>
		var ws = new WebSocket("ws://${pageContext.request.localAddr}/ws/conn.do");
		console.log("websocket connected");
	</script>
	<script src="/js/websocket.js"></script>
</c:if>

<nav class="navbar navbar-inverse fixed-top">
  <div class="container">
      <jsp:include page="${pageContext.servletContext.contextPath }/WEB-INF/view/navbar/navbar_mobile_display.jsp"/>
      
      <jsp:include page="${pageContext.servletContext.contextPath }/WEB-INF/view/navbar/navbar_categories.jsp"/>
      
  </div> <!-- container -->
    
</nav> <!-- nav -->