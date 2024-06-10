<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>설문조사 테이블 우선순위</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<h2>설문조사로 결과로 뽑아낸 중복결과를 체크하는 페이지 </h2>
<hr><center>

    
<%!
   int[] survey = new int[40];
%>
    
<%
    String uid = (String) session.getAttribute("id");
    session.setAttribute("id", uid); 
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
   
   //if part가 'D1'이면, survey[result.getInt("list")] 값을 -1으로 바꿔라. 
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
    	out.println("MySql 데이터베이스 univdb의 student 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
%>

<p><hr><font color=blue>
<%
	if (rowCount == 0) 
		out.println("조회된 결과가 없습니다.");
	else 
		out.println("조회된 결과가 " + rowCount + "건 입니다.");    
   
%>

<br>

    <a href="result2.jsp?index1=<%=survey[1]%>&index2=<%=survey[2]%>&index3=<%=survey[3]%>&index4=<%=survey[4]%>&index5=<%=survey[5]%>&index6=<%=survey[6]%>&index7=<%=survey[7]%>&index8=<%=survey[8]%>&index9=<%=survey[9]%>&index10=<%=survey[10]%>&index11=<%=survey[11]%>&index12=<%=survey[12]%>&index13=<%=survey[13]%>&index14=<%=survey[14]%>&index15=<%=survey[15]%>&index16=<%=survey[16]%>&index17=<%=survey[17]%>&index18=<%=survey[18]%>&index19=<%=survey[19]%>&index20=<%=survey[20]%>&index21=<%=survey[21]%>&index22=<%=survey[22]%>&index23=<%=survey[23]%>&index24=<%=survey[24]%>&index25=<%=survey[25]%>&index26=<%=survey[26]%>&index27=<%=survey[27]%>&index28=<%=survey[28]%>&index29=<%=survey[29]%>&index30=<%=survey[30]%>&index31=<%=survey[31]%>&index32=<%=survey[32]%>&index33=<%=survey[33]%>">결과 보기</a>
            
</body>
</html>