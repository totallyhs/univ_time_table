<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- view mail -->

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<div class="panel panel-default">
			<div class="panel-body message">
				<p class="text-center">MESSAGE</p>
					<!-- RECIVER -->
					<div class="form-group">
				    	<label for="to" class="col-sm-1 control-label">FROM:</label>
				    	<div class="col-sm-11">
                              <input type="text" class="form-control select2-offscreen" 
                              id="receiver" name="receiver" tabindex="-1" value="${mailVo.sender }" disabled>
				    	</div>
				  	</div>
					<div class="form-group">
				    	<label for="bcc" class="col-sm-1 control-label">TITLE</label>
				    	<div class="col-sm-11">
                              <input type="text" class="form-control select2-offscreen" 
                              	id="title" name="title" 
                              	 value="<c:out value="${mailVo.title }" escapeXml="true"/>" tabindex="-1" disabled>
				    	</div>
				  	</div>
				  
				
				<div class="col-sm-11 col-sm-offset-1">
					
					<br>	
					
					<div class="form-group">
						<textarea class="form-control" id="contents" name="contents" 
							rows="12" disabled>
							<c:out value="${mailVo.contents }" escapeXml="true"/>
						</textarea>
					</div>
					
					</div>
					
					<!-- FILES-->
					<div class="col-sm-1">
					</div>
					<div class="col-sm-11">
      					<div class="panel panel-default">
   					   		  <div class="panel-body">
   					   		  	<c:forEach items="${files }" var="f">
   					   		  		<a href="${f.filePath }" download>
   					   		  		 <c:out value="${f.fileName }" escapeXml="true"/>
   					   		  		</a>
   					   		  		 <br/>
   					   		  	</c:forEach>

   				    		 </div>
  			  		  </div>
  				  </div> <!-- FILES->
  				  
					<!-- BUTTON -->					
					<div class="form-group">	
						<button type="submit" class="btn btn-success">삭제</button>
						
			</div>	
		</div>
		
		



		
		
		
		