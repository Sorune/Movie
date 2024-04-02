<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 바디영역 : 컨테이너 -->
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
<div>
	<iframe width="1280" height="720" src="https://www.youtube.com/embed/W7edvITC9g4" title="[스파이더맨: 노 웨이 홈] 티저 예고편" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>
	<hr>
	<div class="row ml-5 mb-5">
		<h4>베스트 무비</h4>
	</div>
	<div class="container-fluid row d-flex justify-content-center">
		<c:forEach items="${movieList}" var="movies">
			<div class="card col-lg-4" style="width: 18rem; margin-right: 5px;">
				<img src="../resources/img/OguLOKDk-6VrZQaMG7zcjA.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">${ movies.title }</h5>
					<p class="card-text">${ fn:substring(movies.content,0,20) } ...</p>
					<p class="card-text"><span>(평점 ${ movies.starsAvg }/5.0)</span></p>
					<a href="/movies/getMovie/${movies.movBno }" class="btn btn-primary">더보기</a>
		 		</div>
			</div>
		</c:forEach>
	</div>
<!-- 사이트 홈 end -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
