<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


      <div id="content-wrapper">

        <div class="container-fluid">

   <div class="col-sm-12">
                                    <div class="card">
                                        <form id="searchForm" name="searchForm" action="/franchise/list" method="get">
											<input type="hidden" name="pageNum" value="1">
											<div class="inp-group">
												<div class="input-group-prepend">
												
													<span class="input-group-text ww">
														가맹사업
													</span> 
													<span class="input-group-text ww">
														<span class="form-group">
															<select name="fra_cd" id="fra_cd" class="form-control" value="${store.franchise.fra_cd}">
																<option value="매장">매장</option>
                                                            	<option value="배달">배달</option>
                                                            	<option value="O2O">O2O</option>
															</select>
														</span>
													</span> 
													
													<span class="input-group-text ww">
														브랜드
													</span> 
													<span class="input-group-text ww">
														<span class="form-group">
															<select name="brand_cd" id="barnd_cd" class="form-control" value="${store.barnd.brand_cd}">
																<option value="돈까스">돈까스</option>
                                                            	<option value="일식">일식</option>
                                                            	<option value="분식">분식</option>
                                                            	<option value="도시락">도시락</option>
                                                            	<option value="햄버거">햄버거</option>
                                                            	<option value="한식">한식</option>
                                                        		<option value="설렁탕">설렁탕</option>
															</select>
														</span>
													</span>  
													<span class="input-group-prepend">
														<button type="button" class="btn btn-primary" onclick="search()"> 검색 </button>
													</span>
													<span class="input-group-prepend">
														<button type="button" class="btn btn-light" onclick="searchReset()">초기화</button>
													</span>
													<span class="input-group-prepend">
														<button type="button" class="btn btn-primary" onclick="insertForm()"> 추가 </button>
													</span>
												</div>
											</div>
										</form>
										
										
                                        </div>
                                        <div class="card-block">
                                            <table id="demo-foo-filtering" class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>가맹사업</th>
                                                        <th>브랜드</th>                                                        <th>가맹점 코드</th>
                                                        <th>가맹점명</th>
                                                        <th>대표자명</th>
                                                        <th>전화번호</th>
                                                        <th>가맹점 주소</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:choose>
														<c:when test="${empty list}">
															<tr><td id="tdsize" colspan="11">내용이 없습니다</td></tr>
														</c:when>
													<c:otherwise>
                                                	<c:forEach items="${list}" var="store">
                                                    <tr>
                                                        <td><c:out value="${store.franchise.fra_cd}" /></td>
                                                        <td><c:out value="${store.brand.brand_cd}" /></td>
                                                        <td><c:out value="${store.str_cd}" /></td>
                                                        <td><a class='move' href='<c:out value="${store.str_cd}"/>'>
                                                        	<c:out value="${store.str_nm}" /></a></td>
                                                        <td>${store.str_rep_nm}</td>
                                                        <td><c:out value="${store.ph_area_no}"/> -
                                                        	<c:out value="${store.ph_tno}" /> -
                                                        	<c:out value="${store.ph_cno}" />
                                                        </td>
                                                        <td><c:out value="${store.str_addr}" />
                                                        	<c:out value="${store.str_addr_dtl}" />
                                                        	<c:out value="${store.str_zipcd}" />
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                    </c:otherwise>
                                                  </c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                        	<div class="container">
												<ul class="pagedesign">
										
													<c:if test="${pageMarker.prev}">
														<li class="page_ac">
														<a href="${pageMarker.startPage-1 }" class="page-link">Previous</a></li>
													</c:if>
										
													<c:forEach var="num" begin="${pageMarker.startPage }"
														end="${pageMarker.endPage }">
										
														<c:if test="${pageMarker.cri.pageNum eq num }">
															<li class="page_ac">
																<a href="${num}" class="page-link">${num}</a>
															</li>
														</c:if>
														<c:if test="${pageMarker.cri.pageNum ne num }">
															<li class="page_ac">
																<a href="${num}" class="page-link">${num}</a>
															</li>
														</c:if>
													</c:forEach>
										
													<c:if test="${pageMaker.next }">
														<li class="page_ac">
															<a href="${pageMarcker.endPage+1 }" class="page-link">Next</a>
														</li>
													</c:if>
												</ul>
											</div>
                                    </div>
                                </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
            <a class="btn btn-primary" href="login.html">로그아웃</a>
          </div>
        </div>
      </div>
    </div>


<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>

function insertForm(){
	var actionForm=$('#actionForm');
	actionForm.attr("action", "/franchise/insert");
	actionForm.submit();
}

function search(){
	var searchfm = $('#searchForm');
	var franchise = $('#searchForm [name="fra_cd"]').val();
	var brand = $('#searchForm [name="brand_cd"]').val();
	if(franchise!="" || brand!=""){
		searchfm.submit();
	}
}

function searchReset(){
	location.href="/franchise/list";
}

function getvalues(brand_cd, tag, name){
	$.ajax({
		type : 'get',
		url : '/franchise/ajax/store/'+fra_cd,
		dataType : 'json',
		success : function(data){
			alert(data);
			if(data==null){
				data=0;
			}
			for(var i = 0; i < data.length; i++){
				
				$(tag).append("<option value='"+ data[i]['fra_cd']
				+ "'>"+data[i]['fra_cd'] + "</option>");
			}
			if(codename != null){
				$(tag).val($('#actionForm [name="'+codename+'"]').val()).prop("selected", true);
			}

		}
	})
}

$(document).ready(getvalues('매장','#fra_cd','fra_cd'));
$(document).ready(getvalues('배달','#fra_cd','fra_cd'));
$(document).ready(getvalues('O2O','#fra_cd','fra_cd'));

$(document).ready(getvalues('돈까스','#brand_cd','brand_cd'));
$(document).ready(getvalues('일식','#brand_cd','brand_cd'));
$(document).ready(getvalues('분식','#brand_cd','brand_cd'));
$(document).ready(getvalues('도시락','#brand_cd','brand_cd'));
$(document).ready(getvalues('햄버거','#brand_cd','brand_cd'));
$(document).ready(getvalues('한식','#brand_cd','brand_cd'));
$(document).ready(getvalues('설렁탕','#brand_cd','brand_cd'));


$(document).ready(function (){
	
	var actionForm = $("#actionForm");
	
	$(".page_ac .page-link").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='str_cd' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/franchise/update_view");
		actionForm.submit();
	})
	
});
</script>

<form id='actionForm' action="/franchise/list" method='get'>

	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='fra_cd' value='${pageMaker.cri.fra_cd}'>
	<input type='hidden' name='brand_cd' value='${pageMaker.cri.brand_cd}'>
	
</form>

