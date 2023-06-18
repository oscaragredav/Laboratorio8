package controllers;

import Beans.Seguro;
import Beans.Usuario;
import Beans.Viaje;
import Daos.EspecialidadDao;
import Daos.SeguroDao;
import Daos.UsuarioDao;
import Daos.ViajeDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "MainServlet", urlPatterns = {"/mainservlet"})
public class MainServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listaViajes" : request.getParameter("action");
        RequestDispatcher view;
        EspecialidadDao especialidadDao = new EspecialidadDao();
        ViajeDao viajeDao = new ViajeDao();

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioSession");

        switch (action) {
//            case "listaViajes":
//                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioSession");
//
//                if(usuario != null && usuario.getIdUsuario() != 0){
//                    request.setAttribute("listaViajes", viajeDao.listarViaje());
//                    view = request.getRequestDispatcher("lista_viajes.jsp");
//                    view.forward(request, response);
//                } else {
//                    response.sendRedirect(request.getContextPath()+"/loginServlet");
//
//                }
//
//
//                break;

            case "listaViajes":
                if(usuario != null && usuario.getIdUsuario() != 0){
//                    System.out.println("SERVLET" +usuario.getIdUsuario());
                    request.setAttribute("listaViajes", viajeDao.listarViaje(usuario.getIdUsuario()));
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("lista_viajes.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath()+"/loginServlet");
                    return;
                }
                break;

            case "crearUsuario":
                request.setAttribute("listaEspecialidades", especialidadDao.obtenerListaEspecialidades());
//                System.out.println("Lista de especialidades: " + especialidadDao.obtenerListaEspecialidades());
                view = request.getRequestDispatcher("crear_usuario.jsp");
                view.forward(request, response);
                break;

            case "crearViaje":
                SeguroDao seguroDao = new SeguroDao();
                request.setAttribute("lista", seguroDao.listaSeguro());
//                System.out.println("Lista de especialidades: " + especialidadDao.obtenerListaEspecialidades());
                view = request.getRequestDispatcher("crear_viaje.jsp");
                view.forward(request, response);
                break;

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
        String action = request.getParameter("action") == null ? "listaJuegosPosteados" : request.getParameter("action");
        UsuarioDao usuarioDao = new UsuarioDao();
        ViajeDao viajeDao = new ViajeDao();
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

                if (nombre.matches("^\\d.*$") || apellido.matches("^\\d.*$")) { // Validamos que nombre y apellidos no empiecen por números
                    //NOTA: El Laboratorio específicamente pide que no EMPIECEN, si queremos que no CONTENGAN debemos usar el regex: .*\\d.*
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorNombreApellido");

                }else if (edad < 18 || edad > 29) { // Validamos que sean mayores de edad y menores de 30
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorEdad");

                }else if (String.valueOf(codigo).length() != 8) { // Validamos que el código PUCP tenga 8 dígitos numéricos
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorCodigo");

                } else if (!correo.matches("^a" + codigo +"@pucp\\.edu\\.pe$")) { // Validamos que el correo PUCP empiece por "a" y tenga "@pucp.edu.pe"
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorCorreo");

                } else if (!password.matches("^(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=]).*$")) { // Validamos que la contraseña tenga una letra mayúscula, un número y un carácter especial
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorContrasena");

                }else if (!password.equals(confirmPassword)) {
                        response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorConfirmacion"); // Validamos que la contraseña y su confimración sean iguales

                } else { // Si todo funciona, se añade exitosamente el usuario :D
                    usuarioDao.anadirUsuario(nombre, apellido, edad, codigo, idEspecialidad, correo, password);
                    response.sendRedirect(request.getContextPath() + "/loginServlet");

                }

            break;

            case "crearViaje":
                String fechaReservaString = request.getParameter("fechaReserva");
                String fechaViajeString = request.getParameter("fechaViaje");
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date fechaReserva1 = null;
                java.util.Date fechaViaje1 = null;

                try {
                    fechaReserva1 = dateFormat.parse(fechaReservaString);
                    fechaViaje1 = dateFormat.parse(fechaViajeString);
                } catch (ParseException e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/mainservlet?action=crearUsuario&errorContrasena");

                }
                java.sql.Date fechaReserva = new java.sql.Date(fechaReserva1.getTime());
                java.sql.Date fechaViaje = new java.sql.Date(fechaViaje1.getTime());

                //pre validación
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                int costoUnitario = Integer.parseInt(request.getParameter("costoUnitario"));
                int idSeguro = Integer.parseInt(request.getParameter("listaSeguro"));

                viajeDao.anadirViaje(fechaReserva, fechaViaje, cantidad, costoUnitario, idSeguro);
                response.sendRedirect(request.getContextPath() + "/loginServlet");

                break;

        }

    }
}
