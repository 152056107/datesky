package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Task;
import com.dao.TaskMapper;
import com.service.TaskService;
@Service("taskService")
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskMapper taskMapper;
	
	
	public List<Task> selectAll() {
		List<Task> taskList = taskMapper.selectAll();
		return taskList;
	}


	@Override
	public int addTask(Task task) {
		int insert = taskMapper.insert(task);
		return insert;
	}


	@Override
	public int updateStatus(long id, String status) {
		Task task = taskMapper.selectByPrimaryKey(id);
		task.setStatus(status);
		int count = taskMapper.updateByPrimaryKeySelective(task);
		return count;
	}


	@Override
	public void deleteTask(Long id) {
		
		taskMapper.deleteByPrimaryKey(id);
	}


	@Override
	public Task selectById(Long id) {
		Task task = taskMapper.selectByPrimaryKey(id);
		
		return task;
		
	}

}
