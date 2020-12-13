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
	<title>favorite</title>
	<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="../css/common.css">
</head>

<body>
	<div id="header-area" class="section">
	<a href="javascript:history.back();">
		<h3>한다 계산</h3></a>
	</div>
<div style="height: 20%; font-size: 0.8em">
<%
String q = request.getParameter("my");
int mycal = Integer.parseInt(q);

String str = "<table border=1>";
ResultSet rs = st.executeQuery("SELECT name, sub1, op1, sub2, op2 FROM algo"); //db 적용순서대로

str += "<tr>";
str += "<td width='100'>이름</td>";
str += "<td width='100'>대입값</td>";
str += "<td width='100'>op1</td>";
str += "<td width='100'>op2</td>";
str += "<td width='100'>결과값</td>";
str += "</tr>";
while(rs.next()) {

str += "<tr>";
str += "<td width='100'>" + rs.getString("name") + "</td>";
str += "<td width='100'>" + mycal + "</td>";

int csub1=rs.getInt("sub1");
int csub2=rs.getInt("sub2");
String cop1 = rs.getString("op1");
String cop2 = rs.getString("op2");
int res1 = 0;
int res2 = 0;

if(cop1.equals("+")) //덧셈뺄셈 마지막
	  res1=mycal+csub1;
if(cop1.equals("-"))
	  res1=mycal-csub1;
if(cop1.equals("*")) //곱셈나눗셈먼저
	  res1=mycal*csub1;
if(cop1.equals("/"))
	  res1=mycal/csub1;
if(cop1.equals("%"))
	  res1=mycal%csub1;

	str += "<td width='100'>" + cop1 + csub1 + "</td>";



if(cop2.equals(""))
	  res2=res1;
if(cop2.equals("+"))
	  res2=res1+csub2;
if(cop2.equals("-"))
	  res2=res1-csub2;
if(cop2.equals("*"))
	  res2=res1*csub2;
if(cop2.equals("/"))
	  res2=res1/csub2;
if(cop2.equals("%"))
	  res2=res1%csub2;
	
String nop2 = cop2 + csub2;

if(nop2.equals("0"))
	nop2="-";


	str += "<td width='100'>" + nop2 + "</td>";
	str += "<td width='100'>" + res2 + "</td>";
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
