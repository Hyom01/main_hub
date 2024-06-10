<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���� ����</title>

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
                <a href="../main/main.jsp" class="navbar-brand">���� ���ڱ�</a>
            </div>
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login/test.html"><%=uid%>��</a></li>
                    <li><a href="#about">�����Ϸ� ����</a></li>
                    
                </ul>
            </div>
        </div>
    </nav>

    <div class="survey-container">
        <div class="card">
            <form method="post" action="../survey/insert3.jsp">
                
                <div class="question">
                    <h3>1. ���� �������� ����ΰ�?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="1" value="A1">ȥ��
                        <input type="radio" name="1" value="A2">������
                        <input type="radio" name="1" value="A3">���̿�
                        <input type="radio" name="1" value="A4">�θ�԰�
                    </label>
                </div>

                <div class="question">
                    <h3>2. �������� Ư¡��?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="2" value="B1">����Ʈ
                        <input type="radio" name="2" value="B2">����
                        <input type="radio" name="2" value="B3">����
                        <input type="radio" name="2" value="B4">���� ����Ʈ
                    </label>
                </div>

                <div class="question">
                    <h3>3. ���� �Բ� ������ �ݷ������� �ִ°�?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="3" value="C1">������
                        <input type="radio" name="3" value="C2">�����
                        <input type="radio" name="3" value="C3">�������� �����
                        <input type="radio" name="3" value="C4">�ش� ����
                    </label>
                </div>

                <div class="question">
                    <h3>4. ������ ���� �ٴϴ°�?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="4" value="D1">����
                        <input type="radio" name="4" value="D2">����
                        <input type="radio" name="4" value="D3">����
                        <input type="radio" name="4" value="D4">����
                    </label>
                </div>

                <div class="question">
                    <h3>5. ��ȣ�ϴ� ��Ȱ ��Ÿ����?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="5" value="E1">�ǳ�
                        <input type="radio" name="5" value="E2">�ǿ�
                        <input type="radio" name="5" value="E3">�Ѵ�
                    </label>
                </div>

                <div class="question">
                    <h3>6. �ݷ������� Ű���� ������ �ִ°�?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="6" value="F1">������
                        <input type="radio" name="6" value="F2">�����
                        <input type="radio" name="6" value="F3">�Ѵ�
                        <input type="radio" name="6" value="F4">����
                    </label>
                </div>

                <div class="question">
                    <h3>7. �ݷ������� �Բ� ���� �� �ش� ������ �޾� �� ���� �ִ°�?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="7" value="G1">����
                        <input type="radio" name="7" value="G2">������ �ʴ�
                        <input type="radio" name="7" value="G3">�๰
                        <input type="radio" name="7" value="G4">������
                        <input type="radio" name="7" value="G5">��������/�Ǻ� �ε巯��
                        <input type="radio" name="7" value="G6">����
                    </label>
                </div>

                <div class="question">
                    <h3>8. Ȱ������ ��� ����ϴ� ���ΰ�?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="8" value="H1">��
                        <input type="radio" name="8" value="H2">����
                        <input type="radio" name="8" value="H3">�ƴϿ�
                    </label>
                </div>

                <div class="question">
                    <h3>9. �߼�ȭ �Ǿ� �ִ� ������ ���ϴ°�?</h3>
                </div>
                <div class="options">
                    <label class="option">
                        <input type="radio" name="9" value="I1">��
                        <input type="radio" name="9" value="I2">�ƴϿ�
                        <input type="radio" name="9" value="I3">�������
                    </label>
                </div>
                <input type="submit" id="submitForm" class="submit-button" value="����">
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        function submitForm() {
                            // ���⿡ �������� ���� ������ �߰��մϴ�.
                            alert('�������簡 ����Ǿ����ϴ�.');
                            //window.location.href = 'http://58.232.79.151:8080/jsp44/hyomin/survey/insert3.jsp';
                        }
                
                        // �ùٸ� id('submitForm')�� ����մϴ�.
                        document.getElementById('submitForm').addEventListener('click', submitForm);
                    });
                </script>
                

                <button type="button" class="submit-button">����</button>
        </div>
    </div> 
    
</form>
    
</body>
</html>