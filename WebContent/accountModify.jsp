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
<title>계정수정</title>
</head>
<link rel="stylesheet" type="text/css" href="bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="PopupSet.css">
<body>
<script type="text/javascript" src="js/sql.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

<script>
function clear() {
	$(document).find('[type=text],[type=password],[type=hidden]').each(function() {
		$(this).val("");
	});
}

function AccDel() {
	if($(document).find('#obj_originalId').val() != "") {
		var queryResult = sqlQuery("DELETE FROM user WHERE userid='" + 
				$(document).find('#obj_originalId').val() + "'");
		clear();
		alert("삭제 완료");
	}
}

function AccSrch() {
	var columns = ($(document).find('#obj_type').val() == 0) ? "userid" : "name";
	var queryResult = 
		sqlQuery("SELECT userid, userpassword, name, isadmin FROM user WHERE " + columns + 
						" = '" + $(document).find('#obj_word').val() + "'");
	clear();
	if(queryResult.Count == 0) {
		alert("검색결과가 없습니다");
		return false;
	}
	
	$(document).find('#obj_originalId').val(queryResult.Data[0].c0);
	$(document).find('#obj_id').val(queryResult.Data[0].c0);
	//$(document).find('#obj_pass').val(queryResult.Data[0].c1);
	$(document).find('#obj_name').val(queryResult.Data[0].c2);
	$(document).find('#obj_admin').val(queryResult.Data[0].c3);
}

function AccUdt() {
	if($(document).find('#obj_originalId').val() != "") {
		sqlQuery("UPDATE user SET userid='" + $(document).find('#obj_id').val() + 
				"', userpassword=SHA1('" + $(document).find('#obj_pass').val() + 
				"'), name='" + $(document).find('#obj_name').val() + 
				"', isadmin='" + $(document).find('#obj_admin').val() + 
				"' WHERE userid='" + $(document).find('#obj_originalId').val() + "'");
		clear();
		alert('수정 완료');
	}
}
</script>
  <div class=bg0>
    <p>홈 > 계정수정</p>
    <div class="bg1">
      <table class="table table-hover form-group">
        <tr>
          <td>
            <select class="form-control" name="obj_type" id="obj_type">
              <option value="0">아이디</option>
              <option value="1">이름</option>
            </select>
          </td>
          <td>
            <input class="form-control" type="text" name="obj_word" id="obj_word" onkeydown="javascript:if(event.keyCode==13){AccSrch(); }">
          </td>
          <td>
            <input class="btn btn-primary" type="button" onclick="AccSrch();" value="검색">
          </td>
        </tr>

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
          <td colspan=3 align=center>
            <input type="hidden" id="obj_originalId" name="obj_originalId">
          	<input class="btn btn-primary" type="button" onclick="AccUpt();"  value="수정하기">
          	<input class="btn btn-primary" type="button" onclick="AccDel();" value="삭제하기">
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>