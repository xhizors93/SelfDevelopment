/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.UserAccount;

/**
 *
 * @author User
 */
public interface UserAccountDao {
 
    public UserAccount getUserAccount(String username, String userpassword);
    
    public UserAccount checkUserAccount(int userId);
    
    public UserAccount saveUserAccount(UserAccount ua);
}
