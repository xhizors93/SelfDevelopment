/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.UserAccountDao;
import com.dao.UserProfileDao;
import com.google.gson.Gson;
import com.model.UserAccount;
import com.utils.ApplicationContextUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author Zakhirulnizam
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/admin/LoginServlet"})
public class LoginServlet extends HttpServlet{
    
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserAccountDao acdao = (UserAccountDao)appCtx.getBean("UserAccountDao");
        UserProfileDao updao = (UserProfileDao)appCtx.getBean("UserProfileDao");
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            String username = request.getParameter("username").toString();
            String userpassword = request.getParameter("userpassword").toString();
            
            System.out.println("Username : "+username+", Password : "+userpassword);
            
            HttpSession session = request.getSession();
            Map result = new HashMap();
            
            UserAccount ac = acdao.getUserAccount(username, userpassword);
            
            if(ac != null){
                session.setAttribute("session_username", ac.getUaUsername());
                session.setAttribute("session_userid", ac.getUpUserid().getUpUserid());
                
                result.put("result", "success");
                result.put("session_username",session.getAttribute("session_username"));
            }else{
                result.put("result", "fail");
            }      
            
            Gson gson = new Gson();
            System.out.println("GSON login: "+gson.toJsonTree(result));
            out.println(gson.toJsonTree(result));

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
