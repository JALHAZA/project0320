<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	 if (document.frm.pname.value==""){
		 alert("상품명을 입력하세요.");
		 document.frm.pname.focus();
		 return false;
	 }	
	 if (document.frm.price.value==""){
		 alert("가격을 입력하세요.");
		 document.frm.price.focus();
		 return false;
	 }
	 if (document.frm.stockQty.value==""){
		 alert("재고수량를 입력하세요.");
		 document.frm.stockQty.focus();
		 return false;
	 }			
	 document.frm.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="addMemSec">
<%@ include file="DBConn.jsp" %>
<%
	String pcode=request.getParameter("pcode");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from product0320 where pcode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,pcode);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String pname=rs.getString("pname");
		String price=rs.getString("price");
		String stockQty=rs.getString("stockQty");									
%>
<h2 id="addH2">상품 수정 화면</h2>
<form name="frm" method=post action="productUpdateProcess.jsp">
<table border=1 id="tableAdd">
<tr>
<th width="200px">상품코드</th>
<td width="500px"> <input type="text" name="pcode" value="<%=pcode%>"></td>
</tr>
<tr>
<th width="200px">상품명</th>
<td width="500px"><input type="text" name="pname" value="<%=pname%>"></td>
</tr>
<tr>
<th width="200px">단가</th>
<td width="500px"> <input type="text" name="price" value="<%=price%>"></td>
</tr>
<tr>
<th width="200px">재고수량</th>
<td width="500px"> <input type="text" name="stockQty" value="<%=stockQty%>"></td>
</tr>
<tr>
<th colspan="2">
<input width="100px" type="button" value="등록" onclick="check()">
<button type="reset" >취소</button>
</th>
</tr>
<%
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>