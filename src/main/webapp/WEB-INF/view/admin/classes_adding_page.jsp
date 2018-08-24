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
							<label>전공</label> <input type="text" name="department"
								placeholder="Enter First Name Here.." class="form-control">
						</div>
						<div class="col-sm-6 form-group">
							<label>과목 이름</label> <input type="text" name="name"
								placeholder="Enter Last Name Here.." class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label>수업 관련 내용</label>
						<textarea placeholder="Enter Address Here.." rows="3"
							class="form-control"></textarea>
					</div>
					<div class="row">
						<div class="col-sm-4 form-group">
							<label>학수번호</label> <input type="text" name="sno"
								placeholder="Enter City Name Here.." class="form-control">
						</div>
						<div class="col-sm-4 form-group">
							<label>수업번호</label> <input type="number" name="cno"
								placeholder="Enter State Name Here.." class="form-control">
						</div>
						<div class="col-sm-4 form-group">
							<label>학년</label> <input type="number" name="grade"
								placeholder="Enter Zip Code Here.." class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>학점수</label> <input type="number" name="units"
								placeholder="Enter Designation Here.." class="form-control">
						</div>
						<div class="col-sm-6 form-group">
							<label>교수님</label> <input type="text" name="professor"
								placeholder="Enter Company Name Here.." class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label>요일</label> <input type="number" name="day"
							placeholder="Enter Phone Number Here.." class="form-control">
					</div>
					<div class="form-group">
						<label>수업 시작 시간</label> <input type="number" name="starttime"
							placeholder="Enter Email Address Here.." class="form-control">
					</div>
					<div class="form-group">
						<label>수업 끝 시간</label> <input type="number" name="endtime"
							placeholder="Enter Website Name Here.." class="form-control">
					</div>
					<button type="submit" class="btn btn-lg btn-info">Submit</button>
				</div>
			</form>
		</div>
	</div>
	</c:otherwise>
</c:choose>