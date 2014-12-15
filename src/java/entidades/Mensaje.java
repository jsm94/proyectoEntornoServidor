/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.sql.*;
import java.util.*;

/**
 *
 * @author Juan Antonio Seco Merchán
 */
public class Mensaje {

    public List<Empleado> getEmpleados() {
        List<Empleado> empleados = new ArrayList();
        Connection conexion = null;
        try {
            conexion = utiles.BD.conectar();
            Statement consultaEmpleados = conexion.createStatement();
            ResultSet resultado = consultaEmpleados.executeQuery(
                    "select * from empleados order by apellidos, nombre");
            while (resultado.next()) {
                Empleado empleado = new Empleado();
                empleado.setId(resultado.getInt("id"));
                empleado.setNick(resultado.getString("nick"));
                empleado.setNombre(resultado.getString("nombre"));
                empleado.setApellidos(resultado.getString("apellidos"));
                empleado.setDepartamento(resultado.getString("departamento"));
                empleados.add(empleado);
            }
        } catch (SQLException e) {
            System.out.println("En Organizacion.getEmpleados(): "
                    + e.getMessage());
        } finally {
            utiles.BD.desconectar(conexion);
        }

        return empleados;
    }

    public String getNombre() {
        return "2º DAW S.A.";
    }
}
