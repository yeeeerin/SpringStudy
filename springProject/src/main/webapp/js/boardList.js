$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/springProject/board/getBoardList',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
				})).append($('<td/>',{
				
					}).append($('<a/>',{
						align: 'left',
						href: '#',
						text: items.subject,
						id: 'subjectA',
						class: items.seq+'',
						id: 'subjectA'
				}))).append($('<td/>',{
					align: 'center',
					text: items.id
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
				})).appendTo($('#boardListTable'));   
					
				//답글 이미지
				for(i=0; i<items.lev; i++){
					$('.' + items.seq).before('&emsp;');
				}
				
				if(items.pseq != 0){
					$('.'+items.seq).before($('<img/>',{
						src: '../image/reply.gif'
					}));
				}
			});  //each
			
			//페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			//로그인 여부 & 작서한 글 확인
			//$(부모).on('이벤트', 후속, function(){});
			$('#boardListTable').on('click', '#subjectA', function(){
					
					if(data.memId == null){
						alert('먼저 로그인하세요');
					}else{
						let seq = $(this).attr('class');
						let pg = data.pg;
						location.href='/springProject/board/boardView?seq='+seq+'&pg='+pg;
					}
			});
		
		},
		error: function(err){
			console.log(err);
		}
	});
});


//검색기능
$('#boardSearchBtn').click(function(event, str){	
	if(str != 'continue') $('input[name=pg]').val(1); //다른거 검색할 때 강제로 1로 이동
		
	if($('#keyword').val() == ''){
		alert('검색어를 입력하세요');
	}else{
		$.ajax({
			type : 'post',
			url : '/springProject/board/getBoardSearch',
			data: { 'pg': $('input[name=pg]').val(),
					'keyword':$('#keyword').val(),
				    'searchOption':$('#searchOption').val()},
			dataType: 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$('#boardListTable tr:gt(0)').remove();
				$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
				})).append($('<td/>',{
						
						}).append($('<a/>',{
							align: 'left',
							href: '#',
							text: items.subject,
							id: 'subjectA',
							class: items.seq+''
				}))).append($('<td/>',{
					align: 'center',
					text: items.id
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
				})).appendTo($('#boardListTable'));         
			});  //each
				
			//페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			},
			error: function(err){
			console.log(err);
		}
	});
		
	}
});

