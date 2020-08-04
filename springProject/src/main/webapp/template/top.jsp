<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.menu:link {color:black; text-decoration: none;}
.menu:visited {color:black; text-decoration: none;}
.menu:hover {color:coral; text-decoration: none; font-weight:bold;}
.menu:attive {color:black; text-decoration: none;}
</style>

<img src="../image/home.png" width="50" height="50" onclick="location.href='/springProject/main/index'" style="cursor:pointer;">
<h3>MVC 기반의 미니 프로젝트</h3>
<c:if test= "${(memId == null)}" >
</c:if>
<c:if test= "${(memId != null)}">
<a href="../board/boardWriteForm" class="menu">글쓰기</a> &emsp;
	<c:if test="${memId eq 'admin'}">
		<a href="../imageboard/imageboardWriteForm" class="menu">이미지 등록</a>&emsp;
	</c:if>
</c:if>
<a href="../board/boardList" class="menu">목록</a> &emsp;
<a href="../imageboard/imageboardList" class="menu">이미지목록</a> &emsp;
