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
    //�˻� ������
    String search = request.getParameter("search");
    String breed = request.getParameter("breed");
    String gender = request.getParameter("gender");
    String neutralization = request.getParameter("neutralization");
   
   
    // �������� ǥ���� �׸� ��
    int itemsPerPage = 15;

    // ���� ������
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

    // ���� �׸� �ε���
    int startIndex = (currentPage - 1) * itemsPerPage;

    
    int rowCount = 0;
     
   
   String sql = "SELECT id, name, STATE_NM, SPECIES_NM, IMAGE_COURS from animals_info";
   if (search != null && !search.equals("null")) {
        sql += " WHERE SPECIES_NM LIKE '%" + search + "%' OR SHTER_NM LIKE '%" + search + "%'";
   
        if (breed != null && !breed.equals("null")) {
            sql += " AND id LIKE '%" + breed + "%'";
        }
        if (gender != null && !gender.equals("null")) {
            sql += " AND SEX_NM LIKE '%" + gender + "%'";
        }
        if (neutralization != null && !neutralization.equals("null")) {
            sql += " AND NEUT_YN LIKE '%" + neutralization + "%'";
        }
   }
   
   if (search == null && search.equals("null")) {
        if (breed != null && !breed.equals("null")) {
            sql += " WHERE id LIKE '%" + breed + "%'";
        }
        if (gender != null && !gender.equals("null")) {
            sql += " AND SEX_NM LIKE '%" + gender + "%'";
        }
        if (neutralization != null && !neutralization.equals("null")) {
            sql += " AND NEUT_YN LIKE '%" + neutralization + "%'";
        }
   }

    
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
                <a href="./main.jsp" class="navbar-brand">���� ���ڱ�</a>
            </div>
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <% 
                       if (uid == null) {
                    %>
                        <li ><a href="../login/sign.html">�α���</a></li>
                    <%
                       }
                       else {
                    %>
                        
                    <li ><a href=""><%=uid%>��</a></li>
                    <%
                        }
                    %>
                    <li><a href="../survey.html">�����Ϸ� ����</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>

<section class="banner-sec" id="home">
    <div class="container">
    <div class="jumbotron">
    <h1>�˻��ϱ�</h1>
<form method= "post" action="../main/search.jsp"> 
    <div class="input-group">
        <input type="text" name="search" id="search-bar" class="form-control" onclick="showOptions()" placeholder="�˻�� �Է��ϼ���">
        <div class="search-container">
            <select class="filter-select" id="animalType" name="breed">
                <option value="">ǰ��</option>
                <option value="1">�ͽ���</option>
                <option value="2">�ѱ� �����</option>
                <option value="3">Ǫ��</option>
                <option value="4">��Ƽ��</option>
                <option value="5">�ͽ���</option>
                <option value="6">���޶�Ͼ�</option>
                <option value="7">��� ������</option>
                <option value="8">������</option>
                <option value="9">ġ�Ϳ�</option>
                <option value="10">����</option>
                <option value="11">�ù�</option>
                <option value="12">���� ��Ʈ����</option>
                <option value="13">����</option>
                <option value="14">��ũ�� �׸���</option>
                <option value="15">��� ��Ʈ����</option>
                <option value="16">������</option>
                <option value="17">���� �ڱ� ����ũ</option>
                <option value="18">�ú����� �㽺Ű</option>
                <option value="19">���� �ݸ�</option>
                <option value="20">����ġ �ҵ�</option>
                <option value="21">���� �ͽ���</option>
                <option value="22">�ڽ���Ʈ</option>
                <option value="23">�丣�þ�</option>
                <option value="24">���þ� ���</option>
                <option value="25">��ī ���ĴϿ�</option>
                <option value="26">��������</option>
                <option value="27">������ �׸���</option>
                <option value="28">��Ű�� �Ӱ��</option>
                <option value="29">�̴Ͼ��� �ɼ�</option>
                <option value="30">������</option>
                <option value="31">���׵�</option>
                <option value="32">����Ƽ������</option>
                <option value="33">���Ĵٵ� Ǫ��</option>
            </select>
            <select class="filter-select" id="gender" name="gender">
                <option value="">����</option>
                <option value="F">F</option>
                <option value="M">M</option>
            </select>
            <select class="filter-select" id="on-off" name="neutralization">
                <option value="">�߼�ȭ ����</option>
                <option value="Y">��</option>
                <option value="N">��</option>
                <option value="U">Ȯ�� �Ұ�</option>
            </select>
            <script>
                function search() {
                    var keyword = document.getElementById('keyword').value;
                    var animalType = document.getElementById('animalType').value;
                    var gender = document.getElementById('gender').value;
                    var neutered = document.getElementById('on-off').value;
                    
                    // �˻���� ���� ������ �̿��� ������ �ۼ� (��: �˻� ����� ǥ���ϴ� ��)
                    alert('�˻���: ' + keyword + ', ���� Ÿ��: ' + animalType);
                }
            </script>
            <span class="input-group-btn"></span> 
            </div>
        
        <button type="submit" class="btn btn-search">search</button>
        </span>             
    </div>
</form> 
        
    </section>

<!-- �˻��κ� �鿣�� -->

    <div class="container">
        <div class="row">
            <h2 class="text-center">�˻� ���</h2>
            <h4 class="text-center"> ������ Ű������ ����Դϴ�. </h4>
<!--
            <h4> search��<%=search%></h4>
            <h4> breed�� <%=breed%></h4>
            <h4> gender��<%=gender%></h4>
            <h4> �߼�ȭ��<%=neutralization%></h4>
            <h4> sql�� <%=sql%></h4>
-->
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

     <!-- ����¡ ��ư ���� -->
<!--
     <div class="page_wrap">
        <div class="page_nation">
             <ul class="arrow pprev prev next">
                  <% 
                  int totalItems = 300; // ��ü �׸� ��
                  int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
   
                  // ���� ������ ��ũ
                  if (currentPage > 1) {
                  %>
                       <li class="pprev prev"><a href="">����</a></li>
                  <%
                  }
   
                  // ������ ��ư ��ũ
                  for (int i = 1; i <= totalPages; i++) {
                  %>
                       <li class="green" <%= (i == currentPage) ? "class='active'" : "" %>><a href=""><%= i %></a></li>
                  <%
                  }
   
                  // ���� ������ ��ũ
                  if (currentPage < totalPages) {
                  %>
                       <li class="nnext next"><a href="">����</a></li>
                  <%
                  }
                  %>
             </ul>
        </div>
        </div>
-->

<%
    rowCount++; 
    }
    result.close();      
    }
    catch(Exception e) {
        out.println("MySql �����ͺ��̽��� animal ��ȸ�� ������ �ֽ��ϴ�. <hr>");
        out.println(e.toString());
        e.printStackTrace();
        
        out.println(search);
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
  
%>


</body>
</html>