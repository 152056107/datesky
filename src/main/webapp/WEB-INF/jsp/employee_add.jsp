<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>添加员工</title>
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
                    <a href="${pageContext.request.contextPath }/employee_list"><li class="list-group-item">员工列表</li></a>
                    <li class="list-group-item">添加员工</li>
                </ul>
            </div>
        </div>
        <div class="col-xs-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">添加员工</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/addEmployee">
                        <div class="form-group">
                            <label for="no" class="col-sm-2 control-label">工号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="employee_number" name="number"
                                       placeholder="请输入员工工号" onclick="createEmployeeNumber()">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name"  name="name"
                                       placeholder="请输入员工姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sex" class="col-sm-2 control-label">性别</label>
                            <div class="col-xs-10">
                                <select class="form-control" id="sex" name="gender">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="age" class="col-sm-2 control-label">出生年份</label>
                            <div class="col-xs-10">
                                <input type="text" id="age" class="form-control" name="age" placeholder="请输入员工出生年份">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-sm-2 control-label">手机号</label>
                            <div class="col-xs-10">
                                <input type="text" id="phone" name="phone" class="form-control" placeholder="请输入手机号">
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">添加</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	

	function createEmployeeNumber(){
		
		
		var date=new Date();
		var employeeNumber="MEM-"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+"-"+date.getHours()+"-"+date.getMinutes();
		
		 $("#employee_number").attr("value",employeeNumber);
	}
	</script>
</body>
</html>