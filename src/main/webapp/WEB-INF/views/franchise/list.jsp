<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


      <div id="content-wrapper">

        <div class="container-fluid">

   <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-header">
                                         <tr><th>가맹사업
                                             <div class='row' style="padding-top:15px">
                                      <form id='searchForm' action="franchise/list" method='get'>
                                         <select name='type'>
                                            <option value="" 
                                               <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>매장</option>
                                            <option value="T" 
                                               <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>배달</option>
                                            <option value="C" 
                                               <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>O2O</option>
                                         </select>
                                      </form>
                                </div>
                                	</th>
                                	<th>브랜드
                                     <div class='row' style="padding-top:15px">
                                      <form id='searchForm' action="franchise/list" method='get' >
                                         <select name='type'>
                                            <option value="" 
                                               <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>돈까스</option>
                                            <option value="T" 
                                               <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>일식</option>
                                            <option value="C" 
                                               <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>분식</option>
                                            <option value="W" 
                                               <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>도시락</option>
                                            <option value="T" 
                                               <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>햄버거</option>
                                            <option value="C" 
                                               <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>한식</option>
                                            <option value="W" 
                                               <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>설렁탕</option>   
                                         </select>
                                      </form>
                                      </th></tr>
                                </div>
                                             <div class="card-header-right">
                                                <div id="plus-size1" class="modal-footer">
                                                         <button type="button" onclick="location.href='franchise/insert'" class="btn btn-primary">등록</button>
                                                         <button type="button" class="btn btn-secondary">조회</button>
                                                </div>
                                            </div>
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
                                                        <td><c:out value="${store.brand.fra_cd}" /></td>
                                                        <td><c:out value="${store.brand.brand_cd}" /></td>
                                                        <td><c:out value="${store.str_cd}" /></td>
                                                        <td class="hidden"><c:out value="${store.del_yn}" /></td>
                                                        <td class="hidden"><c:out value="${store.created_by}" /></td>
                                                        <td class="hidden"><fmt:formatDate pattern="YYYY-MM-DD"
                                                        					value="${store.created}" /></td>
                                                        <td class="hidden"><c:out value="${store.last_upd_by}" /></td>
                                                        <td class="hidden"><fmt:formatDate pattern="YYYY-MM-DD"
                                                        					value="${store.last_upd}" /></td>
                                                        <td>${store.str_nm}</td>
                                                        <td>${store.str_rep_nm}</td>
                                                        <td><c:out value="${store.str_area_no}"/>
                                                        	<c:out value="${store.str_tno}" />
                                                        	<c:out value="${store.str_cno}" />
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
