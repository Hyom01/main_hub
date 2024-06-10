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
    String sql = "select id, state, type, image_path from animal";
    
    int rowCount = 0;

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        pstmt = con.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();

        while (result.next()) {
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kakao Maps Modal</title>

    <link href="./bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href="./main.css" rel="stylesheet">
    <link rel="stylesheet" href="./contact-input-style.css">
    <link rel="stylesheet" href="./hover-effect.css">
    <link rel="stylesheet" type="text/css" href="./font-awesome.min.css" />
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
                    <li ><a href="login/test.html">로그인</a></li>
                    <li><a href="#about">설문하러 가기</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>

    <section class="feature-section" id="features">
        <div class="container">
            <h3 class="text-center">더보기</h3>
            <p class="text-center sub-text"><%= result.getString("type") %></p>
            <p class="text-center sub-text"><%= formattedDate %></p>
            <div class="row">
                <div class="col-md-6 img-sec left-effect">
                    <img class="animal-image" src="<%= result.getString("image_path") %>" alt="Animal Image">
                    <p></p>
                    <!--<button id="openModalBtn" class="btn">모달 열기</button>-->
                </div>
                <div class="col-md-6 right-effect">
                    <div class="content-box">
                        <h4 class="detail">이름: <%= result.getString("type") %><br> 성별:  <%= result.getString("n_check") %><br> 나이:  <%= result.getString("n_check") %><br> 상태:  <%= result.getString("state") %></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=29fb7dc7fcffbf9a8141b119990cbd32"></script>

<button onclick="openKakaoMapModal()">지도 보기</button>
<div id="kakaoMapModal" style="display: none;">
    <div id="kakaoMap" style="width: 100%; height: 400px;"></div>
    <span onclick="closeKakaoMapModal()">Close</span>
</div>

<script>
    function openKakaoMapModal() {
        document.getElementById('kakaoMapModal').style.display = 'block';

        kakao.maps.load(function () {
            var container = document.getElementById('kakaoMap');
            var options = {
                center: new kakao.maps.LatLng(37.5665, 126.9780), // 서울의 좌표
                level: 3
            };
            var map = new kakao.maps.Map(container, options);
        });
    }

    function closeKakaoMapModal() {
        document.getElementById('kakaoMapModal').style.display = 'none';
    }
</script>

    <!-- Your other scripts go here -->
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
