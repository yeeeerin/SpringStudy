<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
th {font-size:10pt; background-color : lightsteelblue;}
td {font-size:8pt;}

#addressA:link {color:black; text-decoration: none;}
#addressA:visited {color:black; text-decoration: none;}
#addressA:hover {color:coral; text-decoration: none; font-weight:bold;}
#addressA:attive {color:black; text-decoration: none;}
</style>


<form name="checkPostForm" id="checkPostForm" method= "post" >
		<table id= "postTable" border="1" cellspacing="0" cellpadding="3" width = "100%">
			<tr>
				<th>시도</th>
				<td align="center">
				<select name="sido" id="sido" style = "width:100px;">
							<option>시도선택</option>
							<option>서울</option>
							<option>인천</option>
							<option>대전</option>
							<option>대구</option>
							<option>울산</option>
							<option>세종</option>
							<option>광주</option>
							<option>경기</option>
							<option>강원</option>
							<option>전남</option>
							<option>전북</option>
							<option>충남</option>
							<option>충복</option>
							<option>부산</option>
							<option>제주</option>
					</select>
					<div id="sidoDiv"></div> 
				</td>
			
				<th>시.군.구</th>
				<td><input type="text" name="sigungu" id="sigungu" size= "20">
					<div id="sigunguDiv"></div> 
				</td>
		</tr>
		
		<tr>
			<th >도로명</th>
			<td colspan="3">
				<input type="text" name="roadname" id="roadname">
				<input type="button" id="postBtn"value="검색" >
				<div id="roadnameDiv"></div> 
			</td>
		</tr>
		
		<tr>
			<th>우편번호</th>
			<th colspan="3">주소</th>
		</tr>
		</table>
	</form>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type = "text/javascript" src = "../js/member.js"></script>
