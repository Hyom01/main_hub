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
   
    // �������� ǥ���� �׸� ��
    int itemsPerPage = 15;

    // ���� ������
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

    // ���� �׸� �ε���
    int startIndex = (currentPage - 1) * itemsPerPage;

    // SQL ������ LIMIT ���� �߰�
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
    
    <title>����ȭ��</title>
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
                <a href="../main/main.jsp" class="navbar-brand">���� ���ڱ�</a>
            </div>
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <% 
                       if (uid == null) {
                    %>
                        <li ><a href="../login/sign.html">�α����� ���ּ���</a></li>
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
                    <li><a href="../survey.html">�����Ϸ� ����</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>
<!--
<section class="banner-sec" id="home">
    <div class="container">
    <div class="jumbotron">
    <h1>�˻��ϱ�</h1>

    <div class="input-group">
        <input type="text" id="search-bar" class="form-control" onclick="showOptions()" placeholder="�˻�� �Է��ϼ���">
        <span class="input-group-btn">
        <button type="button" class="btn btn-search">search</button>
        </span>
                    
    </div>
    <div class="options-container">
        <label><input type="radio" name="options"> ����</label>
        <label><input type="radio" name="options"> ����</label>
        <label><input type="checkbox"> ����</label>
        <label><input type="checkbox"> ����</label>
        <label><input type="checkbox"> ������</label>
        <label><input type="checkbox"> �����</label>
    </div>
    </section>

�˻��κ� �鿣�� -->


    <div class="container">
        <div class="row">
            <h2 class="text-center">�Ծ� ��õ ���</h2>
            <h4 class="text-center"> �������縦 �������� ��õ�帮�� ���̵��Դϴ�.</h4>
        </div>
          <%
               while (result.next()) {
          %>
          
          <div class="col-lg-4 col-md-4 col-sm-6 text-center service-block up-effect">
               <br>
               <img class="animal-image" src="<%= result.getString("IMAGE_COURS") %>" alt="�̹����� �غ����Դϴ�.">
               <h3><%= result.getString("SPECIES_NM") %></h3>
               <p><%= result.getString("STATE_NM") %></p>
               <button type="button" class="btn btn-more"><a href=../modal/more.jsp?pno=<%= result.getString("name") %>>������</a></button>
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
        out.println("MySql �����ͺ��̽��� animal ��ȸ�� ������ �ֽ��ϴ�. <hr>");
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