<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>员工详细信息</title>
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
                        <li class="active"><a href="${pageContext.request.contextPath}/employee_list">员工</a></li>
                        <li><a href="${pageContext.request.contextPath}/task_list">任务</a></li>
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
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/employee_list">员工列表</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/toAddEmployee">添加员工</li>
                </ul>
            </div>
        </div>
        <div class="col-xs-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">员工详细信息</h3>
                </div>
                <table class="table table-striped table-bordered">
                    <tr>
                        <td>姓名</td>
                        <td>${employee.name }</td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td>${employee.gender }</td>
                    </tr>
                    <tr>
                        <td>年龄</td>
                        <td>${2018-employee.age }岁</td>
                    </tr>
                    <tr>
                        <td>手机号</td>
                        <td>${employee.phone }</td>
                    </tr>
                    <tr>
                        <td>手机mac地址</td>
                        <td onclick="upload()"><span class="glyphicon glyphicon-qrcode"></span></td>
                        <td><img alt="" src="http://bshare.optimix.asia/barCode?site=weixin&url=http://192.168.10.209:8899/dateSky/index"></td>
                    </tr>	
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	function upload(){
		
	}
</script>
</body>
</html>