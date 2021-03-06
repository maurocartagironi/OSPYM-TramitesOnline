<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<jsp:include page="./WEB-INF/views/header.jsp" />
  
    <body>
    <section id="hero-carousel">
        <div id="carouselHome" class="carousel slide" data-interval="1000" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#carouselHome" data-slide-to="0" class="active"></li>
                <li data-target="#carouselHome" data-slide-to="1" class=""></li>
                <li data-target="#carouselHome" data-slide-to="2" class=""></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="#"><img class="d-block w-100" src="resources/core/img/slide-01.jpg?dummy=1557697417600" alt="Texto slide 1"></a>
                </div>
                <div class="carousel-item">
                    <a href="#"><img class="d-block w-100" src="resources/core/img/slide-02.jpg?dummy=1557697417600" alt="Texto slide 2"></a>
              	</div>
                <div class="carousel-item">
                    <a target="blank" href="#"><img class="d-block w-100" src="resources/core/img/slide-03.jpg?dummy=1557697417600" alt="Texto slide 3"></a>
                </div>
                <div class="carousel-item">
                   <img class="d-block w-100" src="resources/core/img/slide-04.png?dummy=1557697417600" alt="">
                </div>
			</div>
            <a class="carousel-control-prev carousel-control-shadow" href="#carouselHome" data-slide="prev">
			   <span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next carousel-control-shadow" href="#carouselHome" data-slide="next">
			   <span class="carousel-control-next-icon"></span>
			</a>
        </div>
        <div class="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-lg-3 text-center">
                        <span class="label text-red">EMERGENCIAS Y URGENCIAS</span> 
                        <span id="linkTelefono" class="phone-number"><a href="tel:08002888000">0800 288 8000</a></span>
                        <span id="linkTelefonoTexto" class="phone-number"><a>0800 288 8000</a></span>
						
						<span id="linkTelefono" class="phone-number"><a href="tel:08103338743">0810 333 8743</a></span> 
						<span id="linkTelefonoTexto" class="phone-number"><a>0810 333 8743</a></span>
					
                    </div>
                    <div class="col-md-4 col-lg-3 text-center">
                        <span class="label text-blue">ATENCI�N AL AFILIADO</span>
                        <span id="linkTelefono" class="phone-number"><a href="tel:08002887963">0800 288 7963</a></span>
                        <span id="linkTelefonoTexto" class="phone-number"><a>0800 288 7963</a></span>
                    </div>
                    <div class="col-md-4 col-lg-3 text-center">
                        <span class="label text-green">QUIERO ASOCIARME</span>
                        <span id="linkTelefono" class="phone-number"><a href="tel:08002888432">0800 288 8432</a></span>
                        <span id="linkTelefonoTexto" class="phone-number"><a>0800 288 8432</a></span>
<!--                         <span class="icon"><i class="fas fa-envelope"></i></span> -->
                        
                    </div>
                    <div class="col-lg-3 col-btn">
                        <a target="blank" href="https://www.osdepym.com.ar/micrositio-beneficiarios/login" role="button" class="btn btn-outline-primary btn-block btn-sm">TR�MITES ONLINE</a>
                        <a href="./app.htm?page=contacto" role="button" class="btn btn-outline-primary btn-block btn-sm">CONT�CTENOS</a>
                        <a href="./app.htm?page=servicios" role="button" class="btn btn-outline-primary btn-block btn-sm">CARTILLA</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="novedades" class="bg-gray">
    <h2 class="title-section" style="cursor:pointer;">
            <span class="bg-primary text">NOVEDADES</span>
            <span class="line-div"></span>
        </h2>
        <div class="news">
            <div class="container">
                <div class="row row-eq-height" id="rowNews">
                	<div class="col-md-4">  
						<div class="card">    
							<img class="card-img-top" src="resources/core/img/novedad25.jpg" alt="Card image cap">    
							<div class="card-body">        
								<span class="date">07/05/2019</span>        
								<h5 class="card-title">El Asma</h5>        
								<p class="card-text"></p>
								<p><span style="font-size: 14pt;">El asma es un <strong>trastorno respiratorio de car�cter cr�nico</strong>. Principalmente, act�a Inflamando y estrechando las v�as respiratorias.&nbsp;</span></p>
								<p></p>        
								<a href="javascript:NavigateTo('novedadHome.htm?idNovedad=25');" class="btn btn-outline-primary">+ info</a>    
							</div>  
						</div>
					</div>
					<div class="col-md-4">  
						<div class="card">    
							<img class="card-img-top" src="resources/core/img/novedad24.jpg" alt="Card image cap">    
							<div class="card-body">        
								<span class="date">06/05/2019</span>       
								<h5 class="card-title">Cada vez m�s cerca tuyo</h5>        
								<p class="card-text"></p>
								<p><span style="font-size: 14pt;">Seguimos creciendo. Nueva Sucursal en el <strong>Centro Despachantes de Aduana</strong>.</span></p>
								<p></p>        
								<a href="javascript:NavigateTo('novedadHome.htm?idNovedad=24');" class="btn btn-outline-primary">+ info</a>   
							</div> 
						</div>
					</div>
					<div class="col-md-4">  
						<div class="card">    
							<img class="card-img-top" src="resources/core/img/novedad23.jpg" alt="Card image cap">   
							<div class="card-body">        
								<span class="date">29/04/2019</span>        
								<h5 class="card-title">Llegamos a Formosa</h5>        
								<p class="card-text"></p>
								<p><span style="font-size: 14pt;">La C�mara de Peque�as y Medianas Empresas de Formosa (<strong>CAPYMEF</strong>) nos abre sus puertas.</span></p>
								<p></p>        
								<a href="javascript:NavigateTo('novedadHome.htm?idNovedad=23');" class="btn btn-outline-primary">+ info</a>   
							</div>
						</div>
					</div>	
                </div>	
                <br><br>
                <div class="text-center">
                    <a role="button" style="border-radius:0px;" href="./app.htm?page=novedadesHome" class="btn btn-lg btn-outline-primary btn-novedades">+ NOVEDADES</a>
                </div>
            </div>
           
        </div>
    </section>

	<jsp:include page="./WEB-INF/views/footer.jsp" />
  </body>
</html>