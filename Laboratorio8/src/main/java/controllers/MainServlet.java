package controllers;

import Beans.Usuario;
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
                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSession");

                if(usuario != null && usuario.getIdUsuario() != 0){
                    view = request.getRequestDispatcher("lista_viajes.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath()+"/mainservlet");

                }


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

                if (!password.equals(confirmPassword)) {
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorConfirmacion"); // Validamos que la contraseña y su confimración sean iguales

                }else if (nombre.matches("^\\d.*$") || apellido.matches("^\\d.*$")) { // Validamos que nombre y apellidos no empiecen por números
                    //NOTA: El Laboratorio específicamente pide que no EMPIECEN, si queremos que no CONTENGAN debemos usar el regex: .*\\d.*
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorNombreApellido");

                }else if (edad < 18 || edad > 29) { // Validamos que sean mayores de edad y menores de 30
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorEdad");

                }else if (String.valueOf(codigo).length() != 8) { // Validamos que el código PUCP tenga 8 dígitos numéricos
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorCodigo");

                } else if (!correo.matches("^a" + String.valueOf(codigo) +"@pucp\\.edu\\.pe$")) { // Validamos que el correo PUCP empiece por "a" y tenga "@pucp.edu.pe"
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorCorreo");

                } else if (!password.matches("^(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=]).*$")) { // Validamos que la contraseña tenga una letra mayúscula, un número y un carácter especial
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorContrasena");

                } else { // Si todo funciona, se añade exitosamente el usuario :D
                    usuarioDao.anadirUsuario(nombre, apellido, edad, codigo, idEspecialidad, correo, password);
                    response.sendRedirect(request.getContextPath() + "/loginServlet");

            }

            break;
        }

    }
}
