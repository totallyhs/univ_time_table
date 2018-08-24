<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- https://bootsnipp.com/snippets/O5WPN -->

    


      <div class="col-md-9">
          <div class="panel panel-default">
  <div class="panel-heading" style="background-color:  #428bca;">
    <h3 class="panel-title" style="color: white;">Website Overview</h3>
  </div>
  <div class="panel-body">
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 12</h2>
       <h4>Users</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 25</h2>
       <h4>Pages</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>126</h2>
       <h4>Posts</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span>${applicationScope.visitorCnt }</h2>
       <h4>Visitors</h4>
     </div>
   </div>
  </div>
</div>
<!--Latest User-->
<div class="panel panel-default">
  <div class="panel-heading"style="background-color:  #095f59;">
    <h3 class="panel-title">Latest Users</h3>
  </div>
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Joined</th>
      </tr>

    <tr>
      <td>Madhav Prasad</td>
      <td>mr.madhavprasad@gmail.com</td>
      <td>Dec 13,2014</td>
    </tr>
    <tr>
      <td>Nagendra Kushwaha</td>
      <td>nkushwaha822@gmail.com</td>
      <td>Feb 15,2014</td>
    </tr>
    <tr>
      <td>Arun Kumar</td>
      <td>kumarun@yahoo.com</td>
      <td>Aug 17, 2015</td>
    </tr>
    <tr>
      <td>Nabin Singh</td>
      <td>singhNavs@outlook.com</td>
      <td>March 08,2016</td>
    </tr>
    </table>

  </div>
</div>

      </div>

<!--  
  <footer id="footer">
    <p>Copyright : Madhav Prasad<br>2017</p>
  </footer>

     Bootstrap core JavaScript
    ================================================== 
     Placed at the end of the document so the pages load faster 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    <script src="dist/js/bootstrap.min.js"></script>
    -->