<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    


      <div id="content-wrapper">

        <div class="container-fluid">s

   <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-block">
                                        <form id="update" method="post" action="/franchise/update">
                                            <table id="demo-foo-filtering" class="table">
                                            	<tbody>
                                                    <tr>
                                                        <th>가맹사업
                                                          <div class="col-12">
                                                       	 	<select class="js-example-basic-single form-control plus-imp">
                                                            	<option value="100">매장</option>
                                                            	<option value="101">배달</option>
                                                            	<option value="102">O2O</option>
                                                        	</select> 
                                                     	</div></th>
                                                        <th>브랜드
                                                        <div class="col-12">
                                                    		<select name="barnd_cd" id="brand_cd" class="js-example-basic-single form-control plus-imp" value="${store.brand_cd}">
                                                            	<option value="102">분식</option>
                                                            	<option value="103">도시락</option>
                                                            	<option value="104">햄버거</option>
                                                            	<option value="105">한식</option>
                                                        		<option value="106">설렁탕</option>
                                                        	</select> 
                                                     	</div></th>
                                                    </tr>
                                                     <tr>
                                                   		<th>가맹점 코드
                                                   		<input name="str_cd" id="str_cd" type="text" class="form-control plus-imp" value="${store.str_cd}">
                                                   		</th>
                                                   		
                                                   		<th>가맹점명
                                                        <input name="str_nm" id="str_nm" type="text" class="form-control plus-imp" value="${store.str_nm}">
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                   		<th>대표자명
                                                   		<input name="str_rep_nm" id="str_rep_nm" type="text" class="form-control plus-imp" value="${store.str_rep_nm}">
                                                   		</th>
                                                   		
                                                        <th>전화번호
                                                        <input name="ph_area_no" id="ph_area_no" type="text" class="form-control plus-imp" value="${store.ph_area_no}">-
                                                        <input name="ph_tno" id="ph_tno" type="text" class="form-control plus-imp" value="${store.ph_tno}">-
                                                        <input name="ph_cno" id="ph_cno" type="text" class="form-control plus-imp" value="${store.ph_cno}">
                                                        </th>
                                                    </tr>
                                                    
                                                    <tr><th>가맹점 주소
                                                    <input name="str_zipcd" id="str_zipcd" type="text" class="form-control plus-imp" value="${store.str_zipcd}">
                                                    <input name="str_addr" id="str_addr" type="text" class="form-control plus-imp" value="${store.str_addr}">
                                                    <input name="str_addr_dtl" id="str_addr_dtl" type="text" class="form-control plus-imp" value="${store.str_addr_dtl}">
                                                    </th></tr>
                                                    
                                                    <input name="last_upd" id="last_upd" type="hidden" class="form-control plus-imp" 
                                                    	value='<fmt:formatDate pattern="YYYY-MM-DD" value="${store.last_upd}"/>'>
                                                   
                                                    </tbody>
	                                            </table>
                                       				 <div id="plus-size1" class="modal-footer">
                                                         <input type="submit" class="update btn btn-primary" value="정">
                                                         <button class="delete btn btn-secondary">삭제</button>
                                                         <button type="button" class="btn btn-defalut"
                                                         	onclick="location.href='/franchise/list'">목록</button>
                                                     </div>
                                                   </form>
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
		var formObj = $("form");
		
		// 수정 
		$(".update").on("click", function(){
			formObj.attr("action", "/franchise/update_view");
			formObj.attr("method", "get");
			formObj.submit();				
		});
		
		// 삭제
		$(".delete").on("click", function(){
			formObj.attr("action", "/franchise/delete");
			formObj.attr("method", "post");
			formObj.submit();
		});
	});
	
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
