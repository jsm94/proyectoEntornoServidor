/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package utiles;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Empleado {
    private Integer id;
    private String nombre;
    private String apellidos;
    private String departamento;
    
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
    // </editor-fold>
    
}
