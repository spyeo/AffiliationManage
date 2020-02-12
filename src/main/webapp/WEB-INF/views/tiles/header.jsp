<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function breadCrumbMenu() {
		var path = window.location.pathname;
		$.ajax({
			type : 'get',
			url : '/breadCrumb',
			dataType : 'text',
			data : {
				url : path
			},
			success : function(data) {
				$("#bread").html(data);
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	$(document).ready(function() {
		breadCrumbMenu();
	});
</script>

<nav class="navbar navbar-expand navbar-dark bg-dark static-top fsize">
	<a class="navbar-brand mr-1" href="/franchise/list">COREPLUS</a>
	<div align="right" class="right-f">
		<button type="button" class="btn btn-primary">로그아웃</button>
	</div>
</nav>
<nav id="topMenu">
	<ul>
		<li><a class="menuLink" href="/franchise/list">가맹점</a></li>
		<li><a class="menuLink" href="/consulting/leads">상담/계약</a></li>
		<li><a class="menuLink" href="#">대시보드</a></li>
		<li><a class="menuLink" href="#">관리</a></li>
	</ul>
</nav>
<div id="bread"></div>

