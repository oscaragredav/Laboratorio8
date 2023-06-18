package Daos;

import Beans.Seguro;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SeguroDao extends BaseDao {
    public ArrayList<Seguro> listaSeguro(){
        ArrayList<Seguro> lista = new ArrayList<>();
        String sql ="select * from seguro";
        try(Connection conn = this.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
            while (rs.next()){
                Seguro seguro = new Seguro();
                seguro.setIdSeguro(rs.getInt(1));
                seguro.setNombreSeguro(rs.getString(2));
                lista.add(seguro);
            }
        } catch (SQLException ex){
            ex.printStackTrace();
        }
        return lista;
    }

}
