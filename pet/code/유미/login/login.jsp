<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>�α���</title>
</head>
<body>

<%@ page import="java.sql.*" %>

<h2>�α��� ȭ��</h2>
<hr><center>
<h2>�α���</h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";
    String sql = "select * from member";
    int rowCount = 0;
    int code = 0;
   
    String uid = request.getParameter("id");
    String upw = request.getParameter("pw");
   
    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        pstmt = con.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();


  while (result.next()) {

	rowCount++;
   

        if (uid.equals(result.getString("id"))) {
            code = 1;
		    session.setAttribute("id", uid);
            response.sendRedirect("../main/main.jsp");
        }
        else {
            code = 0;
        }
   
        out.println(code);
        out.println(result.getString("id"));
        out.println(uid);
   

    }
   
    result.close();        
    }
    catch(Exception e) {
    	out.println("MySql �����ͺ��̽� ģ����� ��ȸ�� ������ �ֽ��ϴ�. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
%>
<%
   if (code == 0) {
        out.println("���̵� �������� �ʽ��ϴ�.");
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
%>
</font>
