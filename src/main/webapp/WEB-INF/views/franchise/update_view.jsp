<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    


      <div id="content-wrapper">

        <div class="container-fluid">

   <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-block">
                                            <table id="demo-foo-filtering" class="table">
                                            	<tbody>
                                                    <tr>
                                                        <th>가맹사업
                                                       	 	<select class="form_con_block" readonly="readonly">
                                                            	<option value="100">매장</option>
                                                            	<option value="101">배달</option>
                                                            	<option value="102">O2O</option>
                                                        	</select> 
                                                     	</th>
                                                        <th>브랜드
                                                    		<select name="barnd_cd" id="brand_cd" class="form_con_block plus-imp" value="${store.brand_cd}" readonly="readonly">
                                                    			<option value="102">돈까스</option>
                                                            	<option value="103">일식</option>
                                                            	<option value="104">분식</option>
                                                            	<option value="105">도시락</option>
                                                            	<option value="106">햄버거</option>
                                                            	<option value="107">한식</option>
                                                        		<option value="108">설렁탕</option>
                                                        	</select> 
                                                     	</th>
                                                    </tr>
                                                     <tr>
                                                   		<th>가맹점 코드
                                                   		<input name="str_cd" type="text" class="form_con_block numform" value="${store.str_cd}" readonly="readonly">
                                                   		</th>
                                                   		
                                                   		<th>가맹점명
                                                        <input name="str_nm" type="text" class="form_con_block numform3" value="${store.str_nm}" readonly="readonly">
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                   		<th>대표자명
                                                   		<input name="str_rep_nm" type="text" class="form_con_block numform2" value="${store.str_rep_nm}" readonly="readonly">
                                                   		</th>
                                                   		
                                                        <th>전화번호
                                                        </br>
                                                        <input name="ph_area_no" type="text" class="form_con numform" value="${store.ph_area_no}" readonly="readonly">-
                                                        <input name="ph_tno" type="text" class="form_con numform" value="${store.ph_tno}" readonly="readonly">-
                                                        <input name="ph_cno" type="text" class="form_con numform" value="${store.ph_cno}" readonly="readonly">
                                                        </th>
                                                    </tr>
                                                    
                                                    <tr><th>가맹점 주소
                                                    <input name="str_zipcd" type="text" class="form_con_block numform" value="${store.str_zipcd}" readonly="readonly">
                                                    <input name="str_addr" type="text" class="form_con numform4" value="${store.str_addr}" readonly="readonly">
                                                    <input name="str_addr_dtl" type="text" class="form_con numform3" value="${store.str_addr_dtl}" readonly="readonly">
                                                    </th></tr>
                                                    
                                                    <input name="last_upd" type="hidden" class="form-control plus-imp" 
                                                    	value='<fmt:formatDate pattern="YYYY-MM-DD" value="${store.last_upd}"/>' readonly="readonly">
                                                    
                                                    </tbody>
	                                            </table>
                                       				 <div id="plus-size1" class="modal-footer">
                                                         <button data-oper='update' class="btn btn-primary">수정</button>
                                                         <button type="submit" class="btn btn-secondary"
                                                         		onclick="location.href='/franchise/list'">목록</button>
                                                         
                                                         <form 1d='operForm' actione="/franchise/update" method="get">
                                                         	<input type='hidden' id='str_cd' name='str_cd' value='<c:out value="${store.str_cd}"/>'>
                                                         </form>
                                                     </div>
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

	$(document).ready(function(){
		
		var operForm = $("#operForm");
		
		$("button[data-oper='update']").on("click", function(e){
			operForm.attr("action", "/franchise/update").submit();			
		});
		
	});

</script>