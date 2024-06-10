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
    String sql = "select id, state, type, image_path from animal order by id";
    
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
    
    <title>메인화면</title>
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
                <a href="./main.html" class="navbar-brand">동물 발자국</a>
            </div>
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li ><a href="login/test.html">로그인</a></li>
                    <li><a href="#about">설문하러 가기</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>

    <section class="banner-sec" id="home">
        <div class="container">
        <div class="jumbotron">
        <h1>검색하기</h1>
    
        <div class="input-group">
            <input type="text" id="search-bar" class="form-control" onclick="showOptions()" placeholder="寃??깋?뼱瑜? ?엯?젰?븯?꽭?슂">
            <span class="input-group-btn">
            <button type="button" class="btn btn-search">search</button>
            </span>               
        </div>
        <div class="options-container">
            <label><input type="radio" name="options"> 암컷</label>
            <label><input type="radio" name="options"> 수컷</label>
            <label><input type="checkbox"> 유아</label>
            <label><input type="checkbox"> 성견</label>
            <label><input type="checkbox"> 강아지</label>
            <label><input type="checkbox"> 고양이</label>
        </div>
    </section>

    <section class="four-col-services" id="services">
        <div class="container">
            <div class="row">
            <h2 class="text-center">검색 결과</h2>
            <h4 class="text-center"> 선택한 키워드의 결과 입니다</h4>
        
            <% while (result.ext()){ %>
                <article>
                <div class="col-lg-4 col-md-4 col-sm-6 text-center service-block up-effect">
                    <i class="fa fa-bar-chart" aria-hidden="true"></i>
                    <h3><%= result.getString("type") %></h3><p><%= result.getString("state") %></p>
                    <button type="button" class="btn btn-more">더보기</button>
                </div> </article>
                <% } %>
            

    </section>
  </body>