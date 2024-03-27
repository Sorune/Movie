<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container  pt-6">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2 row justify-content-center">
        	<!-- 셀 형식 -->
        	<div class="col">
				<a href="/actor/register" class="btn btn-primary">등록하기</a>
			</div>
        	<div class="row g-5 justify-content-center">
	        	<c:forEach items="${ actorList}" var="actor">
	                <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
	                    <div class="service-item rounded">
	                       <div class="service-img rounded-top">
	                       		<c:choose>
								    <c:when test="${not empty actor.imgList}">
								        <c:set var="uploadPath" value="${fn:replace(actor.imgList[0].uploadPath, '\\\\', '/')}"/>
										<c:set var="imagePath" value="${uploadPath}/${actor.imgList[0].uuid}_${actor.imgList[0].fileName}"/>
										<c:url var="imageUrl" value="/download"/>
										<img src="<c:out value="${imageUrl}?fileName=${imagePath}"/>" class="img-fluid rounded-top w-100" alt="">
								    </c:when>
								    <c:otherwise>
								        <!-- 이미지가 없는 경우 대체 내용 추가 -->
								        <p>이미지가 없습니다.</p>
								    </c:otherwise>
								</c:choose>
	                       </div>
	                        <div class="service-content rounded-bottom bg-light p-4">
	                            <div class="service-content-inner">
	                                <h5 class="mb-4">${actor.name }</h5>
	                                <p class="mb-4">${actor.age }</p>
	                                <a href="/getMovies/${actor.actbno }" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2">Read More</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
    	    	</c:forEach>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>