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
<link rel="stylesheet" type="text/css" href="main.css">

<body>
<script type="text/javascript" src="js/sql.js"></script>
<script type="text/javascript" src="js/inc.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">$(init);</script>

<div class="row">
<div class="col-xs-12">
  <div class="row bg0">
  <div class="col-xs-12 text-center">
    <p class="subject">IWANNAGETAPOSSYSTEM</p>
    <div class="row">
    <div class="col-xs-12">
      <div class="row bg1">
      <div class="col-xs-12">
        <div class="row dtop">
        <div class="col-xs-8 dtop-left">
          <div class="row item">
          <div class="col-xs-12 divList">
            <div class="row item-list">
            <div class="col-xs-1">확인</div>
            <div class="col-xs-3">품명</div>
            <div class="col-xs-3">단가</div>
            <div class="col-xs-2">수량</div>
            <div class="col-xs-3">가격</div>
            </div>
            <!--이하 계산할 내역------------------>
            <div class="row item-list orderDetail">
            <div class="col-xs-1" style="padding-top: 4px;">
              <input type="checkbox" id=obj_itemChk name=obj_itemChk>
            </div>
            <div class="col-xs-3">
              <input class="form-control input-sm" type=text id=obj_itemName name=obj_itemName readonly>
            </div>
            <div class="col-xs-2">
              <input class="form-control input-sm" type=text id=obj_itemPrice name=obj_itemPrice readonly style='text-align:right'>
            </div>
            <div class="col-xs-1">원</div>
            <div class="col-xs-1">
              <input class="form-control input-sm" type=text id=obj_itemQuan name=obj_itemQuan readonly style='text-align:right'>
            </div>
            <div class="col-xs-1">개</div>
            <div class="col-xs-2">
              <input class="form-control input-sm" type=text id=obj_itemTotal name=obj_itemTotal readonly style='text-align:right'>
            </div>
            <input type=hidden id=obj_itemBarcode name=obj_itemBarcode>
            <div class="col-xs-1">원</div>
            </div>
          </div>
          </div>
        </div>
        <!--위에서 양쪽 경계------------------------------->
        <div class="col-xs-4 dtop-right">
          <div class="row others">
          <div class="col-xs-12">
            <div class="row others-button">
            <div class="col-xs-6">
              <input type="button" class="btn btn-primary btn-one btn-block" id=btn-normal value="기타">
            </div>
            <div class="col-xs-6">
              <input type="button" class="btn btn-primary btn-one btn-block" id=btn-trash value="쓰레기봉투">
            </div>
            </div>
            <!--구분---------->
            <div class="row select-button">
            <div class="col-xs-12">
              <!--1층--------------------------->
              <div class="row select-button-row">
              <div class="col-xs-4">
                <input type="button" class="btn btn-warning btn-two btn-block" id=btn0 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-warning btn-two btn-block" id=btn1 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-warning btn-two btn-block" id=btn2 value="?" disabled>
              </div>
              </div>
              <!--2층--------------------------->
              <div class="row select-button-row">
              <div class="col-xs-4">
                <input type="button" class="btn btn-primary btn-two btn-block" id=btn3 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-primary btn-two btn-block" id=btn4 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-primary btn-two btn-block" id=btn5 value="?" disabled>
              </div>
              </div>
              <!--3층--------------------------->
              <div class="row select-button-row">
              <div class="col-xs-4">
                <input type="button" class="btn btn-warning btn-two btn-block" id=btn6 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-warning btn-two btn-block" id=btn7 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-warning btn-two btn-block" id=btn8 value="?" disabled>
              </div>
              </div>
              <!--4층--------------------------->
              <div class="row select-button-row">
              <div class="col-xs-4">
                <input type="button" class="btn btn-primary btn-two btn-block" id=btn9 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-primary btn-two btn-block" id=btn10 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-primary btn-two btn-block" id=btn11 value="?" disabled>
              </div>
              </div>
              <!--5층--------------------------->
              <div class="row select-button-row">
              <div class="col-xs-4">
                <input type="button" class="btn btn-warning btn-two btn-block" id=btn12 value="?" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-warning btn-two btn-block" id=btn13 value="?" disabled>
              </div>
              <div class="col-xs-4 arrow-button">
              <div class="row arrow-button-row">
                <div class="col-xs-6">
                  <input type="button" class="btn btn-warning btn-two btn-block" id=btn-left value="◀">
                </div>
                <div class="col-xs-6">
                  <input type="button" class="btn btn-warning btn-two btn-block" id=btnr-right value="▶">
                </div>
              </div>
              </div>
              </div>
            </div>
            </div>
          </div>
          </div>
        </div>
        </div>
        <!--위 아래 경계--------------------------------->
        <div class="row dbottom">
          <div class="col-xs-7 dbottom-left">
            <div class="row div-total">
            <div class="col-xs-5">
              <div class="row total-left">
                <div class="col-xs-4">
                  <h5>상품코드</h5>
                </div>
                <div class="col-xs-8">
                  <input type=text class="form-control" id=obj_viewBarcode name=obj_viewBarcode onkeydown="javascript:if(event.keyCode==13){addList(this.value); this.value='';}">
                </div>
              </div>

              <div class="row total-left">
                <div class="col-xs-4">
                  <h5>상 품 명</h5>
                </div>
                <div class="col-xs-8">
                  <input type=text class="form-control" id=obj_viewName name=obj_viewName disabled>
                </div>
              </div>

              <div class="row total-left">
                <div class="col-xs-4">
                  <h5>판매단가</h5>
                </div>
                <div class="col-xs-8">
                  <input type=text class="form-control" id=obj_viewPrice name=obj_viewPrice disabled>
                </div>
              </div>
            </div>
            <div class="col-xs-5">

              <div class="row total-right-total">
                <div class="col-xs-3">
                  <h5>합  계</h5>
                </div>
                <div class="col-xs-9">
                    <span id=obj_viewTotalSpan name=obj_viewTotalSpan>0</span> 원
                    <input type=hidden id=obj_viewTotal name=obj_viewTotal disabled>
                </div>
              </div>

              <div class="row total-right">
                <div class="col-xs-4">
                  <h5>내 신 돈</h5>
                </div>
                <div class="col-xs-8">
                  <input type=text class="form-control" id=obj_viewPay name=obj_viewPay onkeydown="javascript:if(event.keyCode==13){confirmOrder(); }">
                </div>
              </div>

              <div class="row total-right">
                <div class="col-xs-4">
                  <h5>거스름돈</h5>
                </div>
                <div class="col-xs-8">
                  <input type=text class="form-control" id=obj_viewChange name=obj_viewChange disabled>
                </div>
              </div>

            </div>
            <div class="col-xs-2">
              <div class="row calc">
                <button type="button" class="btn btn-danger btn-four btn-block" id=btn-itemCalc onclick="confirmOrder();">계<br>산</button>
              </div>
            </div>
            </div>
          </div>
          <!--경계------------------------------->
          <div class="col-xs-5 dbottom-right">
            <div class="row menu-button">
            <div class="col-xs-12">
              <!--1층--------------------------->
              <div class="row menu-button-row">
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-itemInsert value="물품추가">
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-itemModify value="물품수정">
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-itemSearch value="물품검색">
              </div>
              </div>
              <!--2층--------------------------->
              <div class="row menu-button-row">
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-AccountInsert value="계정추가">
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-AccountModify value="계정수정">
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-orderHistory value="주문내역관리">
              </div>
              </div>
              <!--3층--------------------------->
              <div class="row menu-button-row">
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-plus0 value="" disabled>
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-logout value="로그아웃">
              </div>
              <div class="col-xs-4">
                <input type="button" class="btn btn-success btn-three btn-block" id=btn-plus1 value="" disabled>
              </div>
              </div>
            </div>
          </div>
          </div>
        </div>
      </div>
      </div>
    </div>
    </div>
  </div>
  </div>
</div>
</div>
</body>
</html>