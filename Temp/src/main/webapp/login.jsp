<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>



    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <a href="index.html" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>header</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
 
	#test{ colod:red; }
	div {
    display: block;
    
}
	.header {
	}
	.header .header-ui {
	
	background-color:white;
	height: 65px;
	wieght:100%;
	display:flex;
	justify-content: space-between;
	padding: 0 50px;
	
	border-bottom: 0.3px solid #e3e3e3;
	}
	
	
	
	.header ul{
	display:flex;
	list-style-type:none;
	}
	.css-omez1o-NavLogo {
	font-size: 20px;
	
    margin: 15px 15px 0 0;
}
	.css-rocs30 {
    color: rgb(126, 126, 126);
    font-size: 15px;
    letter-spacing: -0.3px;
    text-decoration: none;
}
	.css-b1s605 {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    height: 62px;
    margin: 0px 0px 0px 20px;
    flex-shrink: 0;
}
.css-joinTheMembership{
    background: none;
    padding: 0;
    border: none;
    margin: 0;
    cursor: pointer;
    background: #ff2f6e;
    color: #fff;
    text-align: center;
    font-size: 17px;
    font-weight: 400;
    letter-spacing: -0.7px;
    line-height: 22px;
    width: 100%;
    height: 44px;
    border-radius: 6px;
    font-size: 15px;
    font-weight: 500;
    letter-spacing: -0.5px;
    line-height: 20px;
    box-sizing: border-box;
    width: auto;
    min-width: 72px;
    height: 32px;
    padding: 5px 12px;
    background: transparent;
    color: #353535;
    font-size: 14px;
    letter-spacing: -0.3px;
    padding: 5px 14px 6px;
    border: 1px solid rgba(116, 116, 123, 0.5);
    margin: 15px 0;
}
.css-ah6ozu-Label {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    background: #f5f5f7 url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMiIgaGVpZ2h0PSIyMiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICAgIDxwYXRoIGZpbGw9IiNCQUJBQzMiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTkuODE0IDE1LjczNWMtMy4yMDcgMC01LjgxNy0yLjYzLTUuODE3LTUuODYxIDAtMy4yMzMgMi42MS01Ljg2MiA1LjgxNy01Ljg2MiAzLjIwNyAwIDUuODE4IDIuNjMgNS44MTggNS44NjJzLTIuNjEgNS44Ni01LjgxOCA1Ljg2bTkuODQxIDIuNTRsLTMuNjYtMy43MDRjLjk4LTEuMzEgMS41NzEtMi45MzIgMS41NzEtNC42OTYgMC00LjMwOC0zLjQ3OC03LjgxMi03Ljc1Mi03LjgxMi00LjI3NCAwLTcuNzUyIDMuNTA0LTcuNzUyIDcuODEyIDAgNC4zMDcgMy40NzggNy44MSA3Ljc1MiA3LjgxIDEuODI5IDAgMy41MDctLjY0NCA0LjgzNC0xLjcxNGwzLjYzNyAzLjY4Yy4xODIuMTg2LjQyNi4yODguNjg1LjI4OC4yNTcgMCAuNS0uMS42ODMtLjI4NC4xODItLjE4NC4yODQtLjQzLjI4NS0uNjkgMC0uMjYtLjEtLjUwNS0uMjgzLS42OSIvPgo8L3N2Zz4K) no-repeat 9px 8px;
    box-sizing: border-box;
    width: 100%;
    height: 38px;
    padding: 7px 10px 8px 36px;
    border-radius: 2px;
}
.css-1pz58u2-Input-makePediaTypeFunction {
    font-size: 12px;
    font-weight: 400;
    letter-spacing: -0.3px;
    line-height: 23px;
    background: transparent;
    width: 100%;
    padding: 0;
    padding-bottom: 1px;
    border: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    caret-color: #353535;
}

.css-153f4fl-SearchContainer {
    position: relative;
    width: 300px;
}

</style>

</head>


        <div id="page-wrapper">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>