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
<%@ include file="DBConn.jsp" %>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
String sql="";
int next_id=0;
try{
	sql="select max(custno) from member0320";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		next_id=rs.getInt(1)+1;		
	}else{
		next_id=1;
	}
}catch(Exception e){
	System.out.println("member 테이블 일기 오류");
	System.out.println("SQL:"+e.getMessage());
}

%>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="addMemSec">
<h2 id="addH2">홈쇼핑 회원 등록</h2>
<form name="frm" method=post action="memberProcess.jsp">
<table border=1 id="tableAdd">
<tr>
<th width="200px">회원번호(자동등록)</th>
<td width="300px"> <input type="text" name="custno" value="<%=next_id %>"></td>
</tr>
<tr>
<th width="200px">회원성명</th>
<td width="500px"><input type="text" name="custname"></td>
</tr>
<tr>
<th width="200px">회원전화</th>
<td width="500px"><input type="text" name="phone"></td>
</tr>
<tr>
<th width="200px">회원주소</th>
<td width="500px"><input type="text" name="address"></td>
</tr>
<tr>
<th width="200px">가입일자</th>
<td width="500px"><input type="text" name="joindate"></td>
</tr>
<tr>
<th width="200px">고객등급</th>
<td>
<select name="grade">
	 <option value="A">A:VIP</option>
	 <option value="B">B:일반</option>
	 <option value="C">C:직원</option>
</select> 
</td>
</tr>
<tr>
<th width="200px">도시코드</th>
<td>
<select name="city">
	 <option value="01">서울</option>
	 <option value="02">경기</option>
	 <option value="10">대전</option>
	 <option value="20">부산</option>
	 <option value="30">광주</option>
	 <option value="40">울산</option>
	 <option value="50">대구</option>
	 <option value="60">강원</option>
	 <option value="70">경상</option>
	 <option value="80">충청</option>
	 <option value="90">제주</option>
</select> 
</td>
</tr>
<tr>
<th width="200px">관심품묵</th>
<td width="500px">
<label><input type="checkbox" name="goods" value="프로그램">프로그램</label>
<label><input type="checkbox" name="goods" value="의류">의류</label>
<label><input type="checkbox" name="goods" value="컴퓨터">컴퓨터</label>
<label><input type="checkbox" name="goods" value="공산품">공산품</label>
<label><input type="checkbox" name="goods" value="관광">관광</label>
<label><input type="checkbox" name="goods" value="전자제품">전자제품</label>
<label><input type="checkbox" name="goods" value="건강제품">건강제품</label>
<label><input type="checkbox" name="goods" value="운동기구">운동기구</label>
</td>
</tr>
<tr>
<th colspan="2">
<input class="bt"type="button" value="등록" onclick="check()">
<button class="bt" type="reset" >조회</button>
</th>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>