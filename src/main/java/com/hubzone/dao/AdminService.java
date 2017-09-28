package com.hubzone.dao;

/*
 * This class is for interface of Admin Services
 * 
 * */

import java.util.List;


import com.hubzone.model.Candidate;
import com.hubzone.model.Employer;
import com.hubzone.model.Users;
import com.hubzone.model.Admin;
import com.hubzone.model.Jobs;

public interface AdminService {
	public void save(Admin admin);
	Admin getById(String id);
	public void updateAdmin(Admin admin);
	public List<Employer> serachEmployer(String employerSearch);
	public List<Candidate> serachCandidate(String candidateSearch);
	public void delete(String userName);
	public void deleteCandidate(String userName);
	public List<Candidate> matchCandidate(String candidateSearch);
	public List<Employer> matchEmployer(String employerSearch);
	public List<Users> matchUser(String userSearch);
	public List<Users> matchUserEmail(String userSearch);
	public List<Candidate> serachCandList(String candidateSearch);
	
	//new 
	public Users searchCandidateByEmail(String email);
	//public Users findUserByEmail(@Param("email") String email);
        public List<Jobs> searchJobsAdmin(String search);

}
