<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

function registProspect(){
	var result = confirm("등록하시겠습니까?");
	if(result){
		var queryString = $("form[id=prospectform]").serialize();
		$.ajax({
			type : 'post',
			url : '/consulting/data/registprospect',
			dataType : 'json',
			data : queryString,
			success : function(data){
				$("#modalView").modal("hide");
				$("#pros_id").val(data.pros_id);
				$("#searchProsNm").val(data.pros_nm);
				$("#pros_nm").val(data.pros_nm);
				$("#cell_ph_no").val(data.cell_ph_no);
				$("#cell_ph_tno").val(data.cell_ph_tno);
				$("#cell_ph_pno").val(data.cell_ph_pno);
				$("#eml_id").val(data.eml_id);
				$("#eml_domain").val(data.eml_domain);
			}
		});
	}
}

function date_to_str(format){
    var year = format.getFullYear();
    var month = format.getMonth() + 1;
    if(month<10) month = '0' + month;
    var date = format.getDate();
    if(date<10) date = '0' + date;
    return year + "-" + month + "-" + date;
}
function loadProspects(){
	$.ajax({
		type : 'get',
		url : '/consulting/modal/prospects',
		dataType : 'text',
		success : function(data){
			$("#modalBody").html(data);
		}
	});
}

function loadNewProspect(){
	$.ajax({
		type : 'get',
		url : '/consulting/modal/newprospect',
		dataType : 'text',
		success : function(data){
			$("#modalBody").html(data);
		}
	});
}


function getProspects(){
	var name = $("#inputName").val();
	if(name == null) name = '';
	var htmlcode = '';
	if(name.length>0){
		$.ajax({
			type : 'get',
			url : '/consulting/data/prospects/'+name,
			dataType : 'json',
			success : function(data){
				if(data.length>0){
					for(var i = 0; i<data.length; i++){
						htmlcode+='<tr>';
						htmlcode+='<td>'+data[i].pros_nm+'</td>';
						htmlcode+='<td>'+data[i].cell_ph_no+"-"+data[i].cell_ph_tno+"-"+data[i].cell_ph_pno+'</td>';
						htmlcode+='<td>'+data[i].eml_id+'@'+data[i].eml_domain+'</td>'
						htmlcode+='<td>'+date_to_str(new Date(data[i].created))+'</td>';
						htmlcode+='<td><button type="button" class="btn btn-outline-primary" onclick="selectProspect('+data[i].pros_id+')">선택</button></td>';
						htmlcode+='</tr>';
					}
				}
				else {
					htmlcode = '<tr><th colspan="5">검색결과가 없습니다.</th></tr>';
				}
				$("#prospectlist").html(htmlcode);
			}
		});
	}
	else {
		htmlcode = '<tr><th colspan="5">검색어를 입력해 주세요.</th></tr>';
		$("#prospectlist").html(htmlcode);
	}
	
}

function selectProspect(id){
	$("#modalView").modal("hide");
	$.ajax({
		type : 'get',
		url : '/consulting/data/prospect/'+id,
		dataType : 'json',
		success : function(data){
			$("#pros_id").val(data.pros_id);
			$("#searchProsNm").val(data.pros_nm);
			$("#pros_nm").val(data.pros_nm);
			$("#cell_ph_no").val(data.cell_ph_no);
			$("#cell_ph_tno").val(data.cell_ph_tno);
			$("#cell_ph_pno").val(data.cell_ph_pno);
			$("#eml_id").val(data.eml_id);
			$("#eml_domain").val(data.eml_domain);
		}
	});
}

$(document).ready(function(){
	loadProspects();
	$("#select_fra_cd").change(function() {
		var fra = $("#select_fra_cd option:selected").val();
		if(fra != ''){
			getSelectorOption('/consulting/data/brands', fra, '#select_brand_cd', 'brand_cd', 'brand_cd', 'brand_nm');
		}
	});
	$('#searchProsNm').click(function(e) {
		searchProspects();
	 });
});
</script>
<div class="modal fade" id="modalView" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	<h5>가망고객관리</h5>
      </div>
      <div class="modal-body" id="modalBody">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>