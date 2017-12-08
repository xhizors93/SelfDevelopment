/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.Booking;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zakhirulnizam
 */
public class BookDaoImpl implements BookDao{
    
    /* ------- Please copy this to every dao impl ------- */
    private static final long serialVersionUID = 1L;
   
    @PersistenceContext
    private EntityManager entityManager;
    
    @Transactional (readOnly = true)
    @Override
    public List<Booking> getBookList()
    {
        Query query = entityManager.createQuery("SELECT b FROM Booking b");
        if(query.getResultList().isEmpty()){
            return null;
        }else{
            return query.getResultList();
        }
    }
    
    @Transactional (readOnly = true)
    @Override
    public Booking checkBookId(long bookId)
    {
        Query query = entityManager.createQuery("SELECT b FROM Booking b WHERE b.bookId=:bookId").setParameter("bookId",bookId);
        if(query.getResultList().isEmpty()){
            return null;
        }else{
            return (Booking)query.getResultList().get(0);
        }
    }
    
    
    @Transactional (readOnly = false)
    @Override
    public Booking saveBooking(Booking book)
    {
        try 
        {
            book = entityManager.merge(book);
            return book;
        } 
        catch(Exception e) 
        {
            System.out.println(e);
            return null;
        }
    }
    
    @Transactional (readOnly = false)
    @Override
    public boolean deleteBooking(long bookId)
    {
        Query query = entityManager.createQuery("DELETE FROM Booking b WHERE b.bookId=:bookId").setParameter("bookId",bookId);
        int a = query.executeUpdate();
        if(a!=0){
            return true;
        }else{
            return false;
        }
    }
}
