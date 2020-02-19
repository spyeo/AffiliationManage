<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function getParam(sname) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var sval = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == sname) { sval = temp[1]; }
	    }
	    return sval;
	}

	function registLead() {
		var actionForm = $('#actionForm');
		actionForm.attr("action", "/consulting/registlead");
		actionForm.submit();
	}

	function search() {
		var searchfm = $('#searchForm');
		var regchnl = $('#searchForm [name="reg_chnl_cd"]').val();
		var contype = $('#searchForm [name="con_type_cd"]').val();
		var name = $('#searchForm [name="pros_nm"]').val();
		var fra = $('#searchForm [name="fra_cd"]').val();
		var brand = $('#searchForm [name="brand_cd"]').val();
		if (regchnl != "" || contype != "" || name != "" || fra != "" || brand != "") {
			searchfm.submit();
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
	
	$(document).ready(getSelectorOption('/consulting/data/codes', '200', '#select_reg_chnl_cd', 'reg_chnl_cd', 'code', 'code_nm'));
	$(document).ready(getSelectorOption('/consulting/data/codes', '300', '#select_con_type_cd', 'con_type_cd', 'code', 'code_nm'));
	$(document).ready(getSelectorOption('/consulting/data/franchises', '', '#select_fra_cd', 'fra_cd', 'fra_cd', 'fra_nm'));
	$(document).ready(function(){
		var fra = getParam("fra_cd");
		if(fra!=''){
			getSelectorOption('/consulting/data/brands', fra, '#select_brand_cd', 'brand_cd', 'brand_cd', 'brand_nm');
		}
	});
	$(document).ready(function() {
		var actionForm = $("#actionForm");

		$(".page-item .page-link").on("click",function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$(".move").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='lead_id' value='"
			+ $(this).attr("href")+ "'>");
			actionForm.attr("action","/consulting/lead");
			actionForm.submit();
		});
		
		$("#select_fra_cd").change(function() {
			var fra = $("#select_fra_cd option:selected").val();
			if(fra != ''){
				getSelectorOption('/consulting/data/brands', fra, '#select_brand_cd', 'brand_cd', 'brand_cd', 'brand_nm');
			}
		});
	});
</script>
<!-- 검색  -->
<div class="col-lg-12">

	<div class="card col-form-label">

		<form id="searchForm" name="searchForm" action="/consulting/leads"
			method="get">
			<input type="hidden" name="pageNum" value="1">
			<div class="table_layout table-sm">
				<table style="text-align:center; width:100%;">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="25%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>
								<div class="col-form-label">접수채널</div>
							</th>
							<th>
								<span class="form-group"> <select name="reg_chnl_cd"
								class="form-control" id="select_reg_chnl_cd">
								<option value="">--</option>
								</select>
								</span>
							</th>
							<th>
								<div class="col-form-label">계약형태</div>
							</th>
							<th>
								<span class="form-group"> <select name="con_type_cd"
								class="form-control" id="select_con_type_cd">
								<option value="">--</option>
								</select>
								</span>
							</th>
							<th>
								<div class="col-form-label">가망고객명</div>
							</th>
							<th>
								<span class="form-group"> <input type="text" name="pros_nm"
								value="${pageMarker.cri.pros_nm }" class="form-control">
								</span>
							</th>
							<th rowspan="2">
								<span class="form-group">
								<button type="button" class="btn btn-primary" onclick="search()">검색</button>
								</span>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>
								<div class="col-form-label">가맹사업</div>
							</th>
							<th>
								<span class="form-group"> <select name="fra_cd"
								class="form-control" id="select_fra_cd">
								<option value="">--</option>
								</select>
								</span>
							</th>
							<th>
								<div class="col-form-label">브랜드</div>
							</th>
							<th>
								<span class="form-group"> <select name="brand_cd"
								class="form-control" id="select_brand_cd">
								<option value="">--</option>
								</select>
								</span>
							</th>
							<th>
								<!-- <div class="col-form-label">삭제 데이터 조회</div> -->
							</th>
							<th style="float:left;">
								 <!-- <div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="del_yn" value="y">
								  <label class="form-check-label" for="inlineCheckbox1">Check</label>
								</div> -->
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<!--   리스트 출력   -->
	<div>
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">모객접수ID</th>
						<th scope="col">접수채널</th>
						<th scope="col">계약형태</th>
						<th scope="col">브랜드</th>
						<th scope="col">가망고객명</th>
						<th scope="col">이동전화</th>
						<th scope="col">이메일</th>
						<th scope="col">접수일시</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty leadList}">
						<td colspan="7" align="center">데이터가 없습니다.</td>
					</c:if>
					<c:if test="${leadList ne null }">
					<c:forEach var="lead" items="${leadList}">
						<tr>
							<td scope="row">
								<a class="move"href='<c:out value="${lead.lead_id }"/>'>
									<c:out value="${lead.lead_id }" />
								</a>
							</td>
							<c:forEach var="code" items="${codeList}">
								<c:if test="${lead.reg_chnl_cd eq code.code}">
									<td>${code.code_nm}</td>
								</c:if>					
							</c:forEach>
							
							<c:forEach var="code" items="${codeList}">
								<c:if test="${lead.con_type_cd eq code.code}">
									<td>${code.code_nm}</td>
								</c:if>					
							</c:forEach>
							<td>${lead.brand_cd }</td>
							<td>${lead.prospectVO.pros_nm}</td>
							<td>${lead.prospectVO.cell_ph_no}-${lead.prospectVO.cell_ph_tno}-${lead.prospectVO.cell_ph_no}</td>
							<td>${lead.prospectVO.eml_id}@${lead.prospectVO.eml_domain}</td>
							<td><fmt:formatDate var="dateTempParse"
									pattern="yyyy-MM-dd HH:mm" value="${lead.last_upd}" /> <c:out
									value="${dateTempParse }" /></td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<div style="float:right">
	<button type="button" class="btn btn-primary" onclick="registLead()">추가</button>
	</div>

	<!--  페이징 처리   -->
	<div>
		<div class="container">
			<ul class="pagination justify-content-center">

				<c:if test="${pageMarker.prev}">
					<li class="page-item previous"><a
						href="${pageMarker.startPage-1 }" class="page-link">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMarker.startPage }"
					end="${pageMarker.endPage }">

					<c:if test="${pageMarker.cri.pageNum eq num }">
						<li class="page-item active"><a href="${num}"
							class="page-link">${num}</a></li>
					</c:if>
					<c:if test="${pageMarker.cri.pageNum ne num }">
						<li class="page-item"><a href="${num}" class="page-link">${num}</a>
						</li>
					</c:if>
				</c:forEach>

				<c:if test="${pageMaker.next }">
					<li class="page-item next"><a href="${pageMarcker.endPage+1 }"
						class="page-link">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>

<!-- 페이지 처리 히든 파라매터 -->
<form id='actionForm' action="/consulting/leads" method='get'>
	<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum }'>
	<input type="hidden" name='amount' value='${pageMarker.cri.amount }'>
	<input type="hidden" name='reg_chnl_cd' value='${pageMarker.cri.reg_chnl_cd }'> 
	<input type="hidden" name='con_type_cd' value='${pageMarker.cri.con_type_cd }'>
	<input type="hidden" name='fra_cd' value='${pageMarker.cri.fra_cd }'>
	<input type="hidden" name='brand_cd' value='${pageMarker.cri.brand_cd }'> 
	<input type="hidden" name='pros_nm' value='${pageMarker.cri.pros_nm }'>
</form>