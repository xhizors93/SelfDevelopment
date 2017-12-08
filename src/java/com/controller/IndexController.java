/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author User
 */
@Controller
public class IndexController {
    
    //guest
    @RequestMapping(value="/guest/index")
    public ModelAndView loadGuestIndexPage(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("guest/index.jsp");
        return mv;
    }
    
    //admin
    @RequestMapping(value="/admin/index")
    public ModelAndView loadAdminIndexPage(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView("admin/index.jsp");
        return mv;
    }
}
