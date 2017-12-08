/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "Booking")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Booking.findAll", query = "SELECT b FROM Booking b"),
    @NamedQuery(name = "Booking.findByBookId", query = "SELECT b FROM Booking b WHERE b.bookId = :bookId"),
    @NamedQuery(name = "Booking.findByBookText", query = "SELECT b FROM Booking b WHERE b.bookText = :bookText"),
    @NamedQuery(name = "Booking.findByBookStartDate", query = "SELECT b FROM Booking b WHERE b.bookStartDate = :bookStartDate"),
    @NamedQuery(name = "Booking.findByBookEndDate", query = "SELECT b FROM Booking b WHERE b.bookEndDate = :bookEndDate")})
public class Booking implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "bookId")
    private Long bookId;
    @Column(name = "bookText")
    private String bookText;
    @Column(name = "bookStartDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date bookStartDate;
    @Column(name = "bookEndDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date bookEndDate;

    public Booking() {
    }

    public Booking(Long bookId) {
        this.bookId = bookId;
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public String getBookText() {
        return bookText;
    }

    public void setBookText(String bookText) {
        this.bookText = bookText;
    }

    public Date getBookStartDate() {
        return bookStartDate;
    }

    public void setBookStartDate(Date bookStartDate) {
        this.bookStartDate = bookStartDate;
    }

    public Date getBookEndDate() {
        return bookEndDate;
    }

    public void setBookEndDate(Date bookEndDate) {
        this.bookEndDate = bookEndDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookId != null ? bookId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Booking)) {
            return false;
        }
        Booking other = (Booking) object;
        if ((this.bookId == null && other.bookId != null) || (this.bookId != null && !this.bookId.equals(other.bookId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.model.Booking[ bookId=" + bookId + " ]";
    }
    
}
