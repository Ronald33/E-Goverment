package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import libraries.DB.DB;

/**
 *
 * @author Ronald
 */
public class Preferencias
{
    private String nombre;
    private String descripion;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripion() {
        return descripion;
    }

    public void setDescripion(String descripion) {
        this.descripion = descripion;
    }
    
    public static ResultSet getAll() throws ClassNotFoundException, SQLException
    {
        DB db = new DB();
        String sql = "SELECT pref_id AS id, pref_nombre AS nombre FROM preferencias WHERE 1 ORDER BY nombre DESC";
        return db.squery(sql);
    }
}