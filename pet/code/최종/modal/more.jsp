<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="en">

<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%  request.setCharacterEncoding("euc-kr"); %>
<%

    
    ArrayList<Double> latitudes = new ArrayList<Double>();
    ArrayList<Double> longitudes = new ArrayList<Double>();

    String pno = request.getParameter("pno");
    Connection con = null;
    PreparedStatement pstmt = null;
    
    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";
    String uid = (String) session.getAttribute("id");
    session.setAttribute("id", uid);

    String sql = "select name, RECEPT_DE, PBLANC_END_DE, STATE_NM, SPECIES_NM, SEX_NM, SHTER_NM, REFINE_ROADNM_ADDR, SHTER_TELNO, IMAGE_COURS, REFINE_WGS84_LAT, REFINE_WGS84_LOGT from animals_info where name = ?";
    
    int rowCount = 0;
    String SPECIES_NM = ""; // SPECIES_NM 변수 초기화

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, pno);
        ResultSet result = pstmt.executeQuery();

        while (result.next()) {
            double lat = result.getDouble("REFINE_WGS84_LAT");
            double lng = result.getDouble("REFINE_WGS84_LOGT");
            SPECIES_NM = result.getString("SPECIES_NM"); // SPECIES_NM 변수에 값을 설정
            // 위도와 경도 값을 배열에 저장
            latitudes.add(lat);
            longitudes.add(lng);

%>

<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모달 창 예제</title>

    <link rel="stylesheet" href="./more.css">
    <link href="./bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="./contact-input-style.css">
    <link rel="stylesheet" href="./hover-effect.css">
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
                        <li ><a href="../login/sign.jsp">로그인</a></li>
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

    <section class="feature-section" id="features">
        <div class="container">
            <h3 class="text-center">더보기</h3>
            <p class="text-center sub-text"><%= result.getString("SPECIES_NM") %> <br> 등록일: <%= result.getString("RECEPT_DE") %></p>
            <div class="row">
                <div class="col-md-6 img-sec left-effect">
                    <img class="animal-image" src="<%= result.getString("IMAGE_COURS") %>" alt="이미지를 준비중입니다.">
                    <p></p>
                    <!--지도 모달-->
                    <button onclick="openKakaoMapModal()" class="btn">지도 보기</button>
                    <div id="kakaoMapModal" class="modal">
                        <div id="kakaoMap" class="modal-content"></div>
                        <button onclick="closeKakaoMapModal()" class="close"><span class="close" id="closeModalBtn">&times;</span></button>
                    </div>

                    <!--입양 모달-->
                    <button onclick="openModal()" class="btn">입양하기</button>
                    <div id="myModal" class="modal">
                        <div class="modal-content">
                            <span class="close" onclick="closeModal()">&times;</span>
                            <h2>입양 과정</h2>
                            <form action="insert_adopt.jsp" method="get" enctype="multipart/form-data">
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>이름</th>
                                            <td><input type="text" id="NAME" name="NAME" placeholder="홍길동"></td>
                                        </tr>
                                        <tr>
                                            <th>전화 번호</th>
                                            <td><input type="text" id="PHONE" name="PHONE" placeholder="ex| 01012345678"></td>
                                        </tr>
                                        <tr>
                                            <th>방문 희망 시간</th>
                                            <td><input type="text" id="DAY" name="DAY" placeholder="ex| 2023/12/31"></td>
                                        </tr>
                                            <!-- pno 값 추가 -->
                                            <input type="hidden" name="pno" value="<%=pno%>">

                                            <!-- 품종 감추어 전송 -->
                                            <input type="hidden" name="animal_breed" value="<%=SPECIES_NM%>">

                                            <!-- 사용자 아이디를 감추어 전송 -->
                                            <input type="hidden" name="uid" value="<%=uid%>">
                                    </tbody>
                                </table>
                                <!-- <button class="submit-button">제출</button> -->
                                <input type="submit" value="제출" class="submit-button">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 right-effect">
                    <div class="content-box">
                        <h4 class="detail">품종: <%= result.getString("SPECIES_NM") %><br> 성별:  <%= result.getString("SEX_NM") %><br> 공고 종료일:  <%= result.getString("PBLANC_END_DE") %><br> 상태:  <%= result.getString("STATE_NM") %><br></h4>
                        <h4 class="detail">보호소이름: <%= result.getString("SHTER_NM") %><br> 보호소주소: <%= result.getString("REFINE_ROADNM_ADDR") %><br> 보호소전화번호: <%= result.getString("SHTER_TELNO") %></h4>    
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=29fb7dc7fcffbf9a8141b119990cbd32"></script>
    <script>
        var javaLat = <%= lat %>;
        var javaLng = <%= lng %>;
    
        function openKakaoMapModal() {
        document.getElementById('kakaoMapModal').style.display = 'block';

        kakao.maps.load(function () {
            var modal = document.getElementById('kakaoMapModal');
            var container = document.getElementById('kakaoMap');

            // 모달 창의 크기 조절
            modal.style.width = '60%'; // 모달 창의 폭을 조절해주세요.
            modal.style.height = '60%'; // 모달 창의 높이를 조절해주세요.
            modal.style.margin = 'auto'; // 가운데 정렬

            // 지도의 크기 조절
            container.style.width = '100%'; // 지도의 폭을 조절해주세요.
            container.style.height = '100%'; // 지도의 높이를 조절해주세요.

            var options = {
                center: new kakao.maps.LatLng(javaLat, javaLng),
                level: 2
            };
            var map = new kakao.maps.Map(container, options);
            console.log("지도 생성 완료");

            // 마커 생성
            var markerPosition = new kakao.maps.LatLng(javaLat, javaLng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커 지도에 표시
            marker.setMap(map);
            console.log("지도 및 마커 생성 완료");

            // 모달 내 종료 버튼 추가
            var closeModalBtn = document.createElement('button');
            closeModalBtn.innerHTML = '닫기';
            closeModalBtn.onclick = function () {
                closeKakaoMapModal();
            };

            modal.appendChild(closeModalBtn);
        });
    }
    
        function closeKakaoMapModal() {
            document.getElementById('kakaoMapModal').style.display = 'none';
        }
    </script>
    <script src="adopt.js"></script>



<%
    rowCount++; 
    }
    result.close();      
    }
    catch(Exception e) {
        out.println("MySql 데이터베이스의 animals_info 조회에 문제가 있습니다. <hr>");
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
