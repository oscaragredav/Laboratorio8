<%@ page import="Beans.Especialidad" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean type="java.util.ArrayList<Beans.Especialidad>" scope="request" id="listaEspecialidades"/>
<!DOCTYPE html>
<html>
<jsp:include page="/static/head.jsp"/>
<body>

<jsp:include page="/includes/navbar.jsp">
    <jsp:param name="page" value=""/>
</jsp:include>

<main>
    <section id="bgr-img" style="min-height: 100vh">
        <div class="img-container container" style="top: 50%">
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="d-md-flex align-items-center form-box">
                            <div class="p-4 p-lg-4 ">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <img src="assets/images/logo.png" alt="logoPrincipal">

                                        <h2 class=section-heading>Crear nuevo usuario:</h2>

                                        <form class="signin-form" method="POST" action="<%=request.getContextPath()%>/mainservlet?action=crearUsuario" >

                                            <h6>A continuación registre los siguientes datos:</h6>

                                            <div class="form-group mb-2">
                                                <label class="label">Nombre:</label>
                                                <input type="text" class="form-control" aria-label="nombreUsuario" name="nombreUsuario" id ="nombreUsuario" required>
                                                <label class="label">Apellido:</label>
                                                <input type="text" class="form-control" aria-label="apellidoUsuario" name="apellidoUsuario" id ="apellidoUsuario" required>
                                            </div>

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col">
                                                        <label class="label">Edad:</label>
                                                        <input type="number" class="form-control" id="edadUsuario" name="edadUsuario" aria-label="edadUsuario" min="0" max="30" required>
                                                    </div>
                                                    <div class="col mb-2">
                                                        <label class="label"> Código PUCP:</label>
                                                        <input type="text" class="form-control" id="codigoPUCP" name="codigoPUCP" aria-label="codigoPUCP"  required>
                                                    </div>
                                                </div>

                                            <div class="form-group mb-2">
                                                <label class="label" >Correo PUCP:</label>
                                                <input type="text" class="form-control" required aria-label="correo" name="correo" placeholder="Correo">
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <label class="label">Especialidades:</label>
                                                    <select class="form-control mb-2" aria-label="listaEspecialidades" id="listaEspecialidades" name="listaEspecialidades" required>
                                                        <option disabled selected>Escoge una especialidad:</option>
                                                        <% for (Especialidad especialidad : listaEspecialidades) { %>
                                                        <option value="<%= especialidad.getIdEspecialidad()%>"><%= especialidad.getNombreEspecialidad()%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>




                                            <div class="form-group">
                                                <button type="submit" class="form-control btn btn-outline-warning px-3">Añadir Boleto</button>
                                            </div>

                                            <% if (request.getParameter("errorConfirmacion") != null) {%>
                                            <div class="form-group text-danger mb-3">¡Las contraseñas no coinciden!</div>
                                            <% }%>

                                            <% if (request.getParameter("errorNombreApellido") != null) {%>
                                            <div class="form-group text-danger mb-3">¡Cuidado! Ingresa un nombre y apellido válidos :)</div>
                                            <% }%>

                                            <% if (request.getParameter("errorEdad") != null) {%>
                                            <div class="form-group text-danger mb-3">Lo sentimos, debes tener entre 18 y 30 para registrarte :(</div>
                                            <% }%>

                                            <% if (request.getParameter("errorCodigo") != null) {%>
                                            <div class="form-group text-danger mb-3">Revisa tu código, ¡debe tener exactamente 8 dígitos!</div>
                                            <% }%>

                                            <% if (request.getParameter("errorCorreo") != null) {%>
                                            <div class="form-group text-danger mb-3">Lo sentimos, debes ingresar un correo del formato PUCP (a*codigo*@pucp.edu.pe) :/</div>
                                            <% }%>

                                            <% if (request.getParameter("errorContrasena") != null) {%>
                                            <div class="form-group text-danger mb-3">¡Hey! Tu contraseña debe tener al menos una mayúscula, un número y un caracter especial :)</div>
                                            <% }%>







                                        </form>




                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
        </div>
    </section>
</main>
<jsp:include page="/static/footer.jsp"/>

</body>
</html>
