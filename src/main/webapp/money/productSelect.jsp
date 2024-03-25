<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2 class="h2">상품목록조회</h2>
<table class="table" border=1>
<tr id="rowFirst">
	<td width="100px">no</td>
	<td width="200px">상품번호</td>
	<td width="200px">상품명</td>
	<td width="100px">단가</td>
	<td width="100px">재고</td>
	<td width="100px">구분</td>
</tr>
<%@ include file="DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from product0320";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	while(rs.next()){
		String pcode=rs.getString("pcode");
		String pname=rs.getString("pname");
		String price=rs.getString("price");
		String stockQty=rs.getString("stockQty");
		no++;		
%>
<tr>
	<td><%=no%></td>	
	<td><%=pcode%></td>
	<td><%=pname%></td>
	<td><%=price%></td>
	<td><%=stockQty%></td>
	<td><a href="productUpdate.jsp?pcode=<%=pcode%>">수정</a>/
	<a href="productDelete.jsp?pcode=<%=pcode%>"
		onclick="if(!confirm('정말로 삭제 하겠습니까?')) return false;">삭제</a>
	</td>
</tr>
<%
}
%>
</table>
</section>
<section>
<%@ include file="footer.jsp" %>
</section>
</body>
</html>