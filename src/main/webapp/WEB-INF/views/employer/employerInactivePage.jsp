<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--   
<div class="mainbodytext">
<p>Thank you for registering for HUBZone Talent. We are close to being able to give you access to the nation&rsquo;s premier HUBZone Search and Job Posting site. In order to gain access, you will have to complete payment for the package you have selected. Somebody from our team should be contacting you shortly, but feel free to reach out to us at <a href="mailto:support@HUBZoneTalent.com">support@HUBZoneTalent.com</a>. Thank you and welcome to the site!</p>
</div>
-->


<div class="mainbody">
	<div class="" style="width: 50%; border:3px solid #E4F3F6;margin: 0 auto;">
		<h2 style="font-size: 14px; font-weight: bold; background-color:#E4F3F6; padding: 10px; margin: 0; border: 1px solid #E4F3F6;">PAYMENT OPTIONS</h2>
<%-- 		<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
		<input type="hidden" name="cmd" value="_s-xclick">
		<input type="hidden" name="hosted_button_id" value="GXNPWYGH7AC8S">
		<div class="" style="margin-bottom: 20px;">
			<input type="hidden" name="on0" value="Payment Options">
			<select name="os0" style="height: 30px;">
	        	<option value="Option 1">Option 1 : $99.00 USD - monthly</option>
	            <option value="Option 2">Option 2 : $899.00 USD - yearly</option>
			</select>
		</div>
		<div class="">
			<input type="hidden" name="currency_code" value="USD">
			<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
			<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
		</div>	
		</form> --%>
<form:form method="POST" id="employer-edit" action="/employer/updateInfo">
                <input type="hidden" name="employerID" id="employerID" value="${empData.employerID}">
                <label>Business Name :</label>
                <input type="text" name="companyName" id="CompanyName" value="${empData.companyName}" class="validate[required, custom[onlyLetterSp],minSize[3],maxSize[30]]">
                <label>Email:</label>
                <input type="text" name="pocEmail" id="pocEmail" value="${empData.pocEmail}"><br>
                <input type="submit" class="btn" value="Update" style="margin: 5px 0px;">
</form:form>
<!--	<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
		<input type="hidden" name="cmd" value="_s-xclick">
		<input type="hidden" name="hosted_button_id" value="WJ6EY86WUB2MN">
		<input type="hidden" name="a3" value="299.00">
		<input type="hidden" name="p3" value="3">
		<input type="hidden" name="t3" value="M">
		<input type="hidden" name="src" value="1">
		<input type="hidden" name="sra" value="1">
		<table>
		<tr><td><input type="hidden" name="on0" value="Subscription Options">Subscription Options</td></tr><tr><td><select name="os0">
			<option value="Option 1">Option 1 : $149.00 USD - monthly</option>
			<option value="Option 1">Option 2 : $299.00 USD - quarterly</option>
			<option value="Option 3">Option 3 : $999.00 USD - yearly</option>
		</select> </td></tr>
		</table>
		<input type="hidden" name="currency_code" value="USD">
		<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
		<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
	
	
	</form>-->
                
            <form:form method="POST" id="employer-edit" action="/employer/subscribe">

		<table style="width:600px">
		<tr><td><input type="hidden" name="on0" value="Subscription Options">Subscription Options</td></tr><tr><td>
                    <c:if test="${param.failed != null}"><label style="color:red;">Please fill up all fields.</label></c:if>
                    <c:if test="${param.invalid != null}"><label style="color:red;">Credit Card is Invalid</label></c:if>
                    <label>Card Number :</label>
                    <input type="text" name="card_number" id="card_number" placeholder="Card Number" /><br>
                    <label>Expiry :</label>
                    <input type="number" max="" name="exp_month" id="exp_month" placeholder="mm" />
                    <input type="number" name="exp_year" id="exp_year" placeholder="yy" /><br>
                    <label>CVV :</label>
                    <input type="number" name="cvv" id="cvv" placeholder="ccv/cvv" /><br>
                    <label>Plan :</label>
                    <select name="subscription_plan" id="subscription_plan">
			<option value="monthly-fee">Option 1 : $149.00 USD - monthly</option>
			<option value="quarterly-fee">Option 2 : $299.00 USD - quarterly</option>
			<option value="yearly-fee">Option 3 : $999.00 USD - yearly</option>
                    </select> 
                    <input type="hidden" name="employerID" id="employerID" value="${empData.employerID}">
                    <input type="hidden" name="emp_email" id="emp_email" value="${empData.pocEmail}"></td></tr>
		</table>
		<input type="submit" class="btn" value="Subscribe" style="margin: 5px 0px;">
	
	
	</form:form>
		
	</div>		
</div>