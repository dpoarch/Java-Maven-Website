

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page session="false"%>

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
	<div class="table-style">
		<h3><b>Company Profile</b></h3>
		<c:if test="${empty employer}">
			No Information Found. testing
		</c:if>
		<c:if test="${not empty employer}">
		<table>
			<tbody>
				<tr>
					<td><strong>Company Name</strong></td>
					<td><c:out value="${employer.companyName}"/></td>
				</tr>
				<tr>
					<td><strong>Company Street</strong></td>
					<td><c:out value="${employer.companyStreetAddress1}"/></td>
				</tr>
				<tr>
					<td><strong>Company City</strong></td>
					<td><c:out value="${employer.companyCity}"/></td>
				</tr>
				<tr>
					<td><strong>Company State</strong></td>
					<td><c:out value="${employer.companyState}"/></td>
				</tr>
				<tr>
					<td><strong>Company Zip</strong></td>
					<td><c:out value="${employer.companyZip}"/></td>
				</tr>
				<tr>
					<td><strong>Company Email</strong></td>
					<td><c:out value="${user.email}"/></td>
				</tr>
				<tr>
					<td><strong>Remaining Job Posts</strong></td>
					<td><c:out value="${employer.jobCountLimit}"/></td>
				</tr>
			</tbody>
		</table>
		</c:if>
	</div>
	<div style="float: left; clear: both"></div>
</div>
