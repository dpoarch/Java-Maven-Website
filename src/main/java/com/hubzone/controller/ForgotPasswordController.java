package com.hubzone.controller;

/*
 * This class will handle forgot password portion
 * 
 * */

import java.io.File;
import java.net.URLEncoder;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hubzone.dao.UsersService;
import com.hubzone.model.Users;
import com.hubzone.utility.Email;
import com.hubzone.utility.SendMail;
import com.hubzone.utility.SendMailAWS;
import com.hubzone.utility.SendMailTLS;
import com.hubzone.utility.Utiltity;
import com.hubzone.model.Candidate;
import com.hubzone.model.Employer;
import com.hubzone.dao.CandidateService;
import com.hubzone.dao.EmployerService;
import com.hubzone.dao.JobService;
import com.hubzone.dao.JobAppliedService;
import com.hubzone.model.JobCategories;
import com.hubzone.model.Jobs;
import com.hubzone.model.JobsApplied;
import com.mysql.jdbc.log.Log;
import org.apache.commons.io.FilenameUtils;

import org.springframework.security.crypto.password.StandardPasswordEncoder;


@Controller
public class ForgotPasswordController {

        public @Value("${cv.location}") 
	String cvPath;
	public @Value("${server.address}")
	String serverHostAddress;
	@Autowired
	SendMailTLS sendMailTLS;
	@Autowired
	SendMail sendMail;
	@Autowired
	UsersService usersService;
	@Autowired
	CandidateService candidateService;
	@Autowired
	JobService jobService;
	@Autowired
	JobAppliedService jobAppliedService;
	@Autowired
	EmployerService employerService;
	@Autowired
	private StandardPasswordEncoder passwordEncoder;

/*
 * This method will show forgot password page to the user
 * 
 * */
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public String forgotPasswordPage() {
		return "forgotPasswordPage";
	}

/*	@RequestMapping(value = "/restore-password/email/{email}/session/{session}", method = RequestMethod.GET)
	public String restorePasswordPage(@PathVariable("email") String email,
			@PathVariable("session") String session, Model model) {
		model.addAttribute("email", email);
		model.addAttribute("session", session);
		return "restorepassword";
	}

	@RequestMapping(value = "/restore-password", method = RequestMethod.POST)
	public String resetPasswordPage(@RequestParam("email") String email,
			@RequestParam("session") String session,
			@RequestParam("password") String password, Model model) {
		Users user = null;
		String encodedPassword = passwordEncoder.encode(password);
		try {
            
			user = usersService.getUserByEmail(email);
			if(user.getVerificationCode()!=null){
				user.setPassword(encodedPassword);
				user.setEnabled(1);
				user.setVerificationCode("");
				usersService.updateUser(user);
				model.addAttribute("messageChange", "Password changed");
				if(user.getRole().equals("ROLE_EMP")) {
					model.addAttribute("param", "emp");
				} else if(user.getRole().equals("ROLE_CAN")) {
					model.addAttribute("param", "cand");
				}
			}else{
				model.addAttribute("error", "Invalid Session ");
			}
		
		} catch (Exception e) {
			if (user == null) {
				model.addAttribute("error", "Invalid email");
			} else {
				model.addAttribute("error", "System Error");
			}
		}
		return "restorepassword";
	}*/
        
        @RequestMapping(value = "/forgot-username", method = RequestMethod.GET)
	public String forgotUsernamePage() {
		return "forgotUsernamePage";
	}
	
	@RequestMapping(value = "/restore-password/email/{email}/session/{session}", method = RequestMethod.GET)
	public String restorePasswordPage(@PathVariable("email") String email,
			@PathVariable("session") String session, Model model) {
		model.addAttribute("email", email);
		model.addAttribute("session", session);
		return "restorepassword";
	}
	
	/*
	 * This method will reset password for the user
	 * 
	 * */

	@RequestMapping(value = "/restore-password", method = RequestMethod.POST)
	public String resetPasswordPage(@RequestParam("email") String email,
			@RequestParam("session") String session,
			@RequestParam("password") String password, Model model) {
		Users user = null;
		try {
			String encodedPassword = passwordEncoder.encode(password);
			user = usersService.getUserByEmail(email);
			if(user != null){
				if(user.getVerificationCode().equals(session)){
					user.setPassword(encodedPassword);
					user.setEnabled(1);
					user.setVerificationCode("");
					usersService.updateUser(user);
					model.addAttribute("successblock", "Password has changed.");
				}else{
					model.addAttribute("errorblock", "Invalid Session");
					
				}
			} else {
				model.addAttribute("warningblock", "Invalid email");
			}
		} catch (Exception e) {
			model.addAttribute("errorblock", "An error has been occur :" +e);
			e.printStackTrace();
		}
		return "restorepassword";
	}



	@RequestMapping(value = "/password-recovery", method = RequestMethod.POST)
	public String passordRecover(@RequestParam("emailId") String toEmail,
			Model model) {
		Users user = null;
		try {

			user = usersService.getUserByEmail(toEmail);
			user.setEnabled(0);
			String random = Utiltity.getRandomValue(30);
			String resetUrl = serverHostAddress+"/restore-password/email/"+toEmail+"/session/"+URLEncoder.encode(random,"UTF-8");

			user.setVerificationCode(random);
			Email emailObj = new Email();
			emailObj.setTo(toEmail);
			emailObj.setFrom("support@HUBZoneTalent.com");
			emailObj.setSubject("Change Password");
			/*emailObj.setBody("To change password click following links</br> <a href='"
					+ serverHostAddress
					+ "/restore-password/email/"
					+ toEmail
					+ "/session/"
					+ URLEncoder.encode(random, "UTF-8")
					+ "'> Forgot Password</a>"+"<br><br><br>Thank you,<br>HUBZone Talent");*/
			emailObj.setBody("To change password click following links</br> <a href='"
					+resetUrl+"'> Forgot Password</a>"+"<br><br><br>Thank you,<br>HUBZone Talent");
			
			System.out.println("Email body is: "+emailObj.getBody());
			//sendMail.sendMail(emailObj);
			//SendMailAWS.sendMail(emailObj);
                        sendMailTLS.sendMail(emailObj);
			
			model.addAttribute("messageSent", "Please Check your email");
			usersService.updateUser(user);
		} catch (Exception e) {
			if (user == null) {
				model.addAttribute("messageFail", "Invalid email");
			}
		}
		//model.addAttribute("emailAdd", "true");
		return "login";
	}
        
        @RequestMapping(value = "/username-recovery", method = RequestMethod.POST)
	public String usernameRecover(@RequestParam("emailId") String toEmail,
			Model model) {
		Users user = null;
		try {

			user = usersService.getUserByEmail(toEmail);
			String random = Utiltity.getRandomValue(30);
			String resetUrl = serverHostAddress+"/login?param=emp";

			user.setVerificationCode(random);
			Email emailObj = new Email();
			emailObj.setTo(toEmail);
			emailObj.setFrom("support@HUBZoneTalent.com");
			emailObj.setSubject("Forgot Username");
			/*emailObj.setBody("To change password click following links</br> <a href='"
					+ serverHostAddress
					+ "/restore-password/email/"
					+ toEmail
					+ "/session/"
					+ URLEncoder.encode(random, "UTF-8")
					+ "'> Forgot Password</a>"+"<br><br><br>Thank you,<br>HUBZone Talent");*/
			emailObj.setBody("Here is your username: <strong>" + user.getUserName() + "</strong><br><br> <a href='"
					+resetUrl+"'> Click here to login</a>"+"<br><br><br>Thank you,<br>HUBZone Talent");
			
			System.out.println("Email body is: "+emailObj.getBody());
			//sendMail.sendMail(emailObj);
			//SendMailAWS.sendMail(emailObj);
                        sendMailTLS.sendMail(emailObj);
			
			model.addAttribute("messageSent", "Please Check your email");
		} catch (Exception e) {
			if (user == null) {
				model.addAttribute("messageFail", "Invalid email");
			}
		}
		//model.addAttribute("emailAdd", "true");
		return "login";
	}
	
//	@RequestMapping(value = "/apply-for-job/{employerID}/{jobID}", method = RequestMethod.GET)
//	public String passordRecover(@PathVariable("employerID") String employerID,Candidate candidate,Principal principal,
//			Model model,Employer employer,HttpServletRequest request,Jobs job,@PathVariable("jobID")Long jobID,@ModelAttribute JobsApplied jobApplied) {
//		Users user=null;
//		Users emp=null;
//		
//		try{
//			user = usersService.getById(principal.getName());
//			candidate = candidateService.getById(principal.getName());
//			employer=employerService.getById(employerID);
//			emp=usersService.getById(employerID);
//			job=jobService.getJobById(jobID);
//			
//			
//			user.setEnabled(0);
//			//user.setVerificationCode(Utiltity.getRandomValue());
//			Email emailObj = new Email();
//			emailObj.setTo(emp.getEmail());
//			emailObj.setFrom("support@HUBZoneTalent.com");
//			emailObj.setSubject("Apply Job");
//			emailObj.setBody("Dear Employer,<br><br>"+candidate.getCandidateFirstName()+" "+candidate.getCandidateLastName()+" has applied for your position of "+job.getJobTitle()+". To view their profile, please log into<br>"
//					+"<a href=\"http://www.HUBZoneTalent.com\">HUBZone Talent Website</a> and/or print his/her resume.<br><br>Thank you for using HUBZone Talent.<br><br>"+"HZT Team");
//			System.out.println(candidate.getCandidateFirstName()+" "+candidate.getCandidateLastName()+" has applied for job #"+job.getJobTitle());			
//			
//
//			/*emailObj.setFileName("cv");
//			
//			
//			String root = request.getSession().getServletContext()
//					.getRealPath("/");
////			response.setCharacterEncoding("utf-8");
//			/*File path = new File(root + "/WEB-INF/cv");
//			File resume = new File(path + "/"
//					+ candidate.getResumeFileLocation());
//			
//			emailObj.setFileSource(resume.getAbsolutePath());*/
//			emailObj.setFileSource("/Users/tauseefalnoor/Desktop/uni-mail.txt");
//			emailObj.setFileName("moin_resume.txt");
//			sendMailTLS.sendAttachMentMail(emailObj);
//			sendMailTLS.sendMail(emailObj);
//			//SendMailAWS.sendMail(emailObj);
//			
//			Email candEmailObj = new Email();
//			candEmailObj.setTo(user.getEmail());
//			candEmailObj.setFrom("support@HUBZoneTalent.com");
//			candEmailObj.setSubject("Job Application Confirmation");
//			String jobId = job.getJobID() == null ? "" : job.getJobID().toString();
//			String jobTitle = job.getJobTitle() == null ? "" : job.getJobTitle();
//			String jobCity = job.getJobCity() == null ? "" : job.getJobCity();
//			String jobState = job.getJobState() == null ? "" : job.getJobState();
//			String jobSummary = job.getJobSummary() == null ? "" : job.getJobSummary();
//			candEmailObj.setBody("You have applied for Job #"+ jobId + " - " + jobTitle + " in " + jobCity+ ", " + jobState+".<br>"
//								+"The employer will be notified of your interest in this position.<br>"
//								+"The detailed job descriptions is below.<br><br>"
//								+jobSummary );
//			sendMailTLS.sendMail(candEmailObj);
//			//SendMailAWS.sendMail(candEmailObj);
//			
//			try{
//			DateFormat formatter;
//			Date date = null;
//
////			formatter = new SimpleDateFormat("MM-dd-yyyy");
////			date = (Date) formatter.parse(lastDate1);
//			
//			formatter = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
//			//date = (Date) formatter.parse(lastDate1);
//			date= new Date();
//			String strDate = formatter.format(date);
//			
//			jobApplied.setApplyDate(formatter.parse(strDate));
//			System.out.println(formatter.parse(strDate));
//			
//			jobApplied.setCandidate(candidate);
//			jobApplied.setJob(job);
//			jobAppliedService.save(jobApplied);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//			
//			job.setCurrentDate(job.getCurrentDate());
//			job.setEmployer(job.getEmployer());
//			job.setJobCategoryName(job.getJobCategoryName());
//			job.setJobCity(job.getJobCity());
//			job.setJobDuration(job.getJobDuration());
//			job.setJobID(job.getJobID());
//			job.setJobKeyWord(job.getJobKeyWord());
//			job.setJobRate(job.getJobRate());
//			job.setJobState(job.getJobState());
//			job.setJobSummary(job.getJobSummary());
//			job.setJobTitle(job.getJobTitle());
//			job.setJobZip(job.getJobZip());
//			job.setLastDate(job.getLastDate());
//			job.setJobApplicant(job.getJobApplicant()+1);
//			System.out.println("Job Applicant number: "+job.getJobApplicant());
//			jobService.update(job);
//			model.addAttribute("message", "Apply Job Successful");	
//				
//		}catch(Exception e){
//		
//			if(user==null){
//				model.addAttribute("message", "Invalid email");
//			}
//			e.printStackTrace();
//		}
//		
//	return "jobAppliedConfirmation";	
//	}
        
        @RequestMapping(value = "/apply-for-job/{employerID}/{jobID}", method = RequestMethod.GET)
	public String applyJob(@PathVariable("employerID") String employerID,Candidate candidate,Principal principal,
			Model model,Employer employer,HttpServletRequest request,Jobs job,@PathVariable("jobID")Long jobID,@ModelAttribute JobsApplied jobApplied) {
		Users user=null;
		Users emp=null;
		
		try{
			user = usersService.getById(principal.getName());
			candidate = candidateService.getById(principal.getName());
			employer=employerService.getById(employerID);
			emp=usersService.getById(employerID);
			job=jobService.getJobById(jobID);
                        boolean isjobapplied=jobAppliedService.checkifApplied(job, candidate);
                        if(!isjobapplied){
			
                            if(candidate.getResumeFileLocation() == null && candidate.getCandidateDescription() == ""){
                                model.addAttribute("message", "<a href='/candidate/edit-candiate-profile'>Please upload your resume to continue</a>");
                            }else{
                                user.setEnabled(0);
                                //user.setVerificationCode(Utiltity.getRandomValue());
                                Email emailObj = new Email();
                                emailObj.setTo(emp.getEmail());
                                emailObj.setFrom("support@HUBZoneTalent.com");
                                emailObj.setSubject("Apply Job");
                                emailObj.setBody("Dear Employer,<br><br>"+candidate.getCandidateFirstName()+" "+candidate.getCandidateLastName()+" has applied for your position of "+job.getJobTitle()+". To view their profile, please log into<br>"
                                                +"<a href=\"http://www.HUBZoneTalent.com\">HUBZone Talent Website</a> and/or print his/her resume.<br><br>Thank you for using HUBZone Talent.<br><br>"+"HZT Team");
                                System.out.println(candidate.getCandidateFirstName()+" "+candidate.getCandidateLastName()+" has applied for job #"+job.getJobTitle());			


                                //emailObj.setFileName("cv");


        //			String root = request.getSession().getServletContext()
        //					.getRealPath("/");
        //			response.setCharacterEncoding("utf-8");
                            if(candidate.getResumeFileLocation() != null){
                                File resume = new File(cvPath + "/" + candidate.getResumeFileLocation());

                                emailObj.setFileSource(resume.getAbsolutePath());
                                String ext = FilenameUtils.getExtension(candidate.getResumeFileLocation());
                                emailObj.setFileName("resume." + ext);
                                sendMailTLS.sendAttachMentMail(emailObj);
                            }else{
        //			emailObj.setFileSource("/Users/tauseefalnoor/Desktop/uni-mail.txt");

                                sendMailTLS.sendMail(emailObj);
                                //SendMailAWS.sendMail(emailObj);
                            }

                                Email candEmailObj = new Email();
                                candEmailObj.setTo(user.getEmail());
                                candEmailObj.setFrom("support@HUBZoneTalent.com");
                                candEmailObj.setSubject("Job Application Confirmation");
                                String jobId = job.getJobID() == null ? "" : job.getJobID().toString();
                                String jobTitle = job.getJobTitle() == null ? "" : job.getJobTitle();
                                String jobCity = job.getJobCity() == null ? "" : job.getJobCity();
                                String jobState = job.getJobState() == null ? "" : job.getJobState();
                                String jobSummary = job.getJobSummary() == null ? "" : job.getJobSummary();
                                candEmailObj.setBody("You have applied for Job #"+ jobId + " - " + jobTitle + " in " + jobCity+ ", " + jobState+".<br>"
                                                                        +"The employer will be notified of your interest in this position.<br>"
                                                                        +"The detailed job descriptions is below.<br><br>"
                                                                        +jobSummary+"<br><br><a href='http://www.HUBZoneTalent.com/jobs/appliedjobs'>Click Here</a> to view your applied jobs.");
                                sendMailTLS.sendMail(candEmailObj);
                                //SendMailAWS.sendMail(candEmailObj);

                                try{
                                DateFormat formatter;
                                Date date = null;

        //			formatter = new SimpleDateFormat("MM-dd-yyyy");
        //			date = (Date) formatter.parse(lastDate1);

                                formatter = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
                                //date = (Date) formatter.parse(lastDate1);
                                date= new Date();
                                String strDate = formatter.format(date);

                                jobApplied.setApplyDate(formatter.parse(strDate));
                                System.out.println(formatter.parse(strDate));

                                jobApplied.setCandidate(candidate);
                                jobApplied.setJob(job);
                                jobAppliedService.save(jobApplied);
                                }catch(Exception e){
                                        e.printStackTrace();
                                }

                                job.setCurrentDate(job.getCurrentDate());
                                job.setEmployer(job.getEmployer());
                                job.setJobCategoryName(job.getJobCategoryName());
                                job.setJobCity(job.getJobCity());
                                job.setJobDuration(job.getJobDuration());
                                job.setJobID(job.getJobID());
                                job.setJobKeyWord(job.getJobKeyWord());
                                job.setJobRate(job.getJobRate());
                                job.setJobState(job.getJobState());
                                job.setJobSummary(job.getJobSummary());
                                job.setJobTitle(job.getJobTitle());
                                job.setJobZip(job.getJobZip());
                                job.setLastDate(job.getLastDate());
                                job.setJobApplicant(job.getJobApplicant()+1);
                                System.out.println("Job Applicant number: "+job.getJobApplicant());
                                jobService.update(job);
                                model.addAttribute("message", "Apply Job Successful");	
                            }
                        }
                        else{
                            model.addAttribute("message", "You have already applied for this job.");	
                        }
		}catch(Exception e){
		
			if(user==null){
				model.addAttribute("message", "Invalid email");
			}
			e.printStackTrace();
		}
		
	return "jobAppliedConfirmation";	
	}
}

	
		
