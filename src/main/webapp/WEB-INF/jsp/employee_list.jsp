<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/datasky.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
					<li><a href="${pageContext.request.contextPath}/index">首页</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/employee_list">员工</a></li>
					<li><a href="${pageContext.request.contextPath}/toTaskList">任务</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-xs-3">
				<div class="panel panel-default">
					<div class="panel-heading">员工管理</div>
					<ul class="list-group">
						<li class="list-group-item"><a
							href="${pageContext.request.contextPath}/employee_list">员工列表</a></li>
						<li class="list-group-item"><a
							href="${pageContext.request.contextPath}/toAddEmployee">添加员工</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-9">
				<form>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">员工列表</h3>
						</div>
						<div class="panel-body">
							<div class="left" >
								<div class="input-group">
									<input type="text" class="form-control" placeholder="输入关键字搜索">
									 <!-- <span class="input-group-btn">
										
										<button class="btn btn-default" type="button">Go!</button>
									</span>  -->
									
								 </div>
									<!-- <button class="btn btn-default" type="button">Go!</button> -->
							
								
							</div>
							<div class="right">
								<a href="javascript:bigEmployeeDelete()"><button
										type="button" class="btn btn-danger">批量删除</button></a> <a
									href="${pageContext.request.contextPath }/toAddEmployee"><button
										type="button" class="btn btn-primary">添加新成员</button></a>
							</div>
						</div>


						<table class="table  table-hover" style="">
							<th>选择</th>
							<th>工号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>电话</th>
							<th>手机mac地址</th>
							<th>操作</th>
							<c:forEach var="employee" items="${employeeList }"
								varStatus="status">
								<tr>
									<td><input type="checkbox" name="ids"
										value="${employee.id }"></td>
									<td>${employee.number }</td>
									<td>${employee.name }</td>
									<td>${employee.gender }</td>
									<td>${2018-employee.age }</td>
									<td>${employee.phone }</td>
									<td>${employee.mac }</td>
									<td><a
										href="${pageContext.request.contextPath }/toEmployeeModify?id=${employee.id }"><button
												type="button" class="btn btn-warning btn-xs">修改</button></a> <a
										href="${pageContext.request.contextPath }/employeeDelete?id=${employee.id }"><button
												type="button" class="btn btn-danger btn-xs">删除</button></a> <a
										href="${pageContext.request.contextPath }/toEmployeeDetail?id=${employee.id }"><button
												type="button" class="btn btn-primary btn-xs">详细</button></a></td>
								</tr>
							</c:forEach>


						</table>
						<div class="panel-footer">
							<ul class="pagination" style="margin: 0">
								<li><a href="#">&laquo;</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function bigEmployeeDelete() {
		var str = "";
		var values = new Array();
		var ids = document.getElementsByName('ids');
		for (var i = 0; i < ids.length; i++) {
			if (ids[i].checked) {
				values.push(ids[i].value);
			}
		}
		$.post(
				getRealPath() + "/bigEmployeeDelete?values="
						+ values.toString(), function(data, status) {
					if (status == "success")
						window.location.reload();
				});

	}
	function getRealPath() {
		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"
				+ contextPath;
		return basePath;
	}
</script>
</html>