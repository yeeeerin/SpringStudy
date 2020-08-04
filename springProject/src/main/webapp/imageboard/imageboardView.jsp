<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>
<h2>상 세 정 보</h2>
	<table border="0" cellspacing=3 cellpadding=3 style=table-layout:fixed frame="hside" rules="rows" width="500">
		<tr>
			<td rowspan="4" >
				<img id="mainImg"  height="80" ><br>
				<img src="../image/detail.png"  width="20" height="20" style="cursor:pointer;" onclick="detailImage()">
				<img src="../image/detail.png" width="20" height="20" style="cursor:pointer;"  id ="imageView">
			</td>
			<th>상 품 명</th>
			<td><span id = "imageNameSpan"></span><td>
		</tr>
		<tr>
			<th>단&emsp;가</th>
			<td><span id = "imagePriceSpan"></span><td>
		</tr>
		<tr>
			<th>개&emsp;수</th>
			<td><span id = "imageQtySpan"></span><td>
		</tr>
		<tr>
			<th>합&emsp;계</th>
			<td><span id = "imageTotalSpan"></span><td>
		</tr>
		<tr>
			<th colspan="4">내&emsp;용</th>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top" >
			<pre><span id = "imageContentSpan"></span></pre>
			</td>
		</tr>
	</table>
<input type="button" value="목록" onclick="location.href='imageboardList?pg=${pg}'">
</center>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/springProject/imageboard/getImageboardView',
		data: 'seq=${seq}',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			let total = data.imageboardDTO.imagePrice * data.imageboardDTO.imageQty;
			$('#mainImg').attr('src', '../storage/'+data.imageboardDTO.image1);
			$('#mainImg').attr('width','80px;');
			$('#mainImg').attr('height','80px;');
			$('#imageNameSpan').text(data.imageboardDTO.imageName);
			$('#imagePriceSpan').text(data.imageboardDTO.imagePrice.toLocaleString());
			$('#imageQtySpan').text(data.imageboardDTO.imageQty);
			$('#imageTotalSpan').text(total.toLocaleString());
			$('#imageContentSpan').text(data.imageboardDTO.imageContent);
		},error: function(err){
			console.log(err);
		}
	});
});
</script>

<script type="text/javascript">
function detailImage(){
	let newWindow = window.open("","","width=500 height=500");
	
	let img = newWindow.document.createElement("img");
	img.setAttribute("src","http:/localhost:8081/springProject/storage/${imageboardDTO.image1}");
	img.setAttribute("width","450");
	img.setAttribute("height","450");
	newWindow.document.body.appendChild(img);
}

$('#imageView').click(function(){
	let url = $('#mainImg').attr('src');
	let newWindow = window.open(url,'','width=300 height=300');

});
</script>

