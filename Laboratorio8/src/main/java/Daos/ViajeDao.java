package Daos;

import Beans.Seguro;
import Beans.Usuario;
import Beans.Viaje;

import java.sql.*;
import java.util.ArrayList;

public class ViajeDao extends BaseDao{

    //lista todos los viajes en la bd
//    public ArrayList<Viaje> listarViaje(){
//
//        ArrayList<Viaje> lista = new ArrayList<>();
//
//        String sql="SELECT v.*, s.nombreSeguro\n" +
//                "FROM viaje v\n" +
//                "INNER JOIN seguro s ON v.idseguro = s.idseguro;";
//
//
//        try (Connection conn = this.getConnection();
//             Statement stmt = conn.createStatement();
//             ResultSet rs = stmt.executeQuery(sql)){
//
//            while (rs.next()){
//
//                Viaje viaje = new Viaje();
//                viaje.setIdViaje(rs.getInt(1));
//                viaje.setFechaReserva(rs.getDate(2));
//                viaje.setFechaViaje(rs.getDate(3));
//                viaje.setCiudadOrigen(rs.getString(4));
//                viaje.setCiudadDestino(rs.getString(5));
//                viaje.setCantidad(rs.getInt(6));
//                viaje.setCostoUnitario(rs.getInt(7));
//                viaje.setCostoTotal( (viaje.getCantidad())*(viaje.getCostoUnitario()) );
//                Seguro seguro = new Seguro();
//                seguro.setNombreSeguro(rs.getString("nombreSeguro"));
//                viaje.setSeguro(seguro);
//                Usuario usuario = new Usuario();
//                usuario.setIdUsuario(rs.getInt("usuario_idUsuario"));
//                viaje.setUsuario(usuario);
//
//                lista.add(viaje);
//
//
//
//            }
//
//        } catch (SQLException ex){
//            ex.printStackTrace();
//        }
//
//        return lista;
//    }
    public ArrayList<Viaje> listarViaje(int idUsuario){

        ArrayList<Viaje> lista = new ArrayList<>();

        String sql="SELECT v.*, s.nombreSeguro, u.nombre, u.apellido\n" +
                "FROM viaje v\n" +
                "INNER JOIN seguro s ON v.idseguro = s.idseguro\n" +
                "INNER JOIN usuario u ON v.usuario_idUsuario = u.idUsuario\n" +
                "WHERE u.idUsuario = ?;";


        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){

                Viaje viaje = new Viaje();
//                System.out.println("DAO"+rs.getInt(1));
                viaje.setIdViaje(rs.getInt(1));
                viaje.setFechaReserva(rs.getDate(2));
                viaje.setFechaViaje(rs.getDate(3));
                viaje.setCiudadOrigen(rs.getString(4));
                viaje.setCiudadDestino(rs.getString(5));
                viaje.setCantidad(rs.getInt(6));
                viaje.setCostoUnitario(rs.getInt(7));
                viaje.setCostoTotal( (viaje.getCantidad())*(viaje.getCostoUnitario()) );
                Seguro seguro = new Seguro();
                seguro.setNombreSeguro(rs.getString("nombreSeguro"));
                viaje.setSeguro(seguro);
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("usuario_idUsuario"));
                viaje.setUsuario(usuario);

                lista.add(viaje);
            }
        } catch (SQLException ex){
            ex.printStackTrace();
        }
//        System.out.println(lista.size());
        return lista;
    }
    public void anadirViaje(String ciudadOrigen, String ciudadDestino,Date fechaReserva, Date fechaViaje, int cantidad, int costoUnitario, int idSeguro, int usuario_idUsuario){
        String sql ="INSERT into viaje (ciudadOrigen, ciudadDestino, fechaReserva,fechaViaje,cantidad, costoUnitario, idSeguro,usuario_idUsuario) values (?,?,?,?,?,?,?,?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, ciudadOrigen);
            pstmt.setString(2, ciudadDestino);
            pstmt.setDate(3, fechaReserva);
            pstmt.setDate(4, fechaViaje);
            pstmt.setInt(5, cantidad);
            pstmt.setInt(6, costoUnitario);
            pstmt.setInt(7, idSeguro);
            pstmt.setInt(8,usuario_idUsuario);
            pstmt.executeUpdate();

        } catch (SQLException throwables) {
            System.out.println("No se pudo realizar la actualización");
            throwables.printStackTrace();
        }


    }
    public void borrarViaje(int idViaje){
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM viaje WHERE idViaje = ?")) {
            pstmt.setInt(1, idViaje);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
