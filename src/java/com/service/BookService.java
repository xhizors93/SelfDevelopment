/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.dao.BookDao;
import com.google.gson.Gson;
import com.model.Booking;
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
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author Zakhirulnizam
 */
public class BookService {
    
     private static final long serialVersionUID = 1L;
     
     //@Transactional(propagation = Propagation.REQUIRED) (only using this if the model has lazy fetch)
    public Map getBookScheduler(HttpServletRequest request)
    {
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        BookDao bookdao = (BookDao) appCtx.getBean("BookDao");
        
        List<Booking> book = bookdao.getBookList();
        
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        List result = new LinkedList();
        
        if(book != null){
            for(int a=0;a<book.size();a++)
            {
                Map item = new HashMap();

                item.put("id",""+book.get(a).getBookId());
                item.put("text", book.get(a).getBookText());
                item.put("start_date",sdf.format(book.get(a).getBookStartDate()));
                item.put("end_date",sdf.format(book.get(a).getBookEndDate()));
                //item.put("type",""+book.get(a).getBookId());

                result.add(item);
            }
        }
        
        Map wrap = new HashMap();
        wrap.put("data",result);
        
        Map map = new HashMap();
        Gson gson_record = new Gson();
        map.put("ListResult", gson_record.toJson(wrap));
        
        return map;
    }
     
      //@Transactional(propagation = Propagation.REQUIRED) (only using this if the model has lazy fetch)
     public Map saveBooking(HttpServletRequest request) throws ParseException
     {
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        BookDao bookdao = (BookDao) appCtx.getBean("BookDao");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        //convert json strigify to json object (please import org.json.JSONObject jar)
        JSONObject obj = new JSONObject(request.getParameter("ev").toString());
        
        //get each data inside json object
        long bookId = Long.parseLong(request.getParameter("id"));
        String bookText = obj.getString("text");
        String bookStartDate = formatter.format(dateFormat.parse(obj.getString("start_date")));
        String bookEndDate = formatter.format(dateFormat.parse(obj.getString("end_date")));
        
        Map message = new HashMap();
        //check if id is exist
        Booking book = bookdao.checkBookId(bookId);
        if(book != null){
            
            book.setBookText(bookText);
            book.setBookStartDate(formatter.parse(bookStartDate));
            book.setBookEndDate(formatter.parse(bookEndDate));
            
            book = bookdao.saveBooking(book);
            
            if(book != null){
                message.put("result","Booking successfully updated");
            }else{
                message.put("result","Booking has failed to update");
            }
            
        }else{
            
            book = new Booking();
            book.setBookId(bookId);
            book.setBookText(bookText);
            book.setBookStartDate(formatter.parse(bookStartDate));
            book.setBookEndDate(formatter.parse(bookEndDate));
            
            book = bookdao.saveBooking(book);
            
            if(book != null){
                message.put("result","Booking successfully saved");
            }else{
                message.put("result","Booking has failed to saved");
            }
        }
        
        return message;
     }
     
     //@Transactional(propagation = Propagation.REQUIRED) (only using this if the model has lazy fetch)
     public Map deleteBooking(HttpServletRequest request)
     {
        ApplicationContext appCtx = ApplicationContextUtils.getApplicationContext();
        BookDao bookdao = (BookDao) appCtx.getBean("BookDao");
        
        long bookId = Long.parseLong(request.getParameter("id"));
        
        boolean book = bookdao.deleteBooking(bookId);
        
        Map message = new HashMap();
        if(book != false)
        {
            message.put("result","Booking successfully deleted");
        }
        else
        {
            message.put("result","Booking has failed to delete");
        }
        
        return message;
     }
    
}
