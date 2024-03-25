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
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;
String pcode=request.getParameter("pcode");
String pname=request.getParameter("pname");
String price=request.getParameter("price");
String stockQty=request.getParameter("stockQty"); 
String sql="update product0320 set pname=?,price=?,stockQty=? where pcode=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,pname);
pstmt.setString(2,price);
pstmt.setString(3,stockQty);
pstmt.setString(4,pcode);
pstmt.executeUpdate();
%>
<script>
	alert("상품테이블 수정 성공");
	location.href="productSelect.jsp";
</script>
</body>
</html>