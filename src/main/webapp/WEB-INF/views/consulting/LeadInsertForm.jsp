<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<script>
	function getcodes(code, tag, codename) {
		$.ajax({
			type : 'get',
			url : '/consulting/data/codes/' + code,
			dataType : 'json',
			success : function(data) {
				if (data == null) {
					data = 0;
				}
				for (var i = 0; i < data.length; i++) {

					$(tag).append(
							"<option value='"+ data[i]['code']
				+ "'>"
									+ data[i]['code_nm'] + "</option>");
				}
				if ($('#actionForm [name="' + codename + '"]').val() != null) {
					$(tag)
							.val(
									$('#actionForm [name="' + codename + '"]')
											.val()).prop("selected", true);
				}

			}
		})
	}

	$(document).ready(getcodes('200', '#select_reg_chnl_cd', 'reg_chnl_cd'));
	$(document).ready(getcodes('300', '#select_con_type_cd', 'con_type_cd'));
</script>

<div id="content-wrapper">

	<div class="container-fluid">

		<div class="col-sm-12">
			<div class="card">
				<div class="card-block">
					<form name="input" method="post" action="consulting/newlead">
						<table id="demo-foo-filtering" class="table">
							<tbody>
								<tr>
									<th>모객접수ID</th>
									<th><input name="lead_id" type="text"
										class="form-control plus-imp"></th>

								</tr>
								<tr>
									<th>고객명</th>
									<th><input name="pros_nm" type="text" data-toggle="modal"
										data-target="#exampleModalCenter"
										class="form-control plus-imp"></th>
									<th>신규여부</th>
									<th><label><input type="checkbox">신규</label></th>
								</tr>
								<tr>
									<th>가망고객ID</th>
									<th><input name="pros_id" type="text"
										class="form-control plus-imp"></th>
									<th>가망고객명</th>
									<th><input name="pros_nm" type="text"
										class="form-control plus-imp"></th>
								</tr>
								<tr>
									<th>이동전화</th>
									<th>
										<div class="row">
											<div class="col-lg-3">
												<input name="pros_id" type="text" class="form-control">
											</div>
											<div class="col-lg-1">
												<h2>-</h2>
											</div>
											<div class="col-lg-3">
												<input name="pros_id" type="text" class="form-control">
											</div>
											<div class="col-lg-1">
												<h2>-</h2>
											</div>
											<div class="col-lg-3">
												<input name="pros_id" type="text" class="form-control">
											</div>
										</div>
									</th>

									<th>이메일</th>
									<th>
										<div class="row">
											<div class="col-lg-5">
												<input name="pros_id" type="text"
													class="form-control plus-imp">
											</div>
											<div class="col-lg-1">@</div>
											<div class="col-lg-6">
												<input name="pros_id" type="text"
													class="form-control plus-imp">
											</div>
										</div>
									</th>
								</tr>
								<tr>
									<th>접수채널</th>
									<th>
										<div class="col-12">
											<select name="select_reg_chnl_cd" id="select_reg_chnl_cd"
												class="js-example-basic-single form-control plus-imp">
												<option value="">없음</option>
											</select>
										</div>
									</th>
									<th>계약형태</th>
									<th>
										<div class="col-12">
											<select name="select_con_type_cd" id="select_con_type_cd"
												class="js-example-basic-single form-control plus-imp">
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
																			CKEDITOR
																					.replace('editor1');
																		</script></th>
								</tr>
							</tbody>
						</table>
						<div id="plus-size1" class="modal-footer">
							<button type="submit" class="btn btn-primary">저장</button>
							<button type="button" class="btn btn-secondary">취소</button>
							<button type="button" class="btn btn-default">목록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

<form id='actionForm' action="/consulting/leads" method='get'>
	<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum }'>
	<input type="hidden" name='amount' value='${pageMarker.cri.amount }'>
	<input type="hidden" name='reg_chnl_cd'
		value='${pageMarker.cri.reg_chnl_cd }'> <input type="hidden"
		name='con_type_cd' value='${pageMarker.cri.con_type_cd }'> <input
		type="hidden" name='pros_nm' value='${pageMarker.cri.pros_nm }'>
</form>


