<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<center>
<br>
<h2>로그인</h2>
<form id="loginForm">
	<table cellspacing="3" cellpadding="3">
	<tr>
		<td align="Center">아이디</td>
		<td>
			<input type="text" name="id" class="id" size = "20" placeholder="아이디 입력">
			<div class="idDiv"></div>
		</td>
	</tr>
	
	<tr>
		<td align="Center">비밀번호</td>
		<td>
			<input type="password" name="pwd" class="pwd" size = "20" placeholder="비밀번호 입력">
			<div class="pwdDiv"></div>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="로그인" id="loginBtn"> 
		<input type="button" value="회원가입" onclick="javascript:location.href='/springProject/member/writeForm'"></td>
	</tr>
		</table>
		<div id="loginResultDiv" style="text-align: center"></div>
	</form>
</center>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type = "text/javascript" src = "../js/member.js"></script>


