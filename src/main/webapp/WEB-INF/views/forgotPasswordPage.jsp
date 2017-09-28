<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
article form {
	width: 320px;
}
</style>
<div class="mainbody">
<div class="employerRegi">
<div class="headersection">
<h1>Forgot Password</h1>
</div>
<c:if test="${not empty message}">
${message} 
</c:if>
<c:if test="${ empty message}">

<c:url var="action" value="/password-recovery" />
	<form:form method="POST" id="forgotpass"
	
		action='${action}'>
		<div id="forgot-password" style="text-align: center;">
			<label>Enter Your Email Address To Get New Password :</label> <input
				type="text" name="emailId" id="for-pass" /> <input type="submit"
				id="forgot-password-submit" value="Submit">
		</div>
	</form:form>
</c:if>
</div>
</div>
