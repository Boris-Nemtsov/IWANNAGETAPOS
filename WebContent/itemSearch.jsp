<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:include page="session.jsp">
		<jsp:param name="isadmin" value="0"/>
	</jsp:include>
<!DOCTYPE<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>물품검색</title>
</head>
<link rel="stylesheet" type="text/css" href="bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="PopupSet.css">
<body>
<script type="text/javascript" src="js/sql.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

<script>
function showData() {
	var queryResult;
	var itemSearchType = $('#obj_searchtype').val();
	var itemWord = $('#obj_word').val();
	
	if(itemWord == '')
		return; 
	if(itemSearchType == 0)
		queryResult = sqlQuery("SELECT * FROM item WHERE barcode='" + itemWord + "'");
	else if(itemSearchType == 1)
		queryResult = sqlQuery("SELECT * FROM item WHERE name='*" + itemWord + "*'");
	
	if(queryResult.Count == 0) {
		alert("검색결과가 없습니다.");
		return;
	}
	
	$('#obj_barcode').val(queryResult.Data[0].c0);
	$('#obj_name').val(queryResult.Data[0].c1);
	$('#obj_price').val(queryResult.Data[0].c2);
	$('#obj_stock').val(queryResult.Data[0].c3);
	
	var type = queryResult.Data[0].c4;
	if(type == 0) {
		type = "일반";
	} else if(type == 1) {
		type = "기타";
	} else {
		type = "쓰레기봉투";
	}
	
	$('#obj_type').val(type);
	$('#obj_word').val("");
}
</script>

  <div class=bg0>
    <p>홈 > 물품검색</p>
    <div class="bg1">
      <table class="table table-hover form-group">
        <tr>
          <td>
              <select class="form-control" name="obj_searchtype" id="obj_searchtype">
                <option value="0">바코드</option>
                <option value="1">이름</option>
              </select>
          </td>

          <td>
              <input class="form-control" type="text" name="obj_word" id="obj_word" onkeydown="javascript:if(event.keyCode==13){showData(); }">
          </td>

          <td>
            <input type="button" class="btn btn-primary" id="obj_search" name="obj_search" onclick="showData();" value="검색">
          </td>
        </tr>

        <tr>
          <td>바코드</td>
          <td><input class="form-control" type="text" name="obj_barcode" id="obj_barcode" readonly></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><input class="form-control" type="text" name="obj_name" id="obj_name" readonly></td>
        </tr>
        <tr>
          <td>가격</td>
          <td><input class="form-control" type="text" name="obj_price" id="obj_price" readonly></td>
        </tr>
        <tr>
          <td>재고</td>
          <td><input class="form-control" type="text" name="obj_stock" id="obj_stock" readonly></td>
        </tr>
        <tr>
          <td>타입</td>
          <td><input class="form-control" type="text" name="obj_type" id="obj_type" readonly></td>
        </tr>
      </table>
  </div>
</body>
</html>
