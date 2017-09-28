<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function() {
		jQuery("#sendEmailForm").validationEngine('attach', {
			promptPosition : "centerRight",
			scroll : false
		});
	});
</script>
<style>
	article form {
		width: 400px;
	}
</style>

<div class="mainbody">
<div class="employerRegi">
<div class="headersection"><h1>HubzoneTalent</h1></div>
	<!--  <p align="center"><b>Contact Us</b></p>
<p align="center"><b>Please email the following for any questions:</b></p>
<p align="center">General Information:  <a href="mailto:info@hubzonetalent.com">info@hubzonetalent.com</a></p>
<p align="center">Technical Problems:  <a href="mailto:support@hubzonetalent.com">support@hubzonetalent.com</a></p>-->
	<c:if test="${not empty error}">
		<div class="highlight-1">Error sending Email.</div>
	</c:if>
	<c:if test="${not empty successful}">
		<div class="highlight-3">Successful sending Email.</div>
	</c:if>
	<c:url var="sendEmail" value="/contact-us" />
	<form:form method="POST" id="sendEmailForm" action="${sendEmail}">
		<label>Send To:</label>
		<select name="to" id="to">
			<option value="info@hubzonetalent.com" selected="selected">General
				Information</option>
			<option value="support@hubzonetalent.com">Technical Issues</option>
		</select>

		<label>Name: *</label>
		<input type="text" name="name" id="name"
			class="validate[required, custom[onlyLetterSp],minSize[2],maxSize[30]]" />

		<label>Email: *</label>
		<input type="text" name="emailFrom" id="emailFrom" 
			class="validate[required,custom[email]]" />

		<label>Subject: *</label>
		<input type="text" name="subject" id="subject" value="${email.subject}"
			class="validate[required,minSize[1],maxSize[100]]" />

		<label>Concerns: *  (max 500 char)</label>
		<textarea id="body" name="body" rows="24" cols="50"
			class="validate[required],minSize[1],maxSize[500]"></textarea>
		<input type="submit" class='btn' id="btn" value="Send"
			style="margin: 0 auto;" />
	</form:form>

	<p align="center">
		<b>You can also contact us directly at:</b>
	</p>
	<p align="center">
		General Info: <a href="mailto:info@hubzonetalent.com">info@hubzonetalent.com</a>
	</p>
	<p align="center">
		Technical Issues: <a href="mailto:support@hubzonetalent.com">support@hubzonetalent.com</a>
	</p>
</div>
</div>
