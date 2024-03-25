<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	String pcode=request.getParameter("pcode");
	String sql="delete from product0320 where pcode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,pcode);
	pstmt.executeUpdate();		
%>
<script>
	alert("상품 삭제 성공");
	location.href="productSelect.jsp";
</script>
</body>
</html>