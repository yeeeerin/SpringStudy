<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.productImage{
	width:60px;
 	height:50px;
 	}
.imageA:link {color:black; text-decoration: none;}
.imageA:visited {color:black; text-decoration: none;}
.imageA:hover {color:coral; text-decoration: none; font-weight:bold;}
.imageA:attive {color:black; text-decoration: none;}
</style> 

<form id="imageboardListForm" action="/springProject/imageboard/imageboardDelete">
<table id="imageboardListTable" border=0 cellspacing=3 cellpadding=3 width=800px style=table-layout:fixed frame="hside" rules="rows">
<tr align=center >
	<th width="100" >
	<input type="checkbox" id="all">번 호</th>
	<th width="100">이 미 지</th>
	<th width="100">상 품 명</th>
	<th width="100">단 가</th>
	<th width="100">개 수</th>
	<th width="100">합 계</th>
</tr>
</table>
</form>
<br>
<c:if test="${sessionScope.memId == 'admin'}">
	<input type="button" value="선택삭제" id="choiceDeleteBtn">
</c:if>
<div id="imageboardPagingDiv" style="width: 700px; text-align : center; display: inline-block;">${imageboardPaging.pagingHTML}</div>


<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type:'post',
		url: '/springProject/imageboard/getImageboardList',
		data: 'pg=${pg}',
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
					}).prepend($('<input/>',{
						type:'checkbox',
						value: items.seq,
						name: 'check'
					}))
				).append($('<td/>',{
					align: 'center',
					}).append($('<img/>',{
						src: '../storage/'+items.image1,
						class: items.seq+'',
						style: 'cursor: pointer; width: 70px; height: 70px;'
					}))
				).append($('<td/>',{
					align: 'center',
					text: items.imageName
				})).append($('<td/>',{
					align: 'center',
					text: items.imagePrice.toLocaleString()
				})).append($('<td/>',{
					align: 'center',
					text: items.imageQty
				})).append($('<td/>',{
					align: 'center',
					text: (items.imagePrice*items.imageQty).toLocaleString()
				})).appendTo($('#imageboardListTable'));
				
				//이미지 보기
				$('.'+items.seq).click(function(){
					location.href='/springProject/imageboard/imageboardView?seq='+items.seq+'&pg='+data.pg;              
				});
				
			}); //each
			
			//페이징 처리
			$('#imageboardPagingDiv').html(data.imageboardPaging.pagingHTML);
			
		},
		err:function(err){
			console.log(err);
		}
	});
});

//전체 선택 &해제
$('#all').click(function(){
	if($('#all').prop('checked'))
		$('input[name=check]').prop('checked', true);
	else
		$('input[name=check]').prop('checked', false);
});

//선택 삭제
$('#choiceDeleteBtn').click(function(){
	let count = $('input[name=check]:checked').length;
	
	if(count==0)
		alert("삭제할 항목을 선택하세요");
	else
		if(confirm("정말로 삭제하시겠습니까")){
			$('#imageboardListForm').submit();
		}
});
</script>

<script type="text/javascript">
function imageboardPaging(pg){
	location.href='/springProject/imageboard/imageboardList?pg='+pg;
}
</script>