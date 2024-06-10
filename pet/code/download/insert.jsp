<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>설문조사 jsp</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<h2>설문조사 jsp </h2>
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
        //삽입할 학생 레코드 데이터 입력
   
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
        if (rowCount == 1) out.println("<hr>학생 [" + answer1 + "] 레코드 하나가 성공적으로 삽입 되었습니다.<hr>");
        else out.println("학생 레코드 삽입에 문제가 있습니다.");
        
        //다시 학생 조회
        stmt = con.createStatement();

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
	out.println("<meta http-equiv='Refresh' content='1;URL=survey.html'>");
%>

<p><hr>

</body>
</html>