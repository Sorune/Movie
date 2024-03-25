package com.firstgroup.movies.util;

import java.util.ArrayList;
import java.util.List;

public class Utility {
	public List<Long> parseToList(String listString){
		List<Long> parsingIntList = new ArrayList<Long>();
		String[] valueList = listString.replace(" ","").split(",");
		for(String value : valueList) {
			parsingIntList.add(Long.parseLong(value));
		}
		return parsingIntList; 
	}
	
	public long[] listToIntList(List<Long> list) {
		return list.stream().mapToLong(Long::longValue).toArray();
	}
}
