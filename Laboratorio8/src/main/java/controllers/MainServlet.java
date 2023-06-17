package controllers;

import Daos.EspecialidadDao;
import Daos.UsuarioDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "MainServlet", urlPatterns = {"/mainservlet"})
public class MainServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listaViajes" : request.getParameter("action");
        RequestDispatcher view;
        EspecialidadDao especialidadDao = new EspecialidadDao();


        switch (action) {
            case "listaViajes":
                view = request.getRequestDispatcher("lista_viajes.jsp");
                view.forward(request,response);
                break;

            case "crearUsuario":
                request.setAttribute("listaEspecialidades", especialidadDao.obtenerListaEspecialidades());
                view = request.getRequestDispatcher("crear_usuario.jsp");
                view.forward(request, response);
                break;

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String action = request.getParameter("action") == null ? "listaJuegosPosteados" : request.getParameter("action");
        UsuarioDao usuarioDao = new UsuarioDao();
        switch (action){
            case "crearUsuario":
            String nombre = request.getParameter("nombreUsuario");
            String apellido = request.getParameter("apellidoUsuario");
            int edad = Integer.parseInt(request.getParameter("edadUsuario"));
            int codigo = Integer.parseInt(request.getParameter("codigoPUCP"));
            String correo = request.getParameter("correo");
            int idEspecialidad = Integer.parseInt(request.getParameter("listaEspecialidades"));
            String password = request.getParameter("inputPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if(!password.equals(confirmPassword)){
                response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario?errorConfirmacion");
            } else {
                usuarioDao.anadirUsuario(nombre, apellido, edad, codigo, idEspecialidad, correo, password);
            }

            response.sendRedirect(request.getContextPath() + "/mainservlet");
            break;
        }

    }
}
