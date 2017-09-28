<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page session="false"%>

<div class="mainbody">
<c:if test="${not empty message}">
${message} 
</c:if>
<c:if test="${ empty message}">
	<c:url var="action" value="/admin/job-search" />
	<form:form method="POST" action='${action}'>
		<div>
			<div style="float:left; margin-left:10px;">
				<fieldset>
					<label>Search Jobs: </label>
					<input type="text" name="jobsearch" id="jobsearch" />
				</fieldset>
			</div>
			<br/>
			<div style="float: left; clear: both"></div>
			<input type="submit" class="btn " value="Find Jobs" style="margin-left: 200px;">
		</div>
	</form:form>
</c:if>

<c:if test="${not empty searchError}">
<!-- <div class="highlight-1" title="Error Employer Search"> -->
Result not found. 
<!-- </div> -->
</c:if>


<div class="table-style">
    <h3>Jobs: </h3>
    <table id="jobsearchTB">
        <thead>
            <tr>    
                <th>Action</th>
                <th data-sort="string">Job Title</th>
                <th data-sort="string">Company</th>
                <th data-sort="string">Location</th>
                <th data-sort="string">Date</th>
                <th>Refresh All Jobs</th>
            </tr>
        </thead>
        <tbody>
                <c:forEach var="job" items="${joblist}" varStatus="status">
                        <tr>
                                <td>
                                    <a href="<c:url value="/employer/edit-posted-job?id=${job.jobID}"/>">Edit</a> &nbsp;
                                    <a href="<c:url value="/jobs/deleteJob?id=${job.jobID}"/>">Delete</a> &nbsp;
                                </td>
                                <td>${job.jobTitle}</td>
                                <td>${job.employer.companyName}</td>
                                <td>${job.jobCity}</td>
                                <td>${job.lastDate == null ? 'test' : job.lastDate}</td>
                                <td>${job.days}</td>
                        </tr>
                </c:forEach>
        </tbody>
    </table>
</div>
<div style="float: left; clear: both"></div>
</div>

