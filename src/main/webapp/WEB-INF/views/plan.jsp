<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<jsp:include page="./header.jsp" />
<body>
    <c:if test="${!empty planSectionList}">
    	<section id="main" class="bg-gray">
            <div class="container page page-cartilla">
	            <c:forEach var="section" items="${planSectionList}">
                <h3>${section.title}</h3>
                <h2>${section.subtitle}</h2>
                <table class="table-plan plan-detail">
                    <c:forEach var="item" items="${section.itemsList}">
                        <tr>
                            <td class="title-item">${item.title}</td>
                            <td class="value-item">${item.value}</td>
                        </tr>
                        <c:forEach var="subitem" items="${item.subitemsList}">
                            <tr>
                                <td class="title-subitem">${subitem.title}</td>
                                <td class="value-subitem">${subitem.value}</td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </table>	                
	            </c:forEach>
	            <div class="col-md-3">                 
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='/OSDEPYM/'">
             			<spring:message code="button.backtomenu" />
            		</button>
                </div>
            </div>
        </section>
   	</c:if>
	<c:if test="${empty planSectionList}">
		<section id="error" class="bg-gray">
	        <div class="container text-center">        	
        		<img src="/OSDEPYM/resources/core/img/error-green.png">
           		<h2><spring:message code="message.empty.plan" /></h2>           		
           	</div>
	    </section>  
	</c:if>  
</body>
<jsp:include page="./footer.jsp" />
</html>