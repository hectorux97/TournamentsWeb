/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.NoticiasDAO;
import beans.Noticia;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JF
 */
@WebServlet(urlPatterns = {"/Controlador/PaginaNoticias"})
public class PaginaNoticias extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        String not = request.getParameter("no");
        
        switch (not) {
            case "mostrar":
                {
                    NoticiasDAO notiDAO = new NoticiasDAO();
                    ArrayList noti;
                    String tipo = request.getParameter("tipoNoticia");
                    int id = Integer.parseInt(request.getParameter("idNoticia"));
                    noti = notiDAO.getNoticiaYRecomendadas(tipo, id);
                    HttpSession session= request.getSession();
                    session.setAttribute("noticias", noti);
                    response.sendRedirect("/blog2.jsp");
                   /* RequestDispatcher rd=request.getRequestDispatcher("/blog2.jsp");
                    rd.forward(request,response);*/
                    break;
                }
                
            case "insertar":
                {
                    NoticiasDAO notiDAO = new NoticiasDAO();
                    Noticia noti = (Noticia)request.getAttribute("notic");
                    //boolean aux = 
                    notiDAO.subirNoticia(noti);
                    //if(aux==true){
                        ///Ver mejor con las cosas de clase
                    //}
                    //else {
                        //Poner lo del error
                    //}  
                    response.sendRedirect("/index.jsp"); // por poner algo
  
                }
                break;
                //Añadido  
            case "borrar":
                {
                    NoticiasDAO notDAO = new NoticiasDAO();
                    int id = Integer.parseInt(request.getParameter("idNoticia"));
                    notDAO.eliminarNoticia(id);
                    response.sendRedirect("/AdminMisNoticias.jsp");
                }
                break;
            case "destacar":
                {
                    NoticiasDAO notDAO = new NoticiasDAO();
                    int id = Integer.parseInt(request.getParameter("idNoticia"));
                    notDAO.destacarNoticia(id);
                    response.sendRedirect("/AdminMisNoticias.jsp");
                }
                break;
            case "tipo":
                {
                    NoticiasDAO notiDAO = new NoticiasDAO();
                    ArrayList noti;
                    String tipo = request.getParameter("tipoNoticia");
                    noti = notiDAO.getNotiasTipo(tipo);
                    HttpSession session = request.getSession();
                    session.setAttribute("noticias", noti);
                    
                    response.sendRedirect("/posttipo.jsp?tipoNoticia="+request.getParameter("tipoNoticia"));
                    /*RequestDispatcher rd=request.getRequestDispatcher("/posttipo.jsp");
                    rd.forward(request,response);*/
                }
                break;
            case "autor":
                {
                    NoticiasDAO notiDAO = new NoticiasDAO();
                    ArrayList noti;
                    int idAutor = Integer.parseInt(request.getParameter("autor"));
                    noti = notiDAO.getNoticiasAutor(idAutor);
                    HttpSession session = request.getSession();
                    session.setAttribute("noticias", noti);
                    response.sendRedirect("/postautor.jsp?autor="+request.getParameter("autor"));
                    
                    /*RequestDispatcher rd=request.getRequestDispatcher("/postautor.jsp");
                    rd.forward(request,response);*/

                }
                break;
                case "recuperarnoticia":
                {
                    NoticiasDAO notiDAO = new NoticiasDAO();
                    Noticia noti;
                    int id = Integer.parseInt(request.getParameter("idNoticia"));
                    noti = notiDAO.mostrarNoticia(id);
                    HttpSession session = request.getSession();
                    session.setAttribute("noticias", noti);
                    response.sendRedirect("/AdminModificarNoticia.jsp");
                    /*RequestDispatcher rd=request.getRequestDispatcher("/ModificarNoticia.jsp");
                    rd.forward(request,response);*/
                }
                break;
            case "inicionoticias":
                {
                   
                    response.sendRedirect("/inicionoticias.jsp");
                    /*RequestDispatcher rd=request.getRequestDispatcher("/inicionoticias.jsp");
                    rd.forward(request,response);*/
                    
                }
                break;
            default:
                response.sendRedirect("index.jsp?error=MISS_DIRECTIVE_ERROR");
                break;
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
