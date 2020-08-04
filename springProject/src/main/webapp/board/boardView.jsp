<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>
<h2> 작 성 글 </h2>
<form name="boardViewForm">
	<input type="hidden" id="seq" name="seq" value="${seq}">
	<input type="hidden" id="pg" name="pg" value="${pg}">
		<table border=0 cellspacing=3 cellpadding=3 width=700px style=table-layout:fixed frame="hside" rules="rows" >
		 <tr align="Left" colspan="2">
		 	<td colspan= "3">제목 : <span id="subjectSpan"></span> </td>
		 </tr>
		 
		 <tr>
		 	<td>글 번호 :  <span id="seqSpan"></span></td>
		    <td>작 성 자 :   <span id="idSpan"></span></td>
		    <td>조 회 수:  <span id="hitSpan"></span></td>	
		 </tr>
		 <tr>
		 	<td valign="top" colspan = '3' height= 300 
		 		style="white-space: pre-wrap; word-break: break-all; overflow: auto;"><span id="contentSpan"></span>
		 	</td>	
		 </tr>
		 </table>
 </form>
<input type="button" value="목록" onclick="location.href='boardList?pg=${pg}'">
<input type="button" value="답글" onclick="mode(3)">
<span id="boardViewSpan">
<input type="button" value="글 수정" onclick="mode(1)">
<input type="button" value="글 삭제" onclick="mode(2)">
</span>
</center>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/springProject/board/getBoardView',
		data : 'seq='+$('#seq').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$('#subjectSpan').text(data.boardDTO.subject);
			$('#seqSpan').text(data.boardDTO.seq);
			$('#idSpan').text(data.boardDTO.id);
			$('#hitSpan').text(data.boardDTO.hit);
			$('#contentSpan').text(data.boardDTO.content);
			
			if(data.memId ==data.boardDTO.id){
				$('#boardViewSpan').show();
			}else{
				$('#boardViewSpan').hide();
			}
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>
<script type="text/javascript">
function mode(num){
	if(num ==1){ //글 수정
		document.boardViewForm.method = 'post';
		document.boardViewForm.action='boardModifyForm';
		document.boardViewForm.submit();
	}else if(num==2){ //글삭제
		if(confirm("삭제하시겠습니까?")){
			document.boardViewForm.method = 'post';
			document.boardViewForm.action = 'boardDelete';
			document.boardViewForm.submit();
		}
		
	}else if(num ==3) { //답글
		document.boardViewForm.method = 'post';
		document.boardViewForm.action='boardReplyForm';
		document.boardViewForm.submit();
	}
}
</script>