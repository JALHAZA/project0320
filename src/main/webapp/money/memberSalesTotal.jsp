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
<h2 class="h2">후보자 등수</h2>
<table class="table" border=1>
<tr id="rowFirst">
	<td width="00px">no</td>
	<td width="100px">회원번호</td>
	<td width="100px">회원이름</td>	
	<td width="200px">고객등급</td>
	<td width="200px">매출</td>
</tr>
<%@ include file="DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select a.custno,a.custname,a.grade,sum(b.amount*b.price) from member0320 a,money0320 b where a.custno=b.custno group by a.custno,a.custname,a.grade order by count(b.amount*b.price) asc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String grade=rs.getString(3);
		String m_sum=rs.getString(4);
		no++;
		
%>
<tr>
	<td><%=no%></td>
	<td><%=custno%></td>
	<td><%=custname%></td>
	<td><%=grade%></td>
	<td><%=m_sum%></td>		
</tr>
<%
}
%>
<caption id="cap2"><input class="bt"type="submit" value="작성" onclick="CandidateInquiryProcess.jsp"></caption>
</table>
</section>
<section>
<%@ include file="footer.jsp" %>
</section>
</body>
</html>