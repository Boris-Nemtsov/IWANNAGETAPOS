<%@page import="Java.dbcontroller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IWANNAGETAPOSSYSTEM</title>
</head>
<link rel="stylesheet" type="text/css" href="bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="PopupSet.css">

<body>
	<div class="bg0" style="width: 250px;">
		<p>로그인</p>
			<div class="bg1">
			<form method=post class="form-group">
				<table class="table table-hover">
					<tr>
						<td> ID </td>
						<td> <input class="form-control" type=text name=userid size=10> </td>
					</tr>
					<tr>
						<td> PW </td>
						<td> <input class="form-control" type=password name=userpassword size=10> </td>
					</tr>
					<tr>
						<td colspan="2" align=center>
							<input class="btn btn-primary" type=submit value=로그인>
							<input class="btn btn-primary" type=reset value=취소>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</html>

<%
	if(request.getMethod().equals("POST")) {
		String userid, userpassword;
		userid = request.getParameter("userid");
		userpassword = request.getParameter("userpassword");
		
		String data[][] = new dbcontroller().sqlQuery("SELECT isadmin FROM user WHERE userid='" + userid + "' AND userpassword=SHA1('" + userpassword + "')");
		
		if(data[0][0] == null) 
			out.println("<script>alert('아이디 혹은 비밀번호가 올바르지 않습니다.')</script>"); 
		else {
			session.setAttribute("ID", userid);
			session.setAttribute("isadmin", data[0][0]);

			out.println("<script>location.href='main.jsp';</script>");
		}
	} else if(request.getMethod().equals("GET")) {
		if(request.getParameter("q") != null) {
			session.invalidate();
			out.println("<script>alert('로그아웃 되었습니다.')</script>");
		}
	} else {
		out.println("<script>alert('비정상적 접근입니다.');</script>");
		out.close();
	}

%>