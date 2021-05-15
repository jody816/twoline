<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "twoline.OnelineDAO" %>
<%@ page import= "twoline.OnelineDTO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>memo</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
	#container {
        width:600px;
        margin:10px auto;
      	}
	h1 {
        padding: 10px;
        background-color: rgb(255, 255, 128);
        color: rgb(0, 0, 0); font-family: 'Lobster', cursive;}
    #m label {
        float: left;
        font-size: 13px;
        width: 110px;
      	}
    #m ul li {
        line-height: 30px;
        list-style: none;
        padding: 5px 10px;
        margin-bottom: 2px;
      	}
	body {background-image: url('C:/Users/jody8/OneDrive/바탕 화면/캡처/cor.jpg');}
	p {font-family: 'Nanum Pen Script', cursive;}
</style>
</head>
<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>
<body>
<div id="container">
	<h1>Oneline Memo</h1>
	<hr>
	<form id="m" method="post" action="memo_write.jsp" style="background-color: #fff">
		<fieldset>
			<ul type="none">
				<li>
					<input type="text" name="memo" placeholder="메모를 작성해주세요"></input>
					<input type="submit" value="등록"></input>
				</li>
			</ul>
		</fieldset>
	</form>
	<hr>
	<div>
<%
	for(int i = 0; i < dtos.size() ; i++) {
		OnelineDTO dto = dtos.get(i);
		out.println("<p>(" + dto.getWdate() + ") " + dto.getMemo() + "<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no=" + dto.getNo() + "'\"><br>");
		out.println("</input></p>");
	}
%>	
	</div>
</div>
</body>
</html>