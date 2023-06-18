<%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<%@ page import="Beans.Viaje" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% ArrayList<Viaje> lista = (ArrayList<Viaje>) request.getAttribute("listaViajes");%>
<jsp:useBean id="usuarioSession" type="Beans.Usuario" scope="session" class="Beans.Usuario"/>

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

    <span class="horizontal-separator text-center">Añade más viajes o edita alguno si así lo deseas :)</span>
    <div style="background-color: black">
    <div class="pt-2">
        <div class="row justify-content-center g-0">
            <div class="col-5 ms-2">
                <form id="search" action="#" class="search-box">
                    <div class="search">
                        <input type="text" placeholder="¿Buscas algo?" id='searchText' aria-label="searchKeyword" name="searchKeyword" onkeypress="handle" class="search" />
                        <button type="submit" class="btn btn-primary">Buscar</button>
                    </div>
                </form>
            </div>
            <div class="col-6 d-flex gap-2 me-2 justify-content-end">
                <a id="addViaje" class="btn btn-warning" href="<%=request.getContextPath()%>/mainservlet?action=crearViaje">Agregar nuevo viaje</a>
                <a id="editViaje" class="btn btn-warning" href="#">Editar nuevo viaje</a>
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


            <% for (Viaje v : lista) { %>


            <tr>
                <td>
                    <%=v.getIdViaje()%>
                </td>
                <td>
                    <%=v.getFechaReserva()%>
                </td>
                <td>
                    <%=v.getFechaViaje()%>
                </td>
                <td>
                    <%=v.getCiudadOrigen()%>
                </td>
                <td>
                    <%=v.getCiudadDestino()%>
                </td>
                <td>
                    <%=v.getSeguro().getNombreSeguro()%>
                </td>
                <td>
                    <%=v.getCantidad()%>
                </td>
                <td>
                    <%=v.getCostoTotal()%>
                </td>

                <%
                    }
                %>

            </tr>
        </table>
    </div>
    </div>
</main>
    <jsp:include page="/static/footer.jsp"/>
</body>
</html>
