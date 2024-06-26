<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./friends.css">
    <script src="https://kit.fontawesome.com/29c4d2b017.js" crossorigin="anonymous"></script>
    <script>
        window.onload = function() {
     
        function onClick1() {
            document.querySelector('.modal_wrap').style.display ='block';
            document.querySelector('.black_bg').style.display ='block';
        }   
        function offClick1() {
            document.querySelector('.modal_wrap').style.display ='none';
            document.querySelector('.black_bg').style.display ='none';
        }
    
        document.getElementById('modal_btn1').addEventListener('click', onClick1);
        document.querySelector('.modal_close').addEventListener('click', offClick1);
 
 };
    </script>
</head>
<body>
    <!--<script>
        const rowCnt = 1;
        const columnCnt = 2;

        document.write('<table border="1">');
        for (let i = 0; i < rowCnt; i++) {
            document.write('<tr>');
            for (let j = 0; j < columnCnt; j++)  {
                document.write('<td>');
                document.write(i);
                document.write('</td>');
            }
        document.write('</tr>')
        }
        document.write('</table>');
    </script>-->

    <header>
        <div class="header">
            <a href="../main/main.jsp">
                <h1>Your Schedule</h1>
            </a> 
        </div>
    </header>
    <main id="main">
           
        <div class="black_bg"></div>
        <div class="modal_wrap">
            <div class="modal_close">
                <img src="./../img/close.png" alt="remove">
            </div>
            <form id="form_add" id="form_add" action="#" accept-charset="utf-8" name="add_modal_time" method="get">
                <p style="font-size: 18px;">친구 추가</p>
                <br>
                <div class="form_add_nic">
                    <label for="fname">친구 닉네임&nbsp;</label>
                    <input type="text" name="fname" style="width: 40%; height: 20px;">
                    <button type="button" id="button-search">검색하기</button>
                </div>
                <br> <br>
                <div class="button_input">
                    <!--검색하기 후 alert창 뜨면 버튼 생성-->
                    <button style="width: 60%; height: 35px;">친구 추가하기</button>
                </div>
                
                <script>
                    document.getElementById('button-search')
                            .addEventListener('click',function(){
                                alert('추가할 수 있는 친구 입니다.');
                            });
                </script>
                
            </form>
        </div>
        <div style="margin: 50px 0;"></div>
        <div id="container-box">
            <div class="container-left">
                <form action="#" id="form_add" accept-charset="utf-8" name="add_modal_time" method="get">
                    <div id="modal_btn1">
                        <img src="../img/menu.png" alt="add" width="25px">
                    </div>
                </form>
                <div class="container_input">
                    <h3 style="text-align: center;">친구 목록</h3>
                    <ul id="list">
                        <li class="list-item"><i class="fa-solid fa-user-large"></i>&nbsp;&nbsp;a팀</li>
                    </ul>
                </div>
            </div>
            <div class="container-right">
                <div class="container_input">
                    <!-- (수락,거절)-->
                    <h3 style="text-align: center;">친구 관리</h3>
                    <ul id="list">
                        <li class="list-item2">
                            <div>
                                <i class="fa-solid fa-user-large"></i>&nbsp;&nbsp;a팀
                            </div>
                            <div>
                                <button type="button">수락</button>
                                <button type="button">거절</button>
                            </div>

                            
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        
    </main>
    <footer> 
        <div>
            <img src="../img/yourschedule_logo.png">
            <p style="font-size: 15px; font-weight: 500;">Your Schedule</p>
            <p style="font-size: 12px; font-weight: 400;">phone : +82)1-234-5678&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팩스번호 : +82)1-234-5678</p>
            <p style="font-size: 15px; font-weight: 500;">Copyright © Your Schedule All right reserved</p>
        </div>
    </footer>
</body>
</html>