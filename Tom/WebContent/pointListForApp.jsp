<%@page import="org.tom.domain.PointVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.Reader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

ArrayList<PointVO> pointList = (ArrayList<PointVO>)request.getAttribute("pointList");
JSONObject pointJson = new JSONObject();
JSONArray itemList = new JSONArray();

for(int i=0; i<pointList.size();i++){
	JSONObject temp = new JSONObject();
	temp.put("point_index", pointList.get(i).getPoint_index());
	temp.put("point_name", pointList.get(i).getPoint_name());
	temp.put("point_longitude", pointList.get(i).getPoint_longitude());
	temp.put("point_latitude", pointList.get(i).getPoint_latitude());
	temp.put("point_address", pointList.get(i).getPoint_address());
	temp.put("bluetooth_address", pointList.get(i).getBluetooth_address());
	
	if(pointList.get(i).getHunting_count() != 0){// 수정 필요
		temp.put("reset_date", pointList.get(i).getReset_date());
		temp.put("hunting_count", pointList.get(i).getHunting_count());
	}else{
		temp.put("reset_date","");
		temp.put("hunting_count", 0);
	}
	itemList.add(temp);
}
pointJson.put("total", pointList.size());
pointJson.put("item", itemList);
request.setAttribute("pointList", pointJson);



%>

<%=pointJson%>