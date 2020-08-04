<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method= "post" action = "/springProject/member/checkId.do">
	<center>
		<br>
		${requestScope.id}사용이 불가합니다 :(
		<br><br>
		아이디 &emsp;<input type="text" name="id" size = "20" placeholder="아이디 입력">
		<input type="submit" value="검색" >
	</center>
</form>
<script type = "text/javascript" src = "../js/member.js"></script>
