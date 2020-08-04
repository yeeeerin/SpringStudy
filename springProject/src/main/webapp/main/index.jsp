<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table cellspacing="3" cellpadding="5" width="100%">
	<tr> 
		<td colspan="2" align="Center" bgcolor=lightyellow ><jsp:include page="../template/top.jsp" flush="false"/></td>
	</tr>
	
	<tr>
		<td height="450" width="240" bgcolor=lavender valign="top"><jsp:include page="../template/left.jsp" flush="false"/></td>
			<td align="Center" bgcolor=lavenderblush><jsp:include page="${display}" flush="false"/></td>
	</tr>
	
	<tr>
		<td colspan="2" align="Center" height="20" bgcolor=lightsteelblue><jsp:include page="../template/bottom.jsp" flush="false"/></td>
	</tr>
</table>

