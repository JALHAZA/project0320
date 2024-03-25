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
	String custno=request.getParameter("custno");
	String sql="delete from member0320 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,custno);
	pstmt.executeUpdate();		
%>
<script>
	alert("회원정보 삭제 성공");
	location.href="memberSelect.jsp";
</script>


</body>
</html>