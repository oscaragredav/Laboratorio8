<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/static/head.jsp"/>
<body>
<div class="bgr-body">

    <!-- ***** Background Area Start ***** -->
    <section id="bgr-img">
        <div class="img-container">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">

                            <div class="login-wrap p-4 p-lg-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <img src="assets/images/logo.png" alt="logoPrincipal">

                                        <h2 class=section-heading>Inicia sesión</h2>

                                        <form class="signin-form" method="POST" action="<%=request.getContextPath()%>/loginServlet" >

                                            <div class="form-group mb-3">
                                                <label class="label" >Nickname de administrador</label>
                                                <input type="text" class="form-control" required aria-label="inputNickname" name="inputNickname" placeholder="Nickname" autofocus="">
                                            </div>

                                            <div class="form-group mb-3">
                                                <label class="label" >Contraseña</label>
                                                <input type="password" class="form-control" required aria-label="inputPassword" name="inputPassword" placeholder="Contraseña">
                                            </div>

                                            <% if (request.getParameter("error") != null) {%>
                                            <div class="form-group text-danger mb-3">Usuario o contraseña incorrectos</div>
                                            <% }%>

                                            <div class="form-group">
                                                <button type="submit" class="form-control btn btn-primary submit px-3">Inicia sesión</button>
                                            </div>

                                        </form>


                                        <div class="form-group d-md-flex">
                                            <div class="w-50 text-left">
                                                <label class="checkbox-wrap checkbox-primary mb-0">Recuérdame
                                                    <input type="checkbox" checked>
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="w-50 text-md-right">
                                                <a href="#">¿Olvidaste tu contraseña?</a>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <a href="<%=request.getContextPath()%>/mainservlet" class="form-control btn btn-scnd submit px-3">Página principal</a>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <h2 class="img-title"></h2>
            <p class="img-subtitle">
                Lista total de viajes:
            </p>
        </div>
    </section>
    <!-- ***** Background Area End ***** -->
    <jsp:include page="/static/footer.jsp"/>
</div>
</body>
</html>
