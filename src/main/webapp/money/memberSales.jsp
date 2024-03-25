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
	<td width="100px">회원이름</td>
	<td width="200px">판매번호</td>
	<td width="100px">단가</td>
	<td width="100px">수량</td>
	<td width="100px">가격</td>
	<td width="100px">상품코드</td>
	<td width="200px">상품명</td>	
	<td width="200px">판매일자</td>
</tr>
<%@ include file="DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select a.custno,a.custname,b.saleno,b.pcost,b.amount,b.price,b.pcode,";			
	sql+="c.pname,to_char(b.sdate,'yyyy-mm-dd') from member0320 a,money0320 b,";
	sql+="product0320 c where a.custno=b.custno and b.pcode=c.pcode";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String saleno=rs.getString(3);
		String pcost=rs.getString(4);
		String amount=rs.getString(5);
		String price=rs.getString(6);
		String pcode=rs.getString(7);
		String pname=rs.getString(8);
		String sdate=rs.getString(9);
		no++;		
%>
<tr>
    <td><%=no%></td>	
	<td><%=custno%></td>
	<td><%=custname%></td>
	<td><%=saleno%></td>
	<td><%=pcost%></td>
	<td><%=amount%></td>
	<td><%=price%></td>
	<td><%=pcode%></td>
	<td><%=pname%></td>
	<td><%=sdate%></td>	
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