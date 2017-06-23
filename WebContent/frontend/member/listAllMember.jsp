<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	MemberService memSvc = new MemberService();
	List<MemberVO> list = memSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ��|����� - listAllMembers.jsp</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��|����� - ListAllMembers.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/member/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<%-- <%@ include file="pages/page1.file" %>  --%>
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�|���s��</th>
		<th>�|���W��</th>
		<th>�ʧO</th>
		<th>�ͤ�</th>
		<th>Mail</th>
		<th>�{�Ҫ��A</th>
	</tr>
<%-- 	begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
	<c:forEach var="memVO" items="${list}" >
		<tr align='center' valign='middle'>
			<td>${memVO.memno}</td>
			<td>${memVO.memname}</td>
			<td>${memVO.sex}</td>
			<td>${memVO.birth}</td>
			<td>${memVO.mail}</td>		
			<td>${memVO.status}</td>	
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="memno" value="${memVO.memno}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="memno" value="${memVO.memno}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- <%@ include file="pages/page2.file" %> --%>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>