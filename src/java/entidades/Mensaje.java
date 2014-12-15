/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entidades;

import java.sql.*;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Mensaje {
    private String nombre;
    private String primerApellido;
    private String segundoApellido;
    private String ocupacion;
    private String email;
    private Empleado empleado;
    private String mensaje;
    private String ip;
    private Date fechaYHora;
    

    public void guardar() throws SQLException {
        Connection conexion = utiles.BD.conectar();
        /*
        String sql = "INSERT INTO contacto VALUES (\"" + nombre + "\","
                    + "\"" + primerApellido + "\",\"" + segundoApellido + "\",\"" + ocupacion + "\","
                    + "\"" + email + "\",\"" + empleado + "\",\"" + mensaje + "\""
                    + ",\"" + fechaYHora + "\",\"" + ip + "\")";
        */
        try {
            PreparedStatement stm;
            stm = conexion.prepareStatement("insert into contacto values (?,?,?,?,?,?,?,?,?)");
            stm.setString(1, nombre);
            stm.setString(2, primerApellido);
            stm.setString(3, segundoApellido);
            stm.setString(4, ocupacion);
            stm.setString(5, email);
            stm.setInt(6, empleado.getId());
            stm.setString(7, mensaje);
            stm.setTimestamp(8, new Timestamp(fechaYHora.getTime()));
            stm.setString(9, ip);
            stm.executeUpdate();
            utiles.BD.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(Mensaje.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="getter & setter">
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Integer id) {
        this.empleado = Organizacion.getEmpleado(id);
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getFechaYHora() {
        return fechaYHora;
    }

    public void setFechaYHora(Date fechaYHora) {
        this.fechaYHora = fechaYHora;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    // </editor-fold>

    public String getMensaje() {
        return mensaje;
    }

    
 
}
