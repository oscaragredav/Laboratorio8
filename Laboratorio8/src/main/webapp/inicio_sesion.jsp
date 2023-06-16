<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 15/06/2023
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="/static/head.jsp"/>
<body>
<div class="bgr-body">
    <!-- ***** Header Area Start ***** -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="viajes"/>
    </jsp:include>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Background Area Start ***** -->
    <section id="bgr-img">
        <div class="img-container">
            <h2 class="img-title">Clasificatorias Sudamericanas Mundial 2026</h2>
            <p class="img-subtitle">
                Lista de jugadores disponibles:
            </p>
        </div>
    </section>
    <!-- ***** Background Area End ***** -->

</body>
</html>
