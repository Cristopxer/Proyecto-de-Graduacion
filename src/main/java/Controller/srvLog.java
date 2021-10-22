/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Chart;
import Model.User;
import ModelDAO.ChartDAO;
import ModelDAO.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Topher
 */
public class srvLog extends HttpServlet {

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
        String admonIndex = "/view/admon/index.jsp";
        String userIndex = "/view/user/index.jsp";
        String login = "/index.jsp";

        String view = "";
        String action = request.getParameter("action");
        view = login;
        if (action.equalsIgnoreCase("login")) {
            User usr = new User();
            LoginDAO dao = new LoginDAO();
            usr = dao.login(request.getParameter("txtUser"), request.getParameter("txtPass"));
            if (usr != null) {
                if (usr.getRoleName() != null) {
                    ChartDAO ch = new ChartDAO();
                    Chart c = ch.Chart();
                    HttpSession session;
                    session = request.getSession();
                    session.setAttribute("user", usr);
                    session.setAttribute("role", usr.getRoleName());
                    request.setAttribute("charts", c);
                    request.setAttribute("msj", "Bienvenido");
                    switch (usr.getRoleName()) {
                        case "ADMINISTRADOR":
                            view = admonIndex;
                            break;
                        case "NO_ADMON":
                            view = userIndex;
                            break;
                    }
                } else {
                    request.setAttribute("msg", "Credenciales Incorrectas");
                }
            }
        }
        if (action.equals("logout")) {
            HttpSession session = request.getSession();
            session.setAttribute("user", null);
            session.invalidate();
        }

        RequestDispatcher v = request.getRequestDispatcher(view);
        v.forward(request, response);

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
