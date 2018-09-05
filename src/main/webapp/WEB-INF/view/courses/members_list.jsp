<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- https://bootsnipp.com/snippets/featured/panel-table-with-filters-per-column -->

<c:choose>
<c:when test="${findtype eq membersfind }">
<div class="container">
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">users</h3>
                <!-- 검색 -->
                <form action="/admin/members/find/list" method="get">
             	<select name="findselect" style="color:black">
					<option value="id" ${param.findselect eq 'id' ? 'selected':'' }>id</option>
					<option value="name" ${param.findselect eq 'name' ? 'selected':'' }>name</option>
					<option value="nickname" ${param.findselect eq 'nickname' ? 'selected':'' }>nickname</option>
					<option value="department" ${param.findselect eq 'department' ? 'selected':'' }>department</option>
					
				</select>
				  <input type="text" name="find" style="color:black" value="${param.find }"/>
				<button type="submit" style="color:black">입력</button>
				</form>
            </div>
            <!-- form -->
            <form action="/admin/members/delete/many" method="get" autocomplete="off">            
           	 <table class="table table-hover">	<!-- table -->
           	     <thead>
           	         <tr class="filters">
           	         	<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<th><input type="checkbox" id="checkboxAll" ></th> 
           	         	</c:if>
           	             <th><input type="text" class="form-control" placeholder="ID" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="PASSWORD" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="NAME" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="NICKNAME" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="DEPARTMENT" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="JOINDATE" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="LASTLOGIN" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="PHOTO" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="EMAIL" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="NO" disabled></th>
           	             
           	             <c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	             	<th colspan="2"><button type="submit" class="btn btn-primary">선택삭제</button></th>
           	             </c:if>
           	         </tr>
           	     </thead>
           	     <tbody>
           	     <c:forEach items="${requestScope.memberlist }" var="member">
           	     	<tr class="subjectrow" id="${member.id }">
           	     		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<td><input type="checkbox" class="checkbox" value="${member.id }"></td> 
           	        	</c:if>
               	 		<td style="display: none;" id="memberNo"></td>
               	 		<td>${member.id }</td>
               	 		<td>${member.pass }</td>
               			<td>${member.name }</td>
                		<td>${member.nickname }</td>
                		<td>${member.department }</td>
                		<td><fmt:formatDate value="${member.joindate }" pattern="yyyy-MM-dd"/></td>
                		<td><fmt:formatDate value="${member.lastlogin }" pattern="yyyy-MM-dd"/></td>
                		<td>${member.photo }</td>
                		<td>${member.email }</td>
                		<td>${member.no }</td>
                		
                		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
                			<td><a href="/admin/members/delete?no=${member.no }">
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
		} else {
			$("#checkboxAll").prop("checked", false);
		}
		
		if ($(this).is(":checked")) {
			$(this).attr("name", "checkbox");
		} else {
			$(this).removeAttr("name");
		}
		console.log($(this).val());
		
	});
	
	
	$("#checkboxAll").on("click", function() {
		var checked = $("#checkboxAll").is(":checked");
		if (checked) {
			$(".checkbox").prop("checked", true);		
			$(".checkbox").attr("name", "checkbox");
		} else {
			$(".checkbox").prop("checked", false);
			$(".checkbox").removeAttr("name");
		}
		
	});
	
	

</script>
</c:when>



<c:otherwise>
<div class="container">
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">users</h3>
                <!-- 검색 -->
                <form action="/admin/members/find/list" method="get">
             	<select name="findselect" style="color:black">
					<option value="id" ${param.findselect eq 'id' ? 'selected':'' }>id</option>
					<option value="name" ${param.findselect eq 'name' ? 'selected':'' }>name</option>
					<option value="nickname" ${param.findselect eq 'nickname' ? 'selected':'' }>nickname</option>
					<option value="department" ${param.findselect eq 'department' ? 'selected':'' }>department</option>		
				</select>
				  <input type="text" name="find" style="color:black" value="${param.find }"/>
				<button type="submit" style="color:black">입력</button>
				</form>






            </div>
            <!-- form -->
            <form action="/admin/members/delete/many" method="get" autocomplete="off">            
           	 <table class="table table-hover">	<!-- table -->
           	     <thead>
           	         <tr class="filters">
           	         	<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<th><input type="checkbox" id="checkboxAll" ></th> 
           	         	</c:if>
           	             <th><input type="text" class="form-control" placeholder="ID" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="PASSWORD" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="NAME" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="NICKNAME" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="DEPARTMENT" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="JOINDATE" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="LASTLOGIN" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="PHOTO" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="EMAIL" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="NO" disabled></th>
           	             
           	             <c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	             	<th colspan="2"><button type="submit" class="btn btn-primary">선택삭제</button></th>
           	             </c:if>
           	         </tr>
           	     </thead>
           	     <tbody>
           	     <c:forEach items="${requestScope.memberlist }" var="member">
           	     	<tr class="subjectrow" id="${member.id }">
           	     		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<td><input type="checkbox" class="checkbox" value="${member.id }"></td> 
           	        	</c:if>
               	 		<td style="display: none;" id="memberNo"></td>
               	 		<td>${member.id }</td>
               	 		<td>${member.pass }</td>
               			<td>${member.name }</td>
                		<td>${member.nickname }</td>
                		<td>${member.department }</td>
                		<td><fmt:formatDate value="${member.joindate }" pattern="yyyy-MM-dd"/></td>
                		<td><fmt:formatDate value="${member.lastlogin }" pattern="yyyy-MM-dd"/></td>
                		<td>${member.photo }</td>
                		<td>${member.email }</td>
                		<td>${member.no }</td>
                		
                		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
                			<td><a href="/admin/members/delete?no=${member.no }">
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
		} else {
			$("#checkboxAll").prop("checked", false);
		}
		
		if ($(this).is(":checked")) {
			$(this).attr("name", "checkbox");
		} else {
			$(this).removeAttr("name");
		}
		console.log($(this).val());
		
	});
	
	
	$("#checkboxAll").on("click", function() {
		var checked = $("#checkboxAll").is(":checked");
		if (checked) {
			$(".checkbox").prop("checked", true);		
			$(".checkbox").attr("name", "checkbox");
		} else {
			$(".checkbox").prop("checked", false);
			$(".checkbox").removeAttr("name");
		}
		
	});
	
	

</script>
</c:otherwise>
</c:choose>
