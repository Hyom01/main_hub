<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("euc-kr");
    String uid = (String) session.getAttribute("id");
    session.setAttribute("id", uid);
    Connection con = null;
    PreparedStatement pstmt = null;
    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";

    // 페이지당 표시할 항목 수
    int itemsPerPage = 15;

    // 현재 페이지
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

    // 시작 항목 인덱스
    int startIndex = (currentPage - 1) * itemsPerPage;

    // SQL 쿼리에 LIMIT 구문 추가
    String sql = "select id, name, STATE_NM, SPECIES_NM, IMAGE_COURS from animals_info LIMIT ?, ?";
    
    int rowCount = 0;

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        pstmt = con.prepareStatement(sql);
        
        pstmt.setInt(1, startIndex);
        pstmt.setInt(2, itemsPerPage);

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
                <a href="./main.jsp" class="navbar-brand">동물 발자국</a>
            </div>
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <% 
                       if (uid == null) {
                    %>
                        <li ><a href="../login/sign.html">로그인</a></li>
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
                    <li><a href="../survey/survey.jsp">설문하러 가기</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>
                            

<section class="banner-sec" id="home">
    <div class="container">
    <div class="jumbotron">
    <h1>검색하기</h1>
<form method= "post" action="../main/search.jsp"> 
    <div class="input-group">
        <input type="text" name="search" id="search-bar" class="form-control" onclick="showOptions()" placeholder="검색어를 입력하세요">
        <div class="search-container">
            <select class="filter-select" id="animalType" name="breed">
                <option value="">품종</option>
                <option value="1">믹스견</option>
                <option value="2">한국 고양이</option>
                <option value="3">푸들</option>
                <option value="4">말티즈</option>
                <option value="5">믹스묘</option>
                <option value="6">포메라니안</option>
                <option value="7">비숑 프리제</option>
                <option value="8">진도견</option>
                <option value="9">치와와</option>
                <option value="10">시츄</option>
                <option value="11">시바</option>
                <option value="12">라브라도 리트리버</option>
                <option value="13">도사</option>
                <option value="14">요크셔 테리어</option>
                <option value="15">골든 리트리버</option>
                <option value="16">스피츠</option>
                <option value="17">웰시 코기 펨브로크</option>
                <option value="18">시베리안 허스키</option>
                <option value="19">보더 콜리</option>
                <option value="20">프렌치 불독</option>
                <option value="21">도사 믹스견</option>
                <option value="22">닥스훈트</option>
                <option value="23">페르시안</option>
                <option value="24">러시안 블루</option>
                <option value="25">코카 스파니엘</option>
                <option value="26">슈나우져</option>
                <option value="27">보스턴 테리어</option>
                <option value="28">터키시 앙고라</option>
                <option value="29">미니어쳐 핀셔</option>
                <option value="30">포인터</option>
                <option value="31">레그돌</option>
                <option value="32">스코티시폴드</option>
                <option value="33">스탠다드 푸들</option>
            </select>
            <select class="filter-select" id="gender" name="gender">
                <option value="">성별</option>
                <option value="F">F</option>
                <option value="M">M</option>
            </select>
            <select class="filter-select" id="on-off" name="neutralization">
                <option value="">중성화 여부</option>
                <option value="Y">유</option>
                <option value="N">무</option>
                <option value="U">확인 불가</option>
            </select>
            <script>
                function search() {
                    var keyword = document.getElementById('keyword').value;
                    var animalType = document.getElementById('animalType').value;
                    var gender = document.getElementById('gender').value;
                    var neutered = document.getElementById('on-off').value;
                    
                    // 검색어와 필터 정보를 이용한 로직을 작성 (예: 검색 결과를 표시하는 등)
                    alert('검색어: ' + keyword + ', 동물 타입: ' + animalType);
                }
            </script>
            <span class="input-group-btn"></span> 
            </div>
        
        <button type="submit" class="btn btn-search">search</button>
        </span>             
    </div>
</form> 
        


    </section>

<!-- 검색부분 백엔드 -->
    <div class="container">
        
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

     <!-- 페이징 버튼 생성 -->
     <div class="page_wrap">
     <div class="page_nation">
          <ul class="arrow pprev prev next">
               <% 
               int totalItems = 300; // 전체 항목 수
               int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

               // 이전 페이지 링크
               if (currentPage > 1) {
               %>
                    <li class="pprev prev"><a href="">이전</a></li>
               <%
               }

               // 페이지 버튼 링크
               for (int i = 1; i <= totalPages; i++) {
               %>
                    <li class="green" <%= (i == currentPage) ? "class='active'" : "" %>><a href=""><%= i %></a></li>
               <%
               }

               // 다음 페이지 링크
               if (currentPage < totalPages) {
               %>
                    <li class="nnext next"><a href="">다음</a></li>
               <%
               }
               %>
          </ul>
     </div>
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