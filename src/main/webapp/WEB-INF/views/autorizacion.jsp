<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<html>
<jsp:include page="./header.jsp" />
<body>
    <section id="main" class="bg-gray">
        <div class="container page page-cartilla">
            <div class="container col-md-6">
            <spring:url value="/autorizacion/send" var="enviarUrl" />
            <form:form class="form-cartilla custom-form" method="post" id="autorizacionForm" modelAttribute="autorizacionForm" action="${enviarUrl}"  enctype="multipart/form-data">
            	<div class="tab">
	                <h2><strong><spring:message code="title.autorizacion" /></strong></h2>	
	                <spring:message code='select.label.empty' var="emptyValue" />
                    <spring:message code='message.tooltip.prestador' var="tooltipPrestador"/>
                    <spring:message code='placeholder.prestador' var="placeholderPrestador"/>
                    <c:if test="${not empty beneficiarios}">
   					<div class="row">
                        <!-- AFILIADO -->
                        <div class="col-md-12">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                            	<form:input path="idAfiliado" type="hidden" id="idAfiliado" class="form-control" />
                            	<form:input path="nombreAfiliado" type="hidden" id="nombreAfiliado" class="form-control" />
                                <label class="control-label">
                                    <spring:message code="label.afiliado" />
                                </label>
                                <form:select path="idBeneficiario" class="form-control" id="idBeneficiario" required="true">
	                                <form:option value="" label=" ${emptyValue} " />
	                                <form:options items="${beneficiarios}" itemValue="id" itemLabel="nombreCompleto" />
	                            </form:select>
	                            <form:input path="nombreBeneficiario" type="hidden" id="nombreBeneficiario" class="form-control" />
	                            
	                            <form:errors path="idBeneficiario" class="control-label" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- ESPECIALIDAD -->
                        <div class="col-md-12">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="control-label">
                                    <spring:message code="label.especialidad" />
                                </label>
                                <form:select path="idEspecialidad" class="form-control" id="idEspecialidad" onchange="getPrestaciones()" required="true">
	                                <form:option value="" label=" ${emptyValue} " />
	                                <form:options items="${especialidades}" itemValue="idEspecialidad" itemLabel="etiqueta" />
	                            </form:select>
	                            <form:errors path="idEspecialidad" class="control-label" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <!-- PRESTACION -->
                    <div class="col-md-12">
                        <div class="form-group ${status.error ? 'has-error' : ''}" id="divIdPrestacion" style="display:none" >
                            <label class="control-label">
                                <spring:message code="label.prestacion" />
                            </label>
                            <form:select path="idPrestacion" class="form-control" id="idPrestacion" required="true">
                                <form:option value="" label=" ${emptyValue} " />
                                <form:options items="${prestaciones}" itemValue="id" itemLabel="etiqueta" />
                            </form:select>
                            <form:errors path="idPrestacion" class="control-label" />
                        </div>
                        <div id="loadingPrestacion">
                        	<div role="status" class="spinner-border spinner-border"><span class='sr-only'>Loading...</span></div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 align-middle">
                            <span class="float-right">
						         <button type="button" id="nextBtn" class="btn btn-primary btn-lg btn-block btn-form ml-2" onclick="nextPrev(1)"><spring:message code="button.next" /></button>
 							</span>
                           	 <span class="float-right">
							     <button type="button" class="btn btn-outline-primary btn-lg btn-block btn-form" onclick="location.href='/OSDEPYM/'"><spring:message code="button.cancel" /></button>
							 </span>
                        </div>
                    </div>
                    <div id="FieldsRequired" class="alert alert-danger my-4"><spring:message code="message.fields.required" /></div>
                    </c:if>
                    <c:if test="${empty beneficiarios}">
					    <div class="alert alert-danger my-4"><spring:message code="message.beneficiarios.list.isempty" /></div>
					</c:if>  
	            </div>
	            <div class="tab">
	                <h2><strong><spring:message code="title.autorizacion" /></strong></h2>
                    <div class="row">
                        <!-- AFILIADO -->
                        <div class="col-md-12">                            
                            <label class="control-label">
                       			<spring:message code="message.upload.file.required" />
                            </label>
                            <ul class="pl-3" id="documents"></ul>
                            <ul class="pl-3" id="documentsNotExists">
                            	<li><spring:message code="message.document.not.exist" /></li>
                            </ul>
                            <div id="loadingDocuments">
                            	<div role="status" class="spinner-border spinner-border"><span class='sr-only'>Loading...</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- CATEGORIAS -->
                        <div class="col-md-12">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="control-label">
                                    <spring:message code="label.prestador" />
                                </label>
                                <form:input path="prestador" type="text" class="form-control" data-toggle="tooltip" data-placement="right" title="${tooltipPrestador}" maxlength="40" placeholder="${placeholderPrestador}" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <!-- COMENTARIO -->
	                    <div class="col-md-12">
	                        <div id="file-container" class="form-group ${status.error ? 'has-error' : ''}">
								<input type="file" id="uploadFile" class="btn-file" name="uploadFiles" size="50" />
				      			<button class="btn btn-primary btn-lg" id="buttonUploadFile">
				      			  	<spring:message code="label.uploadfile" />
						  		</button>
								<div id="message-upload-file">
									<spring:message code="message.uploadfile" />
								</div>    
								<div id="upload_prev"></div>     
								<div id="total_size"></div>
	                        </div>
	                    </div>
                    </div>
                    <div class="row">
	                    <div class="col-md-12">
	                        <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="control-label">
                                    <spring:message code="label.comentarios.adicionales" />
                                </label>
                                <form:textarea path="comentario" rows="5"  maxlength="300" class="form-control" />
                            	<form:errors path="comentario" class="control-label" />
                            </div>
	                    </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 align-middle text-right">
                            <span class="pr-1">
						         <button type="button" class="btn btn-primary btn-lg mt-2 btn-form" id="acceptPrestador"><spring:message code="button.accept" /></button>
							</span>
                           	 <span class="pl-1">
							     <button type="button" class="btn btn-outline-primary btn-lg mt-2 btn-form" onclick="location.href='/OSDEPYM/'"><spring:message code="button.cancel" /></button>
							 </span>
                        </div>
                    </div>
                    <div id="errorFile" class="alert alert-danger my-4"><spring:message code="message.upload.file.error" /></div>
	            </div>
            </form:form>
			</div>
			<div class="modal fade show" id="myModal" role="dialog" >
				  <div class="modal-dialog" role="document">
				    <div class="modal-content rounded-0">
				      <div class="title-section-modal mb-0">
				        <h5 class="text"><spring:message code="title.aviso" /></h5>
				      </div>
				      <div class="modal-body px-4">
				        <p><spring:message code="message.popup.prestador.1" /></p>
						<p><spring:message code="message.popup.prestador.2" /></p>
				      </div>
				      <div class="px-4 pb-4">
					      	<span class="float-left w-50 pr-1">
					        	<button type="button" class="btn btn-primary btn-block" id="acceptModalPrestador"><spring:message code="button.accept" /></button>
 							</span>
                          	<span class="float-right w-50 pl-1">
					        	<button type="button" class="btn btn-outline-primary btn-block" data-dismiss="modal" id="cancelPrestador"><spring:message code="button.cancel" /></button>
						 	</span>
				      </div>
				    </div>
				  </div>
				</div>
        </div>
    </section>
</body>
<jsp:include page="./footer.jsp" />

</html>