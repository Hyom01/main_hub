<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� jsp</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<h2>�������� jsp </h2>
<hr><center>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("insert into survey(m_id, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9) "); 
    SQL.append("values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    //String name = request.getParameter("fname");
    String id = "hyomin";
    String answer1 = request.getParameter("1");    //A
    String answer2 = request.getParameter("2");     //b
    String answer3 = request.getParameter("3");        //c
    String answer4 = request.getParameter("4");     //d
    String answer5 = request.getParameter("5");     //e
    String answer6 = request.getParameter("6");     //f
    String answer7 = request.getParameter("7");     //g
    String answer8 = request.getParameter("8");      //h
    String answer9 = request.getParameter("9");    //i
	String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";

    try {
		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
 //       pstmt = con.prepareStatement(sql);
 //       pstmt.executeUpdate();

        pstmt = con.prepareStatement(SQL.toString());
        //������ �л� ���ڵ� ������ �Է�
   
        pstmt.setString(1, id);
        pstmt.setString(2, answer1);
        pstmt.setString(3, answer2);
        pstmt.setString(4, answer3);
        pstmt.setString(5, answer4);
        pstmt.setString(6, answer5);
        pstmt.setString(7, answer6);
        pstmt.setString(8, answer7);
        pstmt.setString(9, answer8);
        pstmt.setString(10, answer9);
        int rowCount = pstmt.executeUpdate();        
        if (rowCount == 1) out.println("<hr>�л� [" + answer1 + "] ���ڵ� �ϳ��� ���������� ���� �Ǿ����ϴ�.<hr>");
        else out.println("�л� ���ڵ� ���Կ� ������ �ֽ��ϴ�.");
        
        //�ٽ� �л� ��ȸ
        stmt = con.createStatement();

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
	out.println("<meta http-equiv='Refresh' content='1;URL=survey.html'>");
%>

<p><hr>

</body>
</html>