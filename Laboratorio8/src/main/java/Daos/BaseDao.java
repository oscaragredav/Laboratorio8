package Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseDao{
    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex){
            ex.printStackTrace();
        }

        String user = "root";
        String pass = "123456";
        String url ="jdbc:mysql://127.0.0.1:3306/lab8?serverTimezone=America/Lima";

        return DriverManager.getConnection(url, user, pass);
    }
}
