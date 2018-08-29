<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- compose mail -->

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<div class="panel panel-default">
			<div class="panel-body message">
				<p class="text-center">New Message</p>
				<!-- FORM -->
				<form class="form-horizontal" role="form">
					<!-- RECIVER -->
					<div class="form-group">
				    	<label for="to" class="col-sm-1 control-label">To:</label>
				    	<div class="col-sm-11">
                              <input type="text" class="form-control select2-offscreen" id="receiver" placeholder="Type id" tabindex="-1">
				    	</div>
				  	</div>
				  	<!-- 
					<div class="form-group">
				    	<label for="bcc" class="col-sm-1 control-label">BCC:</label>
				    	<div class="col-sm-11">
                              <input type="email" class="form-control select2-offscreen" id="bcc" placeholder="Type email" tabindex="-1">
				    	</div>
				  	</div>
				  	!-->
				  
				
				<div class="col-sm-11 col-sm-offset-1">
					
					<br>	
					
					<div class="form-group">
						<textarea class="form-control" id="message" name="body" rows="12" placeholder="Click here to reply"></textarea>
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
        			        <input type="file" name="files" id="js-upload-files" multiple style="display: none;">
        				      </div>
      					      </div>

      					    <!-- Drop Zone -->
    					      <div class="upload-drop-zone form-control" id="drop-zone">
     					       Just drag and drop files here
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
				console.log($(this));
				var reader = new FileReader();
				for (var i=0; i<this.files.length; i++) {
					
				}
				reader.readAsDataURL(this.files[0]);
				reader.onload = function() {
					$("#prv").attr("src", this.result);
				}
			});
		</script>
		
		
		
		