<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
function modalLoad(){
	$.ajax({
		type : 'get',
		url : '/consulting/modal',
		dataType : 'text',
		success : function(data){
			$("#modal").html(data);
		}
	});
}

function searchProspects(){
	$("#modalView").modal("show");
}

function newleadValidation(){
	
	var errorMsg = "";
	var pros_id = document.getElementById("pros_id").value;
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
	if(pros_id == ""){
		errorMsg = "고객명";
	}
	
	return errorMsg;
}

function backToLeads(){
	
	document.getElementById('actionForm').submit();
}

function registLead(){
	var isEmpty = newleadValidation();
	if(isEmpty != ""){
		alert(isEmpty+"란이 빈칸입니다.");
		return;
	}
	
	var check = confirm("등록하시겠습니까?");
	if(check){
		var text = CKEDITOR.instances.spec_desc.getData();
		$("#spec_desc").val(text);
		var queryString = $("form[id=registForm]").serialize();
		$.ajax({
			type : 'post',
			url : '/consulting/data/registlead',
			dataType : 'json',
			data : queryString,
			success : function(data){
				backToLeads();
			},
			error : function(xhr, status, error){
				alert("저장하는 도중 에러가 발생했습니다.");
			}
		});
	}
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
			if (save_param != null && data != null) {
				$(selecter_id).val($('#actionForm [name="' + save_param + '"]')
				.val()).prop("selected", true);
			}
		}
	});
}



$(document).ready(getSelectorOption('/consulting/data/codes', '200', '#select_reg_chnl_cd', null	, 'code', 'code_nm'));
$(document).ready(getSelectorOption('/consulting/data/codes', '300', '#select_con_type_cd', null, 'code', 'code_nm'));
$(document).ready(getSelectorOption('/consulting/data/franchises', '', '#select_fra_cd', 'fra_cd', 'fra_cd', 'fra_nm'));
$(document).ready(modalLoad());
$(document).ready(function(){
	$("#select_fra_cd").change(function() {
		var fra = $("#select_fra_cd option:selected").val();
		if(fra != ''){
			getSelectorOption('/consulting/data/brands', fra, '#select_brand_cd', 'brand_cd', 'brand_cd', 'brand_nm');
		}
	});
	$('#searchProsNm').click(function(e) {
		searchProspects();
	 });
});
</script>


<div class="card" style="width:98%; margin:0 auto;">
	<div class="card-block">
		<form id="registForm" method="post" action="/consulting/registlead">
			<table style="text-align:center; width:100%;" class="table table-sm">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th><label for="searchProsNm">고객명</label></th>
						<td><input id="searchProsNm" type="text" class="form-control"></td>
						<th><label for="searchProsNm">고객ID</label></th>
						<td><input type="text" id="pros_id" name="pros_id" class="form-control" readonly></td>
					</tr>
					<tr>
						<th>
							<label for="cell_ph_no">전화번호</label>
						</th>
						<td>
							<div style="display:flex;">
									<input id="cell_ph_no" type="text" class="form-control" readonly>
									<span style="vertical-align:middle;">-</span>
									<input id="cell_ph_tno" type="text" class="form-control" readonly>
									<span style="vertical-align:middle;">-</span>
									<input id="cell_ph_pno" type="text" class="form-control" readonly>
							</div>
						</td>
						<th>
							<label for="searchProsNm">이메일</label>
						</th>
						<td>
							<div style="display:flex;">
								<input id="eml_id" type="text"
											class="form-control" readonly>
								<span style="vertical-align:middle;">@</span>
								<input id="eml_domain" type="text"
											class="form-control" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<label for="select_reg_chnl_cd">접수채널</label>
						</th>
						<td>
							<select name="reg_chnl_cd" id="select_reg_chnl_cd"
									class="js-example-basic-single form-control">
									<option value="">없음</option>
							</select>
						</td>
						<th>
							<label for="select_con_type_cd">계약형태</label>
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
						</th>
						<td>
							<span class="form-group"> <select name="brand_cd"
							class="form-control" id="select_brand_cd">
							<option value="">--</option>
							</select>
							</span>
						</td>
					</tr>
					<tr>
						<th>특이사항</th>
						<td colspan="3">
							<textarea name="spec_desc" id="spec_desc" rows="10" cols="80">
         					</textarea> 
        						<script>
									CKEDITOR.replace('spec_desc');
								</script>
						</td>
					</tr>
					<tr>
						<th colspan="4">
							<button type="button" id="regist" class="btn btn-primary" onclick="registLead()">등록</button>
							<button type="button" id="return" class="btn btn-default" onclick="backToLeads()">목록</button>
						</th>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

<div id="modal">
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


