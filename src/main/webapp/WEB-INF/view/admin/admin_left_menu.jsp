<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="list-group">
      <a href="/admin/dashboard" class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
        Dashboard <span class="badge"></span>
      </a>
      <a href="/admin/posts/list" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> BoardPosts</a>
      <a href="/admin/circleposts/list" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> CirclePosts</a>
      <a href="/admin/members/list" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Users</a>
      <a href="/admin/subjects/list" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Subject Edit</a>
      <a href="/admin/classes/list" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Classes Edit</a>
      <a href="#" class="list-group-item" id="timetable">
      	<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Timetable <span class="badge"></span>
      </a>
      <div id="timetableClickDiv" style="display: none;">
      	<a href="/admin/subjects/add" class="list-group-item">
      		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Subjects <span class="badge"></span>	
      	</a>
      	<a href="/admin/classes/add" class="list-group-item">
      		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Classes <span class="badge"></span>	
      	</a>
      </div>
</div>



<script>
	$("#timetable").on("click", function() {
		var t = document.getElementById("timetableClickDiv");
		if (t.style.display == "none") {
			t.style.display = "block";
		} else {
			t.style.display = "none";
		}
	})
</script>