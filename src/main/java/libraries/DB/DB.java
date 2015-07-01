package libraries.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DB
{
    private static String HOST = "localhost";
    private static String DB = "participa";
    private static String USER = "root";
    private static String PASS = "";
    
    private Connection db;
    private PreparedStatement stmt;
    
    private String sql;
    private ArrayList<Object> parameters;
    
    public DB() throws ClassNotFoundException, SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");
        this.db = (Connection) DriverManager.getConnection("jdbc:mysql://" + HOST + "/" + DB, USER, PASS);
    }
    
    /* Query para Select's */
    public ResultSet squery(String sql) throws SQLException
    {
        this.sql = sql;
        this.prepare();
        return this.stmt.executeQuery();
    }
    
    public ResultSet squery(String sql, ArrayList<Object> parameters) throws SQLException
    {
        this.sql = sql;
        this.parameters = parameters;
        this.prepare();
        this.bindValues();
        return this.stmt.executeQuery();
    }
    
    /* Query para los demas */
    public int query(String sql) throws SQLException
    {
        this.sql = sql;
        this.prepare();
        return this.stmt.executeUpdate();
    }
    
    public int query(String sql, ArrayList<Object> parameters) throws SQLException
    {
        this.sql = sql;
        this.parameters = parameters;
        this.prepare();
        this.bindValues();
        return this.stmt.executeUpdate();
    }
    
    private static ArrayList<String> getKeys(HashMap<String, Object> parameters)
    {
        ArrayList<String> keys = new ArrayList<String>();
        for (String key : parameters.keySet()) { keys.add(key); }
        return keys;
    }
    
    private static ArrayList<Object> getValues(HashMap<String, Object> parameters)
    {
        ArrayList<Object> values = new ArrayList<Object>();
        for (Object value : parameters.values()) { values.add(value); }
        return values;
    }
    
    private static String implode(ArrayList<String> keys)
    {
        String s_keys = "";
        String separator = ", ";
        for(String key : keys) { s_keys += key + separator; }
        return s_keys.substring(0, s_keys.length() - separator.length());
    }
    
    private static String getQuestions(int n)
    {
        String questions = "";
        String separator = ", ";
        for(int i=0; i<n; i++) { questions += "?" + separator; }
        return questions.substring(0, questions.length() - separator.length());
    }
    
    public int insert(String table, HashMap<String, Object> parameters) throws SQLException
    {
        ArrayList<String> keys = getKeys(parameters);
        ArrayList<Object> values = getValues(parameters);
        
        String s_keys = implode(keys);
        String questions = getQuestions(keys.size());
        
        String sql = "INSERT INTO " + table + 
                    " (" + s_keys + ")" + 
                    " VALUES " + 
                    " (" + questions + ")";
        
        return query(sql, values);
    }
    
    public int getLastId() throws SQLException
    {
        int key = 0;
        ResultSet rs = this.stmt.getGeneratedKeys();
        if(rs.next()) { key = rs.getInt(1); }
        return key; 
    }
    
    private PreparedStatement prepare() throws SQLException
    {
        this.stmt = this.db.prepareStatement(this.sql, Statement.RETURN_GENERATED_KEYS);
        return this.stmt;
    }
    
    private void bindValues() throws SQLException
    {
        int index;
        for(int i=0; i<this.parameters.size(); i++)
        {
            index = i+1;
            Object value = this.parameters.get(i);
            System.out.println("Con " + index + " entrara: " + value);
            if(value.getClass().equals(Integer.class)) { this.stmt.setInt(index, (Integer) value); }
            else if(value.getClass().equals(Double.class)) { this.stmt.setDouble(index, (Double) value); }
            else if(value.getClass().equals(Float.class)) { this.stmt.setFloat(index, (Float) value); }
            else if(value.getClass().equals(Long.class)) { this.stmt.setLong(index, (Long) value); }
            else if(value.getClass().equals(Boolean.class)) { this.stmt.setBoolean(index, (Boolean) value); }
            else { this.stmt.setString(index, (String) value); }
        }
    }
}