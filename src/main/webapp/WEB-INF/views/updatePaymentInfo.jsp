<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false"%>

<script>
.btn {
	width: 40%;
}
</script>

<div class="mainbody">

<div class="employerRegi">
<c:if test="${not empty success}">
<div class="highlight-3" title="Update Credit Card">
	Credit Card Update Successful.
</div>
</c:if>
<c:url var="ermployerregistrationurl" value="/employer/update-payment-info" />
<div class="headersection">
<h1>Update Credit Card Info</h1>
</div>
<form:form method="POST" id="employer-edit" action="${ermployerregistrationurl}">
	<div>
    <p style="margin: 0 auto; text-align: center;"><strong>Card Number:</strong> <br>************${test.last4}</p>
	</div>
	<label>New Card Number</label>
	<input type="text" name="card_number" id="card_number" value=""  />
	<label>Exp Month :</label>
	<input type="text" name="exp_month" id="exp_month" value="" class="validate[required, custom[phone]]"  />
	<label>Exp year :</label>
	<input type="text" name="exp_year" id="exp_year"  value="" class="validate[custom[phone]]"/>
	<label>CVV :</label>
	<input type="text" name="cvv" id="cvv"  value="" class="validate[required, custom[onlyLetterSp],minSize[3],maxSize[30]]"/>
	<br>
	<input type="hidden" name="employerID" id="employerID" value="${emp.employerID}">
    <input type="hidden" name="emp_email" id="emp_email" value="${emp.pocEmail}">
	<br>
	<input type="submit" class='btn' value="Update" style="width: 40%;"/>
</form:form>
</div>
        <div style="float: left; clear: both"></div>
</div>

