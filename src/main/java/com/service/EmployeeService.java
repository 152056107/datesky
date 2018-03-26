package com.service;

import java.util.List;

import com.bean.Employee;

public interface EmployeeService {
	public void addEmployee(Employee employee);
	
	/**
	 * 通过探针的id查找探针所监控的员工mac
	 * @param id
	 * @return
	 */
	public List<String> getMacsByScanId(String id);
	
	/**
	 * 将探针不包含的mac记录在Count.map中，并判断value是否大于30
	 * @param mac
	 */
	public boolean recordUnscanedMac(String mac);
	
	public List<Employee> findAll();

	public Employee selectById(Long id);

	public void updateById(Employee employee);

	public void deleteById(Long id);

	public List<Employee> findByPage(int startRow, int pageSize);
}
