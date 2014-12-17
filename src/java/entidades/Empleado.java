/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.sql.*;
import java.util.ArrayList;

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
    private Integer admin;
    private boolean validado = false;
    private ArrayList<Mensaje> mensajes = null;

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

    public Integer getAdmin() {
        return admin;
    }

    public void setAdmin(Integer admin) {
        this.admin = admin;
    }

    public ArrayList<Mensaje> getMensajes() {
        return mensajes;
    }

    public void setMensajes(ArrayList<Mensaje> mensajes) {
        this.mensajes = mensajes;
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

    public void setMessages(boolean si) {
        if(si){
            setMensajes(mensajes());
        }
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
     * @param password
     */
    public void setGuardar(String password) {
            guardar(password);
    }
    
    public void setActualizar(String password) {
            actualizar(password);
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
                    "insert into empleados set nick=?, password=?, nombre=?, apellidos=?, departamento=?, admin=?");
            insertar.setString(1, nick);
            insertar.setString(2, password);
            insertar.setString(3, nombre);
            insertar.setString(4, apellidos);
            insertar.setString(5, departamento);
            insertar.setInt(6, admin);
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
                        "update empleados set nick=?, password=?, nombre=?, apellidos=?, departamento=?, admin=? where id=?");
                actualizar.setString(1, nick);
                actualizar.setString(2, password);
                actualizar.setString(3, nombre);
                actualizar.setString(4, apellidos);
                actualizar.setString(5, departamento);
                actualizar.setInt(6, admin);
                actualizar.setInt(7, id);
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
                    admin = resultado.getInt("admin");
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
    
    public ArrayList<Mensaje> mensajes() {
        this.mensajes = new ArrayList<Mensaje>();
        Connection conexion = null;
        try {
            conexion = utiles.BD.conectar();
            
            PreparedStatement sql = conexion.prepareStatement(
                    "select * from mensajes where empleado=? order by id desc");
            sql.setInt(1, id);
            ResultSet rs = sql.executeQuery();
            while(rs.next()) {
                Mensaje mensaje = new Mensaje(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellidos"),
                        rs.getString("ocupacion"),
                        rs.getString("email"),
                        rs.getInt("empleado"),
                        rs.getString("mensaje"),
                        rs.getString("ip"),
                        rs.getTimestamp("fechaYHora")
                );
                this.mensajes.add(mensaje);
                System.out.println("Añadido");
            }
        } catch (SQLException e) {
            System.out.println("En mensaje.guardar(): " + e.getMessage());
        } finally {
            utiles.BD.desconectar(conexion);            
        }
        
        return mensajes;
    }
}
