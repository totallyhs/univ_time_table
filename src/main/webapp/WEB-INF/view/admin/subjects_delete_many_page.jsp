<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
	<c:when test="${addresult eq true }">
		<div>
			<h2 class="well">삭제 성공</h2>
		</div>
		<a href="/courses/subject/list"><button type="button" class="btn btn-lg btn-info">목록</button></a>
	</c:when>
	<c:when test="${addresult eq false }">
		<div>
			<h2 class="well">삭제 실패</h2>
		</div>
		<a href="/courses/subject/list"><button type="button" class="btn btn-lg btn-info">목록</button></a>
	</c:when>
	<c:otherwise>
	<div class="col-lg-12 well">
		<div class="row">
			<form action="/admin/subjects/delete/many" method="post">
				<div class="col-sm-12">
					<div class="row">
						아래 과목들을 삭제하시겠습니까?
						<ul>
							<c:forEach items="${checkbox }" var="subj">
								<li>
									${subj } <input type="hidden" name="checkbox" value="${subj }"/>
								</li>
							</c:forEach>					
						</ul>
						
					<button type="submit" class="btn btn-lg btn-info">삭제</button>
					<a href="/courses/subject/list">
						<button type="button" class="btn btn-lg btn-info" id="cancelBtn">취소</button>
					</a>
				</div>
				</div>
			</form>
		</div>
	</div>
	</c:otherwise>
</c:choose>