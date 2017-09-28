<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@page contentType="text/html;charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page session="false" %> --%>

<script>
$(function() {
	jQuery("#adminEmail").validationEngine('attach', {promptPosition : "centerRight", scroll: false});
	});
	
/* function isInputNumber(field, rules, i, options){
	// This will allow for decimals, signs, and 
	// even scientific notation on the end if you want. 
	var numberRegex = /^[+-]?\d+(\.\d+)?([eE][+-]?\d+)?$/;
	if(numberRegex.test(field.val())) {
		return options.allrules.numberInput.alertText;
	} */
function zipCodeValid(field, rules, i, options){
	// This will allow for decimals, signs, and 
	// even scientific notation on the end if you want. 
	var numberRegex = /^(\d{5})(-\d{4})?$/;
	if(numberRegex.test(field.val())) {
		return options.allRules.zipCodeValidate.alertText;
	}
}
	
	
</script>

<div class="mainbody">
<div class="headersection">
<h1><b>Candidate Email</b></h1>
</div>
<div class="adminEmail">

<c:if test="${not empty messageblock}">
<div class="highlight-3">
${messageblock} 
</div>
</c:if>

<c:if test="${not empty messageblock1}">
<div class="highlight-1">
${messageblock1} 
</div>
</c:if>

<c:url var="formActionUrl" value="send-mass-email" />

<form:form id="adminEmail" action="${formActionUrl}" method="POST" role="form">
	<div>
		<div style="float: left; margin-left: 50px;">
			<label>Subject: *</label>
			<input type="text" name="subject" id="subject" value="${csForm.subject}" class="validate[required]" />
			<label>Description: *</label>
			<textarea id="message" name="message" rows="24" cols="50" value="${csForm.message}" class="validate[required]"></textarea>
		</div>
	</div>
	<br/>
	<input type="submit" class='btn' value="Submit" style="margin-left: 300px;" />


<div class="table-style">
	<h3>Job Seeker: (Total:${fn:length(candidateList)})
	<input type="checkbox" name=choice class="master" onchange="togglecheckboxes(this,'cbgroup1')" />Select All </h3>
	<table id="resultsCandidate">
		<tbody>
			<c:forEach var="admin" items="${candidateList}" varStatus="theCount">
			<tr>				
        		<td><input type="checkbox" name="choosen" class="cbgroup1" value="${theCount.index}${theCount.first ? '-' : ','}${admin.candidateID}"/>${theCount.index} </td>
				<td><b>User Name: </b><a href="<c:url value="/admin/edit-candidate/${admin.candidateID}"/>">${admin.candidateID}</a></td>
				<td><b>First Name: </b><a href="<c:url value="/admin/edit-candidate/${admin.candidateID}"/>">${admin.candidateFirstName}</a></td>
				<td><b>Last Name: </b><a href="<c:url value="/admin/edit-candidate/${admin.candidateID}"/>">${admin.candidateLastName}</a></td>
				<td><b>City: </b><a href="<c:url value="/admin/edit-candidate/${admin.candidateID}"/>">${admin.candidateCity}</a></td>
				<td><b>State: </b><a href="<c:url value="/admin/edit-candidate/${admin.candidateID}"/>">${admin.candidateState}</a></td>
				<td><b>Zip: </b><a href="<c:url value="/admin/edit-candidate/${admin.candidateID}"/>">${admin.candidateZip}</a></td>
				<%-- <td><b>Number of Job: </b><a href="<c:url value="/admin/edit-job-count/${admin.employerID}"/>">${admin.jobCountLimit}</a><br/></td> --%>
			<%-- 	<td>
					<b>Name: </b>${admin.employerID}<br/>
					<b>Number of Job: </b>${admin.jobCountLimit}<br/>
				</td> --%>
				
			</tr>
			</c:forEach>
		</tbody>
		
	</table>


<div id="pageNavPosition"></div><a><b>(Total:${totalResult})</b></a>
	<script type="text/javascript">
	function PagerWithCheckbox(tableName, itemsPerPage,checkboxArray,cbmaster) {
	    this.tableName = tableName;
	    this.itemsPerPage = itemsPerPage;
	    this.currentPage = 1;
	    this.pages = 0;
	    this.inited = false;
	    this.startItem =0;
	    this.endItem=0;
	    this.checkboxArray = checkboxArray;
	    this.cbmaster = cbmaster;
	    
	    this.showRecords = function(from, to) {        
	        var rows = document.getElementById(tableName).rows;
	        // i starts from 1 to skip table header row
	        for (var i = 0; i < rows.length; i++) {
	            if (i < from || i > to)  
	                rows[i].style.display = 'none';
	            else
	                rows[i].style.display = '';
	        }
	    }
	    
	    this.showPage = function(pageNumber) {
	    	if (! this.inited) {
	    		alert("not inited");
	    		return;
	    	}

	        var oldPageAnchor = document.getElementById('pg'+this.currentPage);
	        oldPageAnchor.className = 'pg-normal';
	        
	        this.currentPage = pageNumber;
	        var newPageAnchor = document.getElementById('pg'+this.currentPage);
	        newPageAnchor.className = 'pg-selected';
	        
	        var from = (pageNumber - 1) * itemsPerPage + 1;
	        var to = from + itemsPerPage - 1;
	        this.startItem = from;
	        this.endItem = to;
	        this.showRecords(from, to);
	        this.clearcb();
	    } 
	    
	    this.getStartItemIndex = function(){
	    	return this.startItem;
	    }
	    
	    this.getEndItemIndex = function(){
	    	return this.endItem;
	    }
	    
	    this.prev = function() {
	        if (this.currentPage > 1){
	            this.showPage(this.currentPage - 1);
	            this.clearcb();
	        }
	    }
	    
	    this.next = function() {
	        if (this.currentPage < this.pages) {
	            this.showPage(this.currentPage + 1);
	            this.clearcb();
	        }
	    }                        
	    
	    this.init = function() {
	        var rows = document.getElementById(tableName).rows;
	        var records = (rows.length - 1); 
	        this.pages = Math.ceil(records / itemsPerPage);
	        this.inited = true;
	    }
	    
	    this.clearcb = function(){
	    	
	    	this.cbmaster.checked = false;
	    	for(var i = 0; i < this.checkboxArray.length; i++){		    	
	    		this.checkboxArray[i].checked = false;
		    }
	    }

	    this.showPageNav = function(pagerName, positionId) {
	    	if (! this.inited) {
	    		alert("not inited");
	    		return;
	    	}
	    	var element = document.getElementById(positionId);
	    	
	    	var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> &#171 Prev </span> | ';
	        for (var page = 1; page <= this.pages; page++) 
	            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> | ';
	        pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"> Next &#187;</span>';            
	        
	        element.innerHTML = pagerHtml;
	    }
	    
	    
	}

		cbarray = document.getElementsByClassName('cbgroup1');
		cbmasterArr = document.getElementsByClassName('master');
		pager = new PagerWithCheckbox('resultsCandidate', 450,cbarray,cbmasterArr[0]); 
		pager.init(); 
		pager.showPageNav('pager', 'pageNavPosition'); 
		pager.showPage(1);
		
		
		
		
		function togglecheckboxes(master,group){
			
			var start = pager.getStartItemIndex();
			var end = pager.getEndItemIndex();
		    
		    console.log("start :" + start);
	    	console.log("end :" + end);
		    for(var i = 0; i < cbarray.length; i++){
		    	
		    	var cbValues = cbarray[i].value.split(",");
		    	var cbNo = cbValues[0];
		     	if(cbNo >= start && cbNo <= end){
		        	cbarray[i].checked = master.checked;
		     	}else {
		     		cbarray[i].checked = false;
		     	}
		    }
		}
		
		
	</script>
	</div>
</form:form>
</div>
</div>




