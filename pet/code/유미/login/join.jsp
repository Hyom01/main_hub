<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>


<hr><center>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("insert into member(id, pw, email) "); 
    SQL.append("values (?, ?, ?)");

	String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";

    try {
		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");

        pstmt = con.prepareStatement(SQL.toString());
      
        pstmt.setString(1, request.getParameter("id"));
        pstmt.setString(2, request.getParameter("pw"));
        pstmt.setString(3, request.getParameter("email"));


        int rowCount = pstmt.executeUpdate();        
        if (rowCount == 1) {
  %> 
    <p><hr>
    <script>
        function showSuccessMessage() {
            // 성공 메시지를 alert 창으로 표시
                alert('회원가입이 완료되었습니다!');
                
            }

    // 회원가입 양식에 이벤트 리스너 등록
        document.getElementById('register').addEventListener('submit', function (event) {
            // 실제 회원가입 처리 로직을 여기에 추가
            // ...

            // 회원가입 성공 시 메시지를 표시
            showSuccessMessage();
            
            // 폼의 기본 동작 방지
            event.preventDefault();
        });
    </script>
<%
   }
        
        
        stmt = con.createStatement();

    }
    catch(Exception e) {
    	out.println("MySql 에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
	out.println("<meta http-equiv='Refresh' content='0;URL=./sign.html'>");
%>


</html>