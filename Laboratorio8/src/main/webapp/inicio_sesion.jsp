<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/static/head.jsp"/>
<body>

<jsp:include page="/includes/navbar.jsp">
    <jsp:param name="page" value=""/>
</jsp:include>


<div class="bgr-body">
    <!-- ***** Background Area Start ***** -->
    <section id="bgr-img">
        <div class="img-container">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="d-md-flex align-items-center form-box">
                            <div class="p-4 p-lg-4 ">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <img src="assets/images/logo.png" alt="logoPrincipal">

                                        <h2 class=section-heading>¡Bienvenido Televiajero!</h2>

                                        <form class="signin-form" method="POST" action="<%=request.getContextPath()%>/loginServlet" >

                                            <h6>Por favor ingresa lo siguiente:</h6>

                                            <div class="form-group mb-3">
                                                <label class="label" >Usuario</label>
                                                <input type="text" class="form-control" required aria-label="inputNickname" name="inputUser" placeholder="Usario" autofocus="">
                                            </div>

                                            <div class="form-group mb-3">
                                                <label class="label" >Contraseña</label>
                                                <input type="password" class="form-control" required aria-label="inputPassword" name="inputPassword" placeholder="Contraseña">
                                            </div>

                                            <% if (request.getParameter("errorUsuario") != null) {%>
                                            <div class="form-group text-danger mb-3">Usted está registrado pero no pertenece a la especialidad de Telecomunicaciones :(</div>
                                            <% }%>

                                            <% if (request.getParameter("error") != null) {%>
                                            <div class="form-group text-danger mb-3">Usuario o contraseña incorrectos</div>
                                            <% }%>



                                            <div class="form-group">
                                                <button type="submit" class="form-control btn btn-primary px-3">Inicia sesión</button>
                                            </div>

                                            <div class="form-group mt-2">
                                                <button type="submit" class="form-control btn btn-outline-warning px-3">Soy nuevo y quiero registrarme</button>
                                            </div>

                                            <!--* <div class="form-group d-md-flex mt-2">
                                                 <div class="w-50 text-left">
                                                     <label class="checkbox-wrap checkbox-primary mt-1">Recuérdame
                                                         <input type="checkbox" checked>
                                                         <span class="checkmark"></span>
                                                     </label>
                                                 </div>
                                                 <div class="w-50 text-md-right">
                                                     <a href="#">¿Olvidaste tu contraseña?</a>
                                                 </div>
                                            </div>-->

                                        </form>




                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ***** Background Area End ***** -->
    <jsp:include page="/static/footer.jsp"/>
</div>
</body>
</html>
