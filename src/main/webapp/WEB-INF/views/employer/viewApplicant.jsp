<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page session="false"%>

<style>
tr:nth-child(2n+1) {
	background: 0;
	border-bottom: 1px solid #303D7D;
}
td {
	border-bottom: 0;
}
</style>

<div class="mainbody" id="highlight-word">

<div class="table-style">
		<h3>
			<b>Job Seeker List</b>
		</h3>
		<a href="/employer/job-list-by-employer">Back to Search Result</a>
	<table>
		<tbody>
				<tr>
				</tr>
				<tr>	
				<th>Job Seeker Name</th>
				<th>Apply Date</th>		
				</tr>
				<tr>
				<th></th>
				<th></th>
				</tr>
				<c:forEach var="cand" items="${candList}" varStatus="status">
				
					<tr>
					
<%-- 					<th><c:url value="candidate-profile" var="url">
							<c:param name="CandidateID" value="${cand.candidate.candidateID}" />
						</c:url></th> --%>
					<td><a href="<c:url value="/candidate/candidate-profile/${cand.candidate.candidateID}"/>">${cand.candidate.candidateID}</a></td>
					<td>${cand.applyDate}</td>
					</tr>
				</c:forEach>
				<tr>
				<th></th>
				<th></th>
				</tr>
		</tbody>
	</table>


</div>
</div>