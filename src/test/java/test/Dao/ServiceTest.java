package test.Dao;

import java.util.Map;
import java.util.Map.Entry;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bean.Employee;
import com.dao.EmployeeMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-mybatis.xml"})
public class ServiceTest {
/*	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private EmployeeJobMapper employeeJobMapper;
	
	@Test
	public void test() {		
		Employee record =new Employee();
		record.setJobNumber("152056102");
		record.setName("郭浩卓");
		record.setMac("11:22:33:44:55:66");
		employeeMapper.insert(record );
	}
	@Test
	public void test2() {
		Map<String, Long> ids = employeeJobMapper.selectIdsByJobId(1l);
		for(Entry<String, Long> entry:ids.entrySet() ) {
			System.out.println(entry.getKey()+"  "+entry.getValue());
		}
	}*/
}
