/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utiles;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class BD {

    private static Connection conn;

    public static Connection conectar() {
        try {
            //Cargamos el driver
            Class.forName("com.mysql.jdbc.Driver");
            //url base de datos
            String url = "jdbc:mysql://localhost/cd_jsp";
            //Creamos la conexión
            conn = DriverManager.getConnection(url, "jsp", "jsp");
            //Creamos la sentencia de insercción
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    
    public static void desconectar(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
