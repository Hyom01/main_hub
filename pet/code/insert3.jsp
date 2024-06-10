<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>설문조사 jsp</title>

    <link rel="stylesheet" href="./survey.css">
    <link href="./bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="./contact-input-style.css">
    <link rel="stylesheet" href="./hover-effect.css">
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<nav class="navbar navbar-default top-bar affix" data-spy="affix" data-offset-top="250" >
    <div class="container" >
        <div class="navbar-header page-scroll">
            <button data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" class="navbar-toggle" type="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="../main/main.jsp" class="navbar-brand">동물 발자국</a>
        </div>
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login/test.html"><%=uid%>님</a></li>
                <li><a href="#about">설문하러 가기</a></li>
            </ul>
        </div>
    </div>
</nav>

<img src="./Spinner-1s-200px.gif" alt="">

<%  
    String uid = (String) session.getAttribute("id");
    session.setAttribute("id", uid);
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("insert into survey2(id, answer) "); 
    SQL.append("values (?,?),");
    SQL.append("(?,?),");
    SQL.append("(?,?),");
    SQL.append("(?,?),");
    SQL.append("(?,?),");
    SQL.append("(?,?),");
    SQL.append("(?,?),");
    SQL.append("(?,?),");
    SQL.append("(?,?)");
 

   
    String answer1 = request.getParameter("1");     //A
    String answer2 = request.getParameter("2");     //b
    String answer3 = request.getParameter("3");     //c
    String answer4 = request.getParameter("4");     //d
    String answer5 = request.getParameter("5");     //e
    String answer6 = request.getParameter("6");     //f
    String answer7 = request.getParameter("7");     //g
    String answer8 = request.getParameter("8");     //h
    String answer9 = request.getParameter("9");     //i
	String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";

    try {
		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
 //       pstmt = con.prepareStatement(sql);
 //       pstmt.executeUpdate();

        pstmt = con.prepareStatement(SQL.toString());
        //삽입할 학생 레코드 데이터 입력
   
        pstmt.setString(1, uid);
        pstmt.setString(2, answer1);
        pstmt.setString(3, uid);
        pstmt.setString(4, answer2);
        pstmt.setString(5, uid);
        pstmt.setString(6, answer3);
        pstmt.setString(7, uid);
        pstmt.setString(8, answer4);
        pstmt.setString(9, uid);
        pstmt.setString(10, answer5);
        pstmt.setString(11, uid);
        pstmt.setString(12, answer6);
        pstmt.setString(13, uid);
        pstmt.setString(14, answer7);
        pstmt.setString(15, uid);
        pstmt.setString(16, answer8);
        pstmt.setString(17, uid);
        pstmt.setString(18, answer9);
   
        int rowCount = pstmt.executeUpdate();        
    //    if (rowCount == 9) out.println("<hr>학생 [" + rowCount + "] 레코드 하나가 성공적으로 삽입 되었습니다.<hr>");
    //    else out.println("학생 레코드 삽입에 문제가 있습니다."+rowCount +" ");
        
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
	out.println("<meta http-equiv='Refresh' content='1;URL=result.jsp'>");
%>

<p><hr>

</body>
</html>