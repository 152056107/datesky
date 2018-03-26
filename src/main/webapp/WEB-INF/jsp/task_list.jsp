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
        <div class="col-xs-9">
            <form>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">任务列表</h3>
                    </div>
                    <div class="panel-body">
                        <div class="left">
                            <input type="text" class="form-control" id="" placeholder="输入关键字搜索">
                        </div>
                        <div class="right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-warning" >批量标记为已完成</button>
                                <button type="button" class="btn btn-warning dropdown-toggle"
                                        data-toggle="dropdown">
                                    <span class="caret"></span>
                                    <span class="sr-only">切换下拉菜单</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#"  onclick="bigAction(1)">正在进行</a></li>
                                    <li><a href="#" onclick="bigAction(2)">已完成</a></li>
                                    <li><a href="#" onclick="bigAction(3)">未开始</a></li>
                                    <li class="divider"></li>
                                    <li><a  onclick="bigDelete()" >删除</a></li>
                                </ul>
                            </div>
                            <a href="${pageContext.request.contextPath }/toAddTask"><button type="button" class="btn btn-primary">添加新任务</button></a>
                        </div>
                    </div>


                    <table class="table  table-hover">
                        <th>选择</th>
                        <th>任务编号</th>
                        <th>标题</th>
                        <th>状态</th>
                        <th>优先级</th>
                        <th>操作</th>
                        <c:forEach var="task" items="${taskList }" varStatus="status">
                        	<tr>
                            <td><input type="checkbox" name="ids" value="${task.id }"></td>
                            <td>${task.taskNumber }</td>
                            <td>${task.title }</td>
                            <td>
                            	
                            	<c:choose>
                            		<c:when test="${task.status == 1 }"><span style="color:red">正在进行</span></c:when>
                            		<c:when test="${task.status == 2 }"><span style="color:	#32CD32">已完成</span></c:when>
                            		<c:when test="${task.status == 3 }"><span style="color:Gray">未开始</span></c:when>
                            	</c:choose>
                            </td>
                            <td>
                            	<c:choose>
                            		<c:when test="${task.level == 1 }">重要且紧急</c:when>
                            		<c:when test="${task.level == 2 }">重要不紧急</c:when>
                            		<c:when test="${task.level == 3 }">不重要紧急</c:when>
                            		<c:when test="${task.level == 4 }">不重要不紧急</c:when>
                            	</c:choose>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-warning btn-xs">标记为已完成</button>
                                    <button type="button" class="btn btn-warning dropdown-toggle btn-xs"
                                            data-toggle="dropdown">
                                        <span class="caret"></span>
                                        <span class="sr-only">切换下拉菜单</span>
                                    </button>
                                     
                                    <ul class="dropdown-menu" role="menu" id="action${task} }">
                                        <li><a href="${pageContext.request.contextPath }/updateTask?status=1&id=${task.id}">正在进行</a></li>
                                        <li><a href="${pageContext.request.contextPath }/updateTask?status=2&id=${task.id}">已完成</a></li>
                                        <li><a href="${pageContext.request.contextPath }/updateTask?status=3&id=${task.id}">未开始</a></li>
                                        <li class="divider"></li>
                                       
                                        <li><a onclick="javascript:demo(${task.id},${task.status });">删除</a></li>
                                    </ul>
                                </div>
                                <a href="${pageContext.request.contextPath }/toTaskAllocation?id=${task.id }"><button type="button" class="btn btn-primary btn-xs">详细</button></a>
                                
                            </td>
                        </tr>
                        </c:forEach>
                        
                        

                    </table>
                    <div class="panel-footer">
                        <ul class="pagination" style="margin:0">
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
<script type="text/javascript">
		function demo(id,b){
			if(b==2){
				alert("完成");
				return true;
			}
			else{
				
				msg="未完成,确定要删除？";
				if(confirm(msg)==true){
					$.post(getRealPath()+"/deleteTask?id="+id,function(data,status){
						if(status=="success")
							window.location.reload();
					}); 
				}else{
					
				}
				
			}
				
		}
	
	 function getRealPath(){
        var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
          return basePath ;
         } 
	 function bigAction(index){
		
		
			var values = new Array();
			var ids=document.getElementsByName('ids');
			for(var i = 0; i < ids.length; i++){
			     if(ids[i].checked){
			    	 values.push(ids[i].value);
			     }
		  } 
			$.post(getRealPath()+"/bigAction?ids="+values.toString()+"&status="+index,function(data,status){
				if(status=="success")
					window.location.reload();
			});
	 }
	 function bigDelete(){
			alert("ss");
			
			var values = new Array();
			var ids=document.getElementsByName('ids');
			for(var i = 0; i < ids.length; i++){
			     if(ids[i].checked){
			    	 values.push(ids[i].value);
			     }
		  } 
			$.post(getRealPath()+"/bigTaskDelete?ids="+values.toString(),function(data,status){
				if(status=="success")
					window.location.reload();
			});
	 }
	 function getChecked(){
		 var values = new Array();
			var ids=document.getElementsByName('ids');
			for(var i = 0; i < ids.length; i++){
			     if(ids[i].checked){
			    	 values.push(ids[i].value);
			     }
			}
		return values.toString();	     
	 }
	 
</script>
</body>
</html>