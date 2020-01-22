<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	


<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>

function search(){
	var searchfm = $('#searchForm');
	var regchnl = $('#searchForm [name="reg_chnl_cd"]').val();
	var contype = $('#searchForm [name="con_type_cd"]').val();
	var name = $('#searchForm [name="pros_nm"]').val();
	if(regchnl!="" || contype!="" || name!=""){
		searchfm.submit();
	}
}

function searchReset(){
	location.href="/consulting/leads";
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
			if($('#actionForm [name="'+codename+'"]').val() != null){
				$(tag).val($('#actionForm [name="'+codename+'"]').val()).prop("selected", true);
			}
			
		}
	})
}

$(document).ready(getcodes('200','#select_reg_chnl_cd','reg_chnl_cd'));
$(document).ready(getcodes('300','#select_con_type_cd','con_type_cd'));

$(document).ready(function (){
	/*
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result) {
		
		if(result === '' || history.state) {
			return;
		}
		
		if (parseInt(result)>0) {
			$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
		
	}
	
	$("#regBtn").on("click", function(){
		self.location = "/consulting/register";
	});
	
	*/
	
	var actionForm = $("#actionForm");
	
	$(".page-item .page-link").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='lead_id' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/consulting/lead");
		actionForm.submit();
	})
	
});
</script>
<!-- 검색  -->

<div style="flex-direction: column;">
	<form id="searchForm" name="searchForm" action="/consulting/leads" method="get">
		<input type="hidden" name="pageNum" value="1">
		<div class="input-group">
			<div class="input-group-prepend">
			
				<span class="input-group-text">
					접수채널
				</span> 
				<span class="input-group-text">
					<span class="form-group">
						<select name="reg_chnl_cd" class="form-control" id="select_reg_chnl_cd">
							<option value="">없음</option>
						</select>
					</span>
				</span> 
				
				
				<span class="input-group-text">
					계약형태
				</span> 
				<span class="input-group-text">
					<span class="form-group">
						<select name="con_type_cd" class="form-control" id="select_con_type_cd">
							<option value="">없음</option>
						</select>
					</span>
				</span>  
				<span class="input-group-text">
					가망고객명
				</span> 
				<span class="input-group-text"> 
					<input type="text" name="pros_nm" value="${pageMarker.cri.pros_nm }" aria-label="contract" class="form-control">
				</span> 
				<span class="input-group-prepend">
					<button type="button" class="btn btn-primary" onclick="search()">검색</button>
				</span>
				<span class="input-group-prepend">
					<button type="button" class="btn btn-light" onclick="searchReset()">초기화</button>
				</span>
			</div>
		</div>
	</form>	
	<div style="float:right;">
	<a href="/consulting/newlead" class="btn btn-primary">추가</a>
	</div>
	
	
<!-- 게시물 리스트 -->
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
				<c:forEach var="lead" items="${leadReceiptList}">
					<tr>
						<td scope="row">
							<a class="move" href='<c:out value="${lead.lead_id }"/>'>
								<c:out value="${lead.lead_id }"/>
							</a>
						</td>
						<td>${lead.reg_chnl_cd }</td>
						<td>${lead.con_type_cd }</td>
						<td>${lead.prospectVO.pros_nm}</td>
						<td>${lead.prospectVO.cell_ph_no}-${lead.prospectVO.cell_ph_tno}-${lead.prospectVO.cell_ph_no}</td>
						<td>${lead.prospectVO.eml_id}@${lead.prospectVO.eml_domain}</td>
						<td><fmt:formatDate var="dateTempParse"
								pattern="yyyy-MM-dd HH:mm" value="${lead.last_upd}" /> 
								<c:out value="${dateTempParse }" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<!-- 페이징 -->
	<div class="container">
		<ul class="pagination">

			<c:if test="${pageMarker.prev}">
				<li class="page-item previous">
				<a href="${pageMarker.startPage-1 }" class="page-link">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMarker.startPage }"
				end="${pageMarker.endPage }">

				<c:if test="${pageMarker.cri.pageNum eq num }">
					<li class="page-item active">
						<a href="${num}" class="page-link">${num}</a>
					</li>
				</c:if>
				<c:if test="${pageMarker.cri.pageNum ne num }">
					<li class="page-item">
						<a href="${num}" class="page-link">${num}</a>
					</li>
				</c:if>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="page-item next">
					<a href="${pageMarcker.endPage+1 }" class="page-link">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>

<!-- 페이지 처리 히든 파라매터 -->
<form id='actionForm' action="/consulting/leads" method='get'>
	<input type="hidden" name='pageNum' value = '${pageMarker.cri.pageNum }'>
	<input type="hidden" name='amount' value='${pageMarker.cri.amount }'>
	<input type="hidden" name='reg_chnl_cd' value='${pageMarker.cri.reg_chnl_cd }'>
	<input type="hidden" name='con_type_cd' value='${pageMarker.cri.con_type_cd }'>
	<input type="hidden" name='pros_nm' value='${pageMarker.cri.pros_nm }'>
</form>