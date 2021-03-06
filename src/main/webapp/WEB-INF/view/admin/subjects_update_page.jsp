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
			<form action="/admin/subjects/update" method="post">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>전공</label> 
							<select name="department" class="form-control">
								<option value="0"></option>
								<c:forEach items="${requestScope.departmentList }" var="dept">
									<c:choose>
										<c:when test="${subjectVo.department eq dept.no }">
											<option selected value="${dept.no }">${dept.name }</option>
										</c:when>
										<c:otherwise>
											<option value="${dept.no }">${dept.name }</option>								
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-6 form-group">
							<label>과목 이름</label> 
							<input type="text" name="name" value="${subjectVo.name }" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label>수업 관련 내용</label>
						<textarea rows="3" class="form-control" name="info">${subjectVo.info }</textarea>
					</div>
					<div class="row">
						<div class="col-sm-4 form-group">
							<label>학수번호</label> 
							<input type="text" class="form-control" value="${subjectVo.no }" disabled>
							<input type="hidden" name="no" value="${subjectVo.no }">
						</div>
						<div class="col-sm-4 form-group">
							<label>학년</label> 
							<input type="number" name="grade" class="form-control" value="${subjectVo.grade }">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>학점수</label> 
							<input type="number" name="units" class="form-control" value="${subjectVo.units }">
						</div>
					</div>
					<button type="submit" class="btn btn-lg btn-info">수정</button>
					<button type="reset" class="btn btn-lg btn-info">리셋</button>
				</div>
			</form>
		</div>
	</div>
	</c:otherwise>
</c:choose>