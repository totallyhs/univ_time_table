<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
	<c:when test="${requestScope.result eq true }">
		<div>
			<h2 class="well">삭제 성공</h2>
		</div>
		<a href="/admin/members/list"><button type="button" class="btn btn-lg btn-info">목록</button></a>
	</c:when>
	<c:when test="${requestScope.result eq false }">
		<div>
			<h2 class="well">삭제 실패</h2>
		</div>
		<a href="/admin/members/list"><button type="button" class="btn btn-lg btn-info">목록</button></a>
	</c:when>
	<c:otherwise>
	<div class="col-lg-12 well">
		<div class="row">
			<form action="/admin/members/delete" method="post">
				<div class="col-sm-12">
					<div class="row">
						<ul>
							<li>${requestScope.memberVo.id } 를 삭제 하시겠습니까?
								<input type="hidden" name="no" value="${requestScope.memberVo.no }"/>
							</li>
						</ul>
						
					<button type="submit" class="btn btn-lg btn-info">삭제</button>
					<a href="/courses/members/list">
						<button type="button" class="btn btn-lg btn-info" id="cancelBtn">취소</button>
					</a>
				</div>
				</div>
			</form>
		</div>
	</div>
	</c:otherwise>
</c:choose>