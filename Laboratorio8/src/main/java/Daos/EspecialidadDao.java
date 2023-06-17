package Daos;

import Beans.Especialidad;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EspecialidadDao extends BaseDao {

    public ArrayList<Especialidad> obtenerListaEspecialidades() {
        ArrayList<Especialidad> listaEspecialidades = new ArrayList<>();

        String sql = "SELECT * FROM especialidad";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Especialidad especialidad = new Especialidad();
                especialidad.setIdEspecialidad(rs.getInt(1));
                especialidad.setNombreEspecialidad(rs.getString(2));

                listaEspecialidades.add(especialidad);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaEspecialidades;
    }
}
