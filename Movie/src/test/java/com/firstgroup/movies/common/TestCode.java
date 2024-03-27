package com.firstgroup.movies.common;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TestCode {
	
	@Test
	public void stringParser() {
		String intList = "{1,2,3,4}";
		List<Integer> list = new ArrayList<Integer>();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		log.info(list);
		int[] intValues = list.stream().mapToInt(Integer::intValue).toArray();
		for(int intVal : intValues) {
			log.info(intVal);
		}
		String parsingList = list.toString();
		log.info(parsingList);
		String values = parsingList.substring(1,parsingList.length()-1);
		log.info(values);
		String[] valueList = values.replace(" ","").split(",");
		List<Integer> parsingIntList = new ArrayList<Integer>();
		for(String value : valueList) {
			log.info(value);
			log.info(Integer.parseInt(value));
			parsingIntList.add(Integer.parseInt(value));
		}
	}
	
	public List<Integer> parseToList(String listString){
		List<Integer> parsingIntList = new ArrayList<Integer>();
		String[] valueList = listString.replace(" ","").split(",");
		for(String value : valueList) {
			parsingIntList.add(Integer.parseInt(value));
		}
		return parsingIntList;
	}
	
	public int[] listToIntList(List<Integer> list) {
		return list.stream().mapToInt(Integer::intValue).toArray();
	}
}
