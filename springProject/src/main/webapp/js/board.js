$('#boardWriteBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val()=='') {
		$('#subjectDiv').text('제목을 입력하세요');
		$('#subjectDiv').css('color', 'red');
		$('#subjectDiv').css('font-size', '8pt');
		$('#subjectDiv').focus();
	}else if($('#content').val()=='') {
		$('#contentDiv').text('내용을 입력하세요');
		$('#contentDiv').css('color', 'red');
		$('#contentDiv').css('font-size', '8pt');
		$('#contentDiv').focus();
	}else {
		document.forms[0].submit();
		/*$.ajax({
	    		type : 'post',
	    		url : '/springProject/board/boardWrite',
	    		data : {'subject' : $('#subject').val(),
	    				   'content': $('#content').val()},
	    		success : function(data){
	    			alert('작성하신 글을 저장하였습니다.');
	    			location.href = '/springProject/board/boardList';
	    		},
	    		error : function(err){
					console.log(err);
				}
	    	});*/
    }
});


function isLogin(memId,seq,pg){
	if(memId == '')
		alert("먼저 로그인하세요");
	else
		location.href="boardView.do?seq="+seq+"&pg="+pg;
}

function checkBoardModifyForm(){
	if(document.boardModifyForm.subject.value == "") {
		alert("제목을 입력하세요");
		document.boardModifyForm.subject.focus();
	}else if(document.boardModifyForm.content.value == "") {
		alert("내용을 입력하세요");
	}else {
		document.boardModifyForm.submit();
	}
}

/*
boardPaging : 폼을 잡았다고 가정한다면 페이지처리방법
function boardPaging(pg){
	var keyword = document.getElementById("keyword").value;
	if(keyword == ""){
		location.href = "boardList.do?pg="+pg;
	}else {
	encodeURI는 특수문자 인코딩불가
	encodeURIComponent는 모든 문자가 가능
	location.href="boardSearch.do?pg="+pg+"&searchOption=${searchOption}&keyword="+encodeURIComponent("${keyword}");
	}
}
*/

function checkBoardkReplyForm(){
	if(document.boardReplyForm.subject.value == "") {
		alert("제목을 입력하세요");
		document.boardReplyForm.subject.focus();
	}else if(document.boardReplyForm.content.value == "") {
		alert("내용를 입력하세요");
		document.boardReplyForm.content.focus();
	}else {
		document.boardReplyForm.submit();
	}
}

