package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Model.Chart;
import Model.Detection;
import ModelDAO.ChartDAO;
import ModelDAO.DetectionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Topher
 */
@WebServlet(urlPatterns = {"/srvReports"})
public class srvReports extends HttpServlet {

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

        DetectionDAO detect = new DetectionDAO();
        ArrayList<Detection> d = detect.Detection();
        ArrayList<Detection> singleDetection = new ArrayList<Detection>();
        ChartDAO chart = new ChartDAO();
        Chart ct = chart.Chart();
        if (request.getParameter("search") != null) {
            for (Detection dd : d) {
                if (dd.getDate().contains(request.getParameter("search"))) {
                    singleDetection.add(dd);
                    request.setAttribute("detectionList", singleDetection);
                }
            }
        }
        if (singleDetection.isEmpty()) {
            request.setAttribute("detectionList", d);
        }
        RequestDispatcher v = request.getRequestDispatcher("/view/reports/index.jsp");
        if (request.getParameter("action") != null) {
            request.setAttribute("chart", ct);
            if (request.getParameter("action").equals("year")) {
                v = request.getRequestDispatcher("/view/reports/year.jsp");
            }
            if (request.getParameter("action").equals("store")) {
                v = request.getRequestDispatcher("/view/reports/store.jsp");
            }
        }
        if (request.getParameter("id") != null) {
            for (Detection dd : d) {
                if (dd.getId().equals(request.getParameter("id"))) {                                        
                    request.setAttribute("detection", dd);
                }
            }
            v = request.getRequestDispatcher("/view/reports/detect.jsp");            
        }
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
