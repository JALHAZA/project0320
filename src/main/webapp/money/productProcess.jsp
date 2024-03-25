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
String pcode=request.getParameter("pcode");
String pname=request.getParameter("pname");
String price=request.getParameter("price");
String stockQty=request.getParameter("stockQty");
String sql="insert into product0320 values(?,?,?,?)";
PreparedStatement pstmt=null;
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,pcode);
pstmt.setString(2,pname);
pstmt.setString(3,price);
pstmt.setString(4,stockQty);
pstmt.executeUpdate();
%>	
<script>
	alert("상품등록이 완료되었습니다");
	location.href="productSelect.jsp";
</script>

</body>
</html>