<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	 if (document.frm.pcode.value==""){
		 alert("상품코드를 입력하세요.");
		 document.frm.pcode.focus();
		 return false;
	 }	
	 if (document.frm.pcode.value.length!=4){
		 alert("상품코드는 문자4자리만 가능합니다.");
		 document.frm.pcode.focus();
		 return false;
	 }	
	 if (document.frm.pname.value==""){
		 alert("상품명을 입력하세요.");
		 document.frm.pname.focus();
		 return false;
	 }	
	 if (document.frm.price.value==""){
		 alert("단가을 입력하세요.");
		 document.frm.price.focus();
		 return false;
	 }	
	 if (document.frm.stockQty.value==""){
		 alert("재고수량를 입력하세요.");
		 document.frm.stockQty.focus();
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
<h2 id="addH2">상품 등록 화면</h2>
<form name="frm" method=post action="productProcess.jsp">
<table border=1 id="tableAdd">
<tr>
<th width="200px">상품코드</th>
<td width="500px"> <input type="text" name="pcode"></td>
</tr>
<tr>
<th width="200px">상품명</th>
<td width="500px"><input type="text" name="pname"></td>
</tr>
<tr>
<th width="200px">단가</th>
<td width="500px"> <input type="text" name="price"></td>
</tr>
<tr>
<th width="200px">재고수량</th>
<td width="500px"> <input type="text" name="stockQty"></td>
</tr>
<tr>
<th colspan="2">
<input class="bt" type="button" value="등록" onclick="check()">
<button class="bt" type="reset" >취소</button>
</th>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</head>
<body>

</body>
</html>