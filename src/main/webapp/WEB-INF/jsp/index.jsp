<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	 <title>Datasky</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/datasky.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	 <div class="header">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Datasky</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="${pageContext.request.contextPath}/index">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/employee_list">员工</a></li>
                        <li><a href="${pageContext.request.contextPath}/toTaskList">任务</a></li>
                    </ul>
                </div>
            </div>
        </nav>


    </div>
    <div class="container">
        <div class="row">
        </div>
    </div>
</body>
</html>