<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>

function leadValidation(){
	
	var errorMsg = "";
	//var pros_id = document.getElementById("pros_id").value;
	var con_type_cd = document.getElementById("select_con_type_cd").value;
	var reg_chnl_cd = document.getElementById("select_reg_chnl_cd").value;
	var brand_cd = document.getElementById("select_brand_cd").value;
	
	if(brand_cd == ""){
		errMsg = "브랜드";
	}
	if(con_type_cd == ""){
		errorMsg = "계약형태";
	}
	if(reg_chnl_cd == ""){
		errorMsg = "접수채널";
	}
	/*
	if(pros_id == ""){
	errorMsg = "고객명";
}
	*/
	
	return errorMsg;
}

function deleteLead(){
	var lead_id = $("#lead_id").val();
	var check = confirm("삭제하시겠습니까?");
	if(check){
		$.ajax({
			type : 'post',
			url : '/consulting/data/deletelead/'+lead_id,
			dataType : 'json',
			success : function(data){
				alert("삭제 되었습니다.");
				backToLeads();
				
			},
			error : function(xhr, status, error){
				alert("삭제하는 도중 에러가 발생했습니다.");
			}
		});
	}
}

function modifyLead(){
	
	var isEmpty = leadValidation();
	if(isEmpty != ''){
		alert(isEmpty+"란이 비어있습니다.");
		return;
	}
	
	var check = confirm('수정하시겠습니까?');
	if(check){
		var text = CKEDITOR.instances.spec_desc.getData();
		$("textarea#spec_desc").val(text);
		var queryString = $("form[id=modifyForm]").serialize();
		$.ajax({
			type : 'post',
			url : '/consulting/data/modifylead',
			dataType : 'json',
			data : queryString,
			success : function(data){
				alert("수정 되었습니다.")
				backToLeads();
			},
			error : function(xhr, status, error){
				alert("수정하는 도중 에러가 발생했습니다.");
			}
		});
	}
}

function backToLeads(){
	document.getElementById('actionForm').submit();
}

function getSelectorOption(url, parameter, selecter_id, save_param, option_value, option_text) {
	var restUrl=url;
	if(parameter!=''){
		restUrl+="/"+parameter;
	}
	$.ajax({
		type : 'get',
		url : restUrl,
		dataType : 'json',
		success : function(data) {
			if (data == null) {
				data = 0;
			}
			$(selecter_id).html("<option value=''>--</option>");
			for (var i = 0; i < data.length; i++) {
				$(selecter_id).append("<option value='"+ data[i][option_value]+ "'>"
				+ data[i][option_text] + "</option>");
			}
			$(selecter_id).val($(save_param).val()).prop("selected", true);
		}
	});
}

$(document).ready(getSelectorOption('/consulting/data/codes', '200', '#select_reg_chnl_cd', '#reg_chnl_cd'	, 'code', 'code_nm'));
$(document).ready(getSelectorOption('/consulting/data/codes', '300', '#select_con_type_cd', '#con_type_cd', 'code', 'code_nm'));
$(document).ready(getSelectorOption('/consulting/data/franchises', '', '#select_fra_cd', '#fra_cd', 'fra_cd', 'fra_nm'));
$(document).ready(function(){
	$("#select_fra_cd").change(function() {
		var fra = $("#select_fra_cd option:selected").val();
		if(fra != ''){
			getSelectorOption('/consulting/data/brands', fra, '#select_brand_cd', 'brand_cd', 'brand_cd', 'brand_nm');
		}
	});
	
});

</script>
</head>
<body>

<div class="card" style="width:98%; margin:0 auto;">
	<form id="modifyForm" method="post" action="/consulting/data/modifylead">
		<table style="text-align:center; width:100%;" class="table table-sm">
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="40%">
			</colgroup>
			<tbody>
				<tbody>
				<tr>
					<th>
						<label for="searchProsNm">고객명</label>
						<input type="hidden" id="lead_id" name="lead_id" value="${lead.lead_id }">
					</th>
					<td><input id="searchProsNm" type="text" class="form-control" value="${lead.prospectVO.pros_nm }" readonly></td>
					<th><label for="searchProsNm">고객ID</label></th>
					<td><input type="text" id="pros_id" name="pros_id" class="form-control" value="${lead.prospectVO.pros_id }" readonly></td>
					
				</tr>
				<tr>
					<th>
						<label for="cell_ph_no">전화번호</label>
					</th>
					<td>
						<div style="display:flex;">
								<input id="cell_ph_no" type="text" class="form-control"
								value="${lead.prospectVO.cell_ph_no }" readonly>
								<span style="vertical-align:middle;">-</span>
								<input id="cell_ph_tno" type="text" class="form-control"
								value="${lead.prospectVO.cell_ph_tno }" readonly>
								<span style="vertical-align:middle;">-</span>
								<input id="cell_ph_pno" type="text" class="form-control"
								value="${lead.prospectVO.cell_ph_pno }" readonly>
						</div>
					</td>
					<th>
						<label for="searchProsNm">이메일</label>
					</th>
					<td>
						<div style="display:flex;">
							<input id="eml_id" type="text" value="${lead.prospectVO.eml_id }"
										class="form-control" readonly>
							<span style="vertical-align:middle;">@</span>
							<input id="eml_domain" type="text" value="${lead.prospectVO.eml_domain }"
										class="form-control" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="select_reg_chnl_cd">접수채널</label>
						<input type="hidden" id="reg_chnl_cd" value="${lead.reg_chnl_cd }">
					</th>
					<td>
						<select name="reg_chnl_cd" id="select_reg_chnl_cd"
								class="js-example-basic-single form-control">
								<option value="">없음</option>
						</select>
					</td>
					<th>
						<label for="select_con_type_cd">계약형태</label>
						<input type="hidden" id="con_type_cd" value="${lead.con_type_cd }">
					</th>
					<td>
						<select name="con_type_cd" id="select_con_type_cd"
								class="js-example-basic-single form-control">
								<option value="">없음</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<label for="select_fra_cd">가맹사업</label>
						<input type="hidden" id="fra_cd" value="${franchise }">
					</th>
					<td>
						<span class="form-group"> <select name="fra_cd"
						class="form-control" id="select_fra_cd">
						<option value="">--</option>
						</select>
						</span>
					</td>
					<th>
						<label for="select_fra_cd">브랜드</label>
						<input type="hidden" id="brand_cd" value="${lead.brand_cd }">
					</th>
					<td>
						<span class="form-group"> <select name="brand_cd"
						class="form-control" id="select_brand_cd">
						<option value="">--</option>
						<c:forEach var="brand" items="${brands}">
							<c:if test="${brand.brand_cd eq lead.brand_cd }">
								<option value="${brand.brand_cd }" selected>${brand.brand_nm }</option>
							</c:if>
							<c:if test="${brand.brand_cd ne lead.brand_cd }">
								<option value="${brand.brand_cd }">${brand.brand_nm }</option>
							</c:if>
						
						</c:forEach>
						</select>
						</span>
					</td>
				</tr>
				<tr>
					<th>특이사항</th>
					<td colspan="3">
						<textarea name="spec_desc" id="spec_desc" rows="10" cols="80">
        						${lead.spec_desc}
        					</textarea> 
       						<script>
								CKEDITOR.replace('spec_desc');
							</script>
					</td>
				</tr>
				<tr>
					<th colspan="4">
						<button type='button' id='signup' class='btn btn-primary' onclick="modifyLead()">저장</button>
						<button type='button' id='deletelead' class='btn btn-primary' onclick="deleteLead()">삭제</button>
						<button type="button" id="return" class="btn btn-default" onclick="backToLeads()">목록</button>
					</th>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<form id='actionForm' action="/consulting/leads" method='get'>
	<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum }'>
	<input type="hidden" name='amount' value='${pageMarker.cri.amount }'>
	<input type="hidden" name='reg_chnl_cd' value='${pageMarker.cri.reg_chnl_cd }'> 
	<input type="hidden" name='con_type_cd' value='${pageMarker.cri.con_type_cd }'>
	<input type="hidden" name='fra_cd' value='${pageMarker.cri.fra_cd }'>
	<input type="hidden" name='brand_cd' value='${pageMarker.cri.brand_cd }'> 
	<input type="hidden" name='pros_nm' value='${pageMarker.cri.pros_nm }'>
</form>
</body>
</html>