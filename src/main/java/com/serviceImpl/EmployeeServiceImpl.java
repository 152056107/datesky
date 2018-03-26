package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Employee;
import com.dao.EmployeeMapper;
import com.service.EmployeeService;
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	@Override
	public void addEmployee(Employee employee) {
		employeeMapper.insert(employee);
		
	}
	@Override
	public List<String> getMacsByScanId(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean recordUnscanedMac(String mac) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public List<Employee> findAll() {
		List<Employee> employeeList = employeeMapper.selectAll();
		return employeeList;
	}
	@Override
	public Employee selectById(Long id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
	@Override
	public void updateById(Employee employee) {
		System.out.println(employee.toString());
		employeeMapper.updateByPrimaryKey(employee);
		
	}
	@Override
	public void deleteById(Long id) {
		employeeMapper.deleteByPrimaryKey(id);
		
	}
	@Override
	public List<Employee> findByPage(int startRow, int pageSize) {
		List<Employee> employeeList = employeeMapper.selectByPage(startRow,pageSize);
		return employeeList;
	}

}
