<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="f" uri="/WEB-INF/functions.tld" %>

<div class="mainbody">					
				<div class="vevent">
					<div class="headersection">
						<h1>Job Category</h1>
					</div>
					<div id="jobCategoryTable">
						<div id="jobCategoryLeft">				
						 
							<ul>
								
								<c:forEach var="category" items="${jobCategories}" begin="0" end="${catSep}" step="1" varStatus ="status">
									<%--  <c:url var="url" value="/jobs/category/${f:encodeUri(category.jobCategoryName)}"/> --%> 
										
									<c:url value="/jobs/category" var="url">
										 <c:param name="cat" value="${category.jobCategoryName}"/>	 									   
										</c:url> 									
									<li><a href="<c:out value="${url}" />">${category.jobCategoryName}(${category.numJobs})</a></li>
								</c:forEach>
								
							</ul>
					
						
					</div>
						<div id="jobCategoryRight">
							<ul>
								<c:forEach var="category" items="${jobCategories}" begin="${catSep+1}" end="${catEnd}" step="1" varStatus ="status">
											<%-- <c:url var="url" value="/jobs/category?cat=${category.jobCategoryName}"/> --%>
											<c:url value="/jobs/category" var="url">
											   <c:param name="cat" value="${category.jobCategoryName}"/>										   
											</c:url> 								
										<li><a href="<c:out value="${url}" />">${category.jobCategoryName}(${category.numJobs})</a></li>
								</c:forEach>
							</ul>
							
							
						 </div>	
						 </div>
					</div>
					<div style="float:left;clear:both"></div>
</div>
