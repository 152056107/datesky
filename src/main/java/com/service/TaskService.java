package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bean.Task;
import com.dao.TaskMapper;


public interface TaskService {
	
	public List<Task> selectAll();

	public int addTask(Task task);
	
	public int updateStatus(long id,String status);

	public void deleteTask(Long id);

	public Task selectById(Long id);
}
