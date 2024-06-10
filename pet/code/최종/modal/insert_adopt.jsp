<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>입양 정보 연동 페이지</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
    String pno = request.getParameter("pno");
    Connection con = null;
    PreparedStatement pstmt = null;
    Statement stmt = null;

    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";
    String uid = (String) session.getAttribute("id");
    

    StringBuffer SQL = new StringBuffer("insert into animal_adopt (ID, NAME, PHONE, DAY, pno, animal_breed)");
    SQL.append("values (?, ?, ?, ?, ?, ?)");

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");

        pstmt = con.prepareStatement(SQL.toString());
        pstmt.setString(1, uid);
        pstmt.setString(2, request.getParameter("NAME"));
        int phone = Integer.parseInt(request.getParameter("PHONE"));
        pstmt.setInt(3, phone);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date parsedDate = dateFormat.parse(request.getParameter("DAY"));
        pstmt.setDate(4, new java.sql.Date(parsedDate.getTime()));
        pstmt.setString(5, pno);
        String animal_breed = request.getParameter("animal_breed");
        pstmt.setString(6, animal_breed);

        int rowCount = pstmt.executeUpdate();


        stmt = con.createStatement();

    } catch (Exception e) {
        out.println("<p>MySql 데이터베이스의 animal_adopt 조회에 문제가 있습니다.</p>");
        out.println("<p>" + e.toString() + "</p>");
        out.println(request.getParameter("ID"));
        out.println(request.getParameter("NAME"));
        out.println(request.getParameter("PHONE"));
        out.println(request.getParameter("DAY"));
        out.println(request.getParameter("pno"));
        out.println(request.getParameter("animal_breed"));

        e.printStackTrace();
    } finally {
        // 자원 해제
        if (pstmt != null) pstmt.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>

<!-- 페이지 이동 -->
<script>
    setTimeout(function () {
        window.location.href = "../mypage/mypage.jsp";
    }, 0);
</script>

</body>
</html>
