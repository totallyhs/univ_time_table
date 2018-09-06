<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- inbox -->

        <div class="col-sm-9 col-md-10">
            <!-- Split button -->
            <div class="btn-group">
            </div>
            <a href="/mail/inbox"><button type="button"  data-toggle="tooltip" title="Refresh">
                   <span class="glyphicon glyphicon-refresh"></span></button></a>
            <!-- Single button -->
            <div class="btn-group">
            </div>
        </div>
    <hr />
    <div class="row">
        <div class="col-sm-9 col-md-10">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#home" data-toggle="tab"><span class="glyphicon glyphicon-inbox">
                </span>쪽지</a></li>
  
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div class="list-group">
                    	<c:forEach items="${mailList }" var="m">
	                        <a href="/mail/view?no=${m.NO }" class="list-group-item">
    	                        <div class="checkbox">
       	                         <label>
       	                             <input type="checkbox">
       	                         </label>
        	                    </div>
           	                 <span class="glyphicon glyphicon-star-empty"></span>
           	                 <span class="name" style="min-width: 120px; display: inline-block;">
           	                 	<c:out value="${m.SENDER }" escapeXml="true"/>
           	                 </span> 
            	             <span class="">
           	                 	<c:out value="${m.TITLE }" escapeXml="true"/>
               	             </span>
               	             <span class="text-muted" style="font-size: 11px;">
               	             	<c:out value="${fn:substring(m.CONTENT, 0, 30) }" escapeXml="true"/>
               	             </span> 
                	         <span class="badge">
                	         	<c:choose>
                	         		<c:when test="${today.time - m.SENTDATE.time < (1000*60*60*24) }">
		                	         	<fmt:formatDate value="${m.SENTDATE }" pattern="hh:mm"/>
                	         		</c:when>
                	         		<c:otherwise>
                	         			<fmt:formatDate value="${m.SENTDATE }" type="date"/>
                	         		</c:otherwise>
                	         	</c:choose>
                	         </span>
                	         <c:if test="${m.C > 0  }">
	                   	         <span class="pull-right"><span class="glyphicon glyphicon-paperclip"></span></span>            	         
                	         </c:if> 
                	         </a>
                    		
                    	</c:forEach>
                    
        
                    </div>
                </div>
                <div class="tab-pane fade in" id="profile">
                    <div class="list-group">
                        <div class="list-group-item">
                            <span class="text-center">This tab is empty.</span>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="messages">
                    ...</div>
                <div class="tab-pane fade in" id="settings">
                    This tab is empty.</div>
            </div>
        </div>
    </div>
