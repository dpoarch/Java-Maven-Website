<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="mainbody">

				<div class="table-style">
					<h3><b>Jobs Details</b>
					<button class="backbtn" type="button" name="back" onclick="history.go(-1)"><u>Back to Search Results</u></button>
					</h3>
				
					<table width="100%">

						<tbody>
							<tr>
								<td><strong>Job Title</strong></td>
								<td>${job.jobTitle}</td>
							</tr>
							<tr>
								<td><strong>Company</strong></td>
								<td>${job.employer.companyName}</td>
							</tr>
							<tr>
								<td><strong>City</strong></td>
								<td>${job.jobCity}</td>
							</tr>
							<tr>
								<td><strong>Zip Code</strong></td>
								<td>${job.jobZip}</td>
							</tr>
							<tr>
								<td><strong>Date</strong></td>
								<td><fmt:formatDate pattern="MM-dd-yyyy"  value="${job.lastDate}" /></td>
							</tr>
							<tr>
								<td><strong>Salary</strong></td>
								<td>${job.jobRate}</td>
							</tr>
							<tr>
								<td><strong>Skill</strong></td>
								<td>${job.jobKeyWord}</td>
							</tr>
							<tr>
								<td><strong>Category</strong></td>
								<td>${job.jobCategoryName}</td>
							</tr>
							<tr>
								<td><strong>Duration</strong></td>
								<td>${job.jobDuration}</td>
							</tr>
							<tr>
								<td><strong>Summary</strong></td>
								<td>${job.jobSummary}</td>
							</tr>
							<tr>
								<!-- <td><strong>Remaining Time</strong></td> -->
								<td><strong>Job Posted Date</strong></td>
								<td>${job.currentDate}</td>
							</tr>
							<tr>
							<td><strong>Apply</strong></td>
                                                        <c:if test="${check == false}"><td><a href="<c:url value="/apply-for-job/${job.employer.employerID}/${job.jobID}"/> ">Apply Now</a></td></c:if>
                                                        <c:if test="${check == true}"><td>You have already applied for this job.</td></c:if>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div style="float: left; clear: both"></div>
</div>
			
			
