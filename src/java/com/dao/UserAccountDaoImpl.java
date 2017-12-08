/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.UserAccount;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zakhirulnizam
 */
public class UserAccountDaoImpl implements UserAccountDao {
    
    /* ------- Please copy this to every dao impl ------- */
    private static final long serialVersionUID = 1L;
   
    @PersistenceContext
    private EntityManager entityManager;
    
    @Transactional (readOnly = true) // readOnly = true (just get data no edit), readOnly = false (use mostly to save and update modify data)
    @Override
    public UserAccount getUserAccount(String username, String userpassword)
    {
        Query query = entityManager.createQuery("SELECT ua FROM UserAccount ua WHERE ua.uaUsername=:username AND ua.uaUserpassword=:userpassword")
                                   .setParameter("username", username)
                                   .setParameter("userpassword", userpassword);
        
        if(query.getResultList().isEmpty()){
            return null;
        }else{
            return (UserAccount)query.getResultList().get(0);
        }
    }
    
    @Transactional (readOnly = true) // readOnly = true (just get data no edit), readOnly = false (use mostly to save and update modify data)
    @Override
    public UserAccount checkUserAccount(int userId)
    {
        Query query = entityManager.createQuery("SELECT a FROM UserAccount a WHERE a.upUserid.upUserid=:userId")
                                   .setParameter("userId",userId);
        if(query.getResultList().isEmpty()){
            return null;
        }else{
            return (UserAccount)query.getResultList().get(0);
        }
    }
    
    @Transactional (readOnly = false) // readOnly = true (just get data no edit), readOnly = false (use mostly to save and update modify data)
    @Override
    public UserAccount saveUserAccount(UserAccount ua)
    {
        try 
        {
            ua = entityManager.merge(ua);
            return ua;
        } 
        catch(Exception e) 
        {
            System.out.println(e);
            return null;
        }
    }
}
