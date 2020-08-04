//로그인
$('#loginBtn').click(function(){
	$('.idDiv').empty();
	$('.pwdDiv').empty();
	
	if($('.id').val()=='') {
		$('.idDiv').text('아이디를 입력하세요');
		$('.idDiv').css('color', 'red');
		$('.idDiv').css('font-size', '8pt');
		$('.idDiv').focus();
	}else if($('.pwd').val()=='') {
		$('.pwdDiv').text('비밀번호를 입력하세요');
		$('.pwdDiv').css('color', 'red');
		$('.pwdDiv').css('font-size', '8pt');
		$('.pwdDiv').focus();
	}else {
		    $.ajax({
    		type : 'post',
    		url : '/springProject/member/login',
    		data : {'id' : $('.id').val(),
    				'pwd' : $('.pwd').val()},
    		dataType : 'text',
    		success : function(data){
    			if(data == 'success'){
    				location.href = '/springProject/main/index';
    				
    			}else if(data == 'fail'){
    				$('#loginResultDiv').text('로그인 실패');
    				$('#loginResultDiv').css('color', 'red');
					$('#loginResultDiv').css('font-size', '10pt');
					
    				$('.id').focus();
    			}
    		},
    		error : function(e){
				console.log(e);
			}
    	});
    }
});

//회원가입 유효성 검사
$('#writeBtn').click(function(){
	//공백을 지원주는 작업
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if($('#name').val()==''){
		$('#nameDiv').text('이름을 입력하세요');
		$('#nameDiv').css('color', 'red');
		$('#nameDiv').css('font-size', '8pt');
		$('#name').focus();
	} else if($('#id').val()==''){ 
		$('#idDiv').text('아이디를 입력하세요');
		$('#idDiv').css('color', 'red');
		$('#idDiv').css('font-size', '8pt');
		$('#id').focus();
	} else if($('#checkIdResult').val() != $('#id').val()){
    	$('#idDiv').text('중복체크 하세요')
    	$('#idDiv').css('color', 'red');
        $('#idDiv').css('font-size', '8pt')
        $('#id').focus();
    } else if($('#pwd').val() ==''){
		$('#pwdDiv').text('비밀번호를 입력하세요');
		$('#pwdDiv').css('color', 'red');
		$('#pwdDiv').css('font-size', '8pt');
		$('#pwd').focus();
	} else if($('#pwd').val()!= $('#repwd').val()){
		$('#repwdDiv').text('비밀번호가 일치하지 않습니다.');
		$('#repwdDiv').css('color', 'red');
		$('#repwdDiv').css('font-size', '8pt');
		$('#repwd').focus();
	}else {
		$('form[name=writeForm]').submit();
	}
});
		 	

//중복체크
$('#id').focusout(function(){
	$('#idDiv').empty();
	
	let id = $('#id').val();
	
	if(id == ''){
		$('#idDiv').text('먼저 아이디를 입력하세요');
		$('#idDiv').css('color', 'red');
		$('#idDiv').css('font-size', '8pt');
		$('#id').focus();
	}else {
		$.ajax({
			type:'post',
			url:'/springProject/member/checkId',
			data: 'id='+id,
			dataType:'text',
			success : function(data){
	 			if(data == 'exist'){
					$('#idDiv').text('사용 불가능')
    					$('#idDiv').css('color', 'red');
						$('#idDiv').css('font-size', '8pt');
						$('#idDiv').css('font-weight', 'bold');
					
				}else if(data=='non_exist'){
					$('#checkIdResult').val($('#id').val());
					
					$('#idDiv').text('사용 가능')
    					$('#idDiv').css('color', 'red');
    					$('#idDiv').css('font-size', '8pt');
				}
	 		},
			error : function(e){
				console.log(e);
			}
		});
	}
});


//우편주소
$('#checkPostBtn').on('click' , function(){
	window.open("/springProject/member/checkPost","","width=500 height=500 scrollbars=yes");
});

//주소 받아 오는 메소드
$('#postBtn').click(function(){
	$('#sidoDiv').empty();
	$('#sigunguDiv').empty();
	$('#roadnameDiv').empty();

	if($('#sido').val() == '시도선택'){
		$('#sidoDiv').text('시도를 선택해주세요');
		$('#sidoDiv').css('color', 'red');
		$('#sidoDiv').css('font-size', '8pt');
		
	}else if($('#sido').val() != '세종' && $('#sigungu').val() == ''){
		$('#sigunguDiv').text('시.군.구를 선택하시오');
		$('#sigunguDiv').css('color', 'red');
		$('#sigunguDiv').css('font-size', '8pt');
	
	}else if($('#roadname').val() == ''){
		$('#roadnameDiv').text('도로명을 입력하시오');
		$('#roadnameDiv').css('color', 'red');
		$('#roadnameDiv').css('font-size', '8pt');
	}else {
		$.ajax({
			type: 'post',
			url: '/springProject/member/getZipcodeList',
			data: $('#checkPostForm').serialize(),
			dataType:'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				//3번줄부터 리셋 (시도 / 도로명 / 우편번호줄)
				$.each(data.list, function(index, items){
					let address = items.sido+' '+
								  items.sigungu+' '+
								  items.yubmyundong+' '+
								  items.ri+' '+
								  items.roadname+' '+
								  items.buildingname;
					address = address.replace(/null/g, '');
					
					$('<tr/>').append($('<td/>',{
						align : 'center',
						text : items.zipcode
					})).append($('<td/>',{
						colspan : '3'
						}).append($('<a/>', {
							href : '#',
							id : 'addressA',
							text : address
						}))
					).appendTo($('#postTable'));
				});//each
				
				//a태그를 클립했을 때
				$('a').click(function(){ 
					//alert($(this).parent().prev().text()); 	우편번호
					
					$('#zipcode', opener.document).val($(this).parent().prev().text());
					$('#addr1', opener.document).val($(this).text());
					$('#addr2' ,opener.document).focus();
					window.close();
				});//a
				
			},//success
			error : function(e){
				console.log(e);
			}//error
		});
	}
});
//회원정보수정
$('#modifyBtn').click(function(){
	$('#nameDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if($('#name').val()==''){
		$('#nameDiv').text('이름을 입력하세요');
		$('#nameDiv').css('color', 'red');
		$('#nameDiv').css('font-size', '8pt');
		$('#name').focus();
	} else if($('#pwd').val() ==''){
		$('#pwdDiv').text('비밀번호를 입력하세요');
		$('#pwdDiv').css('color', 'red');
		$('#pwdDiv').css('font-size', '8pt');
		$('#pwd').focus();
	} else if($('#pwd').val()!= $('#repwd').val()){
		$('#repwdDiv').text('비밀번호가 일치하지 않습니다.');
		$('#repwdDiv').css('color', 'red');
		$('#repwdDiv').css('font-size', '8pt');
		$('#repwd').focus();
	}else{
    	$.ajax({
    		type: 'post',
    		url: '/springProject/member/modify',
    		data: $('#modifyForm').serialize(),
    		success: function(){
    			alert('회원 정보 수정 완료');
    			location.href='/springProject/main/index';
    		},
    		error: function(err){
    			console.log(err);
    		}
    	});
    } 
 });


function checkPostClose(zipcode, address){
	opener.document.getElementById("zipcode").value = zipcode;
	opener.document.getElementById("addr1").value = address;
	window.close();
	opener.document.getElementById("addr2").addr2.focus();
	
}


function checkPostClose(zipcode, address) {
	   opener.document.getElementById("zipcode").value = zipcode;
	   opener.document.getElementById("addr1").value = address;
	   window.close();
	   opener.document.getElementById("addr2").focus();
	}
