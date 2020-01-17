<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점 관리 시스템</title>
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
		</div>
		<div class="input-group" style="float: right;">
		<div class="input-group-prepend">
			<button type="button" class="btn btn-primary">Primary</button>
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
				<c:forEach var="lead" items="${leadlist}">
					<tr>
						<th scope="row"><a href="consulting/leaddetail">${lead.lead_id}</a>
						</th>
						<td>${lead.reg_chnl_cd }</td>
						<td>${lead.con_type_code }</td>
						<td>${lead.pros_id }</td>
						<td>${lead.reg_chnl_cd}</td>
						<td>pros_id</td>
						<td>pros_id</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>





</body>
</html>