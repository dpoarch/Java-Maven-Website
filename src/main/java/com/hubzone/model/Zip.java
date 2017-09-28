/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hubzone.model;

/*
 * This class is for  Users table in the database
 * 
 * */

import java.io.Serializable;


import javax.persistence.*;

import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * @author mohammadmoinuddin
 * 
 */
@Entity()
@Table(name="Zip", 
uniqueConstraints=@UniqueConstraint(columnNames={"zipcode"}))
public class Zip implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Basic(optional = false)
	//@NotNull
	@Size(min = 1, max = 30)
	@Column(name = "zipcode", nullable = false, length = 20)
	private String zipcode;

	@Basic(optional = false)
	//@NotNull
	@Size(min = 1, max = 25)
	@Column(name = "latitude", nullable = false, length = 25)
	private double 	latitude;
        
        @Basic(optional = false)
	//@NotNull
	@Size(min = 1, max = 25)
	@Column(name = "longitude", nullable = false, length = 25)
	private double 	longitude;
        
	public String getZipCode() {
		return zipcode;
	}
        
        public double getLat() {
		return latitude;
	}
        
        public double getLong() {
		return longitude;
	}

}
