<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

  <!-- 바디영역 : 컨테이너 -->
    <div class="container-fluid vw-80 pat-75">
        <div class="row ml-5 mb-5">
            <h4>신작영화</h4>
        </div>
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active bg-dark">
                    <a href="">
                        <img src="/imges/OguLOKDk-6VrZQaMG7zcjA.jpg" class="d-block w-100" alt="...">
                    </a>
                </div>
                <div class="carousel-item bg-dark">
                    <a href="">
                        <img src="/imges/Vnn_KYM-QxlK00ydZiSpKA.jpg" class="d-block w-100" alt="...">
                    </a>
                </div>
                <div class="carousel-item bg-dark">
                    <a href="">
                        <img src="/imges/ZVaL2pc9RI2dzIXn-ZjrWQ.jpg" class="d-block w-100" alt="...">
                    </a>
                </div>
            </div>
        </div>
        <hr>
        <div class="row ml-5 mb-5">
            <h4>베스트 무비</h4>
        </div>
        <div class="container-fluid row d-flex justify-content-center">
            <div class="card col-lg-4" style="width: 18rem; margin-right: 5px;">
                <img src="/imges/OguLOKDk-6VrZQaMG7zcjA.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">파묘<span>(2024)</span></h5>
                    <p class="card-text">전율이 오르는 한국 오컬트 장르의 이단아 ...</p>
                    <p class="card-text">id : 이동진 <span>(평점 4.5/5.0)</span></p>
                    <a href="#" class="btn btn-primary">더보기</a>
                </div>
            </div>
            <div class="card col-lg-4" style="width: 18rem; margin-right: 5px;">
                <img src="/imges/Vnn_KYM-QxlK00ydZiSpKA.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">웡카<span>(2024)</span></h5>
                    <p class="card-text">어른들의 유쾌한 어릴적 상상의 비빔밥</p>
                    <p class="card-text">id : 박평식 <span>(평점 3.5/5.0)</span></p>
                    <a href="#" class="btn btn-primary">더보기</a>
                </div>
            </div>
            <div class="card col-lg-4" style="width: 18rem;">
                <img src="/imges/ZVaL2pc9RI2dzIXn-ZjrWQ.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">듄<span>(2024)</span></h5>
                    <p class="card-text">스타워즈를 그리워 하는 어른들의 서브 SF장르물 ...</p>
                    <p class="card-text">id : 홍길동 <span>(평점 4.0/5.0)</span></p>
                    <a href="#" class="btn btn-primary">더보기</a>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/common/footer.jsp" %>