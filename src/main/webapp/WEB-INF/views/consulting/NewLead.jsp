<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>

function newleadValidation(){
	
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

function searchProspects(){
	if($("input:checkbox[id=newProspectCheck]").is(":checked") == false){
		$("#modalBody").empty();
		$("#inputName").val($("#searchProsNm").val());
		if($.trim($("inputName").val()) == ''){
			getProspects();
		}
		$("#modalView").modal("show");
		
	}
}

function getProspects(){
	var name = $("#inputName").val();
	$.ajax({
		type : 'get',
		url : '/consulting/data/prospects/'+name,
		dataType : 'json',
		success : function(data){
			$("#modalBody").empty();
			if(data.length>0){
				var htmlcode='';
				htmlcode+='<table class="table table-striped">' 
				+ '<thead>'
				+'<tr>'
				+'<th>이름</th>'
				+'<th>이메일</th>'
				+'<th>선택</th>'
				+'</tr>'
				+'</thead>'
				+'<tbody>';
				
				for(var i=0; i<data.length ; i++){
					htmlcode+='<tr>'
					+'<td>'+data[i]["pros_nm"]+'</td>'
					+'<td>'+data[i]["eml_id"]+'@'+data[i]["eml_domain"]+'</td>'
					+'<td><button type="button" class="btn btn-outline-primary btn-sm" onclick="readProspect('+'&quot;'+data[i]["pros_id"]+'&quot;'+')">선택</button></td>'
					+'</tr>';
				}
				htmlcode+='</tbody></table>';
			}
			else{
				htmlcode='검색 결과가 없습니다.';
			}
			$("#modalBody").append(htmlcode);
			
		},
		error : function(xhr, status, error){
			$("#modalBody").empty();
			$("#modalBody").append('검색어를 입력해 주세요.');
		}
	});
}

function readProspect(id){
	$("#modalView").modal("hide");
	
	$.ajax({
		type : 'get',
		url : '/consulting/data/prospect/'+id,
		dataType : 'json',
		success : function(data){
			$("#pros_id").val(data['pros_id']);
			$("#searchProsNm").val(data['pros_nm']);
			$("#pros_id").val(data['pros_id']);
			$("#pros_nm").val(data['pros_nm']);
			$("#cell_ph_no").val(data['cell_ph_no']);
			$("#cell_ph_tno").val(data['cell_ph_tno']);
			$("#cell_ph_pno").val(data['cell_ph_pno']);
			$("#eml_id").val(data['eml_id']);
			$("#eml_domain").val(data['eml_domain']);
		}
	});
}

function backToLeads(){
	
	document.getElementById('actionForm').submit();
}

function registLead(){
	var isEmpty = newleadValidation();
	if(isEmpty != ""){
		alert(isEmpty+" 란이 빈칸입니다.");
		return;
	}
	
	var text = CKEDITOR.instances.spec_desc.getData();
	$("#spec_desc").val(text);
	var queryString = $("form[id=registForm]").serialize();
	$.ajax({
		type : 'post',
		url : '/consulting/data/registlead',
		dataType : 'json',
		data : queryString,
		success : function(data){
			alert("저장하였습니다.");
			backToLeads();
		},
		error : function(xhr, status, error){
			alert("저장하는 도중 에러가 발생했습니다.");
		}
	});
}

function getcodes(code, tag, codename){
	$.ajax({
		type : 'get',
		url : '/consulting/data/codes/'+code,
		dataType : 'json',
		success : function(data){
			if(data==null){
				data=0;
			}
			for(var i = 0; i < data.length; i++){
				
				$(tag).append("<option value='"+ data[i]['code']
				+ "'>"+data[i]['code_nm'] + "</option>");
			}
			if(codename!=null){
				if($('#actionForm [name="'+codename+'"]').val() != null){
					$(tag).val($('#actionForm [name="'+codename+'"]').val()).prop("selected", true);
				}
			}
			
		}
	});
}



$(document).ready(getcodes('200', '#select_reg_chnl_cd', null));
$(document).ready(getcodes('300', '#select_con_type_cd', null));
$(document).ready(function(){
	$("#newProspectCheck").change(function(){
		if($("#newProspectCheck").is(":checked")){
			$("#pros_nm").attr("readonly",false);
			$("#cell_ph_no").attr("readonly",false);
			$("#cell_ph_tno").attr("readonly",false);
			$("#cell_ph_pno").attr("readonly",false);
			$("#eml_id").attr("readonly",false);
			$("#eml_domain").attr("readonly",false);
			
			$("#searchProsNm").attr("readonly",true);
		}
		else{
			$("#pros_nm").attr("readonly",true);
			$("#cell_ph_no").attr("readonly",true);
			$("#cell_ph_tno").attr("readonly",true);
			$("#cell_ph_pno").attr("readonly",true);
			$("#eml_id").attr("readonly",true);
			$("#eml_domain").attr("readonly",true);
			
			$("#searchProsNm").attr("readonly",false);
			
			$("#pros_nm").val('');
			$("#cell_ph_no").val('');
			$("#cell_ph_tno").val('');
			$("#cell_ph_pno").val('');
			$("#eml_id").val('');
			$("#eml_domain").val('');
		}
	})
});
</script>

<div id="content-wrapper">

	<div class="container-fluid">

		<div class="col-sm-12">
			<div class="card">
				<div class="card-block">
					<form id="registForm" method="post" action="/consulting/registlead">
						<table id="demo-foo-filtering" class="table">
							<tbody>
								
								<tr>
									<th>고객명</th>
									<th>
										<div class="input-group mb-3">
  											<input id="searchProsNm" type="text" class="form-control">
 					 						<div class="input-group-append">
	    										<span class="input-group-text" id="basic-addon2">
		    										 <a href="#" id="searchProspects" onclick="searchProspects()">검색</a>
												</span>
										  </div>
										</div>
									</th>
									<th>신규여부</th>
									<th><label><input type="checkbox" name="newProspectCheck" id="newProspectCheck" value="check">신규</label></th>
								</tr>
								<tr>
									<th>가망고객명</th>
									<th colspan="3">
										<div class="row">
											<div class="col-lg-6">
												<input id="pros_nm" name="pros_nm" type="text"
										class="form-control" readonly>
											</div>
											<input type="hidden" id="pros_id" name="pros_id">
										</div>
									</th>
									
								</tr>
								<tr>
									<th>이동전화</th>
									<th>
										<div class="row">
											<div class="col-lg-3">
												<input id="cell_ph_no" name="cell_ph_no" type="text" class="form-control" readonly>
											</div>
											<div class="col-lg-1">
												<h2>-</h2>
											</div>
											<div class="col-lg-3">
												<input id="cell_ph_tno" name="cell_ph_tno" type="text" class="form-control" readonly>
											</div>
											<div class="col-lg-1">
												<h2>-</h2>
											</div>
											<div class="col-lg-3">
												<input id="cell_ph_pno" name="cell_ph_pno" type="text" class="form-control" readonly>
											</div>
										</div>
									</th>

									<th>이메일</th>
									<th>
										<div class="row">
											<div class="col-lg-5">
												<input id="eml_id" name="eml_id" type="text"
													class="form-control" readonly>
											</div>
											<div class="col-lg-1">@</div>
											<div class="col-lg-6">
												<input id="eml_domain" name="eml_domain" type="text"
													class="form-control" readonly>
											</div>
										</div>
									</th>
								</tr>
								<tr>
									<th>접수채널</th>
									<th>
										<div class="col-12">
											<select name="reg_chnl_cd" id="select_reg_chnl_cd"
												class="js-example-basic-single form-control">
												<option value="">없음</option>
											</select>
										</div>
									</th>
									<th>계약형태</th>
									<th>
										<div class="col-12">
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
            						</textarea> <script>
												CKEDITOR.replace('spec_desc');
												</script>
									</th>
								</tr>
							</tbody>
						</table>
						<div id="plus-size1" class="modal-footer">
							<button type="button" id="regist" class="btn btn-primary" onclick="registLead()">등록</button>
							<button type="button" id="return" class="btn btn-default" onclick="backToLeads()">목록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalView" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h5>고객명</h5>
    <input type="text" class="form-control" id="inputName">
    <button type="submit" class="btn btn-primary" onclick="getProspects()">검색</button>
      </div>
      <div class="modal-body" id="modalBody">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
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


