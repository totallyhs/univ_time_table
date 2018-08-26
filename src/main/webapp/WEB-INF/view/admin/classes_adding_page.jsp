<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
	<c:when test="${addresult eq true }">
		<div>
			<h2 class="well">등록 성공</h2>
		</div>
		<form action="/admin/classes/add">
			<div class="col-lg-12">
				<button type="submit" class="btn btn-lg btn-info">계속 등록</button>
			</div>
		</form>
	</c:when>
	<c:when test="${addresult eq false }">
		<div>
			<h2 class="well">등록 실패</h2>
		</div>
		<form action="/admin/classes/add">
			<div>
				<button type="submit" class="btn btn-lg btn-info">계속 등록</button>
			</div>
		</form>
	</c:when>
	<c:otherwise>
	<div class="col-lg-12 well">
		<div class="row">
			<form action="/admin/classes/add" method="post">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>전공</label> 
							<select name="department" id="department" class="form-control" >
								<option value="0"></option>
								<c:forEach items="${requestScope.departmentList }" var="dept">
									<option value="${dept.no }">${dept.name }</option>
								</c:forEach>		
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4 form-group">
							<label>학수번호</label> 
							<input type="text" name="subjectNo" id="sno" class="form-control" list="snoList">
							<!-- AJAX 처리 -->
							<datalist id="snoList">
							</datalist>
						</div>
						<div class="col-sm-6 form-group">
							<label>과목 이름</label> 
							<input type="text" name="sname" id="sname" class="form-control" list="snameList">
							<!-- AJAX 처리 -->
							<datalist id="snameList">
							</datalist>
						</div>
						<div class="col-sm-4 form-group">
							<label>학년</label> 
							<input type="number" name="sgrade" id="sgrade" class="form-control" list="sgradeList">
							<!-- AJAX 처리 -->
							<datalist id="sgradeList">
							</datalist>
						</div>
						<div class="col-sm-6 form-group">
							<label>학점수</label> 
							<input type="number" name="sunits" id="sunits" class="form-control" list="sunitsList">
							<!-- AJAX 처리 -->
							<datalist id="sunitsList">
							</datalist>
						</div>
					<div class="form-group">
						<label>수업 관련 내용</label>
						<textarea rows="3" class="form-control" id="sinfo" disabled="disabled"></textarea>
					</div>
						<div class="col-sm-4 form-group">
							<label>수업번호</label> 
							<input type="number" name="no" class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>교수님</label> 
							<input type="text" name="professor" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label>요일</label> 
						<select name="day" class="form-control">
							<option value="0"></option>
							<option value="1">월요일</option>
							<option value="2">화요일</option>
							<option value="3">수요일</option>
							<option value="4">목요일</option>
							<option value="5">금요일</option>
						</select>
					</div>
					<div class="form-group">
						<label>수업 시작 시간</label> 
						<input type="number" name="starttime" class="form-control">
					</div>
					<div class="form-group">
						<label>수업 끝 시간</label> 
						<input type="number" name="endtime" class="form-control">
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
					
					// sinfo
					var sinfo = r[i].info;
					$("#sinfo").value(sinfo);
				}
			});
		});
	</script>
	
	</c:otherwise>
</c:choose>