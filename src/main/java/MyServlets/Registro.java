/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Persona;
import model.Usuario;

/**
 *
 * @author Ronald
 */
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            String usuario = request.getParameter("usuario");
            
            if(Persona.isAvailable(usuario))
            {
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String contrasena = request.getParameter("contrasena");
                String email = request.getParameter("email");
                String[] preferencias = request.getParameterValues("preferencias");
                
                /* Subiendo la imagen */
                InputStream inputStream = null; // input stream of the upload file

                // obtains the upload file part in this multipart request
                Part filePart = request.getPart("imagen");
                
                if(filePart != null)
                {
                    out.println("Primer IF");
                    // prints out some information for debugging
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();
                }
                else
                {
                    System.out.println("No esta llegando la imagen");
                }

                /* Fin de Subiendo la imagen */

                Usuario u = new Usuario();
                u.setNombres(nombres);
                u.setApellidos(apellidos);
                u.setUsuario(usuario);
                u.setContrasena(contrasena);
                u.setEmail(email);
                u.setPreferencias(preferencias);
                if(inputStream != null) { u.setImagen(inputStream); out.println("IF"); }
                else { out.println("ELSE"); }

                u.guardar();

                response.sendRedirect("index.jsp?status=1");
            }
            else
            {
                response.sendRedirect("index.jsp?status=3");
            }
        }   
        catch(Exception e)
        {
            System.out.println(e.getMessage());
            out.println(e.getMessage());
        }
        finally
        {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
