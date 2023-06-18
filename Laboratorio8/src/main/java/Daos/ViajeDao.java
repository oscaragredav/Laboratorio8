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
    public void anadirViaje(Date fechaReserva, Date fechaViaje, int cantidad, int costoUnitario, int idSeguro){
        String sql ="INSERT into viaje (fechaReserva,fechaViaje,cantidad, costoUnitario, idSeguro) values (?,?,?,?,?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setDate(1, fechaReserva);
            pstmt.setDate(2, fechaViaje);
            pstmt.setInt(3, cantidad);
            pstmt.setInt(4, costoUnitario);
            pstmt.setInt(5, idSeguro);
            pstmt.executeUpdate();

        } catch (SQLException throwables) {
            System.out.println("No se pudo realizar la actualización");
            throwables.printStackTrace();
        }

    }
}
