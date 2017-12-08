/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.UserProfile;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zakhirulnizam
 */
public class UserProfileDaoImpl implements UserProfileDao {
    
    /* ------- Please copy this to every dao impl ------- */
    private static final long serialVersionUID = 1L;
   
    @PersistenceContext
    private EntityManager entityManager;
    
    @Transactional (readOnly = true)
    @Override
    public UserProfile getUserProfileByUserId(int userId)
    {
        Query query = entityManager.createQuery("SELECT u FROM UserProfile u WHERE u.upUserid=:userId").setParameter("userId",userId);
        return (UserProfile)query.getSingleResult();
    }
    
    
    
    @Transactional (readOnly = true)
    @Override
    public UserProfile checkProfileByUserId(int userId)
    {
        Query query = entityManager.createQuery("SELECT u FROM UserProfile u WHERE u.upUserid=:userId").setParameter("userId",userId);
        
        //if return just one result (use query.getSingleResult or query.getResultList.get(0) )
        
        //if return many result (use query.getResultList() )
        
        return (UserProfile)query.getSingleResult();
    }
    
    
    @Transactional (readOnly = false)
    @Override
    public UserProfile updateUserProfile(UserProfile up)
    {
        try 
        {
            up = entityManager.merge(up);
            return up;
        } 
        catch(Exception e) 
        {
            System.out.println(e);
            return null;
        }
    }
    
    @Transactional (readOnly = true)
    @Override
    public List<UserProfile> getUserList()
    {
        String combinedQuery;
        
        combinedQuery = " SELECT u FROM UserProfile u ";
        
        Query query = entityManager.createQuery(combinedQuery);
        if(query.getResultList().isEmpty()){
            return null;
        }else{
            return query.getResultList();
        }
    }
    
    
    @Transactional (readOnly = false)
    @Override
    public UserProfile addNewUser(UserProfile up)
    {
        try 
        {
            up = entityManager.merge(up);
            return up;
        } 
        catch(Exception e) 
        {
            System.out.println(e);
            return null;
        }
    }
    
}
