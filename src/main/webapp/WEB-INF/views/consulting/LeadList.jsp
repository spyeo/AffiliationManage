<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점 관리 시스템</title>

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin.css" rel="stylesheet">
</head>
<body>
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">접수채널</span> <span
				class="input-group-text"> <input type="text"
				aria-label="chenal" class="form-control">
			</span> <span class="input-group-text">계약형태</span> <span
				class="input-group-text"> <input type="text"
				aria-label="contract" class="form-control">
			</span> <span class="input-group-text">가망고객명</span> <span
				class="input-group-text"> <input type="text"
				aria-label="name" class="form-control">
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
						<th scope="row"><a href="consulting/lead?lead_id=${lead.lead_id}">${lead.lead_id}</a>
						</th>
						<td>${lead.reg_chnl_cd }</td>
						<td>${lead.con_type_cd }</td>
						<td>${lead.prospectVO.pros_nm}</td>
						<td>${lead.prospectVO.cell_ph_no}-${lead.prospectVO.cell_ph_tno}-${lead.prospectVO.cell_ph_no}</td>
						<td>${lead.prospectVO.eml_id}@${lead.prospectVO.eml_domain}</td>
						<td><fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd HH:mm" value="${lead.last_upd}"/><c:out value="${dateTempParse }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pull-right">
	<ul class="pagination">
	
	<c:if test="${pageMarker.prev}">
	<li class="pagination_button previous"><a href="#" class="btn btn-primary">Previous</a>
	</li>
	</c:if>
	
	<c:forEach var="num" begin="${pageMarker.startPage }"
	end="${pageMarker.endPage }">
	
	<li class="paginate_button"><a href="leads?pageNum=${num}&amount=10"  class="btn btn-primary">${num }</a></li>
	</c:forEach>
	
	<c:if test="${pageMaker.next }">
	<li class="pagination_button next"><a href="#" class="btn btn-primary">Next</a></li>
	</c:if>
	</ul>
	</div>


</body>
</html>