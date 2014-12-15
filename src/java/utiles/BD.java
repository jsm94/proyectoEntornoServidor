/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utiles;

import java.sql.*;

/**
 *
 * @author Juan Antonio Seco Merchán
 */
public class BD {

    /**
     * Establece una conexión con la base de datos de la aplicación
     * @return la conexión
     * @throws SQLException
     */
    public static Connection conectar() throws SQLException {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/empresa", "empresa", "empresa");
        return conn;
    }

    /**
     * Cierra la conexión con la base de datos
     * @param conn la conexión a cerrar
     */
    public static void desconectar(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            }
            catch (Exception e) {}
        }
    }
}
