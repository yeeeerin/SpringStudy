<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<form name="imageboardWriteForm" id="imageboardWriteForm" method="post" enctype="multipart/form-data" action="/springProject/imageboard/imageboardWrite">
<table border=0 cellspacing=3 cellpadding=3  style=table-layout:fixed frame="hside"  >
  <tr>
   <th>상품코드</th>
   <td>
   		<input type="text" name="imageId" id= "imageId" value="img_">
   		<div id="imageIdDiv"></div>
  </td>
  </tr>
  
  <tr>
   <th width="100">상품명</th>
   <td>
   		<input type="text" name="imageName" id="imageName">
   		<div id="imageNameDiv"></div>
   </td>
  </tr>
  
  <tr>
   <th>단가</th>
   <td>
   		<input type="number" name="imagePrice" id="imagePrice">
   		<div id="imagePriceDiv"></div>
   </td>
  </tr>
  
  <tr>
   <th>개수</th>
   <td>
   		<input type="number" name="imageQty" id="imageQty">
   		<div id="imageQtyDiv"></div>
   </td>
  </tr>
  
  <tr>
   <th>내용</th>
   <td>
   	 <textarea name="imageContent" id="imageContent" style="width: 350px; height: 200px;"></textarea>
   	 <div id="imageContentDiv"></div>
   </td>
  </tr>
  
  <tr>
   <td colspan="2">
   	<input type="file" name="img" id="image1" size="50">
   	 <div id="imageDiv"></div>
   </td>
  </tr>
  
   <tr>
   <td colspan="2">
   	<input type="file" name="img" id="image2" size="50">
   	 <div id="imageDiv"></div>
   </td>
  </tr>
  
  <tr>
   <td colspan="2">
   	<input type="file" name="img[]" id="image3" size="50" multiple>
   	 <div id="imageDiv"></div>
   </td>
  </tr>
  
  <tr>
   <td colspan=2 align="center">
    <input type="button" id="imageboardWriteBtn" value="이미지 등록">
    <input type="reset" value="다시작성">
   </td>
  </tr>
 </table>
</form>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('#imageboardWriteBtn').click(function(){
	$('#imageIdDiv').empty();
	$('#imageNameDiv').empty();
	$('#imagePriceDiv').empty();
	$('#imageQtyDiv').empty();
	$('#imageContentDiv').empty();
	$('#imageDiv').empty();
	
	if($('#imageId').val() == 'img_' || $('#imageId').val() == ''){
		$('#imageIdDiv').text('상품코드를 입력하세요');
		$('#imageIdDiv').css('color', 'red');
		$('#imageIdDiv').css('font-size', '8pt');
		$('#imageIdDiv').focus();		
	}else if($('#imageName').val() == ''){
		$('#imageNameDiv').text('상품명을 입력하세요');
		$('#imageNameDiv').css('color', 'red');
		$('#imageNameDiv').css('font-size', '8pt');
		$('#imageNameDiv').focus();		
	}else if($('#imagePrice').val() == ''){
		$('#imagePriceDiv').text('단가를 입력하세요 [숫자만 입력하세요]');
		$('#imagePriceDiv').css('color', 'red');
		$('#imagePriceDiv').css('font-size', '8pt');
		$('#imagePriceDiv').focus();		
	}else if($('#imageQty').val() == ''){
		$('#imageQtyDiv').text('개수를 입력하세요 [숫자만 입력하세요]');
		$('#imageQtyDiv').css('color', 'red');
		$('#imageQtyDiv').css('font-size', '8pt');
		$('#imageQtyDiv').focus();		
	}else if($('#imageContent').val() == ''){
		$('#imageContentDiv').text('내용을 입력하세요');
		$('#imageContentDiv').css('color', 'red');
		$('#imageContentDiv').css('font-size', '8pt');
		$('#imageContentDiv').focus();		
	}else{
		//document.imageboardWriteForm.submit();
		
		$.ajax({
			type: 'post',
			enctype:'multipart/form-data',
			processData: false,
			contentType: false,
			url: '/springProject/imageboard/imageboardWrite',
			data: new FormData($('#imageboardWriteForm')[0]),
			success: function(){
				alert("이미지를 저장하였습니다");
				location.href='/springProject/imageboard/imageboardList';
			},
			error:function(err){
				console.log(err);
			}
		});
	}
});
</script>



