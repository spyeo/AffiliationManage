<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<div id="content-wrapper">

	<div class="container-fluid">

		<div class="col-sm-12">
			<div class="card">
				<div class="card-block">
					<form id="update" method="post" action="/franchise/update">
						
						<table id="demo-foo-filtering" class="table">
							<tbody>
								<tr>
									<th>가맹사업 <select class="form_con_block">
											<option value="매장">매장</option>
                                          	<option value="배달">배달</option>
                                          	<option value="O2O">O2O</option>
									</select>
									</th>
									<th>브랜드 <select name="brand_cd" id="brand_cd"
										class="form_con_block plus-imp" value="${store.brand_cd}">
											<option value="돈까스">돈까스</option>
                                           	<option value="일식">일식</option>
                                           	<option value="분식">분식</option>
                                           	<option value="도시락">도시락</option>
                                           	<option value="햄버거">햄버거</option>
                                           	<option value="한식">한식</option>
                                       		<option value="설렁탕">설렁탕</option>
									</select>
									</th>
								</tr>
								<tr>
									<th>가맹점 코드 <input name="str_cd" id="str_cd" type="text"
										class="form_con_block numform" value="${store.str_cd}">
									</th>

									<th>가맹점명 <input name="str_nm" id="str_nm" type="text"
										class="form_con_block numform3" value="${store.str_nm}">
									</th>
								</tr>
								<tr>
									<th>대표자명 <input name="str_rep_nm" id="str_rep_nm"
										type="text" class="form_con_block numform2"
										value="${store.str_rep_nm}">
									</th>

									<th>전화번호 </br> <input name="ph_area_no" id="ph_area_no"
										type="text" class="form_con numform"
										value="${store.ph_area_no}">
										- 
										<input name="ph_tno"
										id="ph_tno" type="text" class="form_con numform"
										value="${store.ph_tno}">
										- 
										<input name="ph_cno"
										id="ph_cno" type="text" class="form_con numform"
										value="${store.ph_cno}">
									</th>
								</tr>

								<tr>
								 <tr><th>가맹점 주소
                                    </br>
                                    <div class="form-group">                   
									<input class="form-control" style="width: 15%; margin-top: 10px; display: inline;" name="str_zipcd" id="str_zipcd" type="text" value="${store.str_zipcd}" readonly="readonly" >
									    <button type="button" class="btn btn-default" onclick="execPostCode()"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
									</div>
									<div class="form-group">
									    <input class="form-control" style="top: 5px;" name="str_addr" id="str_addr" type="text" value="${store.str_addr}" readonly="readonly" />
									</div>
									<div class="form-group">
									    <input class="form-control" name="str_addr_dtl" id="str_addr_dtl" type="text" value="${store.str_addr_dtl}"  />
									</div>
                                              
                                 </th></tr>
							</tbody>
						</table>
						<div id="plus-size1" class="modal-footer">
							<button type="submit" data-oper='update' class="btn btn-primary">저장</button>
							<button type="submit" data-oper='delete'
								class="btn btn-secondary">삭제</button>
							<button type="submit" data-oper='list' class="btn btn-secondary">목록</button>
 
						</div>
					</form>
					
					<form id='operForm' action="/franchise/update" method='post'>
						<input type='hidden' name='pageNum' value='${cri.pageNum}'>
						<input type='hidden' name='amount' value='${cri.amount}'>
						<input type='hidden' name='fra_cd' value='${cri.fra_cd}'>
						<input type='hidden' name='brand_cd' value='${cri.brand_cd}'>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /.content-wrapper -->

<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready
				to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<a class="btn btn-primary" href="login.html">로그아웃</a>
			</div>
		</div>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           $("input[name=str_zipcd]").val(data.zonecode);
           $("input[name=str_addr]").val(fullRoadAddr);
           
       }
    }).open();
}

</script>

<script type="text/javascript">
	$(document).ready(
			function() {

				var formObj = $("#update");

				$('button .btn btn-primary, button .btn btn-secondary').on(
						"click",
						function(e) {

							e.preventDefault();
							var operation = $(this).data("oper");

							if (operation === 'delete') {
								formObj.attr("action", "/franchise/delete");
							}
							formObj.submit();

						});
				
				function(){
					var operForm = $("#operForm");
					
					$('button .btn btn-primary, button .btn btn-secondary').on(
							"click",
							function(e) {

								e.preventDefault();
								var operation = $(this).data("oper");
								
							if (operation === 'list') {
									formObj.attr("action", "/franchise/list").attr("method", "get");
									var pageNumTag = $("input[name='pageNum']").clone();
									var amountTag = $("input[name='amount']").clone();
									var fra_cdTag = $("input[name='fra_cd']").clone();
									var brand_cdTag = $("input[name='brand_cd']").clone();
									
									formObj.empty();
									formObj.append(pageNumTag);
									formObj.append(amountTag);
									formObj.append(fra_cdTag);
									formObj.append(brand_cdTag);
								}
				});
					
</script>
