package controllers;

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


        switch (action) {
            case "listaViajes":
                view = request.getRequestDispatcher("lista_viajes.jsp");
                view.forward(request,response);
                break;

            case "crearUsuario":
                view = request.getRequestDispatcher("crear_usuario.jsp");
                view.forward(request, response);
                break;

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {


    }
}
