<%--
  Created by IntelliJ IDEA.
  User: oscar
  Date: 17/06/2023
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="Beans.Seguro" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean type="java.util.ArrayList<Beans.Seguro>" scope="request" id="lista"/>

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

                  <h2 class=section-heading>Crear nuevo Viaje:</h2>

                  <form class="signin-form" method="POST" action="<%=request.getContextPath()%>/mainservlet?action=crearViaje" >

                    <h6>Registre los siguientes datos:</h6>

                    <div class="form-group mb-2">
                      <label class="label">Ciudad de origen:</label>
                      <input type="text" class="form-control" aria-label="ciudadOrigen" name="ciudadOrigen" id ="ciudadOrigen" required>
                      <label class="label">Ciudad de destino:</label>
                      <input type="text" class="form-control" aria-label="ciudadDestino" name="ciudadDestino" id ="ciudadDestino" required>
                    </div>

                    <div class="form-group mb-2">
                      <label class="label">Fecha de Reserva (aaaa-mm-dd):</label>
                      <input type="text" class="form-control" aria-label="fechaReserva" name="fechaReserva" id ="fechaReserva" required>
                      <label class="label">Fecha de Viaje (aaaa-mm-dd):</label>
                      <input type="text" class="form-control" aria-label="fechaViaje" name="fechaViaje" id ="fechaViaje" required>
                    </div>

                    <div class="form-group mb-2">

                      <div class="row">
                        <div class="col">
                          <label class="label">Cantidad de boletos:</label>
                          <input type="number" class="form-control" id="cantidad" name="cantidad" aria-label="cantidad" min="0" max="30" required>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col">
                          <label class="label"> Precio del boleto (sea honesto):</label>
                          <input type="text" class="form-control" id="costoUnitario" name="costoUnitario" aria-label="costoUnitario"  required>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col">
                          <label class="label">Seguro de viaje:</label>
                          <select class="form-control mb-2" aria-label="listaSeguro" id="listaSeguro" name="listaSeguro" required>
                            <option disabled selected>Escoge un seguro:</option>
                            <% for (Seguro se : lista) { %>
                            <option value="<%= se.getIdSeguro()%>"><%= se.getNombreSeguro()%></option>
                            <% } %>
                          </select>
                        </div>
                      </div>


                      <div class="form-group">
                        <button type="submit" class="form-control btn btn-outline-warning px-3">Registrarse</button>
                      </div>

                        <% if (request.getParameter("errorFechaString") != null) {%>
                      <div class="form-group text-danger mb-3">¡Respetar el formato de las fechas!</div>
                        <% }%>

                        <% if (request.getParameter("errorfechaViaje") != null) {%>
                      <div class="form-group text-danger mb-3">La fecha de viaje debe ser superior a la fecha actual</div>
                        <% }%>

                        <% if (request.getParameter("errorCantidad") != null) {%>
                      <div class="form-group text-danger mb-3">Debe registrar al menos 1 boleto</div>
                        <% }%>

                        <% if (request.getParameter("errorCostoUnitario") != null) {%>
                      <div class="form-group text-danger mb-3">Error al registrar el precio (sea honesto por favoe :D)</div>
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
