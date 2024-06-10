<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>



<html>



<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>�������� ���̺� �켱����</title>



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



<%

    String uid = (String) session.getAttribute("id");

    session.setAttribute("id", uid); 

%>



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

                <li><a href="#about">�����Ϸ� ����</a></li>

            </ul>

        </div>

    </div>

</nav>



<%!

   int[] survey = new int[40];

%>



<%

   

    Connection con = null;

    PreparedStatement pstmt = null;

    String driverName = "org.gjt.mm.mysql.Driver";

    String dbURL = "jdbc:mysql://localhost:3306/mysql44";

    String sql = "select survey2.id, Q_list.part, Q_list.list From Q_list INNER JOIN survey2 ON Q_list.part = survey2.answer AND id = '"

    + uid

    + "'";



    int rowCount = 0;



    try {

        Class.forName(driverName);

        con = DriverManager.getConnection(dbURL, "root", "kbc0924");

        pstmt = con.prepareStatement(sql);

        ResultSet result = pstmt.executeQuery();



  while (result.next()) {



   survey[result.getInt("list")] += 1;

   //if part�� 'D1'�̸�, survey[result.getInt("list")] ���� -1���� �ٲ��. 

       if (result.getString("part").equals("D2") || result.getString("part").equals("F2") || result.getString("part").equals("G3") || result.getString("part").equals("H2")) {

        survey[result.getInt("list")] = -1;

    }

%>



<%

	rowCount++;

    }



    result.close();        

    }



    catch(Exception e) {

    	out.println("MySql �����ͺ��̽� univdb�� student ��ȸ�� ������ �ֽ��ϴ�. <hr>");

        out.println(e.toString());

        e.printStackTrace();

    }



    finally {

        if(pstmt != null) pstmt.close();

        if(con != null) con.close();

    }

%>



    <img src="./result.jpg" alt="">
    <br>
    <button class="btn"><a href="result2.jsp?index1=<%=survey[1]%>&index2=<%=survey[2]%>&index3=<%=survey[3]%>&index4=<%=survey[4]%>&index5=<%=survey[5]%>&index6=<%=survey[6]%>&index7=<%=survey[7]%>&index8=<%=survey[8]%>&index9=<%=survey[9]%>&index10=<%=survey[10]%>&index11=<%=survey[11]%>&index12=<%=survey[12]%>&index13=<%=survey[13]%>&index14=<%=survey[14]%>&index15=<%=survey[15]%>&index16=<%=survey[16]%>&index17=<%=survey[17]%>&index18=<%=survey[18]%>&index19=<%=survey[19]%>&index20=<%=survey[20]%>&index21=<%=survey[21]%>&index22=<%=survey[22]%>&index23=<%=survey[23]%>&index24=<%=survey[24]%>&index25=<%=survey[25]%>&index26=<%=survey[26]%>&index27=<%=survey[27]%>&index28=<%=survey[28]%>&index29=<%=survey[29]%>&index30=<%=survey[30]%>&index31=<%=survey[31]%>&index32=<%=survey[32]%>&index33=<%=survey[33]%>">��� ����</a></button>


</body>

</html>