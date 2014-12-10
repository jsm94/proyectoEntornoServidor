/*
 * Organizacion
 * Contiene los datos de la organizacion
 */
package utiles;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Organizacion {

    public static List<Empleado> getEmpleados() {
        List<Empleado> empleados = new LinkedList();
        Connection conn = BD.conectar(); // Realizamos la conexión con la base de datos
        try {
            // Creamos la sentencia
            Statement stm = conn.createStatement();
            String sql = "SELECT empleados.id, empleados.nombre, apellidos, departamentos.nombre "
                    + "FROM empleados JOIN departamentos ON departamento = departamentos.id;";
            // Ejecutamos la consulta y recogemos el resultado
            ResultSet rs = stm.executeQuery(sql);
            // Vamos recorriendo los resultados
            while (rs.next()) {
                // Incluimos los datos recogidos para cada fila de empleado en un Empleado
                Empleado empleado = new Empleado();
                empleado.setId(rs.getInt(1));
                empleado.setNombre(rs.getString(2));
                empleado.setApellidos(rs.getString(3));
                empleado.setDepartamento(rs.getString(4));
                // Añadimos el empleado creado a la lista
                empleados.add(empleado);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Organizacion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Organizacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return empleados;
    }

    public static List<Mensaje> getMensajes() {
        List<Mensaje> mensajes = new LinkedList();
        Connection conn = BD.conectar(); // Realizamos la conexión con la base de datos
        try {
            // Creamos la sentencia
            Statement stm = conn.createStatement();
            String sql = "SELECT * FROM contacto";
            // Ejecutamos la consulta y recogemos el resultado
            ResultSet rs = stm.executeQuery(sql);
            // Vamos recorriendo los resultados
            while (rs.next()) {
                // Incluimos los datos recogidos para cada fila de mensaje en un Mensaje
                Mensaje mensaje = new Mensaje();
                mensaje.setNombre(rs.getString(1));
                mensaje.setPrimerApellido(rs.getString(2));
                mensaje.setSegundoApellido(rs.getString(3));
                mensaje.setOcupacion(rs.getString(4));
                mensaje.setEmail(rs.getString(5));
                mensaje.setEmpleado(rs.getInt(6));
                mensaje.setMensaje(rs.getString(7));
                mensaje.setFechaYHora(rs.getTimestamp(8));
                mensaje.setIp(rs.getString(9));
                // Añadimos el mensaje creado a la lista
                mensajes.add(mensaje);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Organizacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mensajes;

    }

    public static Empleado getEmpleado(Integer id) {
        Empleado empleado = new Empleado();
        Connection conn = BD.conectar(); // Realizamos la conexión con la base de datos
        // Creamos la sentencia
        Statement stm;
        try {
            stm = conn.createStatement();
            String sql = "SELECT * FROM empleados WHERE id=" + id + ";";
            // Ejecutamos la consulta y recogemos el resultado
            ResultSet rs = stm.executeQuery(sql);
            rs.next();
            empleado.setId(rs.getInt(1));
            empleado.setNombre(rs.getString(2));
            empleado.setApellidos(rs.getString(3));
            empleado.setDepartamento(rs.getString(4));
        } catch (SQLException ex) {
            Logger.getLogger(Organizacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return empleado;
    }

    public String getNombre() {
        return "2º DAW S.A.";
    }
}
