<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <li ><a href="${pageContext.request.contextPath}/employee_list">员工</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/task_list">任务</a></li>
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
                    <li class="list-group-item">任务列表</li>
                    <li class="list-group-item">添加员工</li>
                </ul>
            </div>
        </div>
        <div class="col-xs-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">任务列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath }/addTask">
                         <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">任务编号</label>
                            <div class="col-sm-10">
                                <input type="text"  class="form-control" id="task_number" name="taskNumber" onclick="createTaskNumber()"
                                   placeholder="点击生成编号"  >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="title" name="title"
                                       placeholder="请输入任务标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="level" class="col-sm-2 control-label">优先级</label>
                            <div class="col-xs-10">
                                <select class="form-control" id="level" name="level">
                                    <option value="1">重要且紧急</option>
                                    <option value="2">重要不紧急</option>
                                    <option value="3">不重要紧急</option>
                                    <option value="4">不重要不紧急</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="status" class="col-sm-2 control-label">状态</label>
                            <div class="col-xs-10">
                                <select class="form-control" id="status" name="status">
                                    <option value="1">正在进行</option>
                                    <option value="2">已完成</option>
                                    <option value="3">未开始</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="team" class="col-sm-2 control-label">任务成员</label>
                            <div class="col-xs-10">
                                <select multiple class="form-control" id="team">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description" class="col-sm-2 control-label">详细描述</label>
                            <div class="col-sm-10">
                                <textarea name="description" class="form-control" rows="5" id="description" placeholder="请描述任务的详情"></textarea>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">确认</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	

	function createTaskNumber(){
		
		
		var date=new Date();
		var taskNumber="TASK-"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+"-"+date.getHours()+"-"+date.getMinutes();
		
		 $("#task_number").attr("value",taskNumber);
	}
</script>
</body>
</html>