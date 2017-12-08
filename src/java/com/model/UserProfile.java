/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author User
 */
@Entity
@Table(name = "UserProfile")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserProfile.findAll", query = "SELECT u FROM UserProfile u"),
    @NamedQuery(name = "UserProfile.findByUpUserid", query = "SELECT u FROM UserProfile u WHERE u.upUserid = :upUserid"),
    @NamedQuery(name = "UserProfile.findByUpFirstname", query = "SELECT u FROM UserProfile u WHERE u.upFirstname = :upFirstname"),
    @NamedQuery(name = "UserProfile.findByUpLastname", query = "SELECT u FROM UserProfile u WHERE u.upLastname = :upLastname"),
    @NamedQuery(name = "UserProfile.findByUpDob", query = "SELECT u FROM UserProfile u WHERE u.upDob = :upDob"),
    @NamedQuery(name = "UserProfile.findByUpAge", query = "SELECT u FROM UserProfile u WHERE u.upAge = :upAge"),
    @NamedQuery(name = "UserProfile.findByUpRace", query = "SELECT u FROM UserProfile u WHERE u.upRace = :upRace"),
    @NamedQuery(name = "UserProfile.findByUpReligion", query = "SELECT u FROM UserProfile u WHERE u.upReligion = :upReligion"),
    @NamedQuery(name = "UserProfile.findByUpAddress", query = "SELECT u FROM UserProfile u WHERE u.upAddress = :upAddress"),
    @NamedQuery(name = "UserProfile.findByUpPostcode", query = "SELECT u FROM UserProfile u WHERE u.upPostcode = :upPostcode"),
    @NamedQuery(name = "UserProfile.findByUpCity", query = "SELECT u FROM UserProfile u WHERE u.upCity = :upCity"),
    @NamedQuery(name = "UserProfile.findByUpState", query = "SELECT u FROM UserProfile u WHERE u.upState = :upState"),
    @NamedQuery(name = "UserProfile.findByUpCountry", query = "SELECT u FROM UserProfile u WHERE u.upCountry = :upCountry"),
    @NamedQuery(name = "UserProfile.findByUpDescription", query = "SELECT u FROM UserProfile u WHERE u.upDescription = :upDescription")})
public class UserProfile implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "up_userid")
    private Integer upUserid;
    @Column(name = "up_firstname")
    private String upFirstname;
    @Column(name = "up_lastname")
    private String upLastname;
    @Column(name = "up_dob")
    @Temporal(TemporalType.DATE)
    private Date upDob;
    @Column(name = "up_age")
    private Integer upAge;
    @Column(name = "up_race")
    private String upRace;
    @Column(name = "up_religion")
    private String upReligion;
    @Column(name = "up_address")
    private String upAddress;
    @Column(name = "up_postcode")
    private Integer upPostcode;
    @Column(name = "up_city")
    private String upCity;
    @Column(name = "up_state")
    private String upState;
    @Column(name = "up_country")
    private String upCountry;
    @Column(name = "up_description")
    private String upDescription;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "upUserid")
    private Collection<UserAccount> userAccountCollection;

    public UserProfile() {
    }

    public UserProfile(Integer upUserid) {
        this.upUserid = upUserid;
    }

    public Integer getUpUserid() {
        return upUserid;
    }

    public void setUpUserid(Integer upUserid) {
        this.upUserid = upUserid;
    }

    public String getUpFirstname() {
        return upFirstname;
    }

    public void setUpFirstname(String upFirstname) {
        this.upFirstname = upFirstname;
    }

    public String getUpLastname() {
        return upLastname;
    }

    public void setUpLastname(String upLastname) {
        this.upLastname = upLastname;
    }

    public Date getUpDob() {
        return upDob;
    }

    public void setUpDob(Date upDob) {
        this.upDob = upDob;
    }

    public Integer getUpAge() {
        return upAge;
    }

    public void setUpAge(Integer upAge) {
        this.upAge = upAge;
    }

    public String getUpRace() {
        return upRace;
    }

    public void setUpRace(String upRace) {
        this.upRace = upRace;
    }

    public String getUpReligion() {
        return upReligion;
    }

    public void setUpReligion(String upReligion) {
        this.upReligion = upReligion;
    }

    public String getUpAddress() {
        return upAddress;
    }

    public void setUpAddress(String upAddress) {
        this.upAddress = upAddress;
    }

    public Integer getUpPostcode() {
        return upPostcode;
    }

    public void setUpPostcode(Integer upPostcode) {
        this.upPostcode = upPostcode;
    }

    public String getUpCity() {
        return upCity;
    }

    public void setUpCity(String upCity) {
        this.upCity = upCity;
    }

    public String getUpState() {
        return upState;
    }

    public void setUpState(String upState) {
        this.upState = upState;
    }

    public String getUpCountry() {
        return upCountry;
    }

    public void setUpCountry(String upCountry) {
        this.upCountry = upCountry;
    }

    public String getUpDescription() {
        return upDescription;
    }

    public void setUpDescription(String upDescription) {
        this.upDescription = upDescription;
    }

    @XmlTransient
    public Collection<UserAccount> getUserAccountCollection() {
        return userAccountCollection;
    }

    public void setUserAccountCollection(Collection<UserAccount> userAccountCollection) {
        this.userAccountCollection = userAccountCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (upUserid != null ? upUserid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserProfile)) {
            return false;
        }
        UserProfile other = (UserProfile) object;
        if ((this.upUserid == null && other.upUserid != null) || (this.upUserid != null && !this.upUserid.equals(other.upUserid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.model.UserProfile[ upUserid=" + upUserid + " ]";
    }
    
}
