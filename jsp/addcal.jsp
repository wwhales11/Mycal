<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="core.*" %>
<%
	
	request.setCharacterEncoding("UTF-8");	

	String cname = request.getParameter("name");
	String cop1 = request.getParameter("op1");
	String csub1 = request.getParameter("sub1");
	String cop2 = request.getParameter("op2");
	String csub2 = request.getParameter("sub2");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycal",
			"root", "1111");
	Statement st = conn.createStatement();
	
	String str = "INSERT INTO algo(name, op1, sub1, op2, sub2) VALUES(";
	str += "'" + cname + "', ";
	str += "'" + cop1 + "', ";
	str += "'" + csub1 + "', ";
	str += "'" + cop2 + "', ";
	str += "'" + csub2 + "'";
	str += ")";
	int cnt = st.executeUpdate(str);
	
	String res = (cnt == 0) ? "입력을  실패했습니다." : "저장되었습니다.";
	%>
	<script>alert('<%= res %>');</script> 
	<script>window.location.replace("../html/fav.html")</script>

