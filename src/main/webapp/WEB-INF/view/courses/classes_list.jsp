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
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <!-- form -->
            <form action="/admin/classes/delete/many" method="get" autocomplete="off">            
           	 <table class="table table-hover">	<!-- table -->
           	     <thead>
           	         <tr class="filters">
           	         	<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<th><input type="checkbox" id="checkboxAll"></th> 
           	         	</c:if>
           	             <th><input type="text" class="form-control" placeholder="수업번호" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="학수번호" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="교수님" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="요일" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="시작시간" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="끝시간" disabled></th>
           	             <th><input type="text" class="form-control" placeholder="전공" disabled></th>
           	             <c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	             	<th colspan="2"><button type="submit" disabled="" id="choicedelete" class="btn btn-primary">선택삭제</button></th>
           	             </c:if>
           	         </tr>
           	     </thead>
           	     <tbody>
           	     <c:forEach items="${requestScope.classesList }" var="cla">
           	     	<tr class="subjectrow" id="${cla.no }">
           	     		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
           	         		<td><input type="checkbox" class="checkbox" value="${cla.id }"></td> 
           	        	</c:if>
               	 		<td style="display: none;" id="classesNo"></td>
               	 		<td>${cla.no }</td>
               	 		<td>${cla.subjectNo }</td>
               			<td>${cla.professor }</td>
                		<td>${cla.day }</td>
                		<td>${cla.starttime }</td>
                		<td>${cla.endtime }</td>
                		<td>${cla.department }</td>
                		<c:if test="${sessionScope.memberVo.id  eq 'admin'}">
                			<td><a href="/admin/classes/update?id=${cla.id }">
                				<button type="button" class="btn btn-primary">수정</button>
                			</a></td>
                			<td><a href="/admin/classes/delete?id=${cla.id }">
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


