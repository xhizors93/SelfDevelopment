/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.UserProfileDao;
import com.google.gson.Gson;
import com.model.UserProfile;
import com.service.BookService;
import com.service.UserAccountService;
import com.service.UserProfileService;
import com.utils.ApplicationContextUtils;
import java.text.ParseException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Zakhirulnizam
 */
@Controller
public class AdminController {
    
    //update profile
    @RequestMapping(value="/admin/updateProfile")
    public ModelAndView loadUpdateProfile(HttpServletRequest request, HttpServletResponse response) throws ParseException
    {
        ModelAndView mv = new ModelAndView("json/json_responder.jsp");
        UserProfileService ups = new UserProfileService();
        
        Map result = ups.updateProfile(request);
        response.setContentType("application/json");
        
        Gson gson = new Gson();
        mv.addObject("jsonResult",gson.toJson(result));
        
        System.out.println("Gson return :"+gson.toJson(result));
        
        return mv;
    }
    
    //userList
    @RequestMapping(value="/admin/userList")
    public ModelAndView loadUserList(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("json/json_responder.jsp");
        UserProfileService ups = new UserProfileService();
        
        Map result = ups.getUserList(request);
        response.setContentType("application/json");
        
        mv.addObject("jsonResult", result.get("ListResult").toString());
        
        System.out.println("RESULT : "+result.get("ListResult").toString());
        
        return mv;
    }
    
    //userList
    @RequestMapping(value="/admin/viewUserProfile")
    public ModelAndView loadViewUserProfile(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/about-us/dialog/dia-viewUserProfile.jsp");
        
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserProfileDao updao = (UserProfileDao) appCtx.getBean("UserProfileDao");
        
        int userId = Integer.parseInt(request.getParameter("userid"));
        
        //DateFormat dt = new SimpleDateFormat("dd-MMM-yyyy");
        
        UserProfile up = updao.getUserProfileByUserId(userId);
        if(up != null){
            mv.addObject("userid",up.getUpUserid());
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
    
    //submit add new user
    @RequestMapping(value="/admin/addNewUser")
    public ModelAndView loadAddNewUser(HttpServletRequest request, HttpServletResponse response) throws ParseException
    {
        ModelAndView mv = new ModelAndView("json/json_responder.jsp");
        UserProfileService ups = new UserProfileService();
        
        Map result = ups.addNewUser(request);
        response.setContentType("application/json");
        
        Gson gson = new Gson();
        mv.addObject("jsonResult",gson.toJson(result));
        
        System.out.println("Gson return :"+gson.toJson(result));
        
        return mv;
    }
    
    //userList
    @RequestMapping(value="/admin/loadScheduler")
    public ModelAndView loadScheduler(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("json/json_responder.jsp");
        BookService bs = new BookService();
        
        Map result = bs.getBookScheduler(request);
        response.setContentType("application/json");
        
        mv.addObject("jsonResult", result.get("ListResult").toString());
        
        System.out.println("RESULT : "+result.get("ListResult").toString());
        
        return mv;
    }
    
    //save booking
    @RequestMapping(value="/admin/saveBooking")
    public ModelAndView loadSaveBooking(HttpServletRequest request, HttpServletResponse response) throws ParseException
    {
        ModelAndView mv = new ModelAndView("json/json_responder.jsp");
        BookService bs = new BookService();
        
        Map result = bs.saveBooking(request);
        response.setContentType("application/json");
        
        Gson gson = new Gson();
        mv.addObject("jsonResult",gson.toJson(result));
        
        System.out.println("Gson return :"+gson.toJson(result));
        
        return mv;
    }
    
    //delete booking
    @RequestMapping(value="/admin/deleteBooking")
    public ModelAndView loadDeleteBooking(HttpServletRequest request, HttpServletResponse response) throws ParseException
    {
        ModelAndView mv = new ModelAndView("json/json_responder.jsp");
        BookService bs = new BookService();
        
        Map result = bs.deleteBooking(request);
        response.setContentType("application/json");
        
        Gson gson = new Gson();
        mv.addObject("jsonResult",gson.toJson(result));
        
        System.out.println("Gson return :"+gson.toJson(result));
        
        return mv;
    }
    
    //submit create/update user account
    @RequestMapping(value="/admin/createUserAccount")
    public ModelAndView loadCreateUserAccount(HttpServletRequest request, HttpServletResponse response) throws ParseException
    {
        ModelAndView mv = new ModelAndView("json/json_responder.jsp");
        UserAccountService uas = new UserAccountService();
        
        Map result = uas.createUserAccount(request);
        response.setContentType("application/json");
        
        Gson gson = new Gson();
        mv.addObject("jsonResult",gson.toJson(result));
        
        System.out.println("Gson return :"+gson.toJson(result));
        
        return mv;
    }
}
