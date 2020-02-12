<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>

var check = false;

function leadValidation(){
	
	var errorMsg = "";
	
	var pros_nm = document.getElementById("pros_nm").value;
	var cell_ph_no = document.getElementById("cell_ph_no").value;
	var cell_ph_tno = document.getElementById("cell_ph_tno").value;
	var cell_ph_pno = document.getElementById("cell_ph_pno").value;
	var eml_id = document.getElementById("eml_id").value;
	var eml_domain = document.getElementById("eml_domain").value;
	var con_type_cd = document.getElementById("select_con_type_cd").value;
	var reg_chnl_cd = document.getElementById("select_reg_chnl_cd").value;
	
	if(reg_chnl_cd == ""){
		errorMsg = "접수채널";
	}
	if(con_type_cd == ""){
		errorMsg = "계약형태";
	}
	if(eml_domain == ""){
		errorMsg = "이메일";
	}
	if(eml_id == ""){
		errorMsg = "이메일";
	}
	if(cell_ph_pno == ""){
		errorMsg = "전화번호";
	}
	if(cell_ph_tno == ""){
		errorMsg = "전화번호";
	}
	if(cell_ph_no == ""){
		errorMsg = "전화번호";
	}
	if(pros_nm == ""){
		errorMsg = "가망고객명";
	}
	
	return errorMsg;
}

function modifyActive(){
	if(check == false){
		$("#pros_nm").attr("readonly", false);
		$("#cell_ph_no").attr("readonly", false);
		$("#cell_ph_tno").attr("readonly", false);
		$("#cell_ph_pno").attr("readonly", false);
		$("#eml_id").attr("readonly", false);
		$("#eml_domain").attr("readonly", false);
		$("#spec_desc").attr("readonly", false);
		$("#select_reg_chnl_cd").removeAttr("disabled");
		$("#select_con_type_cd").removeAttr("disabled");
		$("#signup").show();
		$("#deletelead").show();
		$("#modify").hide();
		check = true;
		CKEDITOR.instances['spec_desc'].setReadOnly(false);
	}
}

function deleteLead(){
	var lead_id = $("#lead_id").val();
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

function modifyLead(){
	
	var isEmpty = leadValidation();
	if(isEmpty != ''){
		alert(leadValidation()+" 란이 비어있습니다.");
		return;
	}
	
	var text = CKEDITOR.instances.spec_desc.getData();
	$("textarea#spec_desc").val(text);
	var queryString = $("form[id=modifyForm]").serialize();
	$.ajax({
		type : 'post',
		url : '/consulting/data/modifylead',
		dataType : 'json',
		data : queryString,
		success : function(data){
			alert("수정하였습니다.");
		},
		error : function(xhr, status, error){
			alert("수정하는 도중 에러가 발생했습니다.");
		}
	});
}

function backToLeads(){
	document.getElementById('actionForm').submit();
}

function getcodes(code, selecter_id, code_type){
	$.ajax({
		type : 'get',
		url : '/consulting/data/codes/'+code,
		dataType : 'json',
		success : function(data){
			if(data==null){
				data=0;
			}
			for(var i = 0; i < data.length; i++){
				$(selecter_id).append("<option value='"+ data[i]['code']
				+ "'>"+data[i]['code_nm'] + "</option>");
			}
			var id= "#"+code_type
			$(selecter_id).val($(id).val()).attr("selected", true);
			$(selecter_id).not(":selected").attr("disabled", "disabled");
		}
	});
}

$(document).ready(getcodes('200', '#select_reg_chnl_cd', 'reg_chnl_cd'));
$(document).ready(getcodes('300', '#select_con_type_cd', 'con_type_cd'));
$(document).ready(function(){
	$("#signup").hide();
	$("#deletelead").hide();
});

</script>
</head>
<body>

	<div class="container-fluid">
		<div class="col-lg-12">
			<div class="card">
					<form id="modifyForm" method="post" action="/consulting/data/modifylead">
						<table id="demo-foo-filtering" class="table">
							<tbody>
								<tr>
									<th>
									가망고객명
									<input type="hidden" name="lead_id" id="lead_id" value="${lead.lead_id }">
									<input type="hidden" name="pros_id" id="pros_id" value="${lead.prospectVO.pros_id }">
									</th>
									<th colspan="3">
										<div class="row">
											<div class="col-lg-6">
												<input id="pros_nm" name="pros_nm" type="text"
										class="form-control" value="${lead.prospectVO.pros_nm }" readonly>
											</div>
										</div>
									</th>
									
								</tr>
								<tr>
									<th>이동전화</th>
									<th>
										<div class="row">
											<div class="col-lg-3">
												<input id="cell_ph_no" name="cell_ph_no" type="text" 
												 value="${lead.prospectVO.cell_ph_no }" class="form-control" readonly>
											</div>
											<div class="col-form-label">-</div>
											<div class="col-lg-4">
												<input id="cell_ph_tno" name="cell_ph_tno" type="text" 
												 value="${lead.prospectVO.cell_ph_tno }" class="form-control" readonly>
											</div>
											<div class="col-form-label">-</div>
											<div class="col-lg-4">
												<input id="cell_ph_pno" name="cell_ph_pno" type="text"
												 value="${lead.prospectVO.cell_ph_pno }" class="form-control" readonly>
											</div>
										</div>
									</th>

									<th>이메일</th>
									<th>
										<div class="row">
											<div class="col-lg-4">
												<input id="eml_id" name="eml_id" type="text"
												 value="${lead.prospectVO.eml_id }"
													class="form-control" readonly>
											</div>
											<div class="col-form-label">@</div>
											<div class="col-lg-7">
												<input id="eml_domain" name="eml_domain" type="text"
												 value="${lead.prospectVO.eml_domain }"
													class="form-control" readonly>
											</div>
										</div>
									</th>
								</tr>
								<tr>
									<th>접수채널<input type="hidden" id="reg_chnl_cd" value="${lead.reg_chnl_cd }"></th>
									<th>
										<div class="col-lg-6">
											<select name="reg_chnl_cd" id="select_reg_chnl_cd"
												class="js-example-basic-single form-control">
												<option value="">없음</option>
											</select>
										</div>
									</th>
									<th>계약형태<input type="hidden" id="con_type_cd" value="${lead.con_type_cd }"></th>
									<th>
										<div class="col-lg-6">
											<select name="con_type_cd" id="select_con_type_cd"
												class="js-example-basic-single form-control">
												<option value="">없음</option>
											</select>
										</div>
									</th>
								</tr>
								<tr>
									<th>특이사항</th>
									<th colspan="3"><textarea name="spec_desc" id="spec_desc"
											rows="10" cols="80">
											${lead.spec_desc}
											</textarea>
											<script>
												CKEDITOR.replace('spec_desc');
												CKEDITOR.config.readOnly = true;
												
											</script>
									</th>
								</tr>
							</tbody>
						</table>
						<div id="actionButton" class="modal-footer">
							<button type="button" id="modify" class="btn btn-primary" onclick="modifyActive()">수정</button>
							<button type='button' id='signup' class='btn btn-primary' onclick="modifyLead()">저장</button>
							<button type='button' id='deletelead' class='btn btn-primary' onclick="deleteLead()">삭제</button>
							<button type="button" id="return" class="btn btn-default" onclick="backToLeads()">목록</button>
						</div>
					</form>
				</div>
		</div>
	</div>

<form id='actionForm' action="/consulting/leads" method='get'>
	<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum }'>
	<input type="hidden" name='amount' value='${pageMarker.cri.amount }'>
	<input type="hidden" name='reg_chnl_cd' value='${pageMarker.cri.reg_chnl_cd }'> 
	<input type="hidden" name='con_type_cd' value='${pageMarker.cri.con_type_cd }'> 
	<input type="hidden" name='pros_nm' value='${pageMarker.cri.pros_nm }'>
</form>
</body>
</html>