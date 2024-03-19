<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<%@include file="./header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">영화 게시판</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">영화 등록</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/admin/bannerModify" method="post">
      

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
							value='<c:out value="${board.title }"/>'>
					</div>
					<div class="form-group">
						<label>장르</label> <input class="form-control" name='title'
							value='<c:out value="판타지"/>'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'><c:out value="${board.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>게시자</label>
						<textarea class="form-control" rows="1" name='writer'><c:out value="${board.content}" /></textarea>
					</div>
					<div class="form-group">
						<label>이미지(728x90)</label>
							<br><br>
							<input type="file">
							<br>
							<img src="../img/about-1.jpg" alt="내사진" width="728px" height="90px">
						
					</div>
								
					
					<div class="form-group">
						<label>웹페이지 주소(http)</label> <input class="form-control"
							name='title' value='<c:out value="${board.title }"/>'>
					</div>
      
          <button type="submit" class="btn btn-default">Submit
            Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<%@include file="./footer.jsp"%>
