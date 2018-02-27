<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:include page="session.jsp">
	<jsp:param name="isadmin" value="1"/>
</jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계정추가</title>
</head>
<link rel="stylesheet" type="text/css" href="bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="PopupSet.css">
<body>
<script type="text/javascript" src="js/sql.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

<script>
function AccIst() {
	if($(document).find('#obj_id').val() != "" && $(document).find('#obj_pass').val() != "" &&
			$(document).find('#obj_name').val() != "") {
		var queryResult = sqlQuery("SELECT * FROM user WHERE userid='" + $(document).find('#obj_id').val() + "'");
		if(queryResult.Count == 1) {
			alert("이미 존재하는 아이디입니다.");
		} else {
			sqlQuery("INSERT INTO user(userid, userpassword, name, isadmin) VALUES('" + 
					$(document).find('#obj_id').val() + "', SHA1('" + $(document).find('#obj_pass').val() + 
					"'), '" + $(document).find('#obj_name').val() + "', '" + $(document).find('#obj_admin').val() + "')");
			
			alert("추가 완료");
		}
		
		$("[type=text],[type=password]").each(function() {
			$(this).val("");
		});
	}
}
</script>
  <div class=bg0>
    <p>홈 > 계정추가</p>
    <div class="bg1">
      <table class="table table-hover form-group">
        <tr>
          <td>ID</td>
          <td>
            <input class="form-control" type="text" name="obj_id" id="obj_id">
          </td>
        </tr>

        <tr>
          <td>암호</td>
          <td>
            <input class="form-control" type="password" name="obj_pass" id="obj_pass">
          </td>
        </tr>

        <tr>
          <td>이름</td>
          <td>
            <input class="form-control" type="text" name="obj_name" id="obj_name">
          </td>
        </tr>

        <tr>
          <td>관리자 여부</td>
          <td>
            <select class="form-control" name="obj_admin" id="obj_admin">
        	    <option value="1">예</option>
        	    <option value="0">아니요</option>
            </select>
      	  </td>
        </tr>

        <tr>
        	<td colspan="2" align="center">
            <input class="btn btn-primary" type="button" onclick="AccIst();" value="추가">
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>