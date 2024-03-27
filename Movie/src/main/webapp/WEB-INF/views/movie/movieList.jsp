<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>


<div class="top-block">
	<!-- 상단 안보이는걸 막기위한 div 미디어쿼리 넣어야한다.-->
</div>


<div class="container  pt-6">
	<div class="card o-hidden border-0 shadow-lg my-3">
		<div class="card-body p-2 row justify-content-center">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">영화 게시판</h2>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="container">
				<div class="card o-hidden border-0 shadow-lg my-3">
					<div class="card-body p-2 row justify-content-center">

						<!-- 셀 형식 -->
						<div class="row g-5 justify-content-center">
							<c:forEach items="${movie}" var="movie">
								<div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp"
									data-wow-delay="0.1s">
									<div class="service-item rounded shadow-sm">
										<div class="service-img rounded-top">
											<img src="img/service-1.jpg"
												class="img-fluid rounded-top w-100" alt="">
										</div>
										<div class="service-content rounded-bottom bg-light p-4">
											<div class="service-content-inner">
												<h5 class="mb-4">
													<c:out value="${movie.title}"></c:out>
												</h5>
												<p class="mb-4">
													<c:out value="${movie.content }"></c:out>
												</p>
												<a href="/getMovie?movbno=${movie.movBno }"
													class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Read
													More</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>