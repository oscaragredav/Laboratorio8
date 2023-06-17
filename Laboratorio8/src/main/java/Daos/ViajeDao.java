package Daos;

import Beans.Seguro;
import Beans.Usuario;
import Beans.Viaje;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ViajeDao extends BaseDao{

    //lista todos los viajes en la bd
    public ArrayList<Viaje> listarViaje(){

        ArrayList<Viaje> lista = new ArrayList<>();

        String sql="SELECT v.*, s.nombreSeguro\n" +
                "FROM viaje v\n" +
                "INNER JOIN seguro s ON v.idseguro = s.idseguro;";


        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){

                Viaje viaje = new Viaje();
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

        return lista;
    }
}
