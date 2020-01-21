<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	


<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>



function getcodes(code,tag){
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
		}
	})
}

$(document).ready(getcodes('200','#select_reg_chnl_cd'));
$(document).ready(getcodes('300','#select_con_type_cd'));

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
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
});
</script>

<div style="flex-direction: column;">
<!-- 검색 리스트 -->
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">
				접수채널
			</span> 
			<span class="input-group-text">
				<span class="form-group">
					<select class="form-control" id="select_reg_chnl_cd">
						<option value="">없음</option>
					</select>
				</span>
			</span> 
			
			
			<span class="input-group-text">
				계약형태
			</span> 
			<span class="input-group-text">
				<span class="form-group">
					<select class="form-control" id="select_con_type_cd">
						<option value="">없음</option>
					</select>
				</span>
			</span>  
			<span class="input-group-text">
				가망고객명
			</span> 
			<span class="input-group-text"> 
				<input type="text" aria-label="contract" class="form-control">
			</span> 
			<div class="input-group-prepend">
				<button type="button" class="btn btn-primary">검색</button>
			</div>
		</div>
	</div>
	
	
	
	
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
						<th scope="row"><a
							href="/consulting/lead?lead_id=${lead.lead_id}">${lead.lead_id}</a>
						</th>
						<td>${lead.reg_chnl_cd }</td>
						<td>${lead.con_type_cd }</td>
						<td>${lead.prospectVO.pros_nm}</td>
						<td>${lead.prospectVO.cell_ph_no}-${lead.prospectVO.cell_ph_tno}-${lead.prospectVO.cell_ph_no}</td>
						<td>${lead.prospectVO.eml_id}@${lead.prospectVO.eml_domain}</td>
						<td><fmt:formatDate var="dateTempParse"
								pattern="yyyy-MM-dd HH:mm" value="${lead.last_upd}" /> <c:out
								value="${dateTempParse }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="pull-right">
		<ul class="pagination">

			<c:if test="${pageMarker.prev}">
				<li class="paginate_button previous">
				<a href="${pageMarker.startPage-1 }"
					class="btn btn-primary">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMarker.startPage }"
				end="${pageMarker.endPage }">

				<li class="paginate_button ${pageMarker.cri.pageNum == num ? "active":""}">
					<a href="${num}" class="btn btn-primary">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="paginate_button next">
					<a href="${pageMarcker.endPage+1 }" class="btn btn-primary">Next</a>
				</li>
			</c:if>
		</ul>
		<form id='actionForm' action="/consulting/leads" method='get'>
			<input type="hidden" name='pageNum' value = '${pageMarker.cri.pageNum }'>
			<input type="hidden" name='amount' value='${pageMarker.cri.amount }'>
		</form>
	</div>
</div>