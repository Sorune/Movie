<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 바디영역 : 컨테이너 -->
<div class="row ml-5 mb-5 pt-6">
	<h4>신작영화</h4>
	<h3>${pinfo }</h3>
	<h3>${pinfo.member }</h3>
	<h3>${pinfo.member.id }</h3>
</div>
<div id="carouselExample" class="carousel slide stillcut">
	<div class="carousel-inner">
		<div class="carousel-item active" style="background-color: black;">
			<img src="../resources/img/dune-1.jpg" class="d-block w-100 img-dark" alt="...">
		</div>
		<div class="carousel-item">
			<img src="../resources/img/dune-2.jpg" class="d-block w-100 img-dark" alt="...">
		</div>
		<div class="carousel-item">
			<img src="../resources/img/dune-3.jpg" class="d-block w-100 img-dark" alt="...">
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>
</div>
   <hr>
   <div class="row ml-5 mb-5">
       <h4>베스트 무비</h4>
   </div>
   <div class="container-fluid row d-flex justify-content-center">
       <div class="card col-lg-4" style="width: 18rem; margin-right: 5px;">
    <img src="../resources/img/OguLOKDk-6VrZQaMG7zcjA.jpg" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">파묘<span>(2024)</span></h5>
        <p class="card-text">전율이 오르는 한국 오컬트 장르의 이단아 ...</p>
        <p class="card-text">id : 이동진 <span>(평점 4.5/5.0)</span></p>
        <a href="#" class="btn btn-primary">더보기</a>
    </div>
</div>
<div class="card col-lg-4" style="width: 18rem; margin-right: 5px;">
    <img src="../resources/img/Vnn_KYM-QxlK00ydZiSpKA.jpg" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">웡카<span>(2024)</span></h5>
        <p class="card-text">어른들의 유쾌한 어릴적 상상의 비빔밥</p>
        <p class="card-text">id : 박평식 <span>(평점 3.5/5.0)</span></p>
        <a href="#" class="btn btn-primary">더보기</a>
    </div>
</div>
<div class="card col-lg-4" style="width: 18rem;">
        <img src="../resources/img/ZVaL2pc9RI2dzIXn-ZjrWQ.jpg" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">듄<span>(2024)</span></h5>
            <p class="card-text">스타워즈를 그리워 하는 어른들의 서브 SF장르물 ...</p>
            <p class="card-text">id : 홍길동 <span>(평점 4.0/5.0)</span></p>
            <a href="#" class="btn btn-primary">더보기</a>
        </div>
    </div>
</div>

<!-- 사이트 홈 end -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
