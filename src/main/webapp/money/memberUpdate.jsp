<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function check(){
	 if (document.frm.custname.value==""){
		 alert("회원성명을 입력하세요.");
		 document.frm.custname.focus();
		 return false;
	 }	
	 if (document.frm.phone.value==""){
		 alert("회원전화번호를 입력하세요.");
		 document.frm.phone.focus();
		 return false;
	 }		 
	 if (document.frm.address.value==""){
		 alert("회원주소를 선택하세요.");
		 document.frm.address.focus();
		 return false;
	 }		 	 
	 if (document.frm.joindate.value==""){
		 alert("가입일자를 입력하세요.");
		 document.frm.joindate .focus();
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
	String custno=request.getParameter("custno");	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city,goods from member0320 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,custno);		
	rs=pstmt.executeQuery();
	if(rs.next()){	
		String custname=rs.getString(2);
		String phone=rs.getString(3);
		String address=rs.getString(4);
		String joindate=rs.getString(5);
		String grade=rs.getString(6);
		String city=rs.getString(7);
		String goods=rs.getString(8);
		String arr[]=goods.split(",");
							
		
		
		
%>
<h2 id="addH2">홈쇼핑 회원 수정</h2>
<form name="frm" method=post action="memberUpdateProcess.jsp">
<table border=1 id="tableAdd">
<tr>
<th width="200px">회원번호</th>
<td width="300px"> <input type="text" name="custno" value="<%=custno%>"></td>
</tr>
<tr>
<th width="200px">회원성명</th>
<td width="500px"><input type="text" name="custname" value="<%=custname%>"></td>
</tr>
<tr>
<th width="200px">전화번호</th>
<td width="500px"><input type="text" name="phone" value="<%=phone%>"></td>
</tr>
<tr>
<th width="200px">주소</th>
<td width="500px"><input type="text" name="address" value="<%=address%>"></td>
</tr>
<tr>
<th width="200px">가입일자</th>
<td width="500px"><input type="text" name="joindate" value="<%=joindate%>"></td>
</tr>
<tr>
<th width="200px">고객등급</th>
<td width="500px">
<select name="grade" value="<%=grade%>" >
	 <option value="A"<%if(grade.equals("A")){%>selected<%} %>>A:VIP</option>
	 <option value="B"<%if(grade.equals("B")){%>selected<%} %>>B:일반</option>
	 <option value="C"<%if(grade.equals("C")){%>selected<%} %>>C:직원</option>	 
</select> 
</td>
</tr>
<tr>
<th width="200px">도시코드</th>
<td width="500px">
<select name="city" value="<%=city%>" >
	 <option value="01"<%if(city.equals("01")){%>selected<%} %>>서울</option>
	 <option value="02"<%if(city.equals("02")){%>selected<%} %>>경기</option>
	 <option value="10"<%if(city.equals("10")){%>selected<%} %>>대전</option>
	 <option value="20"<%if(city.equals("20")){%>selected<%} %>>부산</option>
	 <option value="30"<%if(city.equals("30")){%>selected<%} %>>광주</option>
	 <option value="40"<%if(city.equals("40")){%>selected<%} %>>울산</option>
	 <option value="50"<%if(city.equals("50")){%>selected<%} %>>대구</option>
	 <option value="60"<%if(city.equals("60")){%>selected<%} %>>강원</option>
	 <option value="70"<%if(city.equals("70")){%>selected<%} %>>경상</option>
	 <option value="80"<%if(city.equals("80")){%>selected<%} %>>충청</option>
	 <option value="90"<%if(city.equals("90")){%>selected<%} %>>제주</option>
</select> 
</td>
</tr>
<tr>
<th width="200px">관심상품</th>
<td width="700px">
<label><input type="checkbox" name="goods" value="프로그램"<%for(int i=0;i<arr.length;i++)if("프로그램".equals(arr[i])) out.print("checked");%>>프로그램</label>
<label><input type="checkbox" name="goods" value="의류"<%for(int i=0;i<arr.length;i++)if("의류".equals(arr[i])) out.print("checked");%>>의류</label>
<label><input type="checkbox" name="goods" value="식료품"<%for(int i=0;i<arr.length;i++)if("식료품".equals(arr[i])) out.print("checked");%>>식료품</label>
<label><input type="checkbox" name="goods" value="컴퓨터"<%for(int i=0;i<arr.length;i++)if("컴퓨터".equals(arr[i])) out.print("checked");%>>컴퓨터</label>
<label><input type="checkbox" name="goods" value="공산품"<%for(int i=0;i<arr.length;i++)if("공산품".equals(arr[i])) out.print("checked");%>>공산품</label>
<label><input type="checkbox" name="goods" value="광광"<%for(int i=0;i<arr.length;i++)if("관광".equals(arr[i])) out.print("checked");%>>관광</label>
<label><input type="checkbox" name="goods" value="전자제품"<%for(int i=0;i<arr.length;i++)if("전자제품".equals(arr[i])) out.print("checked");%>>전자제품</label>
<label><input type="checkbox" name="goods" value="건강제품"<%for(int i=0;i<arr.length;i++)if("건강제품".equals(arr[i])) out.print("checked");%>>건강제품</label>
<label><input type="checkbox" name="goods" value="운동기구"<%for(int i=0;i<arr.length;i++)if("운동기구".equals(arr[i])) out.print("checked");%>>운동기구</label>
</td>
</tr>
<th colspan="2">
<input width="100px" type="button" value="수정" onclick="check()">
<button type="reset" >조회</button>
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