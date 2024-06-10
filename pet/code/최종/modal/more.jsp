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
    String SPECIES_NM = ""; // SPECIES_NM ���� �ʱ�ȭ

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, pno);
        ResultSet result = pstmt.executeQuery();

        while (result.next()) {
            double lat = result.getDouble("REFINE_WGS84_LAT");
            double lng = result.getDouble("REFINE_WGS84_LOGT");
            SPECIES_NM = result.getString("SPECIES_NM"); // SPECIES_NM ������ ���� ����
            // ������ �浵 ���� �迭�� ����
            latitudes.add(lat);
            longitudes.add(lng);

%>

<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��� â ����</title>

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
                <a href="../main/main.jsp" class="navbar-brand">���� ���ڱ�</a>
            </div>
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <% 
                       if (uid == null) {
                    %>
                        <li ><a href="../login/sign.jsp">�α���</a></li>
                    <%
                       }
                       else {
                    %>
                        
                    <li class="dropbtn_click" onclick="dropdown()">
                        <%=uid%>��
                        <select class="filter-select" id="on-off" name="neutralization" onchange="handleSelectionChange(this)">
                            <option value="">������</option>
                            <option value="out">�α׾ƿ�</option>
                            <option value="mypage">����������</option>
                        </select>
                    </li>
                    
                    <script>
                        function handleSelectionChange(selectElement) {
                            var selectedValue = selectElement.value;
                            
                            if (selectedValue === 'out') {
                                var confirmLogout = confirm('�α׾ƿ��Ͻðڽ��ϱ�?');
                                if (confirmLogout) {
                                    alert('�α׾ƿ��Ǿ����ϴ�.');
                                    // ���� �α׾ƿ� ó���� ���� �������� �̵� ���� �۾��� �߰��� �� �ֽ��ϴ�.
                                    window.location.href = '../login/logout.jsp'; // �α׾ƿ� �������� �̵� ����
                                }
                            } else if (selectedValue === 'mypage') {
                                alert('������������ �̵��մϴ�.');
                                // ���� ������������ �̵��ϴ� �������� URL�� �����ص� �˴ϴ�.
                                window.location.href = '../mypage/mypage.jsp'; // ������������ �̵� ����
                            }
                        }
                    </script>
                    <%
                        }
                    %>
                    <li><a href="../survey/survey.jsp">�����Ϸ� ����</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>

    <section class="feature-section" id="features">
        <div class="container">
            <h3 class="text-center">������</h3>
            <p class="text-center sub-text"><%= result.getString("SPECIES_NM") %> <br> �����: <%= result.getString("RECEPT_DE") %></p>
            <div class="row">
                <div class="col-md-6 img-sec left-effect">
                    <img class="animal-image" src="<%= result.getString("IMAGE_COURS") %>" alt="�̹����� �غ����Դϴ�.">
                    <p></p>
                    <!--���� ���-->
                    <button onclick="openKakaoMapModal()" class="btn">���� ����</button>
                    <div id="kakaoMapModal" class="modal">
                        <div id="kakaoMap" class="modal-content"></div>
                        <button onclick="closeKakaoMapModal()" class="close"><span class="close" id="closeModalBtn">&times;</span></button>
                    </div>

                    <!--�Ծ� ���-->
                    <button onclick="openModal()" class="btn">�Ծ��ϱ�</button>
                    <div id="myModal" class="modal">
                        <div class="modal-content">
                            <span class="close" onclick="closeModal()">&times;</span>
                            <h2>�Ծ� ����</h2>
                            <form action="insert_adopt.jsp" method="get" enctype="multipart/form-data">
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>�̸�</th>
                                            <td><input type="text" id="NAME" name="NAME" placeholder="ȫ�浿"></td>
                                        </tr>
                                        <tr>
                                            <th>��ȭ ��ȣ</th>
                                            <td><input type="text" id="PHONE" name="PHONE" placeholder="ex| 01012345678"></td>
                                        </tr>
                                        <tr>
                                            <th>�湮 ��� �ð�</th>
                                            <td><input type="text" id="DAY" name="DAY" placeholder="ex| 2023/12/31"></td>
                                        </tr>
                                            <!-- pno �� �߰� -->
                                            <input type="hidden" name="pno" value="<%=pno%>">

                                            <!-- ǰ�� ���߾� ���� -->
                                            <input type="hidden" name="animal_breed" value="<%=SPECIES_NM%>">

                                            <!-- ����� ���̵� ���߾� ���� -->
                                            <input type="hidden" name="uid" value="<%=uid%>">
                                    </tbody>
                                </table>
                                <!-- <button class="submit-button">����</button> -->
                                <input type="submit" value="����" class="submit-button">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 right-effect">
                    <div class="content-box">
                        <h4 class="detail">ǰ��: <%= result.getString("SPECIES_NM") %><br> ����:  <%= result.getString("SEX_NM") %><br> ���� ������:  <%= result.getString("PBLANC_END_DE") %><br> ����:  <%= result.getString("STATE_NM") %><br></h4>
                        <h4 class="detail">��ȣ���̸�: <%= result.getString("SHTER_NM") %><br> ��ȣ���ּ�: <%= result.getString("REFINE_ROADNM_ADDR") %><br> ��ȣ����ȭ��ȣ: <%= result.getString("SHTER_TELNO") %></h4>    
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

            // ��� â�� ũ�� ����
            modal.style.width = '60%'; // ��� â�� ���� �������ּ���.
            modal.style.height = '60%'; // ��� â�� ���̸� �������ּ���.
            modal.style.margin = 'auto'; // ��� ����

            // ������ ũ�� ����
            container.style.width = '100%'; // ������ ���� �������ּ���.
            container.style.height = '100%'; // ������ ���̸� �������ּ���.

            var options = {
                center: new kakao.maps.LatLng(javaLat, javaLng),
                level: 2
            };
            var map = new kakao.maps.Map(container, options);
            console.log("���� ���� �Ϸ�");

            // ��Ŀ ����
            var markerPosition = new kakao.maps.LatLng(javaLat, javaLng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // ��Ŀ ������ ǥ��
            marker.setMap(map);
            console.log("���� �� ��Ŀ ���� �Ϸ�");

            // ��� �� ���� ��ư �߰�
            var closeModalBtn = document.createElement('button');
            closeModalBtn.innerHTML = '�ݱ�';
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
        out.println("MySql �����ͺ��̽��� animals_info ��ȸ�� ������ �ֽ��ϴ�. <hr>");
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
