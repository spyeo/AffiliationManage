<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<table class="table">
      		<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="15%">
					<col width="5%">
			</colgroup>
			<tbody>
				<tr>
					<td>
						<label for="inputName">고객명</label>
					</td>
					<td>
						<input type="text" class="form-control" id="inputName">
					</td>
					<td>
						<button type="submit" class="btn btn-primary" onclick="getProspects()">검색</button>
					</td>
					<td>
						<button type="button" class="btn btn-primary" onclick="loadNewProspect()">추가</button>
					</td>
				</tr>
			</tbody>
      	</table>
      	<table class="table">
      		<colgroup>
				<col width="15%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>고객명</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>생성일자</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody id="prospectlist">
			</tbody>
      	</table>