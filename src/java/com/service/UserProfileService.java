/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.dao.UserProfileDao;
import com.google.gson.Gson;
import com.model.UserProfile;
import com.utils.ApplicationContextUtils;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author Zakhirulnizam
 */
public class UserProfileService {
    
    private static final long serialVersionUID = 1L;
    
    
    //@Transactional(propagation = Propagation.REQUIRED) (only using this if the model has lazy fetch)
    public Map updateProfile(HttpServletRequest request) throws ParseException
    {
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserProfileDao updao = (UserProfileDao) appCtx.getBean("UserProfileDao");
        
        DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
        Map message = new HashMap();
        
        int userId = Integer.parseInt(request.getParameter("txtUserId"));
        
        String txtFirstName = StringUtils.isBlank(request.getParameter("txtFirstName")) ? null : request.getParameter("txtFirstName");
        String txtLastName = StringUtils.isBlank(request.getParameter("txtLastName")) ? null : request.getParameter("txtLastName");
        Date txtDOB = StringUtils.isBlank(request.getParameter("txtDOB")) ? null : date.parse(request.getParameter("txtDOB"));
        int txtAge = StringUtils.isBlank(request.getParameter("txtAge")) ? null : Integer.parseInt(request.getParameter("txtAge"));
        String txtRace = StringUtils.isBlank(request.getParameter("txtRace")) ? null : request.getParameter("txtRace");
        String txtReligion = StringUtils.isBlank(request.getParameter("txtReligion")) ? null : request.getParameter("txtReligion");
        String txtAddress = StringUtils.isBlank(request.getParameter("txtAddress")) ? null : request.getParameter("txtAddress");
        int txtPostCode = StringUtils.isBlank(request.getParameter("txtPostCode")) ? null : Integer.parseInt(request.getParameter("txtPostCode"));
        String txtCity = StringUtils.isBlank(request.getParameter("txtCity")) ? null : request.getParameter("txtCity");
        String txtState = StringUtils.isBlank(request.getParameter("txtState")) ? null : request.getParameter("txtState");
        String txtCountry = StringUtils.isBlank(request.getParameter("txtCountry")) ? null : request.getParameter("txtCountry");
        String txtDescription = StringUtils.isBlank(request.getParameter("txtDescription")) ? null : request.getParameter("txtDescription");
        
        //check if exist
        UserProfile up = updao.checkProfileByUserId(userId);
        
        if(up != null){
            up.setUpFirstname(txtFirstName);
            up.setUpLastname(txtLastName);
            up.setUpDob(txtDOB);
            up.setUpAge(txtAge);
            up.setUpRace(txtRace);
            up.setUpReligion(txtReligion);
            up.setUpAddress(txtAddress);
            up.setUpPostcode(txtPostCode);
            up.setUpCity(txtCity);
            up.setUpState(txtState);
            up.setUpCountry(txtCountry);
            up.setUpDescription(txtDescription);
            
            
            //start saving
            up = updao.updateUserProfile(up);
            
            if(up != null){
                message.put("result","Profile successfully save");
            }else{
                message.put("result","Profile has failed to save");
            }
        }else{
            message.put("result","No such user is found");
        }
        
        return message;
        
    }
    
    //@Transactional(propagation = Propagation.REQUIRED) (only using this if the model has lazy fetch)
    public Map getUserList(HttpServletRequest request)
    {
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserProfileDao updao = (UserProfileDao) appCtx.getBean("UserProfileDao");
        
        String firstname = StringUtils.isBlank(request.getParameter("firstname")) ? null : request.getParameter("firstname");
        String lastname = StringUtils.isBlank(request.getParameter("lastname")) ? null : request.getParameter("lastname");
        
        
        List<UserProfile> lup = updao.getUserList();
        
        List result = new LinkedList();
        
        if(lup != null){
            for(int a=0;a<lup.size();a++)
            {
                Map item = new HashMap();

                item.put("number", a+1);
                item.put("userid", lup.get(a).getUpUserid());
                item.put("firstname", lup.get(a).getUpFirstname());
                item.put("lastname", lup.get(a).getUpLastname());
                item.put("address", lup.get(a).getUpAddress());

                //declare new hashmap() and put item hashMap() item into user hashMap();
                Map user = new HashMap();
                user.put("user",item);

                //add user HashMap() into result LinkedList();
                result.add(user);
            }
        }
        
        Map records = new HashMap();
        records.put("data", result);
        
        
        Map map = new HashMap();
        Gson gson_record = new Gson();
        map.put("ListResult", gson_record.toJson(records));
        
        return map;
    }
    
     //@Transactional(propagation = Propagation.REQUIRED) (only using this if the model has lazy fetch)
    public Map addNewUser(HttpServletRequest request) throws ParseException
    {
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserProfileDao updao = (UserProfileDao) appCtx.getBean("UserProfileDao");
        
        DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
        Map message = new HashMap();
        
        String txtFirstName = StringUtils.isBlank(request.getParameter("txtFirstName")) ? null : request.getParameter("txtFirstName");
        String txtLastName = StringUtils.isBlank(request.getParameter("txtLastName")) ? null : request.getParameter("txtLastName");
        Date txtDOB = StringUtils.isBlank(request.getParameter("txtDOB")) ? null : date.parse(request.getParameter("txtDOB"));
        int txtAge = StringUtils.isBlank(request.getParameter("txtAge")) ? null : Integer.parseInt(request.getParameter("txtAge"));
        String txtRace = StringUtils.isBlank(request.getParameter("txtRace")) ? null : request.getParameter("txtRace");
        String txtReligion = StringUtils.isBlank(request.getParameter("txtReligion")) ? null : request.getParameter("txtReligion");
        String txtAddress = StringUtils.isBlank(request.getParameter("txtAddress")) ? null : request.getParameter("txtAddress");
        int txtPostCode = StringUtils.isBlank(request.getParameter("txtPostCode")) ? null : Integer.parseInt(request.getParameter("txtPostCode"));
        String txtCity = StringUtils.isBlank(request.getParameter("txtCity")) ? null : request.getParameter("txtCity");
        String txtState = StringUtils.isBlank(request.getParameter("txtState")) ? null : request.getParameter("txtState");
        String txtCountry = StringUtils.isBlank(request.getParameter("txtCountry")) ? null : request.getParameter("txtCountry");
        String txtDescription = StringUtils.isBlank(request.getParameter("txtDescription")) ? null : request.getParameter("txtDescription");
    
        UserProfile up = new UserProfile();
        
        up.setUpFirstname(txtFirstName);
        up.setUpLastname(txtLastName);
        up.setUpDob(txtDOB);
        up.setUpAge(txtAge);
        up.setUpRace(txtRace);
        up.setUpReligion(txtReligion);
        up.setUpAddress(txtAddress);
        up.setUpPostcode(txtPostCode);
        up.setUpCity(txtCity);
        up.setUpState(txtState);
        up.setUpCountry(txtCountry);
        up.setUpDescription(txtDescription);
        
        up = updao.addNewUser(up);
        if(up != null)
        {
            message.put("result","New user profile successfully added");
        }
        else
        {
            message.put("result","New user profile has failed to add");
        }
        
        return message;
    }
}
