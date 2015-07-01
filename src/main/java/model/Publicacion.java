package model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import libraries.DB.DB;

/**
 *
 * @author Ronald
 */
public class Publicacion
{
    private int publ_id;
    private String titulo;
    private String contenido;
    private Date fecha_publicacion;

    public int getPubl_id() {
        return publ_id;
    }

    public void setPubl_id(int publ_id) {
        this.publ_id = publ_id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Date getFecha_publicacion() {
        return fecha_publicacion;
    }

    public void setFecha_publicacion(Date fecha_publicacion) {
        this.fecha_publicacion = fecha_publicacion;
    }
    
    public void guardar(int usua_id) throws ClassNotFoundException, SQLException
    {
        DB db = new DB();
        HashMap<String, Object> p = new HashMap<String, Object>();
        p.put("publ_titulo", this.titulo);
        p.put("publ_contenido", this.contenido);
        p.put("publ_usua_id", usua_id);
        db.insert("publicaciones", p);
    }
    
    public static ResultSet getPublicacionesSeguidores(int usua_id) throws ClassNotFoundException, SQLException
    {
        DB db = new DB();
        usua_id = 2;
        String sql = "SELECT publ_id, publ_titulo AS titulo, publ_contenido AS contenido, publ_fecha_publicacion AS fecha, usua_id, pers_nombres AS nombres, usua_imagen AS imagen FROM publicaciones JOIN usuarios ON publ_usua_id = usua_id JOIN personas ON usua_pers_id = pers_id WHERE publ_usua_id in (SELECT segu_seguidos AS seguidos FROM seguimientos WHERE segu_usua_id = ? UNION SELECT ?)";
        System.out.println(sql);
        ArrayList<Object> p = new ArrayList<Object>();
        p.add(usua_id);
        p.add(usua_id);
        return db.squery(sql, p);
    }
}
