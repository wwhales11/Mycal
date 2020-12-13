<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% 

request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycal", "root", "1111"); 
Statement st = conn.createStatement(); 
%>

<html>

<head>
	<title>list</title>
	<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="../css/common.css">
</head>

<body>
	<div id="header-area" class="section">
			<a href="javascript:history.back();"><h3>한다 계산</h3></a>
	</div>
	<div style="height: 20%">
		<%
String str = "<table border=1>";
ResultSet rs = st.executeQuery("SELECT no, name, op1, sub1, op2, sub2 FROM algo");

str += "<tr>";
str += "<td width='100'>이름</td>";
str += "<td width='100'>op1</td>";
str += "<td width='100'>sub1</td>";
str += "<td width='100'>op2</td>";
str += "<td width='100'>sub2</td>";
str += "<td width='100'></td>";
str += "</tr>";

while(rs.next()) {
	str += "<tr>";
	str += "<td width='100'>" + rs.getString("name") + "</td>";
	str += "<td width='100'>" + rs.getString("op1") + "</td>";
	str += "<td width='100'>" + rs.getString("sub1") + "</td>";
	str += "<td width='100'>" + rs.getString("op2") + "</td>";
	str += "<td width='100'>" + rs.getString("sub2") + "</td>";
	str += "<td width='100'><a href='calDelete.jsp?no=" + rs.getString("no") + "'>";
	str += "<button>삭제</button>";
	str += "</a></td>";
	str += "</tr>";
	 
}

str += "</table>";
out.print(str);

rs.close();
st.close();
conn.close();

%>
	</div>
</body>

</html>