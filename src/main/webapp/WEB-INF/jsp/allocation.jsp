<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>任务列表</title>
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
                     <li ><a href="${pageContext.request.contextPath}/index">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/employee_list">员工</a></li>
                        <li  class="active"><a href="${pageContext.request.contextPath}/task_list">任务</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="container">
    	<div class="row">
        <div class="col-xs-3">
            <div class="panel panel-default">
                <div class="panel-heading">任务管理</div>
                <ul class="list-group">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toTaskList">任务列表</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toAddTask">添加任务</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toAllocation">任务分配</a></li>
                </ul>
            </div>
        </div>
        <div class="col-xs-8">
        	 <div class="panel panel-default ">
                <div class="panel-heading">任务分配</div>
                <div class="container" style="width:100%">
                	<div class="row">
	                <ul class="list-group col-xs-6">
	                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toTaskList">任务列表</a></li>
	                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toAddTask">添加任务</a></li>
	                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toAllocation">任务分配</a></li>
	                </ul>
	                <ul class="list-group col-xs-6">
	                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toTaskList">任务列表</a></li>
	                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toAddTask">添加任务</a></li>
	                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/toAllocation">任务分配</a></li>
	                </ul>
                </div>
                
                </div>
                
            </div>
        </div>
        </div>
</div>

</body>
</html>