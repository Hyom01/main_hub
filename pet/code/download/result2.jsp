<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>설문조사 jsp</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%  
    String uid = (String) session.getAttribute("id");
    session.setAttribute("id", uid);
   
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("insert into result(id, num, total, animal_num) "); 
    SQL.append("values (?, ?, ?, ?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),"); 
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),");
    SQL.append("(?,?,?,?),"); 
    SQL.append("(?,?,?,?)"); 
   
   
   
   
    
    String animal1 = request.getParameter("index1");    
    String animal2 = request.getParameter("index2");   
    String animal3 = request.getParameter("index3");       
    String animal4 = request.getParameter("index4");     
    String animal5 = request.getParameter("index5");  
    String animal6 = request.getParameter("index6");    
    String animal7 = request.getParameter("index7");      
    String animal8 = request.getParameter("index8");     
    String animal9 = request.getParameter("index9"); 
    String animal10 = request.getParameter("index10");    
    String animal11 = request.getParameter("index11");    
    String animal12 = request.getParameter("index12");      
    String animal13 = request.getParameter("index13");    
    String animal14 = request.getParameter("index14");    
    String animal15 = request.getParameter("index15");  
    String animal16 = request.getParameter("index16");  
    String animal17 = request.getParameter("index17");      
    String animal18 = request.getParameter("index18"); 
    String animal19 = request.getParameter("index19");  
    String animal20 = request.getParameter("index20");    
    String animal21 = request.getParameter("index21");       
    String animal22 = request.getParameter("index22");    
    String animal23 = request.getParameter("index23");    
    String animal24 = request.getParameter("index24");   
    String animal25 = request.getParameter("index25"); 
    String animal26 = request.getParameter("index26");      
    String animal27 = request.getParameter("index27"); 
    String animal28 = request.getParameter("index28");  
    String animal29 = request.getParameter("index29");    
    String animal30 = request.getParameter("index30");    
    String animal31 = request.getParameter("index31");     
    String animal32 = request.getParameter("index32");     
    String animal33 = request.getParameter("index33");    

   
	String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql44";

    try {
		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");

        pstmt = con.prepareStatement(SQL.toString());

   
        pstmt.setString(1, uid);
        pstmt.setInt(2, 1);
        pstmt.setString(3, animal1);
        pstmt.setInt(4, 1);
   
        pstmt.setString(5, uid);
        pstmt.setInt(6, 2);
        pstmt.setString(7, animal2);
        pstmt.setInt(8, 2);
   
        pstmt.setString(9, uid);
        pstmt.setInt(10, 3);
        pstmt.setString(11, animal3);
        pstmt.setInt(12, 3);
   
        pstmt.setString(13, uid);
        pstmt.setInt(14, 4);
        pstmt.setString(15, animal4);
        pstmt.setInt(16, 4);
   
        pstmt.setString(17, uid);
        pstmt.setInt(18, 5);
        pstmt.setString(19, animal5);
        pstmt.setInt(20, 5);
   
        pstmt.setString(21, uid);
        pstmt.setInt(22, 6);
        pstmt.setString(23, animal6);
        pstmt.setInt(24, 6);
   
        pstmt.setString(25, uid);
        pstmt.setInt(26, 7);
        pstmt.setString(27, animal7);
        pstmt.setInt(28, 7);
   
        pstmt.setString(29, uid);
        pstmt.setInt(30, 8);
        pstmt.setString(31, animal8);
        pstmt.setInt(32, 8);
   
        pstmt.setString(33, uid);
        pstmt.setInt(34, 9);
        pstmt.setString(35, animal9);
        pstmt.setInt(36, 9);
   
        pstmt.setString(37, uid);
        pstmt.setInt(38, 10);
        pstmt.setString(39, animal10);
        pstmt.setInt(40, 10);
   
        pstmt.setString(41, uid);
        pstmt.setInt(42, 11);
        pstmt.setString(43, animal11);
        pstmt.setInt(44, 11);
   
        pstmt.setString(45, uid);
        pstmt.setInt(46, 12);
        pstmt.setString(47, animal12);
        pstmt.setInt(48, 12);
   
        pstmt.setString(49, uid);
        pstmt.setInt(50, 13);
        pstmt.setString(51, animal13);
        pstmt.setInt(52, 13);
   
        pstmt.setString(53, uid);
        pstmt.setInt(54, 14);
        pstmt.setString(55, animal14);
        pstmt.setInt(56, 14);
   
        pstmt.setString(57, uid);
        pstmt.setInt(58, 15);
        pstmt.setString(59, animal15);
        pstmt.setInt(60, 15);
   
        pstmt.setString(61, uid);
        pstmt.setInt(62, 16);
        pstmt.setString(63, animal16);
        pstmt.setInt(64, 16);
   
        pstmt.setString(65, uid);
        pstmt.setInt(66, 17);
        pstmt.setString(67, animal17);
        pstmt.setInt(68, 17);
   
        pstmt.setString(69, uid);
        pstmt.setInt(70, 18);
        pstmt.setString(71, animal18);
        pstmt.setInt(72, 18);
   
        pstmt.setString(73, uid);
        pstmt.setInt(74, 19);
        pstmt.setString(75, animal19);
        pstmt.setInt(76, 19);
   
        pstmt.setString(77, uid);
        pstmt.setInt(78, 20);
        pstmt.setString(79, animal20);
        pstmt.setInt(80, 20);
        
        pstmt.setString(81, uid);
        pstmt.setInt(82, 21);
        pstmt.setString(83, animal21);
        pstmt.setInt(84, 21);
   
        pstmt.setString(85, uid);
        pstmt.setInt(86, 22);
        pstmt.setString(87, animal22);
        pstmt.setInt(88, 22);
   
        pstmt.setString(89, uid);
        pstmt.setInt(90, 23);
        pstmt.setString(91, animal23);
        pstmt.setInt(92, 23);
   
        pstmt.setString(93, uid);
        pstmt.setInt(94, 24);
        pstmt.setString(95, animal24);
        pstmt.setInt(96, 24);
   
        pstmt.setString(97, uid);
        pstmt.setInt(98, 25);
        pstmt.setString(99, animal25);
        pstmt.setInt(100, 25);
   
        pstmt.setString(101, uid);
        pstmt.setInt(102, 26);
        pstmt.setString(103, animal26);
        pstmt.setInt(104, 26);
   
        pstmt.setString(105, uid);
        pstmt.setInt(106, 27);
        pstmt.setString(107, animal27);
        pstmt.setInt(108, 27);
   
        pstmt.setString(109, uid);
        pstmt.setInt(110, 28);
        pstmt.setString(111, animal28);
        pstmt.setInt(112, 28);
   
        pstmt.setString(113, uid);
        pstmt.setInt(114, 29);
        pstmt.setString(115, animal29);
        pstmt.setInt(116, 29);
   
        pstmt.setString(117, uid);
        pstmt.setInt(118, 30);
        pstmt.setString(119, animal30);
        pstmt.setInt(120, 30);
   
        pstmt.setString(121, uid);
        pstmt.setInt(122, 31);
        pstmt.setString(123, animal31);
        pstmt.setInt(124, 31);
   
        pstmt.setString(125, uid);
        pstmt.setInt(126, 32);
        pstmt.setString(127, animal32);
        pstmt.setInt(128, 32);
   
        pstmt.setString(129, uid);
        pstmt.setInt(130, 33);
        pstmt.setString(131, animal33);
        pstmt.setInt(132, 33);
   
   
        int rowCount = pstmt.executeUpdate();        
     //   if (rowCount == 33) out.println("<hr>학생 [" + animal2 + "] 레코드 하나가 성공적으로 삽입 되었습니다.<hr>");
     //   else out.println("학생 레코드 삽입에 문제가 있습니다."+rowCount + "" );
        
        //다시 학생 조회
        stmt = con.createStatement();

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

<%
   out.println("<meta http-equiv='Refresh' content='0;URL=./main/recommend.jsp'>");
%>
</body>
</html>