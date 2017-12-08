
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.UserProfile;
import java.util.List;

/**
 *
 * @author Zakhirulnizam
 */
public interface UserProfileDao {
    
    public UserProfile getUserProfileByUserId(int userId);
    
    public UserProfile checkProfileByUserId(int userId);
    
    public UserProfile updateUserProfile(UserProfile up);
    
    public List<UserProfile> getUserList();
    
    public UserProfile addNewUser(UserProfile up);
}
