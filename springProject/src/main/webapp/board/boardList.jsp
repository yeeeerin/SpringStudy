<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#subjectA:link {color:black; text-decoration: none;}
#subjectA:visited {color:black; text-decoration: none;}
#subjectA:hover {color:coral; text-decoration: none; font-weight:bold;}
#subjectA:attive {color:black; text-decoration: none;}
</style>

<input type="hidden" id="pg" value="${pg}">
<table id = "boardListTable" border=0 cellspacing=3 cellpadding=3 width=800px style=table-layout:fixed frame="hside" rules="rows">
		<tr align=center >
			<th width="100" >글 번 호</th>
			<th width="300">제 목</th>
			<th width="100"> 작 성 자</th>
			<th width="100">작 성 일</th>
			<th width="100">조 회 수</th>
		</tr>
</table>	
<br>
	<div id="boardPagingDiv" style="width: 700px; text-align : center;"></div>	
		<br><br>
		<input type="hidden" name="pg" value="1">
		<form name="boardSearch" method="post" action="/springProject/board/boardSearch.do">
			<select name="searchOption" id="searchOption">
				<option value="subject" selected>제목</option>
				<option value="id">작성자</option>
			</select> 
				<input type="search" name="keyword" id ="keyword" value = "${keyword}">
				<input type="button" id="boardSearchBtn"value="검색">
		</form>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type = "text/javascript" src = "../js/boardList.js?var=1"></script>
<script>
window.onload=function(){
	if("${searchOption}" == "subject" || "${searchOption}" == "id"){
		document.getElmentById("searchOption").value = "${searchOption}";
	}
}

function boardPaging(pg){
	var keyword = document.getElementById("keyword").value;
	if(keyword == ""){
		location.href="boardList?pg="+pg;
	}else{
		/*
		encodeURI는 특수문자는 인코딩이 안되고 
		encodeURIComponent는 모든 문자가 다되는듯 이왕이면 encodeURIComponent쓰자!
		*/
		$('input[name=pg]').val(pg);
		$('#boardSearchBtn').trigger('click','continue');
	}
}
</script>

