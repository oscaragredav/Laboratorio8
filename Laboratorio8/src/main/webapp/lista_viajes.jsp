<%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/static/head.jsp"/>
<body>
    <!-- ***** Header Area Start ***** -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="viajes"/>
    </jsp:include>
    <!-- ***** Header Area End ***** -->
<main>
    <!-- ***** Background Area Start ***** -->
    <section id="bgr-img">
        <div class="img-container">
            <h2 class="img-title">Todos tus viajes realizados</h2>
            <p class="img-subtitle">
                Lista total de viajes:
            </p>
        </div>
    </section>
    <!-- ***** Background Area End ***** -->


    <div class="pt-4">
        <div class="row">
            <div class="col-lg-12 d-flex justify-content-end" >
                <a id="ocultar" class="btn btn-warning" href="#">Agregar nuevo viaje</a>
            </div>
        </div>
    </div>

    <div class="tabla">
        <table class="table table-dark table-transparent table-hover">
            <thead>
            <tr>
                <td>Identificador
                </td>
                <td>Fecha de reserva
                </td>
                <td>Fecha del viaje
                </td>
                <td>Ciudad origen
                </td>
                <td>Ciudad destino
                </td>
                <td>Empresa de seguro
                </td>
                <td>Numero de boletos
                </td>
                <td>Costo total
                </td>
            </tr>
            </thead>

            <%
                //for ( : ) {
            %>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>

                <%
                    //}
                %>

            </tr>
        </table>
    </div>
</main>
    <jsp:include page="/static/footer.jsp"/>
</body>
</html>
