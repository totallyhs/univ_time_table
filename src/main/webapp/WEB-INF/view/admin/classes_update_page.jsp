<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
	<c:when test="${addresult eq true }">
		<div>
			<h2 class="well">수정 성공</h2>
		</div>
		<a href="/courses/subject/list"><button type="button" class="btn btn-lg btn-info">목록</button></a>
	</c:when>
	<c:when test="${addresult eq false }">
		<div>
			<h2 class="well">등록 실패</h2>
		</div>
		<a href="/courses/subject/list"><button type="button" class="btn btn-lg btn-info">목록</button></a>
	</c:when>
	<c:otherwise>
	<div class="col-lg-12 well">
		<div class="row">
			<form action="/admin/classes/update" method="post">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-4 form-group">
							<label>학수번호</label> 
							<input type="text"  name="subjectNo" id="sno" class="form-control" list="snoList">
							<script>
								document.getElementById('sno').value='${ClassVo.subjectNo }';
							</script>
						</div>
						<div class="col-sm-4 form-group">
							<label>수업번호</label> 
							<input type="number" name="no" id="classesNo" class="form-control">
							<script>
								document.getElementById('classesNo').value='${ClassVo.no }';
							</script>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>교수님</label> 
							<input type="text" name="professor" id="teacher" class="form-control">
							<script>
								document.getElementById('teacher').value='${ClassVo.professor }';
							</script>
						</div>
					</div>
					<div class="form-group">
						<label>요일</label> 
						<select name="day" class="form-control" id="day">
							<option value="0"></option>
							<option value="1">월요일</option>
							<option value="2">화요일</option>
							<option value="3">수요일</option>
							<option value="4">목요일</option>
							<option value="5">금요일</option>
						</select>
							<script>
								document.getElementById('day').value='${ClassVo.day }';
							</script>
					</div>
					<div class="form-group">
						<label>수업 시작 시간</label> 
						<input type="number" name="starttime" step=50 class="form-control" id="start">
							<script>
								document.getElementById('start').value='${ClassVo.starttime }';
							</script>
					</div>
					<div class="form-group">
						<label>수업 끝 시간</label> 
						<input type="number" name="endtime" step=50 id="endtime" class="form-control">
							<script>
								document.getElementById('endtime').value='${ClassVo.endtime }';
							</script>
					</div>
					</div>
				<div>
					<button type="submit" class="btn btn-lg btn-info">수정</button>
					<button type="reset" class="btn btn-lg btn-info">리셋</button>
				</div>
				<input type="hidden" name="id" value="${ClassVo.id }"> 
					</form>
				</div>
		</div>
	</c:otherwise>
</c:choose>