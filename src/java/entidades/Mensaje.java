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
public class Mensaje {

    private int id;
    private String nombre;
    private String apellidos;
    private String ocupacion;
    private String email;
    private int empleado;
    private String mensaje;
    private String ip;
    private java.util.Date fechaYHora;

    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    } 
    
    public String getApellidos() {
        return apellidos;
    }
    
    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }
    
    public String getOcupacion() {
        return ocupacion;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmpleado(int empleado) {
        this.empleado = empleado;
    }
    
    public int getEmpleado() {
        return empleado;
    }
    
    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
    public String getMensaje() {
        return mensaje;
    }
    
    public void setIp(String ip) {
        this.ip = ip;
    }
    
    public String getIp() {
        return ip;
    }
    
    public void setFechaYHora(java.util.Date fechaYHora) {
        this.fechaYHora = fechaYHora;
    }
    
    public java.util.Date getFechaYHora() {
        return fechaYHora;
    }
    
    public void guardar() throws SQLException {
        Connection conexion = null;
        try {
            conexion = utiles.BD.conectar();
            /*
            String insercion = "insert into mensajes values("
                    + id + ", '"
                    + nombre + "', '"
                    + apellidos + "', '"
                    + ocupacion + "', '"
                    + email + "', " +
                    + empleado + ", '"
                    + mensaje + "', '"
                    + ip + "','')";
            Statement sentenciaSQL = conexion.createStatement();
            sentenciaSQL.executeUpdate(insercion);
            */
            PreparedStatement sentenciaSQL = conexion.prepareStatement(
                    "insert into mensajes values (?,?,?,?,?,?,?,?,?)");
            sentenciaSQL.setInt(1, id);
            sentenciaSQL.setString(2, nombre);
            sentenciaSQL.setString(3, apellidos);
            sentenciaSQL.setString(4, ocupacion);
            sentenciaSQL.setString(5, email);
            sentenciaSQL.setInt(6, empleado);
            sentenciaSQL.setString(7, mensaje);
            sentenciaSQL.setString(8, ip);
            sentenciaSQL.setTimestamp(9, new Timestamp(fechaYHora.getTime()));
            sentenciaSQL.executeUpdate();
        } catch (SQLException e) {
            System.out.println("En mensaje.guardar(): " + e.getMessage());
            throw e;
        } finally {
            utiles.BD.desconectar(conexion);            
        }
    }
}
