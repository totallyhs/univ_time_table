<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h1 class="well">Registration Form</h1>
<c:choose>
	<c:when test="${addresult eq true }">
		<div>
			<h2 class="well">등록 성공</h2>
		</div>
		<form action="/admin/subjects/add">
			<div class="col-lg-12">
				<button type="submit" class="btn btn-lg btn-info">계속 등록</button>
			</div>
		</form>
	</c:when>
	<c:when test="${addresult eq false }">
		<div>
			<h2 class="well">등록 실패</h2>
		</div>
		<form action="/admin/subjects/add">
			<div>
				<button type="submit" class="btn btn-lg btn-info">계속 등록</button>
			</div>
		</form>
	</c:when>
	<c:otherwise>
	<div class="col-lg-12 well">
		<div class="row">
			<form action="/admin/subjects/add" method="post">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>전공</label> 
							<select name="department" id="department" class="form-control" >
								<c:forEach items="${requestScope.departmentList }" var="dept">
									<option value="${dept.no }">${dept.name }</option>
								</c:forEach>		
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4 form-group">
							<label>학수번호</label> <input type="text" name="sno" id="sno"
								placeholder="Enter City Name Here.." class="form-control" list="snoList">
								<!-- AJAX 처리 -->
								<datalist id="snoList">
								</datalist>
						</div>
						<div class="col-sm-6 form-group">
							<label>과목 이름</label> <input type="text" name="sname" id="sname"
							 class="form-control" list="snameList">
							<!-- AJAX 처리 -->
							<datalist id="snameList">
							</datalist>
						</div>
						<div class="col-sm-4 form-group">
							<label>학년</label> <input type="number" name="sgrade" id="sgrade"
								value="" class="form-control" list="sgradeList">
							<!-- AJAX 처리 -->
							<datalist id="sgradeList">
							</datalist>
						</div>
						<div class="col-sm-6 form-group">
							<label>학점수</label> <input type="number" name="sunits" id="sunits"
								 class="form-control" list="sunitsList">
							<!-- AJAX 처리 -->
							<datalist id="sunitsList">
							</datalist>
						</div>
					<div class="form-group">
						<label>수업 관련 내용</label>
						<textarea placeholder="Enter Address Here.." rows="3"
							class="form-control"></textarea>
					</div>
						<div class="col-sm-4 form-group">
							<label>수업번호</label> <input type="number" name="no"
								class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>교수님</label> <input type="text" name="professor"
								 class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label>요일</label> <select name="day"
							 class="form-control">
							 	<option value=""></option>
							 	<option value=""></option>
							 	<option value=""></option>
							 	<option value=""></option>
							 	<option value=""></option>
							 	<option value=""></option>
							 	<option value=""></option>
							 </select>
					</div>
					<div class="form-group">
						<label>수업 시작 시간</label> <input type="datetime" name="starttime"
							 class="form-control">
					</div>
					<div class="form-group">
						<label>수업 끝 시간</label> <input type="datetime" name="endtime"
							 class="form-control">
					</div>
					<button type="submit" class="btn btn-lg btn-info">Submit</button>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		$("#department").on("change", function() {
			console.log($(this).val());
			$.ajax({
				"url" : "/admin/classes/add/ajax/subject",
				"method" : "post",
				"data" : {
					"departmentNo" : $(this).val()
				}
			}).done(function(r) {
				console.log(r);
				for (var i=0; i<r.length; i++) {
					// sno
					var sno = "<option value=\"" + r[i].no + "\">";
					sno += r[i].name + "</option>";
					$("#snoList").html(sno);
					
					// sname
					var sname = "<option value=\"" + r[i].name + "\">";
					sname += "</option>";
					$("#snameList").html(sname);
					
					// sgrade
					var sname = "<option value=\"" + r[i].grade + "\">";
					sname += "</option>";
					$("#sgradeList").html(sname);
					
					// sunits
					var sname = "<option value=\"" + r[i].units + "\">";
					sname += "</option>";
					$("#sunitsList").html(sunits);
				}
			});
		});
	</script>
	
	</c:otherwise>
</c:choose>