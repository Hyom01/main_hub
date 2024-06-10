<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("euc-kr");

    Connection con = null;
    PreparedStatement pstmt = null;
    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";
    String uid = (String) session.getAttribute("id");
    session.setAttribute("id", uid);
   
    // 페이지당 표시할 항목 수
    int itemsPerPage = 15;

    // 현재 페이지
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

    // 시작 항목 인덱스
    int startIndex = (currentPage - 1) * itemsPerPage;

    // SQL 쿼리에 LIMIT 구문 추가
   String sql = "SELECT animals_info.id, MAX(result.id) AS result_id, MAX(result.total) AS total, "
        + "MAX(animals_info.SPECIES_NM) AS SPECIES_NM, MAX(animals_info.STATE_NM) AS STATE_NM, "
        + "MAX(animals_info.IMAGE_COURS) AS IMAGE_COURS, MAX(animals_info.name) AS name "
        + "FROM animals_info INNER JOIN result ON animals_info.id = result.animal_num AND result.id = '"
        +uid
        + "'"
        + "GROUP BY animals_info.id ORDER BY total DESC LIMIT 7";
    
    int rowCount = 0;

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        pstmt = con.prepareStatement(sql);
        


        ResultSet result = pstmt.executeQuery();
        while (result.next()) {

%>

<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>메인화면</title>
    <link href="./bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href="./main.css" rel="stylesheet">
    <link rel="stylesheet" href="./contact-input-style.css">
    <link rel="stylesheet" href="./hover-effect.css">
    <link rel="stylesheet" type="text/css" href="./font-awesome.min.css" />
    <script src="./main.js"></script>
  </head>

  <body>
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
                    <% 
                       if (uid == null) {
                    %>
                        <li ><a href="../login/sign.html">로그인을 해주세요</a></li>
                    <%
                       }
                       else {
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
                    <li><a href="../survey.html">설문하러 가기</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>
<!--
<section class="banner-sec" id="home">
    <div class="container">
    <div class="jumbotron">
    <h1>검색하기</h1>

    <div class="input-group">
        <input type="text" id="search-bar" class="form-control" onclick="showOptions()" placeholder="검색어를 입력하세요">
        <span class="input-group-btn">
        <button type="button" class="btn btn-search">search</button>
        </span>
                    
    </div>
    <div class="options-container">
        <label><input type="radio" name="options"> 암컷</label>
        <label><input type="radio" name="options"> 수컷</label>
        <label><input type="checkbox"> 유아</label>
        <label><input type="checkbox"> 성견</label>
        <label><input type="checkbox"> 강아지</label>
        <label><input type="checkbox"> 고양이</label>
    </div>
    </section>

검색부분 백엔드 -->


    <div class="container">
        <div class="row">
            <h2 class="text-center">입양 추천 목록</h2>
            <h4 class="text-center"> 설문조사를 바탕으로 추천드리는 아이들입니다.</h4>
        </div>
          <%
               while (result.next()) {
          %>
          
          <div class="col-lg-4 col-md-4 col-sm-6 text-center service-block up-effect">
               <br>
               <img class="animal-image" src="<%= result.getString("IMAGE_COURS") %>" alt="이미지를 준비중입니다.">
               <h3><%= result.getString("SPECIES_NM") %></h3>
               <p><%= result.getString("STATE_NM") %></p>
               <button type="button" class="btn btn-more"><a href=../modal/more.jsp?pno=<%= result.getString("name") %>>더보기</a></button>
          </div>
          <%
               }
          %>
    </div>

<%
    rowCount++; 
    }
    result.close();      
    }
    catch(Exception e) {
        out.println("MySql 데이터베이스의 animal 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
  
%>


</body>
</html>