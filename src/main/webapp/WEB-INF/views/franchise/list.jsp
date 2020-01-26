<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


      <div id="content-wrapper">

        <div class="container-fluid">

   <div class="col-sm-12">
                                    <div class="card">
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
													<span class="input-group-prepend">
														<button type="button" class="btn btn-primary" onclick="search()">검색</button>
													</span>
													<span class="input-group-prepend">
														<button type="button" class="btn btn-light" onclick="searchReset()">초기화</button>
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
                                                        <th>브랜드</th>
                                                        <th>가맹점 코드</th>
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
                                                       
                                                        <td>${store.str_nm}</td>
                                                        <td>${store.str_rep_nm}</td>
                                                        <td><c:out value="${store.ph_area_no}"/>
                                                        	<c:out value="${store.ph_tno}" />
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

<script type="text/javascript">

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

</script>

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
	location.href="/franchise/list";
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