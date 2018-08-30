<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- result -->
<c:choose>
	<c:when test="${requestScope.success eq true }">
		<div>
			<h2>메일 보내기 성공</h2>
		</div>
		<a href="/mail/inbox"><button type="button" class="btn btn-lg btn-info">Inbox</button></a>
	</c:when>
	<c:when test="${requestScope.success eq false }">
		<div>
			<h2>메일 보내기 실패</h2>
		</div>
		<a href="/mail/inbox"><button type="button" class="btn btn-lg btn-info">목록</button></a>
	</c:when>
	<c:otherwise>
	
<!-- compose mail -->

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<div class="panel panel-default">
			<div class="panel-body message">
				<p class="text-center">New Message</p>
				<!-- FORM -->
				<form class="form-horizontal" action="/mail/compose" 
					autocomplete="off" method="post" enctype="multipart/form-data">
					<!-- RECIVER -->
					<div class="form-group">
				    	<label for="to" class="col-sm-1 control-label">To:</label>
				    	<div class="col-sm-11">
                              <input type="text" class="form-control select2-offscreen" 
                              id="receiver" name="receiver" placeholder="Type id" tabindex="-1" list="idList">
                              <datalist id="idList">
                              </datalist>
				    	</div>
				  	</div>
					<div class="form-group">
				    	<label for="bcc" class="col-sm-1 control-label">TITLE</label>
				    	<div class="col-sm-11">
                              <input type="text" class="form-control select2-offscreen" id="title" name="title" placeholder="Type email" tabindex="-1">
				    	</div>
				  	</div>
				  
				
				<div class="col-sm-11 col-sm-offset-1">
					
					<br>	
					
					<div class="form-group">
						<textarea class="form-control" id="contents" name="contents" rows="12"></textarea>
					</div>
					
					</div>
					
					<!-- FILEUPLOAD -->
					<div class="col-sm-1">
					</div>
					<div class="col-sm-11">
      					<div class="panel panel-default">
   					   		  <div class="panel-body">

        				    <div class="form-inline">
        				      <div class="form-group">
        			        <input type="file" name="fileupload" id="js-upload-files" multiple>
        				      </div>
      					      </div>

      					    <!-- Drop Zone -->
      					    file
    					      <div class="upload-drop-zone form-control" id="drop-zone">
    					      </div>


   				    		 </div>
  			  		  </div>
  				  </div> <!-- FILEUPLOAD-->
  				  
					<!-- BUTTON -->					
					<div class="form-group">	
						<button type="submit" class="btn btn-success">Send</button>
						<!-- <button type="submit" class="btn btn-default">Draft</button> -->
						<button type="button" class="btn btn-danger">Discard</button>
					</div>	<!-- BUTTON -->
						
				</form>	<!-- FORM -->
			</div>	
		</div>
		
		
		<script>
			$("#drop-zone").on("click", function() {
				$("#js-upload-files").click();
			});
			
			$("#js-upload-files").on("change", function() {
				var zone = $("#drop-zone");
				zone.html();
				console.log($("#js-upload-files"));
				/*
				var reader = new FileReader();
				console.log(this.files)
				for (var i=0; i<this.files.length; i++) {
					var file = this.files[i];
					reader.readAsDataURL(file);
					reader.onload = function() {
						console.log(this.result);
						var str = "<small>" + file.name + "</small>";
						$("#drop-zone").html($("#drop-zone").html() + "  " + str);
					}				
				}
				*/
			});
			
			
			$("#receiver").on("keyup", function() {
				$("#idList").html("");
				$.ajax({
					"url":"/member/ajaxId",
					"method" : "post",
					"data" : {
						"id" : $(this).val()
					}
				}).done(function(r) {
					for (var i=0; i<r.length; i++) {
						var str = "<option value=" + r[i].id + ">";
						str += r[i].name + "</option>";
						$("#idList").append(str);
					}
				});
			});
			
		</script>
	</c:otherwise>
</c:choose>



		
		
		
		