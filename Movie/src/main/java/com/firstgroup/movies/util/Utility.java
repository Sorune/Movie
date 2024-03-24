package com.firstgroup.movies.util;

import java.util.ArrayList;
import java.util.List;

public class Utility {
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
