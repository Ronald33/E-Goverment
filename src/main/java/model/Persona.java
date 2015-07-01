/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import libraries.DB.DB;

/**
 *
 * @author Ronald
 */
abstract public class Persona
{
    protected String nombres;
    protected String apellidos;
    protected String usuario;
    protected String contrasena;
    protected String email;

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public int guardar() throws SQLException, ClassNotFoundException
    {
        DB db = new DB();
        HashMap<String, Object> p = new HashMap<String, Object>();
        p.put("nombres", this.nombres);
        p.put("apellidos", this.apellidos);
        p.put("usuario", this.usuario);
        p.put("contrasena", this.contrasena);
        p.put("email", this.email);
        return db.insert("personas", p);
    }
    
    public static Boolean isAvailable(String usuario) throws SQLException, ClassNotFoundException
    {
        DB db = new DB();
        String sql = "SELECT 1 FROM personas WHERE pers_usuario = ? LIMIT 1";
        ArrayList<Object> p = new ArrayList<Object>();
        p.add(usuario);
        ResultSet rs = db.squery(sql, p);
        if(rs.next()) { return false; }
        else { return true; }
    }
    
    public Boolean existe() throws SQLException, ClassNotFoundException
    {
        DB db = new DB();
        String sql = "SELECT 1 FROM personas WHERE pers_contrasena = ? AND pers_usuario = ? LIMIT 1";
        ArrayList<Object> p = new ArrayList<Object>();
        p.add(this.contrasena);
        p.add(this.usuario);
        ResultSet rs = db.squery(sql, p);
        if(rs.next()) { return true; }
        else { return false; }
    }
}