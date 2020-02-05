<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <!-- 빵 조각 네비게이션 -->
    <!-- 
        링크 클릭 이벤트 
    url 생성 후 비교하여 없으면 배열에 추가, 이전 메뉴로 이동시 배열 삭제,
    for문으로 breadcrumb 생성
    	  
    -->
     <div class="minimenu">
		<ul class="breadcrumb pamini"> 
            <li class="breadcrumb-item"><a href="/">홈</a></li>
            <li class="breadcrumb-item"><a href="#">가맹점</a></li>
            <li class="breadcrumb-item"><a href="#">가맹점 정보</a></li>
        </ul>

        
     </div>
        
