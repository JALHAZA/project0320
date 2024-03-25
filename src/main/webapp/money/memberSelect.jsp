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
<h2 class="h2">회원목록조회/수정</h2>
<table class="table" border=1>
<tr id="rowFirst">
	<td width="100px">no</td>
	<td width="100px">회원번호</td>
	<td width="100px">회원성명</td>
	<td width="200px">전화번호</td>
	<td width="300px">주소</td>
	<td width="200px">가입일자</td>
	<td width="100px">고객등급</td>
	<td width="100px">거주지역</td>
	<td width="300px">관심상품</td>	
	<td width="100px">구분</td>
</tr>
<%@ include file="DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city,goods from member0320";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String phone=rs.getString(3);
		String address=rs.getString(4);
		String joindate=rs.getString(5);
		String grade=rs.getString(6);
		String city=rs.getString(7);
		String goods=rs.getString(8);
		no++;		
%>
<tr>
    <td><%=no %></td>
	<td><a href="memberUpdate.jsp?custno=<%=custno%>"><%=custno%></a></td>
	<td><%=custname%></td>
	<td><%=phone%></td>
	<td><%=address%></td>
	<td><%=joindate%></td>
	<td><%=grade%></td>
	<td><%=city%></td>
	<td><%=goods%></td>
	<td><a href="memberDelete.jsp?custno=<%=custno%>"
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