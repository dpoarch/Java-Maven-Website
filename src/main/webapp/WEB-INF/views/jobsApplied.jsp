<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <c:if test="${not empty postnewjob}">
	<div class="highlight-1" title="Post Job">
		Post job successful.
	</div>
</c:if> --%>
<div class="mainbodyhead">
				<div
					style1="min-width: 500px; margin-top: 15px; float: left; -webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px; border: 3px solid #96C0FF; background: rgba(255, 255, 255, 0.5); -webkit-box-shadow: #B3B3B3 4px 4px 4px; -moz-box-shadow: #B3B3B3 4px 4px 4px; box-shadow: #B3B3B3 4px 4px 4px;">

					<h3><b>Applied Jobs List</b></h3>
				
					<table>

						<tbody>
							<tr>
								<th>Job Title</th>
								<th>Company</th>
								<th>Location</th>
								<th>Date</th>
								<%-- <th><a href="<c:url value="/jobCategory"/>">Refresh All Jobs</a></th> --%>
								<!-- <th>View Applicants</th> -->
							</tr>
							<c:forEach var="job" items="${joblist}" varStatus="status">
								<tr>
									<td><a href="<c:url value="/jobs/details/${job.jobID}"/>">${job.jobTitle}</a></td>
									<td>${job.employer.companyName}</td>
									<td>${job.jobCity}</td>
									<td><fmt:formatDate pattern="MM-dd-yyyy"   value="${job.lastDate}" /></td>
									<%-- <td>${job.days} days</td> --%>
									<%-- <td><a href="<c:url value="/jobAppliedNumber/${job.jobID}"/>">${job.jobApplicant}</a></td> --%>
								</tr>
							</c:forEach>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<!-- <th>Refresh All Jobs</th> -->
								<th></th>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="float: left; clear: both"></div>
			
</div>			