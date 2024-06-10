<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설문 조사</title>

    <link rel="stylesheet" href="./survey.css">
    
    <link href="./bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="./contact-input-style.css">
    <link rel="stylesheet" href="./hover-effect.css">
</head>
<body>
    
<%
    String uid = (String) session.getAttribute("id");
    session.setAttribute("id", uid);
%>
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
                    <li><a href="login/test.html"><%=uid%>님</a></li>
                    <li><a href="#about">설문하러 가기</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>

    <div class="survey-container">
        <div class="card">
            <form method="post" action="../survey/insert3.jsp">
                
                <div class="question">
                    <h3>1. 현재 동거인은 몇명인가?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="1" value="A1">혼자
                        <input type="radio" name="1" value="A2">가족과
                        <input type="radio" name="1" value="A3">아이와
                        <input type="radio" name="1" value="A4">부모님과
                    </label>
                </div>

                <div class="question">
                    <h3>2. 거주지의 특징은?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="2" value="B1">아파트
                        <input type="radio" name="2" value="B2">주택
                        <input type="radio" name="2" value="B3">농장
                        <input type="radio" name="2" value="B4">고층 아파트
                    </label>
                </div>

                <div class="question">
                    <h3>3. 현재 함께 지내는 반려동물이 있는가?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="3" value="C1">강아지
                        <input type="radio" name="3" value="C2">고양이
                        <input type="radio" name="3" value="C3">강아지와 고양이
                        <input type="radio" name="3" value="C4">해당 없음
                    </label>
                </div>

                <div class="question">
                    <h3>4. 여행을 자주 다니는가?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="4" value="D1">자주
                        <input type="radio" name="4" value="D2">종종
                        <input type="radio" name="4" value="D3">가끔
                        <input type="radio" name="4" value="D4">딱히
                    </label>
                </div>

                <div class="question">
                    <h3>5. 선호하는 생활 스타일은?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="5" value="E1">실내
                        <input type="radio" name="5" value="E2">실외
                        <input type="radio" name="5" value="E3">둘다
                    </label>
                </div>

                <div class="question">
                    <h3>6. 반려동물을 키워본 경험이 있는가?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="6" value="F1">강아지
                        <input type="radio" name="6" value="F2">고양이
                        <input type="radio" name="6" value="F3">둘다
                        <input type="radio" name="6" value="F4">없음
                    </label>
                </div>

                <div class="question">
                    <h3>7. 반려동물과 함께 있을 때 해당 증상을 겪어 본 적이 있는가?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="7" value="G1">심함
                        <input type="radio" name="7" value="G2">심하지 않다
                        <input type="radio" name="7" value="G3">콧물
                        <input type="radio" name="7" value="G4">눈충혈
                        <input type="radio" name="7" value="G5">붉은반점/피부 두드러기
                        <input type="radio" name="7" value="G6">없음
                    </label>
                </div>

                <div class="question">
                    <h3>8. 활동적인 운동을 즐겨하는 편인가?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="8" value="H1">예
                        <input type="radio" name="8" value="H2">종종
                        <input type="radio" name="8" value="H3">아니오
                    </label>
                </div>

                <div class="question">
                    <h3>9. 중성화 되어 있는 동물을 원하는가?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="9" value="I1">예
                        <input type="radio" name="9" value="I2">아니오
                        <input type="radio" name="9" value="I3">상관없다
                    </label>
                </div>
                <input type="submit" id="submitForm" class="submit-button" value="제출">
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        function submitForm() {
                            // 여기에 설문조사 제출 로직을 추가합니다.
                            alert('설문조사가 제출되었습니다.');
                            //window.location.href = 'http://58.232.79.151:8080/jsp44/hyomin/survey/insert3.jsp';
                        }
                
                        // 올바른 id('submitForm')를 사용합니다.
                        document.getElementById('submitForm').addEventListener('click', submitForm);
                    });
                </script>
                

                <button type="button" class="submit-button">리셋</button>
        </div>
    </div> 
    
</form>
    
</body>
</html>