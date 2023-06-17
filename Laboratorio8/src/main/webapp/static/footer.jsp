<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioSession" type="Beans.Usuario" scope="session" class="Beans.Usuario"/>

<% if (usuarioSession.getIdUsuario() != 0) {%>
<% if(usuarioSession.getEstatus().getNombreStatus().equals("Normal")) {%>
<footer style="background-color: darkblue">
    <%} else if(usuarioSession.getEstatus().getNombreStatus().equals("Silver")) {%>
  <footer style="background-color: grey">
      <%} else if(usuarioSession.getEstatus().getNombreStatus().equals("Gold")) {%>
    <footer style="background-color: gold">
        <%}  else if(usuarioSession.getEstatus().getNombreStatus().equals("Platinum")) {%>
      <footer style="background-color: black">
          <%}%>
          <%} else {%>
        <footer>
            <%}%>
  <div class="container">
    <div class="col-lg-12">
      <p>Copyright © 2023 Laboratorio 8: 20193733, 20193315. Todos los derechos reservados. Diseñado para el curso de
        Ingeniería web PUCP.</p>
    </div>
  </div>
</footer>
