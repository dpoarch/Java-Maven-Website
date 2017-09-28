package com.hubzone.utility;

import java.io.IOException;

import com.amazonaws.services.simpleemail.*;
import com.amazonaws.services.simpleemail.model.*;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.*;

public class SendMailAWS {
	
	 	private static final String FROM = "support@hubzonetalent.com";  // Replace with your "From" address. This address must be verified.
	    
	    private static final String aws_id = "AKIAJFDPXXVLH7RLDQ4Q";
	    private static final String aws_key = "SMFzALdBsB+fW3RUtSPOEPTRO/2yPeB3ZbI6wbp5";
	    
	    public static void sendMail(Email mail) throws IOException {    	
	                
	        Destination destination = new Destination().withToAddresses(new String[]{mail.getTo()});
	        

	        Content subject = new Content().withData(mail.getSubject());
	        Content textBody = new Content().withData(mail.getBody()); 
	        Body body = new Body().withHtml(textBody);
	        
	        Message message = new Message().withSubject(subject).withBody(body);
	        SendEmailRequest request = new SendEmailRequest().withSource(FROM).withDestination(destination).withMessage(message);
	        
      
	            System.out.println("Attempting to send an email through Amazon SES by using the AWS SDK for Java...");
	            AmazonSimpleEmailServiceClient client = new AmazonSimpleEmailServiceClient(new BasicAWSCredentials(aws_id, aws_key)); 
	            Region REGION = Region.getRegion(Regions.US_EAST_1);
	            client.setRegion(REGION);
	       
	            // Send the email.
	            client.sendEmail(request);  
	            System.out.println("Email sent!");
	
	    }

}
