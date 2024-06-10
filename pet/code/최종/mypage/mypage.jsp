<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="en">

<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
    String pno = request.getParameter("pno");
    Connection con = null;
    PreparedStatement pstmt = null;

    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";
    String uid = (String) session.getAttribute("id");

    // 'id'가 null이거나 빈 문자열인 경우 로그인 페이지로 이동
    if (uid == null || uid.trim().isEmpty()) {
        response.sendRedirect("../mypage/mypage.html");
        return;
    }

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");

        // 여기서부터는 member 테이블을 조회하는 부분
        pstmt = con.prepareStatement("SELECT member.*, animal_adopt.animal_breed FROM member LEFT JOIN animal_adopt ON member.id = animal_adopt.ID WHERE member.id = ?");
        pstmt.setString(1, uid);
        ResultSet result = pstmt.executeQuery();
        
%>

<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="./mypage.css">
    <link href="./bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="./contact-input-style.css">
    <link rel="stylesheet" href="./hover-effect.css">
</head>
<body>
    <nav class="navbar navbar-default top-bar affix" data-spy="affix" data-offset-top="250">
        <div class="container">
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
                    <%
                       if (uid == null) {
                    %>
                        <li><a href="../login/sign.html">로그인</a></li>
                    <%
                       } else {
                    %>
                    <li class="dropbtn_click" onclick="dropdown()">
                        <%=uid%>님
                        <select class="filter-select" id="on-off" name="neutralization" onchange="handleSelectionChange(this)">
                            <option value="">내정보</option>
                            <option value="out">로그아웃</option>
                            <option value="mypage">마이페이지</option>
                        </select>
                    </li>
                    
                    <script>
                        function handleSelectionChange(selectElement) {
                            var selectedValue = selectElement.value;
                            
                            if (selectedValue === 'out') {
                                var confirmLogout = confirm('로그아웃하시겠습니까?');
                                if (confirmLogout) {
                                    alert('로그아웃되었습니다.');
                                    // 실제 로그아웃 처리를 위한 페이지로 이동 등의 작업을 추가할 수 있습니다.
                                    window.location.href = '../login/logout.jsp'; // 로그아웃 페이지로 이동 예시
                                }
                            } else if (selectedValue === 'mypage') {
                                alert('마이페이지로 이동합니다.');
                                // 실제 마이페이지로 이동하는 페이지의 URL로 변경해도 됩니다.
                                window.location.href = '../mypage/mypage.jsp'; // 마이페이지로 이동 예시
                            }
                        }
                    </script>
                    <%
                        }
                    %>
                    <li><a href="../survey/survey.jsp">설문하러 가기</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <header>
        <h1>마이페이지</h1>
    </header>

    <section>


        <div class="user-info">
            <h2>사용자 이름: <%= uid %>님</h2>
        

        
                     
<%
    if (result.next()) {
   
%>
        <p>이메일 주소: <%= result.getString("email") %></p>  
        </div>
<%
   }
%> 
    <div class="user-activities">
      <h2>입양 내역</h2>
    
<%
        while (result.next()) {
%>
            <div class="activity-item">
                <p>입양품종:  <%= result.getString("animal_breed") %></p>
                <span>진행상태: 진행중</span>
            </div>
<%
   }
%>     
            <div class="activity-item">
                <p>설문 결과</p>
                <span><a href="../main/recommend.jsp">확인하기</a></span>
            </div>
           
    </div> 
    </section>

<%
        
        result.close();
    } catch (Exception e) {
        out.println("MySql 데이터베이스의 member 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
%>

</body>
</html>
