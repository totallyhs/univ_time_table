<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- https://bootsnipp.com/snippets/featured/panel-table-with-filters-per-column -->

<div class="container">
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">과목</h3>
            </div>
            <!-- form -->
            <form action="/admin/subjects/delete/many" method="get" autocomplete="off">            
           	 <table class="table table-hover">	<!-- table -->
           	     <thead>
           	         <tr class="filters">
           	         	<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<th><input type="checkbox" id="checkboxAll"></th> 
           	         	</c:if>
           	             <th><input type="text" class="form-control" placeholder="학수번호" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="과목명" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="학점수" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="학년" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="전공" disabled></th>
           	             <c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	             	<th colspan="2"><button type="submit" class="btn btn-primary">선택삭제</button></th>
           	             </c:if>
           	         </tr>
           	     </thead>
           	     <tbody>
           	     <c:forEach items="${requestScope.subjectsList }" var="subj">
           	     	<tr class="subjectrow" id="${subj.NO }">
           	     		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<td><input type="checkbox" class="checkbox" value="${subj.NO }"></td> 
           	        	</c:if>
               	 		<td style="display: none;" id="subjectNO"></td>
               	 		<td>${subj.NO }</td>
               	 		<td>${subj.NAME }</td>
               			<td>${subj.UNITS }</td>
                		<td>${subj.GRADE }</td>
                		<td>${subj.DEPARTMENTNAME }</td>
                		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
                			<td><a href="/admin/subjects/update?no=${subj.NO }">
                				<button type="button" class="btn btn-primary">수정</button>
                			</a></td>
                			<td><a href="/admin/subjects/delete?no=${subj.NO }">
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


