<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<meta CONTENT="text/html;charset=UTF-8">
		<title>ȸ����������</title>
	</head>
	
	<body>
		
		<br><br><h1 align="center"> ȸ�� ���� ���� </h1><br><br>
		
<form action="control_member.jsp?action=modify" method="post">
		
		<table align="center">
		
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">ID</td>
				<td width="300" align="center"> <input type=text name=name_mem size=30 maxlength=20> </td>
			</tr>
			
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">��й�ȣ</td>
				<td width="300" align="center"> <input type="password" name=password size=30 maxlength=20> </td>
			</tr>
			
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">��й�ȣ Ȯ��</td>
				<td width="300" align="center"> <input type=password name=password1 size=30 maxlength=20> </td>
			</tr>
		
			<tr height="45" valign="middle">
				<td width="150" align="center" bgcolor="#efefef">����</td>
				<td width="300" align="center"> 
					<select name="age_mem" size=1 style="width:50pt" >
<%
						int j;
						for(j=1; j<=100; j++)
							out.println("<option value="+j+">"+j+"</option>");
%>					
					</select> 
				</td>
			</tr>
			
		</table>
		
		<p align="center">
			<br><br>
			<input type="submit" value="����" style="width:100pt; height:30pt; margin-right:15pt; background-color:#dedede"/>
			<input type=reset value="�ʱ�ȭ" style="width:100pt; height:30pt; margin-right:15pt; background-color:#dedede">		
		</p>	
		
</form>
	
	</body>
</html>