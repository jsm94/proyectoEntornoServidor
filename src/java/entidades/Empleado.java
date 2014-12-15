/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.sql.*;

/**
 *
 * @author Juan Antonio Seco Merchán
 */

public class Empleado {

    private Integer id;
    private String nombre;
    private String apellidos;
    private String departamento;
    private String nick;
    private boolean validado = false;

    // <editor-fold defaultstate="collapsed" desc="getter & setter">
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getNick() {
        return nick;
    }
    // </editor-fold>

    /**
     * Establece la propiedad autenticacion (sólo escritura) Cuando se
     * establece, realiza la autenticación del usuario
     *
     * @param password la password con la que se intenta autenticar el usuario
     */
    public void setAutenticacion(String password) {
        validado = autenticar(nick, password);
    }

    /**
     * Consulta la propiedad validado (sólo lectura)
     *
     * @return true si el usuario está validado, false en caso contrario
     */
    public boolean isValidado() {
        return validado;
    }

    /**
     * Establece la propiedad guardar
     *
     * @param guardar si es true, se guardan los datos en la Base de Datos
     */
    public void setGuardar(boolean guardar) {
        if (guardar) {
            guardar();
        }
    }

    /**
     * Inserta el empleado en la BD o actualiza sus datos si ya existe
     */
    public void guardar() {
        Connection con = null;
        try {
            con = utiles.BD.conectar();
            // Comprobamos si el emplead existe
            PreparedStatement comprobar = con.prepareStatement("select * from empleados where id =?");
            comprobar.setInt(1, id);
            ResultSet resultado = comprobar.executeQuery();
            if (resultado.next()) {
                // El empleado ya existe -> update
                PreparedStatement actualizar = con.prepareStatement(
                        "update empleados set nick=?, nombre=?, apellidos=?, departamento=? where id=?");
                actualizar.setString(1, nick);
                actualizar.setString(2, nombre);
                actualizar.setString(3, apellidos);
                actualizar.setString(4, departamento);
                actualizar.setInt(5, id);
                actualizar.executeUpdate();
            } else {
                // El empleado no existe -> insert
                PreparedStatement insertar = con.prepareStatement(
                        "insert into empleados set nick=?, nombre=?, apellidos=?, departamento=?, id=?");
                insertar.setString(1, nick);
                insertar.setString(2, nombre);
                insertar.setString(3, apellidos);
                insertar.setString(4, departamento);
                insertar.setInt(5, id);
                insertar.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("En Empleado.guardar(): " + e.getMessage());
        } finally {
            utiles.BD.desconectar(con);
        }
    }

    /**
     * Realiza la autenticación del usuario en base a la password del empleado
     * Para ello, primero se debe inicializar el campo nick del usuario Si la
     * autenticación tiene éxito, se cargan todos los campos desde la base de
     * datos y a partir de ese momento, el empleado será operativo
     *
     * @param nick el nick del empleado
     * @param password la password introducida
     * @return true si el usuario se ha autenticado correctamente, false en caso
     * contrario
     */
    public boolean autenticar(String nick, String password) {
        boolean autenticado = false;
        Connection con = null;
        try {
            con = utiles.BD.conectar();
            PreparedStatement autenticacion = con.prepareStatement("select * from empleados where nick=?");
            autenticacion.setString(1, nick);
            ResultSet resultado = autenticacion.executeQuery();
            if (resultado.next()) {
                if (resultado.getString("password").equals(password)) {
                    id = resultado.getInt("id");
                    this.nick = nick;
                    nombre = resultado.getString("nombre");
                    apellidos = resultado.getString("apellidos");
                    departamento = resultado.getString("departamento");
                    autenticado = true;
                }
            }
        } catch (SQLException e) {
            System.out.println("En Empleado.autenticar(): " + e.getMessage());
        } finally {
            utiles.BD.desconectar(con);
        }

        return autenticado;
    }
}
