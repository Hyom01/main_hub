<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
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
            // ���� �޽����� alert â���� ǥ��
                alert('ȸ�������� �Ϸ�Ǿ����ϴ�!');
                
            }

    // ȸ������ ��Ŀ� �̺�Ʈ ������ ���
        document.getElementById('register').addEventListener('submit', function (event) {
            // ���� ȸ������ ó�� ������ ���⿡ �߰�
            // ...

            // ȸ������ ���� �� �޽����� ǥ��
            showSuccessMessage();
            
            // ���� �⺻ ���� ����
            event.preventDefault();
        });
    </script>
<%
   }
        
        
        stmt = con.createStatement();

    }
    catch(Exception e) {
    	out.println("MySql �� ������ �ֽ��ϴ�. <hr>");
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