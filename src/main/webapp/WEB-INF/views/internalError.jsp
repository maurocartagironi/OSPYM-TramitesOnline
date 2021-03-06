<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<jsp:include page="./header.jsp" />

<body>
    <section id="error" class="bg-gray">
        <div class="container text-center">
            <img src="/OSDEPYM/resources/core/img/error-green.png">
            <h2><spring:message code="error.unknow.error" /></h2>
        </div>
    </section>
</body>
<jsp:include page="./footer.jsp" />
</html>