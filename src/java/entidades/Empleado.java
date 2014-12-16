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
     * @param password
     */
    public void setGuardar(String password) {
            guardar(password);
    }

    /**
     * Inserta el empleado en la BD o actualiza sus datos si ya existe
     *
     * @param password
     */
    public void guardar(String password) {
        Connection con = null;
        try {
            con = utiles.BD.conectar();

            // El empleado no existe -> insert
            PreparedStatement insertar = con.prepareStatement(
                    "insert into empleados set nick=?, password=?, nombre=?, apellidos=?, departamento=?");
            insertar.setString(1, nick);
            insertar.setString(2, password);
            insertar.setString(3, nombre);
            insertar.setString(4, apellidos);
            insertar.setString(5, departamento);
            insertar.executeUpdate();
        } catch (SQLException e) {
            System.out.println("En Empleado.guardar(): " + e.getMessage());
        } finally {
            utiles.BD.desconectar(con);
        }
    }

    /**
     * Inserta el empleado en la BD o actualiza sus datos si ya existe
     *
     * @param password
     */
    public void actualizar(String password) {
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
                        "update empleados set nick=?, password=?, nombre=?, apellidos=?, departamento=? where id=?");
                actualizar.setString(1, nick);
                actualizar.setString(2, password);
                actualizar.setString(3, nombre);
                actualizar.setString(4, apellidos);
                actualizar.setString(5, departamento);
                actualizar.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("En Empleado.actualizar(): " + e.getMessage());
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
            PreparedStatement autenticacion = con.prepareStatement("SELECT * FROM empleados JOIN departamentos ON departamento = departamentos.id WHERE nick=?");
            autenticacion.setString(1, nick);
            ResultSet resultado = autenticacion.executeQuery();
            if (resultado.next()) {
                if (resultado.getString("password").equals(password)) {
                    id = resultado.getInt("id");
                    this.nick = nick;
                    nombre = resultado.getString("nombre");
                    apellidos = resultado.getString("apellidos");
                    departamento = resultado.getString("departamentos.nombre");
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
