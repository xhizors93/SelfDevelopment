/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.UserAccountDao;
import com.dao.UserProfileDao;
import com.model.UserAccount;
import com.model.UserProfile;
import com.utils.ApplicationContextUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Zakhirulnizam
 */
@Controller
public class AdminPathController {
    
    //home
    @RequestMapping(value="/admin/home")
    public ModelAndView loadAdminHome(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/home.jsp");
        
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("session_username");
        int userId = (Integer) session.getAttribute("session_userid");
        
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserProfileDao updao = (UserProfileDao) appCtx.getBean("UserProfileDao");
        
        UserProfile up = updao.getUserProfileByUserId(userId);
        
        String username = up.getUpFirstname();
        
        mv.addObject("username",username);
        return mv;
    }
    
    //login fail
    @RequestMapping(value="/admin/loginFail")
    public ModelAndView loadLoginFail(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/loginFail.jsp");
        return mv;
    }
    
    //login success
    @RequestMapping(value="/admin/loginSuccess")
    public ModelAndView loadLoginSuccess(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/loginSuccess.jsp");
        
        String username = request.getParameter("session_username");
        
        mv.addObject("session_username",username);
        return mv;
    }
    
    //profile
    @RequestMapping(value="/admin/profile")
    public ModelAndView loadProfile(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/about-us/us-profile.jsp");
        
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserProfileDao updao = (UserProfileDao) appCtx.getBean("UserProfileDao");
        
        HttpSession session = request.getSession();
        int userId = (Integer) session.getAttribute("session_userid");
        
        mv.addObject("userId",userId);
        
        UserProfile up = updao.getUserProfileByUserId(userId);
        if(up != null){
            mv.addObject("txtFirstName",up.getUpFirstname());
            mv.addObject("txtLastName",up.getUpLastname());
            mv.addObject("txtDOB",up.getUpDob());
            mv.addObject("txtAge",up.getUpAge());
            mv.addObject("txtRace",up.getUpRace());
            mv.addObject("txtReligion",up.getUpReligion());
            mv.addObject("txtAddress",up.getUpAddress());
            mv.addObject("txtPostCode",up.getUpPostcode());
            mv.addObject("txtCity",up.getUpCity());
            mv.addObject("txtState",up.getUpState());
            mv.addObject("txtCountry",up.getUpCountry());
            mv.addObject("txtDescription",up.getUpDescription());
        }
        
        return mv;
    }
    
    //header
    @RequestMapping(value="/admin/header")
    public ModelAndView loadHeader(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/portfolio-template/pt-header.jsp");
        
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("session_username");
        
        mv.addObject("session_username",user);
        return mv;
    }
    
    //footer
    @RequestMapping(value="/admin/footer")
    public ModelAndView loadFooter(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/portfolio-template/pt-footer.jsp");
        return mv;
    }
    
    //addUser
    @RequestMapping(value="/admin/addUser")
    public ModelAndView loadAddUser(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/about-us/us-adduser.jsp");
        return mv;
    }
    
    //addNewUserDialog
    @RequestMapping(value="/admin/addNewUserDialog")
    public ModelAndView loadAddNewUserDialog(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/about-us/dialog/dia-addnewdialog.jsp");
        return mv;
    }
    
    //createUserAccount
    @RequestMapping(value="/admin/createUserAccountDialog")
    public ModelAndView loadCreateUserAccountDialog(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/about-us/dialog/dia-createUserAccount.jsp");
        
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserAccountDao acdao = (UserAccountDao) appCtx.getBean("UserAccountDao");
        
        int userId = Integer.parseInt(request.getParameter("userid"));
        
        UserAccount ac = acdao.checkUserAccount(userId);
        if(ac != null){
            mv.addObject("txtusername",ac.getUaUsername());
            mv.addObject("txtuserpassword",ac.getUaUserpassword());
        }else{
            mv.addObject("txtusername",null);
            mv.addObject("txtuserpassword",null);
        }
        
        
        mv.addObject("userId",userId);
        return mv;
    }
    
    //dhtmlx
    @RequestMapping(value="/admin/dhtmlx")
    public ModelAndView loadDHTMLX(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/portfolio-template/DHTMLX/dhtmlx.jsp");
        return mv;
    }
    
    //pie3ddonut
    @RequestMapping(value="/admin/pie3ddonut")
    public ModelAndView loadPie3DDonut(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/portfolio-template/ANYCHART/anychart-3ddonut.jsp");
        return mv;
    }
}
