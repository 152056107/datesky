package com.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.bean.Employee;
import com.bean.Task;
import com.service.EmployeeService;
import com.service.TaskService;
import com.util.DataObject;
import com.util.UserData;

@Controller
public class MainController {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private TaskService taskService;
	/**
	 * 接受探针传过来的data，进行判断
	 * 思路：
	 * 0、获取探针的id,查找探针所监控的员工mac
	 * 1、查找当前所有应当在岗的员工mac，存放于list中
	 * 2、遍历list，判断mac是否被data字符串包含
	 * 3、不包含的话，判断Count.map中是否包含该mac，如包含，将该mac对应的value值归0；如mac不包含在Count.map的key中，添加它，并设它的value++
	 * @param data
	 */
	@RequestMapping("/work_and_relax")
	public void WorkAndRelax(String data,HttpServletRequest request) {
		
		System.out.println(data);
		if(data.contains("3c:47:11:c6:d9:52"))
			System.out.println("王金");
		if(data.contains("18:f0:e4:12:e1:1c"))
			System.out.println("李明");
		if(data.contains("d8:c4:6a:29:d5:c5"))
			System.out.println("号桌");
		if(data.contains("84:41:67:5b:70:37"))
			System.out.println("杨旭");
		getMac(getRemoteAddress(request));
	}
	
	
	@RequestMapping("/addUser")
	public void addUser(String name,int age) {
		
	}
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	
	public ModelAndView toEmployeeList() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("employee_list");
		List<Employee> employeeList = employeeService.findAll();
		mv.addObject("employeeList", employeeList);
		
		
		return mv;
	}
	@RequestMapping("/employee_list")
	public ModelAndView findByPage(String page) {
		//每页显示个数
				int pageSize=10;	
				List<Employee> employeeList = employeeService.findAll();
				//总页数
				int pageTimes;
				if(employeeList.size()%pageSize==0) {
					pageTimes=employeeList.size()/pageSize;
				}else {
					pageTimes=employeeList.size()/pageSize+1;
				}
				if(page==null) {
					page="1";
				}
				int startRow=(Integer.parseInt(page)-1)*pageSize;
				employeeList.clear();
				System.out.println("startRow:"+startRow+" pageSize:"+pageSize);
				employeeList = employeeService.findByPage(startRow, pageSize);
				ModelAndView mv=new ModelAndView();
				mv.setViewName("employee_list");
				mv.addObject("currentPage", Integer.parseInt(page));
				mv.addObject("pageTimes", pageTimes);
				/*for(Employee employee:employeeList) {
					System.out.println(employee.getType());
				}*/
				mv.addObject("employeeList", employeeList);
				return mv;
	}
	@RequestMapping("/toAddEmployee")
	public ModelAndView toAddEmployee() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("employee_add");
		return mv;
	}
	
	@RequestMapping("/addEmployee")
	public ModelAndView addEmployee(HttpServletRequest request,String password,String number,String name,String age,String gender,String phone) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("employee_add");
		Employee employee =new Employee();
		employee.setName(name);
		employee.setAge(Integer.parseInt(age));
		employee.setGender(gender);
		employee.setNumber(number);
		employee.setPhone(phone);
		employee.setPassword(password);
		employee.setMac(getMACAddress(getRemoteAddress(request)));
		employeeService.addEmployee(employee);
		List<Employee> employeeList = employeeService.findAll();
		mv.addObject("employeeList", employeeList);
		mv.setViewName("employee_list");
		return mv;
		
		
	}
	@RequestMapping(value="/toEmployeeModify",method=RequestMethod.GET)
	public ModelAndView toEmployeeModify(Long id) {
		ModelAndView mv=new ModelAndView("employee_modify");
		Employee employee = employeeService.selectById(id);
		mv.addObject("employee", employee);
		return mv;
	}
	
	@RequestMapping("/employeeModify")
	public ModelAndView employeeModify(String name,String age,String number,String phone,String password,String gender,String id ) {
		ModelAndView mv=new ModelAndView();
		System.out.println(name+" "+phone+" "+password);
		Employee employee =new Employee();
		employee.setName(name);
		System.out.println(id);
		employee.setId(Long.parseLong(id));
		employee.setAge(Integer.parseInt(age));
		employee.setGender(gender);
		employee.setNumber(number);
		employee.setPhone(phone);
		employee.setPassword(password);
		employeeService.updateById(employee);
		List<Employee> employeeList = employeeService.findAll();
		mv.addObject("employeeList", employeeList);
		mv.setViewName("employee_list");
		return mv;
		
	}
	
	@RequestMapping("/employeeDelete")
	public ModelAndView employeeDelete(Long id) {
		ModelAndView mv=new ModelAndView();
		employeeService.deleteById(id);
		List<Employee> employeeList =  employeeService.findAll();
		mv.addObject("employeeList", employeeList);
		mv.setViewName("employee_list");
		return mv;
	}
	@RequestMapping("/toEmployeeDetail")
	public ModelAndView employeeDetail(Long id) {
		ModelAndView mv=new ModelAndView();
		Employee employee = employeeService.selectById( id);
		mv.addObject("employee", employee);
		mv.setViewName("employee_detail");
		return mv;
		
	}
	@RequestMapping("/uploadMac")
	public String uploadMac(String employeeId,HttpServletRequest request) {
		
		System.out.println(employeeId);
		String macAddress = getMACAddress(getRemoteAddress(request));
		System.out.println(macAddress);
		return "mobile";
	}
	@RequestMapping("/bigEmployeeDelete")
	public ModelAndView bigEmployeeDelete(String values) {
		ModelAndView mv=new ModelAndView();
		System.out.println(values);
		String[] ids = values.split(",");
		for(String id:ids) {
			employeeService.deleteById(Long.parseLong(id));
		}
		List<Employee> employeeList = employeeService.findAll();
		mv.addObject("employeeList", employeeList);
		mv.setViewName("employee_list");
		return mv;
	}
	
	public void getMac(String ip) {
		String macStr = "";//MAC网卡地址
		try {
		    /*InetAddress address = InetAddress.getLocalHost();//取得本地Ip地址
		    System.out.println("getLocalHost:" + address.toString());*/
		    InetAddress address = InetAddress.getByName(ip);
		    NetworkInterface ni = NetworkInterface.getByInetAddress(address);
		    if (ni != null) {
		        byte[] mac = ni.getHardwareAddress();
		        if (mac != null) {
		            for (int i = 0; i < mac.length; i++) {
		                System.out.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : "");
		                macStr = macStr + String.format("%02X%s",mac[i],(i < mac.length - 1) ? "-" : "");//格式化输出
		            }
		        } else {
		            System.out.println("Address doesn't exist or is not accessible.");
		        }
		    } else {
		        System.out.println("Network Interface for the specified address is not found.");
		}
		} catch (UnknownHostException ex) {
		    ex.printStackTrace();
		} catch (SocketException ex1) {
		    ex1.printStackTrace();
		}
		
	}
	

	 public String getMACAddress(String ip) {
	        String str = "";
	        String macAddress = "";
	        try {
	            Process p = Runtime.getRuntime().exec("nbtstat -a " + ip);
	            InputStreamReader ir = new InputStreamReader(p.getInputStream());
	            LineNumberReader input = new LineNumberReader(ir);
	            for (int i = 1; i < 100; i++) {
	                str = input.readLine();
	                if (str != null) {
	                    //if (str.indexOf("MAC Address") > 1) {
	                    if (str.indexOf("MAC") > 1) {
	                        macAddress = str.substring(
	                                str.indexOf("=") + 2, str.length());
	                        break;
	                    }
	                }
	            }
	        } catch (IOException e) {
	            e.printStackTrace(System.out);
	        }
	        System.out.println(macAddress);
	        return macAddress;
	    }
	 public String getRemoteAddress(HttpServletRequest request) {
	        String ip =  request.getHeader("x-forwarded-for");
	        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
	            ip = request.getRemoteAddr();
	        }
	        System.out.println(ip);
	        return ip;
	    }
}
