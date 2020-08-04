<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>회원 정보 수정</h4>
<form id= "modifyForm" name="modifyForm" method="post">
		<table border="1" cellspacing="3" cellpadding="3">
			<tr>
				<td align="center">이 름</td>
				<td >
					<input type="text" name="name" id="name" value= "${memberDTO.getName()}" size = "10">
					<div id="nameDiv"></div>
				</td>
			</tr>

			<tr>
				<td align="center">아 이 디</td>
				<td>
					<input type="text" name="id" size = "20" value= "${memberDTO.getId()}" readonly>
				</td>
			</tr>

			<tr>
				<td align="center">비 밀 번 호</td>
				<td>
					<input type="password" name="pwd" id="pwd" size = "30">
					<div id="pwdDiv"></div>
				</td>
			</tr>

			<tr>
				<td align="center">비 밀 번 호 재 확 인</td>
				<td>
					<input type="password" name="repwd" id="repwd" size = "30">
					<div id="repwdDiv"></div>
				</td>
			</tr>

			<tr>
				<td align="center">성 별</td>
				<td>
					<input type="radio" name="gender" value="0">남 &emsp;&emsp;
					<input type="radio" name="gender" value="1">여</td>
			</tr>

			<tr>
				<td align="center">이 메 일</td>
				<td>
					<input type="text" name="email1" value= "${memberDTO.getEmail1()}" size = "10"> @
					<input type="email" name="email2" id = "email2" size = "15" placeholder= "직접입력" list="defaultEmails"> 
					<datalist id="defaultEmails">
						<option value="@naver.com">
						<option value="@gmail.com">
						<option value="@hanmail.net">
					</datalist>
				</td>
			</tr>

			<tr>
				<td align="center">핸 드 폰</td>
				<td>
				<select name="tel1" value="${memberDTO.getTel1()}">
						<option value = "010">010</option>
						<option value = "017">017</option>
						<option value = "019">019</option>
				</select> 
				-  <input type="text" name="tel2"  value="${memberDTO.getTel2()}" size ="9">
				-  <input type="text" name="tel3"  value="${memberDTO.getTel3()}"size ="9"> </td>
			</tr>

			<tr>
				<td align="center">주 소</td>
				<td>
				<input type="text" name="zipcode" id = "zipcode" value="${memberDTO.getZipcode()}"readonly>
				<input type="button" value="우편번호 검색" id="checkPostBtn">
					<br><input type="text" name = "addr1" id = "addr1" value="${memberDTO.getAddr1()}"  placeholder= "주소" size="30" readonly>
					<br><input type="text" name = "addr2" id = "addr2" value="${memberDTO.getAddr2()}" placeholder="상세주소" size="30">
			</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<input type="button" value="회원정보수정" id="modifyBtn"> 
				<input type="reset"  value="다시작성"></td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type = "text/javascript" src = "../js/member.js"></script>
<script type="text/javascript">
//현재페이지가 보여지면 바로 읽어지는 기능 
window.onload =function(){
	document.modifyForm.gender['${memberDTO.gender}'].checked = true;
	document.modifyForm.email2.value = '${memberDTO.email2}'; 
	document.modifyForm.tel1.value = '${memberDTO.tel1}'; 
}
</script>
