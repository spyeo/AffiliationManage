<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>
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
		if (regchnl != "" || contype != "" || name != "") {
			searchfm.submit();
		}
	}

	function searchReset() {
		location.href = "/consulting/leads";
	}

	function getcodes(code, selecter_id, code_type) {
		$.ajax({
			type : 'get',
			url : '/consulting/data/codes/' + code,
			dataType : 'json',
			success : function(data) {
				if (data == null) {
					data = 0;
				}
				for (var i = 0; i < data.length; i++) {
					$(selecter_id).append("<option value='"+ data[i]['code']+ "'>"
					+ data[i]['code_nm'] + "</option>");
				}
				if (code_type != null) {
					$(selecter_id).val($('#actionForm [name="' + code_type + '"]')
					.val()).prop("selected", true);
				}
			}
		});
	}

	$(document).ready(getcodes('200', '#select_reg_chnl_cd', 'reg_chnl_cd'));
	$(document).ready(getcodes('300', '#select_con_type_cd', 'con_type_cd'));
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
	});
</script>
<!-- 검색  -->
<div class="col-lg-12">

	<div class="card col-form-label">

		<form id="searchForm" name="searchForm" action="/consulting/leads"
			method="get">
			<input type="hidden" name="pageNum" value="1">
			<div class="form-group row">
				<div class="col-lg-1"></div>
				<div class="col-lg-9 row">
					<div class="col-lg-auto col-form-label">접수채널</div>
					<div class="col-lg-2">
						<span class="form-group"> <select name="reg_chnl_cd"
							class="form-control" id="select_reg_chnl_cd">
								<option value="">없음</option>
						</select>
						</span>
					</div>
					<div class="col-lg-auto col-form-label">계약형태</div>
					<div class="col-lg-2">
						<span class="form-group"> <select name="con_type_cd"
							class="form-control" id="select_con_type_cd">
								<option value="">없음</option>
						</select>
						</span>
					</div>
					<div class="col-lg-auto col-form-label">가망고객명</div>
					<div class="col-lg-4">
						<span> <input type="text" name="pros_nm"
							value="${pageMarker.cri.pros_nm }" class="form-control">
						</span>
					</div>
				</div>
				<div class="col-lg-auto">
					<button type="button" class="btn btn-primary" onclick="search()">검색</button>
				</div>
				<div class="col-lg-1 row">
					<button type="button" class="btn btn-light" onclick="searchReset()">초기화</button>
				</div>
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
	<input type="hidden" name='pros_nm' value='${pageMarker.cri.pros_nm }'>
</form>