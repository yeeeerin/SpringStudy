<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>글쓰기</h2>
<form name="boardWriteForm" method="post" action="/springProject/board/boardWrite">
		<table border=0 cellspacing=3 cellpadding=3  style=table-layout:fixed frame="hside" rules="rows" >
			<tr>
				<td align="center">제목  &emsp;</td>
				<td>
					<input type="text" name="subject" id="subject" size="58"  placeholder="제목 입력">
					<div id="subjectDiv"></div>
				</td>
			</tr>
			
			<tr>
				<td align="center">내용  &emsp;</td>
				<td>
					<textarea cols='50' rows='15' id="content" name='content' style="resize:none;" placeholder="내용을 입력" ></textarea>
					<div id="contentDiv"></div>
				</td>
			</tr>
		</table>
	</form>
		<input type="button" value="글쓰기" id="boardWriteBtn" > 
		<input type="reset" value="다시작성"> 
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type = "text/javascript" src = "../js/board.js"></script>
