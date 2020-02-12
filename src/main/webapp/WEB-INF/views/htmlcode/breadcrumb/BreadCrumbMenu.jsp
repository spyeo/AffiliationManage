<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

 <div class="minimenu">
		<ul class="breadcrumb">
		<c:set var="size" value="${fn:length(breadcrumb)-1}" />
		
		<c:forEach var="i" begin="0" end="${size}" step="1">
			<c:if test="${i ne size }">
				<li class="breadcrumb-item"><a href="${breadcrumb[i].url }">${breadcrumb[i].url_nm }</a></li>
			</c:if>
			<c:if test="${i eq size }">
				<li class="breadcrumb-item"><a href="">${breadcrumb[i].url_nm }</a></li>
			</c:if>
		</c:forEach>
        </ul>
</div>