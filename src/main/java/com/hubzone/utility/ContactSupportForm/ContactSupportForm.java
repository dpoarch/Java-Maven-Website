/**
 * 
 */
package com.hubzone.utility.ContactSupportForm;

import java.util.List;

/**
 * @author moin
 *
 */
public class ContactSupportForm {
	
	private String subject;
	
	private String message;
	
	private List<String> candidates;
	


	public List<String> getCandidates() {
		return candidates;
	}

	public void setCandidates(List<String> candidates) {
		this.candidates = candidates;
	}

	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}



}
