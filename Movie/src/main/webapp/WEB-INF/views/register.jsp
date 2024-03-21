<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container">
    <div class="card o-hidden border-0 shadow-lg my-3">
        <div class="card-body p-2">
            <!-- Nested Row within Card Body -->
         
               <div class="col-lg-7">
                   <div class="p-5">
                       <div class="text-center">
                           <h1 class="h4 text-gray-900 mb-4">회원가입을 해보자 !</h1>
                       </div>
                       <form class="user">
                           <div class="form-group">
                               <div class="col-sm-6 mb-3 mb-sm-1">
                                   <input type="text" class="form-control form-control-user" id="ID" placeholder="아이디">
                               </div>
                           </div>
                           <div class="form-group">
                               <div class="mb-sm-1">
                               	<input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호">
                            	</div>
                        	</div>
                           <div class="form-group row">
                               <div class="col-sm-6 mb-3 mb-sm-5">
                                   <input type="name" class="form-control form-control-user" id="name" placeholder="이름">
                               </div>
                               <div class="col-sm-6 ">
                                   <input type="name" class="form-control form-control-user"id="Nickname" placeholder="닉네임">
                               </div>
                           </div>
                           <div class="form-group row">
							<div class="col-sm-6 mb-sm-1">
								<input type="adress" class="form-control form-control-user" id="adress" placeholder="우편번호">
							</div>
							<div class="col-sm-6">
								<a type="button" class="btn btn-primary btn-user btn-block" >우편번호</a>
							</div>
							<div class="col-sm-12 mb-sm-1">
								<input type="adress" class="form-control form-control-user" id="adress" placeholder="서울 용산구 한남동 (지번주소)">
							</div>
							<div class="col-sm-12 mb-sm-1">
								<input type="adress" class="form-control form-control-user" id="adress" placeholder="서울 용산구 다산로 (도로명주소)">
	                              	</div>
							<div class="col-sm-6 mb-sm-3">
								<input type="adress" class="form-control form-control-user" id="adress" placeholder="나머지 주소">
							</div>
						</div>
						<div class="row">
						    <button type="submit" href="login.html" class="col-sm-6 btn btn-primary btn-user btn-block">
                                회원가입
                            </button>
	                        <div class="col-sm-6 text-center">
	                            <a class="small" href="/loginAuth">로그인으로 돌아가기</a>
	                        </div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>