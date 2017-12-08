/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "UserAccount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserAccount.findAll", query = "SELECT u FROM UserAccount u"),
    @NamedQuery(name = "UserAccount.findByUaAccountid", query = "SELECT u FROM UserAccount u WHERE u.uaAccountid = :uaAccountid"),
    @NamedQuery(name = "UserAccount.findByUaUsername", query = "SELECT u FROM UserAccount u WHERE u.uaUsername = :uaUsername"),
    @NamedQuery(name = "UserAccount.findByUaUserpassword", query = "SELECT u FROM UserAccount u WHERE u.uaUserpassword = :uaUserpassword")})
public class UserAccount implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ua_accountid")
    private Integer uaAccountid;
    @Column(name = "ua_username")
    private String uaUsername;
    @Column(name = "ua_userpassword")
    private String uaUserpassword;
    @JoinColumn(name = "up_userid", referencedColumnName = "up_userid")
    @ManyToOne(optional = false)
    private UserProfile upUserid;

    public UserAccount() {
    }

    public UserAccount(Integer uaAccountid) {
        this.uaAccountid = uaAccountid;
    }

    public Integer getUaAccountid() {
        return uaAccountid;
    }

    public void setUaAccountid(Integer uaAccountid) {
        this.uaAccountid = uaAccountid;
    }

    public String getUaUsername() {
        return uaUsername;
    }

    public void setUaUsername(String uaUsername) {
        this.uaUsername = uaUsername;
    }

    public String getUaUserpassword() {
        return uaUserpassword;
    }

    public void setUaUserpassword(String uaUserpassword) {
        this.uaUserpassword = uaUserpassword;
    }

    public UserProfile getUpUserid() {
        return upUserid;
    }

    public void setUpUserid(UserProfile upUserid) {
        this.upUserid = upUserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (uaAccountid != null ? uaAccountid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserAccount)) {
            return false;
        }
        UserAccount other = (UserAccount) object;
        if ((this.uaAccountid == null && other.uaAccountid != null) || (this.uaAccountid != null && !this.uaAccountid.equals(other.uaAccountid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.model.UserAccount[ uaAccountid=" + uaAccountid + " ]";
    }
    
}
