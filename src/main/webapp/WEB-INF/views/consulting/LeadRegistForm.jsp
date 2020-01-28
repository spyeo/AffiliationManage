<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<script>

function searchProspects(){
	var url = "/consulting/prospects";
	if($("input[id='newProspect']:checked").length<=0){
		$("#exampleModalLabel").load(url, function(){
			$("#exampleModalLabel").modal();
			
		});
	}
}

function registLead(){

	var queryString = $("form[id=registForm]").serialize();
	
	$.ajax({
		type : 'post',
		url : '/consulting/registlead',
		data : queryString,
		dataType : 'json',
		success : function(data){
			alert('저장되었습니다.');
		},
		error : function(xhr, status, error){
			alert('실패했습니다.');
		}
	});
}

function backToLeads(){
	
	document.getElementById('#actionForm').submit();
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
	$("#newProspect").change(function(){
		if($("#newProspect").is(":checked")){
			$("#pros_nm").attr("readonly",false);
			$("#cell_ph_no").attr("readonly",false);
			$("#cell_ph_tno").attr("readonly",false);
			$("#cell_ph_pno").attr("readonly",false);
			$("#eml_id").attr("readonly",false);
			$("#eml_domain").attr("readonly",false);
		}
		else{
			$("#pros_nm").attr("readonly",true);
			$("#cell_ph_no").attr("readonly",true);
			$("#cell_ph_tno").attr("readonly",true);
			$("#cell_ph_pno").attr("readonly",true);
			$("#eml_id").attr("readonly",true);
			$("#eml_domain").attr("readonly",true);
		}
	})
});
$(document).ready(function(){
	$("#exampleModalCenter").on('show.bs.modal', function (event) {
		//이벤트 생성
	});
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
								
								<!-- 
								<tr>
									<th>모객접수ID</th>
									<th><input name="lead_id" type="text" value="자동채번 됩니다."
										class="form-control plus-imp" readonly></th>
								</tr>
								 -->
								
								<tr>
									<th>고객명</th>
									<th>
										<div class="input-group mb-3">
  											<input type="text" class="form-control">
 					 						<div class="input-group-append">
	    										<span class="input-group-text" id="basic-addon2">
		    										 <a href="#" id="searchProspects" onclick="searchProspects()">검색</a>
												</span>
										  </div>
										</div>
									</th>
									<th>신규여부</th>
									<th><label><input type="checkbox" id="newProspect">신규</label></th>
								</tr>
								<tr>
									
									<!-- <th>가망고객ID</th>
									<th><input id="pros_id" name="pros_id" type="text" value="자동채번 됩니다."
										class="form-control plus-imp" readonly></th>
									 -->
									<th>가망고객명</th>
									<th colspan="3">
										<div class="row">
											<div class="col-lg-6">
												<input id="pros_nm" name="pros_nm" type="text"
										class="form-control" readonly>
											</div>
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
									<th colspan="3"><textarea name="editor1" id="editor1"
											rows="10" cols="80">
            						</textarea> <script>
												CKEDITOR.replace('editor1');
												</script></th>
								</tr>
							</tbody>
						</table>
						<div id="plus-size1" class="modal-footer">
							<button type="button" id="regist" class="btn btn-primary" onclick="registLead()">저장</button>
							<button type="button" id="calcel" class="btn btn-secondary">취소</button>
							<button type="button" id="return" class="btn btn-default" onclick="backToLeads()">목록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="exampleModalLabel" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width:600px;height:350px;backgroud-color:white">
        <div class="modal-content">
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


