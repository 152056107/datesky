package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Task;
import com.service.TaskService;

@Controller
public class TaskController {
	@Autowired
	private TaskService taskService;
	
	@RequestMapping("/toAddTask")
	public String toAddTask() {
		
		return "task_detail";
	}
	@RequestMapping("/toTaskList")
	public ModelAndView toTaskList() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("task_list");
		List<Task> taskList= taskService.selectAll();
		
		mv.addObject("taskList", taskList);
		
		
		return mv;
	}
	@RequestMapping("/toTaskAllocation")
	public ModelAndView toTaskAllocation(Long id) {
		System.out.println(id);
		ModelAndView mv=new ModelAndView();
		Task task = taskService.selectById(id);
		System.out.println(task.toString());
		mv.addObject("task", task);
		mv.setViewName("task_allocation");
		return mv;
	}
	@RequestMapping("/addTask")
	public ModelAndView addTask(String taskNumber,String title,String description,int level,String status ) {
		ModelAndView mv=new ModelAndView();
		Task task=new Task(taskNumber, title, description, level, status);
		taskService.addTask(task);
		mv.setViewName("task_list");
		List<Task> taskList = taskService.selectAll();
		mv.addObject("taskList", taskList);
		return mv;
	}
	
	@RequestMapping("/updateTask")
	public ModelAndView updateTask(Long id,String status) {
		taskService.updateStatus(id, status);
		List<Task> taskList = taskService.selectAll();
		ModelAndView mv=new ModelAndView();
		mv.addObject("taskList", taskList);
		mv.setViewName("task_list");
		return mv;
	}
	@RequestMapping("/deleteTask")
	public ModelAndView deleteTask(Long id) {
		taskService.deleteTask(id);
		List<Task> taskList = taskService.selectAll();
		ModelAndView mv=new ModelAndView();
		mv.addObject("taskList", taskList);
		mv.setViewName("task_list");
		return mv;
	}
	@RequestMapping("/toAllocation")
	public ModelAndView toAllocation() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("allocation");
		return mv;
	}
	@RequestMapping("/bigAction")
	public ModelAndView bigAction(String ids,String status) {
		ModelAndView mv=new ModelAndView();
		String[] id = ids.split(",");
		for(String i:id) {
			taskService.updateStatus(Long.parseLong(i), status);
		}
		mv.setViewName("task_list");
		List<Task> taskList = taskService.selectAll();
		mv.addObject("taskList", taskList);
		return mv;
	}
	@RequestMapping("/bigTaskDelete")
	public ModelAndView bigTaskDelete(String ids) {
		ModelAndView mv=new ModelAndView();
		String[] id = ids.split(",");
		for(String i:id) {
			taskService.deleteTask(Long.parseLong(i));
		}
		mv.setViewName("task_list");
		List<Task> taskList = taskService.selectAll();
		mv.addObject("taskList", taskList);
		return mv;
	}
}
