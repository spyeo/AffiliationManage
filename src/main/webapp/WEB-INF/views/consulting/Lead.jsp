<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

${lead.lead_id }<br>
<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd HH:mm" value="${lead.last_upd}" />
<c:out value="${dateTempParse }" /><br>
${lead.prospectVO.pros_nm }<br>
${lead.reg_chnl_cd }<br>
${lead.con_type_cd }<br>
${lead.spec_desc }<br>
