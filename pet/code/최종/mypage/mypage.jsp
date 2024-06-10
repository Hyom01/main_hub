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

    // 'id'�� null�̰ų� �� ���ڿ��� ��� �α��� �������� �̵�
    if (uid == null || uid.trim().isEmpty()) {
        response.sendRedirect("../mypage/mypage.html");
        return;
    }

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");

        // ���⼭���ʹ� member ���̺��� ��ȸ�ϴ� �κ�
        pstmt = con.prepareStatement("SELECT member.*, animal_adopt.animal_breed FROM member LEFT JOIN animal_adopt ON member.id = animal_adopt.ID WHERE member.id = ?");
        pstmt.setString(1, uid);
        ResultSet result = pstmt.executeQuery();
        
%>

<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>����������</title>

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
                <a href="../main/main.jsp" class="navbar-brand">���� ���ڱ�</a>
            </div>
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <%
                       if (uid == null) {
                    %>
                        <li><a href="../login/sign.html">�α���</a></li>
                    <%
                       } else {
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

    <header>
        <h1>����������</h1>
    </header>

    <section>


        <div class="user-info">
            <h2>����� �̸�: <%= uid %>��</h2>
        

        
                     
<%
    if (result.next()) {
   
%>
        <p>�̸��� �ּ�: <%= result.getString("email") %></p>  
        </div>
<%
   }
%> 
    <div class="user-activities">
      <h2>�Ծ� ����</h2>
    
<%
        while (result.next()) {
%>
            <div class="activity-item">
                <p>�Ծ�ǰ��:  <%= result.getString("animal_breed") %></p>
                <span>�������: ������</span>
            </div>
<%
   }
%>     
            <div class="activity-item">
                <p>���� ���</p>
                <span><a href="../main/recommend.jsp">Ȯ���ϱ�</a></span>
            </div>
           
    </div> 
    </section>

<%
        
        result.close();
    } catch (Exception e) {
        out.println("MySql �����ͺ��̽��� member ��ȸ�� ������ �ֽ��ϴ�. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
%>

</body>
</html>
