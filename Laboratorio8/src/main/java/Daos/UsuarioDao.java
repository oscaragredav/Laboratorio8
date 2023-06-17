package Daos;

import Beans.Especialidad;
import Beans.Estatus;
import Beans.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDao extends BaseDao {

    public Usuario obtenerUsuario(int idUsuario){

        Usuario usuario = null;

        String sql = "SELECT * FROM usuario LEFT JOIN especialidad ON usuario.idEspecialidad = especialidad.idEspecialidad LEFT JOIN estatus ON usuario.estatus_idestatus = estatus.idestatus WHERE idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setInt(1, idUsuario);
            ResultSet rs = pstmt.executeQuery();

            if(rs.next()){
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                //usuario.setNickname(rs.getString(4));
                usuario.setEdad(rs.getInt(4));
                usuario.setCodigo(rs.getInt(5));
                usuario.setEstatus_monto(rs.getFloat(7));
                usuario.setEmail(rs.getString(8));
                usuario.setPasswordHashed(rs.getString(10));

                Especialidad especialidad = new Especialidad();
                especialidad.setIdEspecialidad(rs.getInt("especialidad.idEspecialidad"));
                especialidad.setNombreEspecialidad(rs.getString("especialidad.nombreEspecialidad"));
                usuario.setEspecialidad(especialidad);

                Estatus estatus = new Estatus();
                estatus.setIdEstatus(rs.getInt("estatus.idestatus"));
                estatus.setNombreStatus(rs.getString("estatus.nombreStatus"));
                usuario.setEstatus(estatus);

            }

        }catch (SQLException ex) {
            ex.printStackTrace();
        }

        return usuario;
    }

    public void anadirUsuario(String nombre, String apellido, int edad, int codigo, int idEspecialidad, String correo, String password){
        String query = "INSERT INTO lab8.usuario (nombre, apellido, edad, codigo, idEspecialidad, estatus, email, passwordHashed, estatus_idestatus)\n" +
                "VALUES(?, ?, ?, ?, ?, 0, ?, ?, 1)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)){

            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setInt(3, edad);
            pstmt.setInt(4, codigo);
            pstmt.setInt(5, idEspecialidad);
            pstmt.setString(6, correo);
            pstmt.setString(7, password);
            pstmt.executeUpdate();

        } catch (SQLException throwables) {
            System.out.println("No se pudo realizar la actualización");
            throwables.printStackTrace();
        }
    }


    public Usuario validarNicknamePassword(String user, String password){
        Usuario usuario = null;

        String sql = "SELECT * FROM usuario WHERE email = ? AND passwordHashed = SHA2(?,256)";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user);
            pstmt.setString(2, password);



            try(ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    int idTrabajador = rs.getInt(1);
                    usuario = this.obtenerUsuario(idTrabajador);
                }
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la búsqueda");
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return usuario;
    }
}
