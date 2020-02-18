<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <form id="prospectform">
    <table class="table">
      		<colgroup>
				<col width="20%">
				<col width="auto">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<label class="col-form-label" for="pros_nm">고객명</label>
					</th>
					<td>
						<input type="text" name="pros_nm" class="form-control">
					</td>
				</tr>
				<tr>
					<th>
						<label for="cell_ph_no">전화번호</label>
					</th>
					<td>
						<div style="display:flex;">
								<input id="cell_ph_no" name="cell_ph_no" type="text" class="form-control">
								<span style="vertical-align:middle;">-</span>
								<input id="cell_ph_tno" name="cell_ph_tno" type="text" class="form-control">
								<span style="vertical-align:middle;">-</span>
								<input id="cell_ph_pno" name="cell_ph_pno" type="text" class="form-control">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="searchProsNm">이메일</label>
					</th>
					<td>
						<div style="display:flex;">
							<input id="eml_id" name="eml_id" type="text"
										class="form-control">
							<span style="vertical-align:middle;">@</span>
							<input id="eml_domain" name="eml_domain" type="text"
										class="form-control">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<button type="button" class="btn btn-primary" onclick="registProspect()">저장</button>
						<button type="button" class="btn btn-secondary" onclick="loadProspects()">목록</button>
					</td>
				</tr>
			</tbody>
      	</table>
      </form>