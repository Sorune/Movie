<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>


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

/* 별점 체크용 */
.starAdd {
    position: relative;
    font-size: 2rem; 
    color: #ddd;
}

.starAdd input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
}

.starAdd span {
   height: 100%;
    width: 0px;
    position: absolute;
    font-size: 2rem;
    left: 0;
    /* color: red; */
    overflow: hidden;
    pointer-events: none;
}

.countingStar {
   color: yellow;
   font-size: 2rem;
    text-shadow: 0 0 5px yellow;
}

.staff {
	width: 75px;
	height: 75px;
}

</style>
<div class="col-lg-12 pt-6">
	<div id="uploadedImages2" class="carousel slide carousel-fade" data-bs-ride="carousel">
      		<div class="carousel-inner" id="carousel-inner2" style="width:100%;height:auto;">
			<c:forEach items="${movie.titleList}" var="img" varStatus="i" begin="0">
				<c:choose>
				    <c:when test="${not empty img}">
				    	<c:choose>
				    		<c:when test="${ i.index == 0 }">
				    			<div class="carousel-item active">
				    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
									<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
									<c:url var="imageUrl" value="/movies/download"/>
									<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
				    			</div>
				    		</c:when>
				    		<c:otherwise>
				    			<div class="carousel-item">
				    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
									<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
									<c:url var="imageUrl" value="/member/download"/>
									<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
				    			</div>
				    		</c:otherwise>
				    	</c:choose>
				    </c:when>
				    <c:otherwise>
				        <!-- 이미지가 없는 경우 대체 내용 추가 -->
				        <div id="drop-area" style="width:100%;">
							<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
	        			</div>
				    </c:otherwise>
				</c:choose>
			</c:forEach>
      		</div>
      		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages2" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages2" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
      	</div>
</div>

<!-- About Start -->
<div class="container-fluid about bg-light py-5">
	<div class="container py-5">
		<div class="row g-5 align-items-center">
			<div class="col-lg-5 wow fadeInLeft" data-wow-delay="0.2s">
				<div id="uploadedImages" class="carousel slide carousel-fade" data-bs-ride="carousel">
	        		<div class="carousel-inner" style="width:100%;height:auto;">
						<c:forEach items="${movie.imgList}" var="img" varStatus="i" begin="0">
							<c:choose>
							    <c:when test="${not empty img}">
							    	<c:choose>
							    		<c:when test="${ i.index == 0 }">
							    			<div class="carousel-item active">
							    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
												<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
												<c:url var="imageUrl" value="/movies/download"/>
												<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
							    			</div>
							    		</c:when>
							    		<c:otherwise>
							    			<div class="carousel-item">
							    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
												<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
												<c:url var="imageUrl" value="/member/download"/>
												<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
							    			</div>
							    		</c:otherwise>
							    	</c:choose>
							    </c:when>
							    <c:otherwise>
							        <!-- 이미지가 없는 경우 대체 내용 추가 -->
							        <div id="drop-area" style="width:100%;">
										<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
				        			</div>
							    </c:otherwise>
							</c:choose>
						</c:forEach>
	        		</div>
	        		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
	        	</div>
	        </div>
			</div>
			<div class="col-lg-7 wow fadeInRight" data-wow-delay="0.4s">
				<div class="section-title text-start mb-5">
					<h4 class="sub-title pe-3 mb-0">Movie Info</h4>
					<h1 class="display-3 mb-4"><c:out value="${movie.title }"/><c:out value="${movie.movBno }"/></h1>
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
<div class="container py-5">
<h4>출연/제작</h4></div>
<!-- diretor, actors -->
<div class="container-sm">
	
	<div class="row g-4 justify-content-left mb-5">
	
		<div class="row wow fadeInUp"
			data-wow-delay="0.1s">
			
				<%-- <c:forEach> --%>
			<div class="col-1">
				<img src="../resources/img/dune-3.jpg"
					class="img-thumbnail rounded-circle staff" alt="...">
			</div>
			<div class="col-3 mt-3">
				<span><strong>이름</strong></span><br>
				<span><small>이름</small></span>
			</div>
			<%-- 	</c:forEach> --%>
		</div>
	</div>
	<div id="uploadedImages3" class="carousel slide carousel-fade" data-bs-ride="carousel">
   		<div class="carousel-inner" id="carousel-inner3" style="width:100%;height:auto;">
			<c:forEach items="${movie.contentList}" var="img" varStatus="i" begin="0">
				<c:choose>
				    <c:when test="${not empty img}">
				    	<c:choose>
				    		<c:when test="${ i.index == 0 }">
				    			<div class="carousel-item active">
				    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
									<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
									<c:url var="imageUrl" value="/movies/download"/>
									<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
				    			</div>
				    		</c:when>
				    		<c:otherwise>
				    			<div class="carousel-item">
				    				<c:set var="uploadPath" value="${fn:replace(img.uploadPath, '\\\\', '/')}"/>
									<c:set var="imagePath" value="${uploadPath}/${img.uuid}_${img.fileName}"/>
									<c:url var="imageUrl" value="/member/download"/>
									<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>"  width="100%" class="img-fluid" uploadPath="${uploadPath}" uuid="${img.uuid}" fileName="${img.fileName}">
				    			</div>
				    		</c:otherwise>
				    	</c:choose>
				    </c:when>
				    <c:otherwise>
				        <!-- 이미지가 없는 경우 대체 내용 추가 -->
				        <div id="drop-area" style="width:100%;">
							<p>이미지를 드래그 앤 드롭 하거나 클릭하여 업로드하세요.</p>
	        			</div>
				    </c:otherwise>
				</c:choose>
			</c:forEach>
   		</div>
   		<button class="carousel-control-prev" type="button" data-bs-target="#uploadedImages3" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#uploadedImages3" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
   	</div>
</div>
<div class="container-sm">
	<!-- Content here -->
	<!-- 코멘트 -->
	<div class="container-xs">
		<div class="container py-5">
			<label>쿠키 영상</label>
			<c:set var="videoId" value="" />
			<c:choose>
			    <c:when test="${not empty movie.video and movie.video.startsWith('https://youtu.be/')}">
			        <c:set var="videoId" value="${fn:substringAfter(movie.video, 'https://youtu.be/')}"/>
			    </c:when>
			    <c:when test="${not empty movie.video and movie.video.startsWith('https://www.youtube.com/watch?v=')}">
			        <c:set var="videoId" value="${fn:substringAfter(movie.video, 'https://www.youtube.com/watch?v=')}"/>
			        <c:if test="${videoId.contains('&')}">
			            <c:set var="videoId" value="${fn:substringBefore(videoId, '&')}"/>
			        </c:if>
			    </c:when>
			    <c:otherwise>
			        <p>올바른 YouTube URL을 입력하세요.</p>
			    </c:otherwise>
			</c:choose>
			<c:if test="${not empty videoId}">
			    <div class="form-group"  id="video-container">
			        <div class="card card-body">
			            <iframe id="videoViewer" width="1280" height="720" src='https://www.youtube.com/embed/${ videoId }' frameborder='0' allowfullscreen='true' ></iframe>
			        </div>
			    </div>
			</c:if>
		</div>
	</div>
</div>
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
					<h5 class="mb-4"><c:out value="${user.membno }"/></h5>
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
		<h4>Comment</h4>
	<div class="wow fadeInUp" data-wow-delay="0.1s">
	<div class="col-lg-12">
		
		
			<div class="row">
			<c:forEach items="${movie.comment}" var="comment" >
		<div class="col-6 col-md-6">
				<ul class="list-group">
					<li class="list-group-item border-0">
						<div class="service-item rounded shadow-sm">
							<div class="service-content rounded-top rounded-bottom bg-light p-4">
								<div class="row">
						            
						            
								            <div class="col d-flex">
												<p class="mb-4"><strong><c:out value="${comment.nickName}" /></strong> </p>
								            </div>
									<div class="col d-flex justify-content-end">
										
										<button type="button" class="btn btn-outline-info btn-sm" style="height: 30px; text-align: center;"><small>수정</small></button>
										<!-- <button type="button" class="btn btn-outline-danger btn-sm" style="height: 30px; text-align: center;" id="removeComBtn"><small>삭제</small></button> -->
										
									
												<%-- <c:forEach items="${movie.comment}" var='star'  varStatus="i" begin="0" end="4" step="1">
													<div class="col starts mb-3 d-flex" style="margin-right: 0; justify-content: flex-end;">
														<i class="fa fa-star fz20"> <c:out value="${star.stars }"/> </i>
						           					</div>
												</c:forEach> --%>
									</div>
								</div>
								
					            <div class="service-content-inner">
									<p class="mb-4"><c:out value="${comment.content}"></c:out></p> 
								</div>
										<hr>
										<input type="hidden" id ="comBno" value="<c:out value="${comment.comBno }"></c:out>" />
										<button class="border-0" id="like_btn" value="1">
										<i class="bi bi-heart-fill" style="color: white; border-color: #faf9fb;"></i>
										</button>
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
							
<%-- 								<c:set value="${movie.comment}" var="writer"/> <!-- 모델 영역의 객체 변수화 -->
 --%>								
							<form role="form" action="/regComment" method="post">

							     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>      

							      <span class="starAdd">
							          <!-- 기존 별 -->
							            <i class="fa fa-star"></i>
							            <i class="fa fa-star"></i>
							            <i class="fa fa-star"></i>
							            <i class="fa fa-star"></i>
							            <i class="fa fa-star"></i>
							          <!-- 체크하면 나타날 별 -->
							          <span class="">
							             <i class="fa fa-star countingStar"></i>
							              <i class="fa fa-star countingStar"></i>
							              <i class="fa fa-star countingStar"></i>
							              <i class="fa fa-star countingStar"></i>
							              <i class="fa fa-star countingStar"></i>
							          </span>
							          <!-- 별점 체크를 위한 input(hidden) -->
							          <input id="inputs" type="range" oninput="addStar(this)" value="0" step="1" min="0" max="5">
							      </span>
							      <div class="avg-txt">
							            평점 :<input type="hidden" id='starVal' name='stars'/> <span id="scores">0.0</span> / 5.0
							            <!-- 평점 숫자 출력되는 부분 -->
							      </div>


								<div class="form-group">
									<textarea class="form-control" rows="3" name='content' id='content'></textarea>
								</div><br>
								 <sec:authorize access="isAuthenticated()">
								<div class="form-group">
									<label>작성자</label> <input class="form-control" name="writer" value='<sec:authentication property="principal.member.name"/>' readonly="readonly">
										 <input type="hidden" name='memBno' value='<c:out value="${ user.membno }"/>' id='memBno'/> 
								</div><br>
										</sec:authorize>
								 <sec:authorize access="isAnonymous()">
								<div class="form-group">
									<label>작성자</label> <input type="text" class="form-control" name="writer" readonly />
								</div><br>
										</sec:authorize>
								
							
								<input type="hidden" name='movBno' value="<c:out value="${movie.movBno }"/>" id='movBno'/>
								

								
								<button type="submit" id="commentBtn" class="btn btn-primary rounded-pill text-white py-2 px-4 flex-wrap flex-sm-shrink-0">Submit
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
      
<script>

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>