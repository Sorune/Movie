<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%> --%>


<style type="text/css">
img {
	height: 500px;
	background: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2));
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	object-fit: cover;
}

.img-dark {
	background-color: black;
	/* 	filter: brightness(80%);
	background: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)); */
}

.best-img {
	height: 200px;
}

.stillcut {
	background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)),
		url(./resources/img/dune-2.jpg);
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	/* 	padding: 160px 0 60px 0;   */
}
</style>

<div id="carouselExample" class="carousel slide" style="padding-top: 100px;">
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
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExample" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExample" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>

<!-- About Start -->
<div class="container-fluid about bg-light py-5">
	<div class="container py-5">
		<div class="row g-5 align-items-center">
			<div class="col-lg-5 wow fadeInLeft" data-wow-delay="0.2s">
				<div class="about-img pb-5 ps-5">
					<img src="../resources/img/dune-poster.jpg"  class="img-fluid rounded w-100"
						style="object-fit: cover;" alt="Image" />
					<div class="about-experience">15 years experience</div>
				</div>
			</div>
			<div class="col-lg-7 wow fadeInRight" data-wow-delay="0.4s">
				<div class="section-title text-start mb-5">
					<h4 class="sub-title pe-3 mb-0">Movie Info</h4>
					<h1 class="display-3 mb-4"><c:out value="${movie.title }"/></h1>
					<!-- 평균 별점 들어갈 곳 -->
					<p class="mb-4"><c:out value="${movie.content }"/></p>
					<div class="mb-4">
						<p class="text-secondary">
							<i class="fa fa-check text-primary me-2"></i> 쿠키있음
						</p>
						<p class="text-secondary">
							<i class="fa fa-check text-primary me-2"></i> 전체이용가
						</p>
					</div>
					<a href="#"
						class="btn btn-primary rounded-pill text-white py-3 px-5">Discover
						More</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- About End -->
<br>
<br>


<!-- 베스트 댓글  -->
<div class="row g-4 justify-content-center">
	<div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp"
		data-wow-delay="0.1s">
		<div class="service-item rounded shadow-lg">
			<div class="service-content rounded-top rounded-bottom bg-light p-4">
				<div class="starts mb-3 d-flex justify-content-center">
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	            </div>
				<div class="service-content-inner">
					<h5 class="mb-4">베스트 댓글1</h5>
					<p class="mb-4">Dolor, sit amet consectetur adipisicing elit.
						Soluta inventore cum accusamus, dolor qui ullam</p>
					<a href="#"
						class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">view</a>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp"
		data-wow-delay="0.1s">
		<div class="service-item rounded shadow-lg">
			<div class="service-content rounded-top rounded-bottom bg-light p-4">
				<div class="starts mb-3 d-flex justify-content-center">
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	            </div>
				<div class="service-content-inner">
					<h5 class="mb-4">베스트 댓글2</h5>
					<p class="mb-4">Dolor, sit amet consectetur adipisicing elit.
						Soluta inventore cum accusamus, dolor qui ullam</p>
					<a href="#"
						class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">view</a>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp"
		data-wow-delay="0.1s">
		<div class="service-item rounded shadow-lg">
			<div class="service-content rounded-top rounded-bottom bg-light p-4">
				<div class="starts mb-3 d-flex justify-content-center">
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	                <i class="fa fa-star fz20"></i>
	            </div>
	            <div class="service-content-inner">
					<h5 class="mb-4">베스트 댓글3</h5>
					<p class="mb-4">Dolor, sit amet consectetur adipisicing elit.
						Soluta inventore cum accusamus, dolor qui ullam</p>
					<a href="#"
						class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">view</a>
				</div>
			</div>
		</div>
	</div>

</div>



<br>
<div class="container-sm">
	<!-- Content here -->
	<!-- 코멘트 -->
	<div class="container-xs">
	<div class="container py-5">
		<h4>Comments</h4>
	<div class="wow fadeInUp" data-wow-delay="0.1s">
	<div class="col-lg-12">
		
		
			<div class="row">
			<c:forEach items="${map}" var="comments" >
				<c:set var="user" value="${map.user }"/>
				<c:set var="comment" value="${map.comments }"/>
			<div class="col-6 col-md-6">
				<ul class="list-group">
					<li class="list-group-item border-0">
						<div class="service-item rounded shadow-sm">
							<div class="service-content rounded-top rounded-bottom bg-light p-4">
								<div class="row">
						            <div class="col d-flex">
										<p class="mb-4"><strong><c:out value="${user[nickname]}" /></strong> </p>
						            </div>
								
									<div class="col d-flex justify-content-end">
									
											<%-- <c:choose>
												<c:forEach items="${comments }" var='star'  varStatus="i" begin="0" end="4" step="1">
													<div class="col starts mb-3 d-flex" style="margin-right: 0; justify-content: flex-end;">
														<i class="fa fa-star fz20"> <c:out value="${star.stars }"/> </i>
						           					</div>
												</c:forEach>
											</c:choose> --%>
									</div>
								</div>
								
					            <div class="service-content-inner">
									<p class="mb-4"><c:out value="${comment}"></c:out></p> 
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			</c:forEach>
			</div>
			
		</div>
		</div>
	<!-- ./ 코멘트 -->
	<!-- 코멘트 입력 -->
	
	<div class="service-content rounded bg-light p-4 mt-3">
		<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="panel-heading"></div>
						<!-- /.panel-heading -->
						<div class="panel-body">

							<form role="form" action="/getMovie/comment" method="post">

								<%--     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>           --%>

								<div class="form-group" >
									<div class="col starts mb-3 d-flex" style="margin-right: 0; justify-content: flex-end;">
						                <i class="fa fa-star fz20"><input type="hidden"></i>
						                <i class="fa fa-star fz20"></i>
						                <i class="fa fa-star fz20"></i>
						                <i class="fa fa-star fz20"></i>
						                <i class="fa fa-star fz20"></i>
						            </div>
								</div><br>

								<div class="form-group">
									<textarea class="form-control" rows="3" name='content'></textarea>
								</div><br>
								
								<div class="form-group">
									<label>Writer</label> <input class="form-control" name='writer'
										<%-- value='<sec:authentication property="principal.username"/>' --%>
										readonly="readonly">
								</div><br>


								<button type="submit" class="btn btn-primary rounded-pill text-white py-2 px-4 flex-wrap flex-sm-shrink-0">Submit
									Button</button>
								<button type="reset" class="btn btn-danger rounded-pill px-3">Reset
									Button</button>
							</form>

						</div>
						<!--  end panel-body -->

					</div>
					<!--  end panel-body -->
				</div>
				<!-- end panel -->
			</div>
			<!-- /.row -->
		</div>
		
		
	</div>
	<!-- /div.wow fadeInUp -->
</div>

</div>
<br>

<!-- 
   <div>
        <span class="star">
            기존 별
            ★★★★★
            체크하면 나타날 별
            <span>★★★★★</span>
            별점 체크를 위한 input(hidden)
            <input id="inputVal" type="range" oninput="checkStar(this)" value="0.0" step="0.5" min="0" max="5">
        </span>
        <div class="avg-txt">
            평점 : <span id="score">0.0</span> / 5.0
            평점 숫자 출력되는 부분
        </div>
    </div> -->

	
	
	<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->



<%@ include file="/WEB-INF/views/common/footer.jsp" %>