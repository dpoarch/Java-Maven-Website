<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="mainbody">
<div class="employerRegi">
<div class="headersection">
<h1>Forgot Username</h1>
</div>
<c:if test="${not empty message}">
${message} 
</c:if>
<c:if test="${ empty message}">

<c:url var="action" value="/username-recovery" />
	<form:form method="POST" id="forgotpass"
	
		action='${action}'>
		<div id="forgot-username" style="text-align: center;">
			<label>Enter Your Email Address To Retrieve Your Username :</label> <input
				type="text" name="emailId" id="for-pass" /> <input type="submit"
				id="forgot-password-submit" value="Submit">
		</div>
	</form:form>
</c:if>
</div>
</div>
