package model;

import java.sql.SQLException;
import java.util.HashMap;
import libraries.DB.DB;

public class Usuario extends Persona
{
    private String estado;

    public String getEstado()
    {
        return estado;
    }

    public void setEstado(String estado)
    {
        this.estado = estado;
    }
    
    @Override
    public int guardar() throws SQLException, ClassNotFoundException
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
        /* Fin de Insertamos a la Persona */
        
        int pers_id = db.getLastId();
        HashMap<String, Object> p1 = new HashMap<String, Object>();
        p1.put("usua_pers_id", pers_id);
        return db.insert("usuarios", p1);
    }
}
