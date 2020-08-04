<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--boardWrite는 무조건 첫번째 페이지를 보여줘여 하지만 boardReply는 답글이기에 기존의 글 페이지위치로 가는점이 다르다-->
window.onload = function() {
	alert("답글이 작성되었습니다");
	location.href='boardList?pg=${pg}';
}
</script>
