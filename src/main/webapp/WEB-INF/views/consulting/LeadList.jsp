<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script>
window.onload = function () {
	
}

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
						<option value="201">전화</option>
						<option value="202">이메일</option>
						<option value="203">SNS</option>
					</select>
				</span>
			</span> 
			
			
			<span class="input-group-text">
				계약형태
			</span> 
			<span class="input-group-text">
				<span class="form-group">
					<select class="form-control" id="select_con_type_cd">
						<option value="301">직영계약</option>
						<option value="302">가맹계약</option>
						<option value="303">협력계약</option>
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
				<li class="pagination_button previous"><a href="#"
					class="btn btn-primary">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMarker.startPage }"
				end="${pageMarker.endPage }">

				<li class="paginate_button"><a
					href="leads?pageNum=${num}&amount=10" class="btn btn-primary">${num }</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="pagination_button next"><a href="#"
					class="btn btn-primary">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>