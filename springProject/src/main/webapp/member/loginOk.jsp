<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ${sessionScope.memName}님의 로그인 :) --%>
<center>
 <br><br>
 <img src ="../image/hey.gif" width="150" height="150">
 <br><br>
<strong>${memName}님의 로그인 </strong>
 <br><br>
 
<input type="button" value="로그아웃" onclick="location.href='/springProject/member/logout'"> &emsp;
<input type="button" value="회원정보수정"onclick="location.href='/springProject/member/modifyForm'">
</center>

