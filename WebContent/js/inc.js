var m_ListLen = 0;
var m_ListData;
var data = new Array();
var limit = 0, stat = 0;

function init() {
	$('#obj_viewBarcode').focus();
	loadOthers((stat = 1), (limit = 0));
	
	$('#btn-itemInsert').on('click',function() {
		window.open('itemInsert.jsp',"","width=430,height=420");
	});
	$('#btn-itemSearch').on('click',function() {
		window.open('itemSearch.jsp',"","width=430,height=420");
	});
	$('#btn-itemModify').on('click',function() {
		window.open('itemModify.jsp',"","width=440,height=460");
	});
	$('#btn-AccountInsert').on('click',function() {
		window.open('accountInsert.jsp',"","width=440,height=400");
	});
	$('#btn-AccountModify').on('click',function() {
		window.open('accountModify.jsp',"","width=440,height=460");
	});
	$('#btn-orderHistory').on('click',function() {
		window.open('orderHistory.jsp',"","width=1275,height=800");
	});
	$('#btn-normal').on('click',function() {
		LimitOther = loadOthers((stat = 1), (limit = 0));
	});
	$('#btn-trash').on('click',function() {
		LimitOther = loadOthers((stat = 2), (limit = 0));
	});
	$('#btn-left').on('click',function() {
		loadOthers(0, -1);
	});
	$('#btnr-right').on('click',function() {
		loadOthers(0, 1);
	});
	$('#btn-logout').on('click',function() {
		document.location.href = 'login.jsp?q=out';
	});
}

function number_fomrat(str){
    str = str + "";
    if(str == "" || /[^0-9,]/.test(str)) return str;
    str = str.replace(/,/g, "");
    for(var i=0; i<parseInt(str.length/3, 10); i++){
        str = str.replace(/([0-9])([0-9]{3})(,|$)/, "$1,$2$3");
    }
    return str;
}

function saveList() {
	m_ListData = [];
	
	for(var i = 0; i < m_ListLen; i++) {
		m_ListData[i] = [];
		m_ListData[i].push($('[name=obj_itemChk]').eq(i).is(':checked'));
		m_ListData[i].push($('[name=obj_itemName]').eq(i).val());
		m_ListData[i].push($('[name=obj_itemPrice]').eq(i).val());
		m_ListData[i].push($('[name=obj_itemQuan]').eq(i).val());
		m_ListData[i].push($('[name=obj_itemTotal]').eq(i).val());
		m_ListData[i].push($('[name=obj_itemBarcode]').eq(i).val());
	}
}

function calcOrderTotal() {
	var orderTotal = 0;
	
	$('.orderDetail').each(function() {
		if($(this).find('#obj_itemChk').is(':checked') == true) {
			orderTotal += $(this).find('#obj_itemTotal').val()*1;
		}
	});
	
	$('#obj_viewTotal').val(orderTotal);
	$('#obj_viewTotalSpan').html(number_fomrat(orderTotal));
}

function calcItemTotal(objOrderDetail) {
	var itemOldQuantity = objOrderDetail.find('#obj_itemQuan');
	var itemOldTotal = objOrderDetail.find('#obj_itemTotal');
		
	itemOldTotal.val(itemOldTotal.val()*1/itemOldQuantity.val()*1 + itemOldTotal.val()*1);
	itemOldQuantity.val(itemOldQuantity.val()*1 + 1);
}



function loadOthers(type, page) {	
	if(type == 0) {
		if(page == -1 && limit == 0)
			limit = 0;
		else
			limit = limit+page;
	}
	
	queryResult = sqlQuery(
			"SELECT barcode, name FROM item WHERE type='" + 
			stat + "' LIMIT " + 14*limit + ", 14");
	
	if(queryResult.Count == 0) { 
		limit = limit-page;
		return false;
	}
	
	for(var i = 0; i <= 13; i++) {
		$('#btn' + i).unbind();
		$('#btn' + i).attr("disabled", true).attr("value","");
	}
	
	for(var i = 0; i < queryResult.Count; i++) {
		if(i >= 14) break;
		var elements = $("#btn" + i);
		elements.attr("alt", queryResult.Data[i].c0);
		elements.val(queryResult.Data[i].c1);
		elements.removeAttr('disabled');
		
		$('#btn' + i).on('click', function() {
			addList($(this).attr("alt"));
		});
	}
	return true;
}

function checkStock(objOrderDetail, itemBarcode) {
	var queryResult = sqlQuery("SELECT stock, name FROM item WHERE barcode='" + itemBarcode + "'");
	
	if(queryResult.Count == 0)
		return true;
	
	var quantity;
	if(objOrderDetail != false) 
		quantity = objOrderDetail.find('#obj_itemQuan').val()*1;
	else 
		quantity = 0;
	
	if(queryResult.Data[0].c0 < quantity + 1) {
		alert(queryResult.Data[0].c1 + "의 재고가 부족합니다.");
		return false;
	}
	return true;
}

function addList(itemBarcode) {
	var defClone = $('.orderDetail').eq(0);
	var isExist = false;
	var queryResult;
	var itemName;
	var itemPrice;
	
	var objExist = false;
	$('.orderDetail').each(function() {
		if(itemBarcode == $(this).find('#obj_itemBarcode').val()) {
			isExist = true;
			objExist = $(this);
		}
	});
	
	if(!checkStock(objExist, itemBarcode))
		return false;
	
	if(!isExist) { 
		queryResult = sqlQuery("SELECT name, price FROM item WHERE barcode='" + itemBarcode + "'");
		if(queryResult.Count == 0) {
			if (confirm("등록되지 않은 상품입니다. \n등록하시겠습니까?")) {
				window.open('itemInsert.jsp?b=' + itemBarcode,"","width=430,height=420");
			} 
			return;
		}
		
		itemName = queryResult.Data[0].c0;
		itemPrice = queryResult.Data[0].c1;
		
		$('#obj_viewName').val(itemName);
		$('#obj_viewPrice').val(itemPrice);
		
		if(m_ListLen != 0) {
			$('.divList').append(defClone = defClone.clone());
		}
		
		defClone.find('#obj_itemChk').prop("checked",true);
		defClone.find('#obj_itemName').val(itemName);
		defClone.find('#obj_itemPrice').val(itemPrice);
		defClone.find('#obj_itemQuan').val(1);
		defClone.find('#obj_itemTotal').val(itemPrice);
		defClone.find('#obj_itemBarcode').val(itemBarcode);
		
		saveList();
		m_ListLen++;
	} else {
		calcItemTotal(objExist);
	}
	
	calcOrderTotal();
}

function confirmOrder() {
	if(m_ListLen == 0) {
		alert("저장 할 주문이 없습니다.");
		return;
	}
	
	sqlQuery("INSERT INTO `order`(`totalprice`) VALUES('" + $('#obj_viewTotal').val() + "')");
	var queryResult = sqlQuery("SELECT `no` FROM `order` ORDER BY `no` DESC LIMIT 0,1");
	var newOrderNo = (queryResult.Count == 0) ? 0 : queryResult.Data[0].c0;
	
	$('.orderDetail').each(function() {
		if($(this).find('#obj_itemChk').is(":checked") == true) {
			sqlQuery("INSERT INTO `orderitem`(`orderNo`,`barcode`,`quantity`) VALUES('" + newOrderNo + "', '" + 
					$(this).find('#obj_itemBarcode').val() + "', '" + 
					$(this).find('#obj_itemQuan').val() + "')");
			sqlQuery("UPDATE item SET stock=stock-" + $(this).find('#obj_itemQuan').val() +
					" WHERE barcode='" + $(this).find('#obj_itemBarcode').val() + "'");
		}
	});
	
	if($('#obj_viewPay').val() != "") {
		var diff = $('#obj_viewPay').val() - $("#obj_viewTotal").val();
		$('#obj_viewPay').val("");
		
		if(diff < 0) {
			$('#obj_viewChange').val("금액이 모자릅니다.");
			$('#obj_viewPay').focus();
			return false;
		} else
			$('#obj_viewChange').val(number_fomrat(diff));
	}
	
	clearList();
	$('#obj_viewBarcode').focus();
}

function clearList() {
	$('.orderDetail').each(function() {
		if($(this).index() == 1) {
			$(this).find('[type=text],[type=hidden]').each(function() {
				$(this).val("");
			});
			$(this).find('[type=checkbox]').prop('checked',false);
			return true;
		}
		$(this).remove();
	});
	
	m_ListLen = 0;
	calcOrderTotal();
}
