<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


      <div id="content-wrapper">

        <div class="container-fluid">

   <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-block">
                                        <form name="input" method="post" action="franchise/insert">
                                            <table id="demo-foo-filtering" class="table">
                                            	<tbody>
                                                    <tr>
                                                        <th>가맹사업
                                                        <div class="col-12">
                                                    		<select name="c_asset" class="js-example-basic-single form-control plus-imp">
                                                            	<option value="AS001">매장</option>
                                                            	<option value="AS002">배달</option>
                                                            	<option value="AS003">O2O</option>
                                                        	</select> 
                                                     	</div></th>
                                                        <th>브랜드
                                                        <div class="col-12">
                                                    		<select name="c_asset" class="js-example-basic-single form-control plus-imp">
                                                            	<option value="AS001">돈까스</option>
                                                            	<option value="AS002">일식</option>
                                                            	<option value="AS003">분식</option>
                                                            	<option value="AS004">도시락</option>
                                                            	<option value="AS005">햄버거</option>
                                                            	<option value="AS006">한식</option>
                                                        		<option value="AS007">설렁탕</option>
                                                        	</select> 
                                                     	</div></th>
                                                    </tr>
                                                    <tr>
                                                   		<th>가맹점 코드
                                                   		<input name="a_nickname" type="text" class="form-control plus-imp">
                                                   		</th>
                                                        <th>가맹점명
                                                        <input name="a_nickname" type="text" class="form-control plus-imp">
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                   		<th>대표자명
                                                   		<input name="a_nickname" type="text" class="form-control plus-imp">
                                                   		</th>
                                                        <th>전화번호
                                                        <input name="a_nickname" type="text" class="form-control plus-imp">
                                                        </th>
                                                    </tr>
                                                    <tr><th>가맹점 주소
                                                    <input name="a_nickname" type="text" class="form-control plus-imp">
                                                    </th></tr>
                                                    </tbody>
	                                            </table>
                                       				 <div id="plus-size1" class="modal-footer">
                                                         <button type="submit" class="btn btn-primary">저장</button>
                                                         <button type="button" class="btn btn-secondary">취소</button>
                                                         <button type="button" class="btn btn-default">목록</button>
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
