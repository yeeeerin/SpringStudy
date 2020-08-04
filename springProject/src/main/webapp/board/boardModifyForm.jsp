<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h4>** 글 수정 **</h4>
<form id="boardModifyForm" >
<input type = "hidden" name="seq" id="seq" value="${seq}">
<input type = "hidden" name="pg"  id="pg" value="${pg}">
<table border=0 cellspacing=3 cellpadding=3 width=700px style=table-layout:fixed frame="hside" rules="rows" >
 <tr align="Left">
 		<td colspan= "3">제목 : <input type = "text" name="subject" id="subject" size="90">
 			<span id="subjectSpan"></span>
 	</td>
 </tr>
 <tr>
 	<td>글 번호 : <span id="seqSpan"></td>
    <td >작 성 자 :<span id="idSpan"></td>
    <td >조 회 수:<span id="hitSpan"></td>	
 </tr>
 <tr>
 	<td>
 		<textarea cols='85' rows='15' name= "content" id= "content"  style="resize:none;" ></textarea>
 		<span id="contentSpan"></span>
 	</td>
 </tr>
 </table>
</form>
<input type="button" value="글 수정" id="boardModifyBtn">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type = "text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/springProject/board/getBoardView',
		data: 'seq='+$('#seq').val(),
		dataType: 'json',
		success : function(data){
			$('#subject').val(data.boardDTO.subject);
			$('#seqSpan').text(data.boardDTO.seq);
			$('#idSpan').text(data.boardDTO.id);
			$('#hitSpan').text(data.boardDTO.hit);
			$('#content').text(data.boardDTO.content);
		},
	});
	
});

$('#boardModifyBtn').click(function(){
	$('#subjectSpan').empty();
	$('#contentSpan').empty();
	
	if($('#subject').val()=='') {
		$('#subjectSpan').text('제목을 입력하세요');
		$('#subjectSpan').css('color', 'red');
		$('#subjectSpan').css('font-size', '8pt');
		$('#subjectSpan').focus();
	}else if($('#content').val()=='') {
		$('#contentSpan').text('내용을 입력하세요');
		$('#contentSpan').css('color', 'red');
		$('#contentSpan').css('font-size', '8pt');
		$('#contentSpan').focus();
	}else {
		$.ajax({
			type : 'post',
			url : '/springProject/board/boardModify',
			data: $('#boardModifyForm').serialize(),
			success : function(data){
				alert("글 수정 완료");
				location.href='/springProject/board/boardList?pg='+$('#pg').val();
			},
			error : function(err){
				console.log(err);
			}
		});
    }
});




</script>
