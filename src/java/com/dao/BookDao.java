/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.Booking;
import java.util.List;

/**
 *
 * @author Zakhirulnizam
 */
public interface BookDao {
    
    public List<Booking> getBookList();
    
    public Booking checkBookId(long bookId);
    
    public Booking saveBooking(Booking book);
    
    public boolean deleteBooking(long bookId);
}
