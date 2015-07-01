package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import libraries.DB.DB;

public class Usuario extends Persona
{
    private int id;
    private String estado;
    private String[] preferencias;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String[] getPreferencias() {
        return preferencias;
    }

    public void setPreferencias(String[] preferencias) {
        this.preferencias = preferencias;
    }

    public String getEstado()
    {
        return estado;
    }

    public void setEstado(String estado)
    {
        this.estado = estado;
    }
    
    public void guardar() throws ClassNotFoundException, SQLException
    {
        DB db = new DB();
        /* Insertamos a la Persona */
        HashMap<String, Object> p = new HashMap<String, Object>();
        p.put("pers_nombres", this.nombres);
        p.put("pers_apellidos", this.apellidos);
        p.put("pers_usuario", this.usuario);
        p.put("pers_contrasena", this.contrasena);
        p.put("pers_email", this.email);
        db.insert("personas", p);
        this.id = db.getLastId();
        /* Fin de Insertamos a la Persona */
        this.guardarUsuario();
        this.guardarPreferencias();
    }
    
    private void guardarUsuario() throws SQLException, ClassNotFoundException
    {
        DB db = new DB();
        HashMap<String, Object> p1 = new HashMap<String, Object>();
        p1.put("usua_pers_id", this.id);
        db.insert("usuarios", p1);
    }
    
    private void guardarPreferencias() throws ClassNotFoundException, SQLException
    {
        DB db = new DB();
        for(String preferencia : this.preferencias)
        {
            int i_preferencia = Integer.parseInt(preferencia);
            System.out.println(preferencia);
            System.out.println(i_preferencia);
            HashMap<String, Object> p = new HashMap<String, Object>();
            p.put("pepr_pers_id", this.id);
            p.put("pepr_pref_id", i_preferencia);
            db.insert("personas_preferencias", p);
        }
    }
    
    public void setIdByPersona() throws ClassNotFoundException, SQLException
    {
        DB db = new DB();
        String sql = "SELECT usua_id AS id FROM usuarios where usua_pers_id = ? LIMIT 1";
        ArrayList<Object> p = new ArrayList<Object>();
        p.add(this.pers_id);
        ResultSet rs = db.squery(sql, p);
        while(rs.next())
        {
            this.setId(rs.getInt("id"));
        }
    }
}
