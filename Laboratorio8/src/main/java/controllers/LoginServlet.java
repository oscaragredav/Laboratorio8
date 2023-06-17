package controllers;

import Beans.Usuario;
import Daos.UsuarioDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "loginform" : request.getParameter("action");

        RequestDispatcher view;

        switch (action){
            case "loginform":
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSession");

                if(usuario != null && usuario.getIdUsuario() != 0){
                    response.sendRedirect(request.getContextPath()+"/mainservlet");
                }
                view = request.getRequestDispatcher("inicio_sesion.jsp");
                view.forward(request, response);
                break;

            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/loginServlet");
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        UsuarioDao usuarioDao = new UsuarioDao();

        String user = request.getParameter("inputUser");
        String password = request.getParameter("inputPassword");

        Usuario usuario = usuarioDao.validarNicknamePassword(user, password);

        if(usuario != null){
            if(usuario.getEspecialidad().getNombreEspecialidad().equals("Ingeniería de Telecomunicaciones") ){
                HttpSession session = request.getSession();
                session.setAttribute("usuarioSession",usuario);
                response.sendRedirect(request.getContextPath() + "/mainservlet");

            } else {
                response.sendRedirect(request.getContextPath() + "/loginServlet?errorUsuario");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/loginServlet?error");
        }

    }
}