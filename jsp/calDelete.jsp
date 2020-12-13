<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
	String cno = request.getParameter("no");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycal", "root", "1111");
	
	String sql = "DELETE FROM algo WHERE no = ?";
	PreparedStatement st = conn.prepareStatement(sql);
	st.setString(1, cno);
	
	int cnt = st.executeUpdate();
	
	String res = (cnt == 0) ? "삭제를  실패했습니다." : "삭제되었습니다.";
	
	st.close();
	conn.close();
%>
	<script>alert('<%= res %>');</script> 
	<script>window.location.replace("callist.jsp")</script>