<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>���� ���� �˰���</title>
</head>
<body>

<%@ page import="java.sql.*" %>


<hr><center>
<h2>���� �˰���</h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";
    String sql = "select * from survey";
    int rowCount = 0;
    String str[] = { "JSP��", "����", "���", "�ִ�" };
    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        pstmt = con.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();
%>
  <table border=1 cellpadding=1>
  <tr>
    <th width=50>��ȣ</th>
    <th width=80>���̵�</th>
    <th width=80>�̸�</th>
    <th width=80>���г⵵</th>
    <th width=80>�а�</th>
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
    	out.println("MySql �����ͺ��̽� univdb�� student ��ȸ�� ������ �ֽ��ϴ�. <hr>");
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
		out.println("��ȸ�� ����� �����ϴ�.");
	else 
		out.println("��ȸ�� ����� " + rowCount + "�� �Դϴ�.");    
        out.println(answer1);
%>
</font>
<br>
<a href="input.html">�űԵ��</a>

</body>
</html>