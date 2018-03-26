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
                        <li  class="active"><a href="${pageContext.request.contextPath}/toTaskList">任务</a></li>
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
                </ul>
            </div>
        </div>
        <div class="col-xs-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">任务详细信息</h3>
                </div>
                <table class="table table-striped table-bordered">
                    <tr>
                        <td>编号</td>
                        <td>${task.taskNumber }</td>
                    </tr>
                    <tr>
                        <td>标题</td>
                        <td>${task.title }</td>
                    </tr>
                    <tr>
                        <td>描述</td>
                        <td>${task.description }</td>
                    </tr>
                    <tr>
                        <td>级别</td>
                        <td>
                        <c:choose>
                            		<c:when test="${task.status == 1 }"><span style="color:red">正在进行</span></c:when>
                            		<c:when test="${task.status == 2 }"><span style="color:	#32CD32">已完成</span></c:when>
                            		<c:when test="${task.status == 3 }"><span style="color:Gray">未开始</span></c:when>
                            	</c:choose>
						</td>
                    </tr>
                    <tr>
                        <td>状态</td>
                        <td>
                        <c:choose>
                            		<c:when test="${task.level == 1 }">重要且紧急</c:when>
                            		<c:when test="${task.level == 2 }">重要不紧急</c:when>
                            		<c:when test="${task.level == 3 }">不重要紧急</c:when>
                            		<c:when test="${task.level == 4 }">不重要不紧急</c:when>
                            	</c:choose>
                        </td>
                        
                    </tr>
                    <tr>
                    	<td>人员分配</td>
                    	<td>
                    		
                    	</td>
                    </tr>	
                </table>
            </div>
        </div>
        </div>
        </div>
        
</body>
</html>