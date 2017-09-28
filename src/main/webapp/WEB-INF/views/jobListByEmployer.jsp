<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#a {
	height: 100vh;
	padding: 0 0 0 0;
}
#b {
	height: calc(100% - 300px);
}
article {
	height: 100%;
	min-height: 100%;
}
.pagewrapper {
	height: 100%;
	min-height: 100%;
}
.mainbody {
	height: 100%;
	min-height: 100%;
}
</style>


<div class="mainbody">
	<c:if test="${not empty postnewjob}">
		<div class="highlight-3">Post Job Successful.</div>
	</c:if>
	<div class="table-style">		
		<h3><b>Jobs List</b>
		<button class="backbtn" type="button" onclick="location.href="/employer/refreshAllJob"><u>Refresh All Jobs</u></button>
		</h3>
		<table>
			<tbody>
				<tr>
					<!-- <th>Employer Company</th> -->
					 <%-- <th><a href="<c:url value="/employer/password-encode"/>">Refresh All Jobs</a></th> --%> 
					<th></th>
 					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					
					
				</tr>
				<tr>
					<!-- <th>Employer Company</th> -->
					
					<th>Action</th>	
					<th>Job Title</th>
					<th>Location</th>
					<th>Salary Level</th> 
					<th>Job Preference</th> 
					<th>Expiration Date</th>
					<%-- <th><a href="<c:url value="/employer/refreshAllJob"/>">Refresh All Jobs</a></th> --%>
					<th>Applicants</th>
					<%-- <th><a href="<c:url value="/employer/job-list-by-employer-by-order"/>">Refresh By Date</a></th> --%>
					
				</tr>
				<tr>
					<!-- <th>Employer Company</th> -->
					<%-- <th><a href="<c:url value="/employer/refreshAllJob"/>">Refresh All Jobs</a></th> --%>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					
					
				</tr>
				<c:forEach var="job" items="${joblist}" varStatus="status">
					<tr>
						<td >
                                                        <a href="<c:url value="/jobs/preview/${job.jobID}"/>">Preview</a> &nbsp;
							<a href="<c:url value="/employer/edit-posted-job?id=${job.jobID}"/>">Edit</a> &nbsp;
							<a href="<c:url value="/jobs/deleteJob?id=${job.jobID}"/>">Delete</a> &nbsp;
							<%-- <a href="<c:url value="/jobs/refreshJob?id=${job.jobID}"/>">Refresh</a> --%>
						
						<%-- <td>${job.employer.companyName}</td> --%>
						
						<td>${job.jobTitle}</td>
						<td>${job.jobCity}, ${job.jobState} ${job.jobZip}</td>
						<td>${job.jobRate}</td>
						<td>${job.jobDuration}</td> 

						<td> <fmt:formatDate pattern="MM-dd-yyyy"  value="${job.lastDate}" /></td>
						<%-- <td>${job.days} days ${job.hours} hours ${job.munutes} minutes</td> --%>
						<td><a href="<c:url value="/employer/jobAppliedNumber/${job.jobID}"/>">${job.jobApplicant}</a></td>

						<%-- <td><fmt:formatDate type="both"     dateStyle="medium" timeStyle="medium"  value="${job.lastDate}" /></td> --%>

						<!-- <td></td> -->
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="float: left; clear: both"></div>
</div>
