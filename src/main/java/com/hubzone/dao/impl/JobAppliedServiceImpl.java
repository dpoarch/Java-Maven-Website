package com.hubzone.dao.impl;

/*
 * This class is for implementation of Job Applied service methods
 * 
 * */

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hubzone.dao.JobAppliedService;
//import com.hubzone.model.Candidate;
import com.hubzone.model.Candidate;
import com.hubzone.model.Jobs;
import com.hubzone.model.JobsApplied;


@Repository
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class JobAppliedServiceImpl implements JobAppliedService{
	
	Logger log = Logger.getLogger(JobAppliedServiceImpl.class);
	
	@PersistenceContext
	private EntityManager em;
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public int appliedJobCount(long jobID){
		
		return 0;
		
	}
	///
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void save(JobsApplied jobApplied) {

		em.persist(jobApplied);

	}
	
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public List<JobsApplied> candList(long JobID){
		String sql ="SELECT ja FROM JobsApplied ja WHERE ja.job.jobID =:jobID";
		TypedQuery<JobsApplied> query = em.createQuery(sql, JobsApplied.class);
		query.setParameter("jobID", JobID);
		return query.getResultList();
		
	}
        
        @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public boolean checkifApplied(Jobs JobID, Candidate candidateID){
                boolean check = false;
		String sql ="SELECT ja FROM JobsApplied ja WHERE ja.job =:jobID AND ja.candidate=:candidateID";
		TypedQuery<JobsApplied> query = em.createQuery(sql, JobsApplied.class);
		query.setParameter("jobID", JobID);
                query.setParameter("candidateID", candidateID);
                if(query.getResultList().size() > 0){
                    check = true;
                }
		return check;	
	}

}
