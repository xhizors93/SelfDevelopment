/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.dao.UserAccountDao;
import com.dao.UserProfileDao;
import com.model.UserAccount;
import com.model.UserProfile;
import com.utils.ApplicationContextUtils;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author Zakhirulnizam
 */
public class UserAccountService {
    
    private static final long serialVersionUID = 1L;
    
    
    //@Transactional(propagation = Propagation.REQUIRED) (only using this if the model has lazy fetch)
    public Map createUserAccount(HttpServletRequest request)
    {
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        UserAccountDao acdao = (UserAccountDao) appCtx.getBean("UserAccountDao");
        UserProfileDao updao = (UserProfileDao) appCtx.getBean("UserProfileDao");
        
        int userId = Integer.parseInt(request.getParameter("txtUserId"));
        
        String txtUsername = request.getParameter("txtUsername");
        String txtUserpassword = request.getParameter("txtUserpassword");
        
        Map message = new HashMap();
        
        UserAccount ua = acdao.checkUserAccount(userId);
        if(ua != null){
            ua.setUaUsername(txtUsername);
            ua.setUaUserpassword(txtUserpassword);
            
            ua = acdao.saveUserAccount(ua);
            
            if(ua != null)
            {
                message.put("result","User account successfuly updated");
            }
            else
            {
                message.put("result","User account has failed to update");
            }
        }else{
            ua = new UserAccount();
            
            ua.setUpUserid(updao.getUserProfileByUserId(userId));
            ua.setUaUsername(txtUsername);
            ua.setUaUserpassword(txtUserpassword);
            
            ua = acdao.saveUserAccount(ua);
            
            if(ua != null)
            {
                message.put("result","User account successfuly saved");
            }
            else
            {
                message.put("result","User account has failed to save");
            }
            
        }
        
        return message;
    }
}
