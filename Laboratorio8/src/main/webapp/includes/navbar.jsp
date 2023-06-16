<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioSession" type="Beans.Usuario" scope="session" class="Beans.Usuario"/>

<% if (usuarioSession.getIdUsuario() != 0) {%>
    <% if(usuarioSession.getEstatus().getNombreStatus().equals("Normal")) {%>
        <header class="header-area" style="background-color: darkblue">
    <%} else if(usuarioSession.getEstatus().getNombreStatus().equals("Silver")) {%>
        <header class="header-area" style="background-color: grey">
    <%} else if(usuarioSession.getEstatus().getNombreStatus().equals("Gold")) {%>
        <header class="header-area" style="background-color: gold">
    <%}  else if(usuarioSession.getEstatus().getNombreStatus().equals("Platinum")) {%>
        <header class="header-area" style="background-color: black">
    <%}%>
<%} else {%>
    <header class="header-area">
     <%}%>


    <div class="container">
        <div class="row">
            <div class="col-12">

                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <ul class="header-logo-img">
                        <li><a href="#"><img src="<%=request.getContextPath()%>/assets/images/PUCPlogo.png" alt="logo" class = logo-imagen style="width: 120px"></a>
                        </li>
                        <li>
                            <span class="vertical-separator"></span>
                        </li>
                        <li>
                            <img src="<%=request.getContextPath()%>/assets/images/Logo-TELECOM.png" alt="logo" class="logo-imagen" style="width: 235px">

                        </li>
                    </ul>

                    <% if(usuarioSession.getIdUsuario() == 0) {%>

                    <%} else {%>
                    <ul class="welcome-message text-center">
                        <li>
                            <h5>¡Bienvenid@ <%= usuarioSession.getNombre() + " " + usuarioSession.getApellido() %> !</h5>
                            <h6>Actualmente tu status es: <%= usuarioSession.getEstatus().getNombreStatus() %></h6>
                        </li>
                    </ul>


                    <ul class="nav">

                        <li><a class="<%=request.getParameter("page").equals("viajes")? "active": "" %>" href="<%=request.getContextPath()%>/mainservlet">Lista de viajes</a></li>
                        <li><a href="<%=request.getContextPath()%>/loginServlet?action=logout">Cerrar Sesión</a></li>
                    </ul>
                    <%} %>
                </nav>
            </div>
        </div>
    </div>
</header>
