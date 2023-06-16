<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <ul class="header-logo-img">
                        <li><a href="#"><img src="<%=request.getContextPath()%>#" alt="logo" class = logo-imagen style="width: 75px"></a>
                        </li>
                        <li>
                            <span class="vertical-separator"></span>
                        </li>
                        <li>
                            <img src="<%=request.getContextPath()%>#" alt="logo" class="logo-imagen" style="width: 60px">

                        </li>
                    </ul>


                    <ul class="nav">
                        <li><a class="<%=request.getParameter("page").equals("usuarios")? "active": "" %>" href="<%=request.getContextPath()%>/#">Crear usuario</a></li>
                        <li><a class="<%=request.getParameter("page").equals("viajes")? "active": "" %>" href="<%=request.getContextPath()%>/#">Lista de viajes</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
