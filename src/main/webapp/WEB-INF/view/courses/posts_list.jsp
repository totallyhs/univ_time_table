<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- https://bootsnipp.com/snippets/featured/panel-table-with-filters-per-column -->


<c:choose>
<c:when test="${findtype eq 'boardfind' }">
<div class="container">
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">posts</h3><br/>
                <!-- 검색 -->
                <form action="/admin/posts/find/list" method="get">
             	<select name="findselect" style="color:black">
					<option value="subject" ${param.findselect eq 'subject' ? 'selected':'' }>subject</option>
					<option value="no" ${param.findselect eq 'no' ? 'selected':'' }>no</option>
					<option value="published" ${param.findselect eq 'published' ? 'selected':'' }>published</option>
					<option value="content" ${param.findselect eq 'content' ? 'selected':'' }>content</option>
					<option value="writer" ${param.findselect eq 'writer' ? 'selected':'' }>writer</option>
					
				</select>
				  <input type="text" name="find" style="color:black" value="${param.find }"/>
				<button type="submit" style="color:black">입력</button>
				</form>
				
				
            </div>
            <!-- form -->
            <form action="/admin/posts/delete/many" method="get" autocomplete="off">            
           	 <table class="table table-hover">	<!-- table -->
           	     <thead>
           	         <tr class="filters">
           	         	<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<th><input type="checkbox" id="checkboxAll" ></th> 
           	         	</c:if>
           	             <th><input type="text" class="form-control" placeholder="no" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="boardNo" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="subject" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="writer" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="content" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="ip" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="writtenDate" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="hit" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="published" disabled></th>
           	             
           	             <c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	             	<th colspan="2"><button type="submit" disabled="" id="choicedelete" class="btn btn-primary">선택삭제</button></th>
           	             </c:if>
           	         </tr>
           	     </thead>
           	     <tbody>
           	     <c:forEach items="${requestScope.postslist }" var="post">
           	     	<tr class="subjectrow" id="${member.id }">
           	     		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<td><input type="checkbox" class="checkbox" value="${post.no }"></td> 
           	        	</c:if>
               	 		<td style="display: none;" id="memberNo"></td>
               	 		<td>${post.no }</td>
               	 		<td>${post.boardNo }</td>
               			<td><a href="/circleboardview?no=${post.no}">${post.subject }</a></td>
                		<td>${post.writer }</td>
                		<td>${post.content }</td>
                		<td>${post.ip }</td>
                		<td><fmt:formatDate value="${post.writtenDate }" pattern="yyyy-MM-dd"/></td>
                		<td>${post.hit }</td>
                		<td>${post.published }</td>
                		
                		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
                			<td><a href="/admin/posts/delete?no=${post.no }">
                				<button type="button" class="btn btn-primary">삭제</button>
                			</a></td>
                		</c:if>
                </c:forEach>
                </tbody>
           	 </table> <!-- table -->
            </form>	<!-- form -->
        </div>
    </div>
</div>

<script>
	$(".checkbox").on("click", function() {
		if ($(".checkbox:checked").length == $(".checkbox").length) {
			$("#checkboxAll").prop("checked", true);
			$("#choicedelete").attr('disabled',false);
		} else {
			$("#checkboxAll").prop("checked", false);
			$("#choicedelete").attr('disabled',true);
		}
		
		if ($(this).is(":checked")) {
			$(this).attr("name", "checkbox");
			$("#choicedelete").attr('disabled',false);
		} else {
			$(this).removeAttr("name");
			$("#choicedelete").attr('disabled',true);
		}
		console.log($(this).val());
		
	});
	
	
	$("#checkboxAll").on("click", function() {
		var checked = $("#checkboxAll").is(":checked");
		if (checked) {
			$(".checkbox").prop("checked", true);		
			$(".checkbox").attr("name", "checkbox");
			$("#choicedelete").attr('disabled',false);
		} else {
			$(".checkbox").prop("checked", false);
			$(".checkbox").removeAttr("name");
			$("#choicedelete").attr('disabled',true);
		}
		
	});
	
	

</script>
</c:when>
<c:otherwise>
<div class="container">
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">posts</h3><br/>
                <!-- 검색 -->
                <form action="/admin/posts/find/list" method="get">
             	<select name="findselect" style="color:black">
					<option value="subject">subject</option>
					<option value="no">no</option>
					<option value="published">published</option>
					<option value="content">content</option>
					<option value="writer">writer</option>
				</select>
				<input type="text" name="find" style="color:black" placeholder="내용을 입력해주세요."/>
				<button style="color:black">입력</button>
				</form>
            </div>
            <!-- form -->
            <form action="/admin/posts/delete/many" method="get" autocomplete="off">            
           	 <table class="table table-hover">	<!-- table -->
           	     <thead>
           	         <tr class="filters">
           	         	<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<th><input type="checkbox" id="checkboxAll" ></th> 
           	         	</c:if>
           	             <th><input type="text" class="form-control" placeholder="no" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="boardNo" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="subject" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="writer" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="content" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="ip" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="writtenDate" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="hit" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="published" disabled></th>
           	             
           	             <c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	             	<th colspan="2"><button type="submit" disabled="" id="choicedelete" class="btn btn-primary">선택삭제</button></th>
           	             </c:if>
           	         </tr>
           	     </thead>
           	     <tbody>
           	     <c:forEach items="${requestScope.postslist }" var="post">
           	     	<tr class="subjectrow" id="${member.id }">
           	     		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<td><input type="checkbox" class="checkbox" value="${post.no }"></td> 
           	        	</c:if>
               	 		<td style="display: none;" id="memberNo"></td>
               	 		<td>${post.no }</td>
               	 		<td>${post.boardNo }</td>
               			<td><a href="/circleboardview?no=${post.no}">${post.subject }</a></td>
                		<td>${post.writer }</td>
                		<td>${post.content }</td>
                		<td>${post.ip }</td>
                		<td><fmt:formatDate value="${post.writtenDate }" pattern="yyyy-MM-dd"/></td>
                		<td>${post.hit }</td>
                		<td>${post.published }</td>
                		
                		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
                			<td><a href="/admin/posts/delete?no=${post.no }">
                				<button type="button" class="btn btn-primary">삭제</button>
                			</a></td>
                		</c:if>
                </c:forEach>
                </tbody>
           	 </table> <!-- table -->
            </form>	<!-- form -->
        </div>
    </div>
</div>

<script>
	$(".checkbox").on("click", function() {
		if ($(".checkbox:checked").length == $(".checkbox").length) {
			$("#checkboxAll").prop("checked", true);
			$("#choicedelete").attr('disabled',false);
		} else {
			$("#checkboxAll").prop("checked", false);
			$("#choicedelete").attr('disabled',true);
		}
		
		if ($(this).is(":checked")) {
			$(this).attr("name", "checkbox");
			$("#choicedelete").attr('disabled',false);
		} else {
			$(this).removeAttr("name");
			$("#choicedelete").attr('disabled',true);
		}
		console.log($(this).val());
		
	});
	
	
	$("#checkboxAll").on("click", function() {
		var checked = $("#checkboxAll").is(":checked");
		if (checked) {
			$(".checkbox").prop("checked", true);		
			$(".checkbox").attr("name", "checkbox");
			$("#choicedelete").attr('disabled',false);
		} else {
			$(".checkbox").prop("checked", false);
			$(".checkbox").removeAttr("name");
			$("#choicedelete").attr('disabled',true);
		}
		
	});


</script>
</c:otherwise>
</c:choose>

