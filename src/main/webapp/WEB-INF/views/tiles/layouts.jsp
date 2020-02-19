<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>

<html>

  <head>
		<tiles:insertAttribute name="css" />
		<tiles:insertAttribute name="js" />
  </head>

  <body id="page-top">

		<tiles:insertAttribute name="header" />

    <div id="wrapper">

		<tiles:insertAttribute name="content" />

    </div>

  </body>

</html>
