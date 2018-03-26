package com.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * 该类用于记录探针扫描不到员工的次数；
 * 探针的频率为1秒1次，当探针连续30次都扫描不到某个员工的mac，说明员工不在岗
 * 
 * key为mac.
 * value为次数
 * @author king
 *
 */
public class Counter {
	public static Map<String,Integer> map=new HashMap<String,Integer>();
}
