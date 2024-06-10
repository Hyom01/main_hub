<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>설문 조사 알고리즘</title>
</head>
<body>

<%@ page import="java.sql.*" %>


<hr><center>
<h2>설문 알고리즘</h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";
    String sql = "select * from survey";
    int rowCount = 0;
    String str[] = { "JSP가", "정말", "재미", "있다" };
    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        pstmt = con.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();
%>
  <table border=1 cellpadding=1>
  <tr>
    <th width=50>번호</th>
    <th width=80>아이디</th>
    <th width=80>이름</th>
    <th width=80>입학년도</th>
    <th width=80>학과</th>
  </tr>
<%
  while (result.next()) {
   
    String answer1 = result.getString(1);
%>
  <tr>
    <td align=center><%= result.getString(2) %></td>
    <td align=center><%= result.getString(3) %></td>     
    <td align=center><%= result.getString(4) %></td>
    <td align=center><%= result.getString(5) %></td>
  </tr>
<%
	rowCount++;
    }
    result.close();        
    }
    catch(Exception e) {
    	out.println("MySql 데이터베이스 univdb의 student 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
%>
</table>
</center>

<p><hr><font color=blue>
<%
	if (rowCount == 0) 
		out.println("조회된 결과가 없습니다.");
	else 
		out.println("조회된 결과가 " + rowCount + "건 입니다.");    
        out.println(answer1);
%>
</font>
<br>
<a href="input.html">신규등록</a>

</body>
</html>