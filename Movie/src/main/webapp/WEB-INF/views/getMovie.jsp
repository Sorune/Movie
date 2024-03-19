<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

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

<div id="carouselExample" class="carousel slide stillcut">
	<div class="carousel-inner">
		<div class="carousel-item active" style="background-color: black;">
			<img src="../resources/img/sources/dune-1.jpg" class="d-block w-100 img-dark" alt="...">
		</div>
		<div class="carousel-item">
			<img src="../resources/img/sources/dune-2.jpg" class="d-block w-100 img-dark" alt="...">
		</div>
		<div class="carousel-item">
			<img src="../resources/img/sources/dune-3.jpg" class="d-block w-100 img-dark" alt="...">
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
					<h1 class="display-3 mb-4">DUNE 2</h1>
					<!-- 평균 별점 들어갈 곳 -->
					<p class="mb-4">황제의 모략으로 멸문한 가문의 유일한 후계자 폴.(티모시 샬라메) 어머니 레이디
						제시카(레베카 퍼거슨)와 간신히 목숨만 부지한 채 사막으로 도망친다. 그곳에서 만난 반란군들과 숨어 지내다 그들과 함께
						황제의 모든 것을 파괴할 전투를 준비한다. 한편 반란군들의 기세가 높아질수록 불안해진 황제와 귀족 가문은 잔혹한 암살자
						페이드 로타(오스틴 버틀러)를 보내 반란군을 몰살하려 하는데… 운명의 반격이 시작된다!</p>
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
<div class="container-sm">
	<h4>Comment</h4>
	<br>
</div>

<div class="row g-4 justify-content-center">
	<div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp"
		data-wow-delay="0.1s">
		<div class="service-item rounded">
			<div class="service-img rounded-top">
				<img src="./resources/img/dune-1.jpg"
					class="img-fluid best-img rounded-top w-100" alt="">
			</div>
			<div class="service-content rounded-bottom bg-light p-4">
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
		<div class="service-item rounded">
			<div class="service-img rounded-top">
				<img src="./resources/img/dune-1.jpg"
					class="img-fluid best-img rounded-top w-100" alt="">
			</div>
			<div class="service-content rounded-bottom bg-light p-4">
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
		<div class="service-item rounded">
			<div class="service-img rounded-top">
				<img src="./resources/img/dune-3.jpg"
					class="img-fluid best-img rounded-top w-100" alt="">
			</div>
			<div class="service-content rounded-bottom bg-light p-4">
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
<div class="container-lg">
	<!-- Content here -->
	<div class="wow fadeInUp" data-wow-delay="0.1s">
	
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">content</th>
						<th scope="col">name</th>
						<th scope="col">date</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>2024-03-18</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>2024-03-18</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td colspan="2">Larry the Bird</td>
						<td>2024-03-18</td>
					</tr>
				</tbody>
			</table>
		
		<br>
			<div class="service-content rounded bg-light p-4">
		<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="panel-heading"></div>
						<!-- /.panel-heading -->
						<div class="panel-body">

							<form role="form" action="/board/register" method="post">

								<%--     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>           --%>

								<div class="form-group">
									<label>Title</label> <input class="form-control" name='title'>
								</div><br>

								<div class="form-group">
									<label>Text area</label>
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
<br>

	
	
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



<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>