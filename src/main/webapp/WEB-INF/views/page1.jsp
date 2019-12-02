<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <%@page import="home.estore.core.model.estore.AssembledPC"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Compose your PC</title>
 	<c:url value="/assets/test1.css" var="jstlCss" />
		<link href="${jstlCss}" rel="stylesheet" />
        <c:url value="/assets/page1.css" var="jstlCss3" />
		<link href="${jstlCss3}" rel="stylesheet" />
 
</head>
<body>
   <jsp:include page="header.jsp" />
 
 	<script>
	 	function toggleCategory(cssClass){
		 		$('div.productsList:not(.productsList.'+cssClass+")").hide();
			 		if($("div.productsList."+cssClass).is(':visible')){
			 			$("div.productsList."+cssClass).hide();
			 		}
			 		else{
			 			$("div.productsList."+cssClass).show();
			 		}
			 	}
	 	function toggleSelected(item,type){
		 		$(item).parent('.product-item-template').siblings().find('.selected-container.selected-item').removeClass('selected-item');
		 		
		 		if($(item).hasClass('selected-item')){
		 			
// 		 			removeItemFromAssembledPC(item,type);
		 			
		 			$(item).removeClass('selected-item');
		 		}
		 		else{
// 		 			addItemToAssembledPC(item,type);
		 			$(item).addClass('selected-item');
		 		}
		}
	 	function addItemToAssembledPC(item,pctype){
	 		$.ajax({
				type: 'POST',
				dataType: "json",
				url: "<c:url value="/web/addItem" />",
				data: "type="+ pctype+"&item="+ item.id,
				success: function(response) { 
					 var msg = response;
					 alert(msg);
					
				}  
			});
	 	}
	 	function removeItemFromAssembledPC(item,pctype){
	 		$.ajax({
				type: 'POST',
				dataType: "json",
				url: "<c:url value="/web/removeItem" />",
				data: "type="+ pctype+"&item="+ item.id,
				success: function(response) { 
					 var msg = response;
					 alert(msg);
				}  
			});
	 	}
	</script>
				
	<div class="bto-header">
		<div class="header-text">Compose your PC</div>
		
		<%  AssembledPC assembledPC = (AssembledPC)request.getSession().getAttribute("assembledPC");
        	if(assembledPC != null && assembledPC.getCpu() != null && assembledPC.getHardDrive() != null && assembledPC.getMonitor() != null && assembledPC.getMemories().size() > 0 ){
        		%>
        			<a class="buy-button" style="color:white"href="${pageContext.request.contextPath}/web/addMsOffice">Proceed</a>
        		<%
        	}
		%>
		
		
	</div> 
	
	<div class="bto-steps-container">
        <div class="bto-steps-content" style="left: 0px;">
            <div class="clearfix" >
            
                <div class="bto-step" onclick="toggleCategory('cpu')">
                    <div class="step-num alert-message">
                    	<c:set var="assembledCPU" value="false" />
						<c:if test="${not empty assembledPC.cpu}">
							<c:set var="assembledCPU" value="true" />
						</c:if>
						<c:if test="${assembledCPU == false}">
							 <div class="alert-icon">
	                            <img src="<c:url value='/assets/images/icons/alert-icon.png'/>">
	                        </div>
						</c:if>
						<c:if test="${assembledCPU == true}">
							 <div class="success-check">
	                            <img src="<c:url value='/assets/images/icons/check-icon.png'/>">
	                        </div>
						</c:if>
                       
                        <span class="step-id">1</span>
                    </div>
                    <div class="bto-step-icon completed">
                        <img  src="<c:url value='../assets/images/icons/CPU.png'/>">
                        <span >CPU</span>
                    </div>
                </div>
            
                <div class="bto-step" onclick="toggleCategory('memory')">
                    <div class="step-num alert-message">
                    <%
                    	if(assembledPC != null && assembledPC.getMemories().size() > 0){
                    		%>
                    		<div class="success-check">
	                            <img src="<c:url value='/assets/images/icons/check-icon.png'/>">
	                        </div>
                    		<%
                    	}
                    	else{
                    		%>
                    		<div class="alert-icon">
	                            <img src="<c:url value='/assets/images/icons/alert-icon.png'/>">
	                        </div>
                    		<%
                    	}
                    %>
                        <span class="step-id">2</span>
                    </div>
                    <div class="bto-step-icon completed">
                        <img src="<c:url value='/assets/images/icons/RAM.png'/>">
                        <span >Memory</span>
                    </div>
                </div>
            
                <div class="bto-step" onclick="toggleCategory('dhdrive')">
                    <div  class="step-num alert-message">
                        <c:set var="assembledHardDrive" value="false" />
						<c:if test="${not empty assembledPC.hardDrive}">
							<c:set var="assembledHardDrive" value="true" />
						</c:if>
						<c:if test="${assembledHardDrive == false}">
							 <div class="alert-icon">
	                            <img src="<c:url value='/assets/images/icons/alert-icon.png'/>">
	                        </div>
						</c:if>
						<c:if test="${assembledHardDrive == true}">
							 <div class="success-check">
	                            <img src="<c:url value='/assets/images/icons/check-icon.png'/>">
	                        </div>
						</c:if>
                        <span class="step-id">3</span>
                    </div>
                    <div class="bto-step-icon completed">
                        <img src="<c:url value='/assets/images/icons/HDD.png'/>">
                        <span >Hard Drive</span>
                    </div>
                </div>
            
                <div class="bto-step" onclick="toggleCategory('monitor')">
                    <div class="step-num ">
                        <c:set var="assembledMonitor" value="false" />
						<c:if test="${not empty assembledPC.monitor}">
							<c:set var="assembledMonitor" value="true" />
						</c:if>
						<c:if test="${assembledMonitor == false}">
							 <div class="alert-icon">
	                            <img src="<c:url value='/assets/images/icons/alert-icon.png'/>">
	                        </div>
						</c:if>
						<c:if test="${assembledMonitor == true}">
							 <div class="success-check">
	                            <img src="<c:url value='/assets/images/icons/check-icon.png'/>">
	                        </div>
						</c:if>
                        <span class="step-id">4</span>
                    </div>
                    <div class="bto-step-icon completed">
                        <img src="<c:url value='/assets/images/icons/MONITOR.png'/>">
                        <span>Monitor</span>
                    </div>
                </div>
            </div>
        </div>
    </div>       
    
    <div class="product-header-container">
        <div class="product-header-content">
            <span class="product-num" style="color: black; font-size: 13px;">Products</span>
        </div>
    </div>
    
    <div class="product-content">
            
        <div class="product-preview-container jspScrollable" tabindex="0" style="overflow: hidden; padding: 0px; width: 965px;">
                
        <div class="jspContainer clearfix" >
            	
	            	<div class="productsList cpu" 	  style="width: 100%; display:none">
	            		<c:if test="${not empty cpuList}">
							<c:forEach var="listValue" items="${cpuList}">
								<div class="product-item-template">
									<c:set var="contains" value="false" />
									<c:if test="${assembledPC.cpu.id == listValue.id}">
									   <c:set var="contains" value="true" />
									</c:if>
									<c:if test="${contains == false}">
										<div class="selected-container " onclick="toggleSelected(this,'cpu')">
									</c:if>
			                        <c:if test="${contains == true}">
										<div class="selected-container selected-item" onclick="toggleSelected(this,'cpu')">
									</c:if>
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${listValue.image}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${listValue.descr}</span>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${listValue.price}" type="currency"/></span>
			                                </div>
												
											<c:if test="${contains == false}">
													<a class="btn btn-secondary m-2"  href="${pageContext.request.contextPath}/web/addItem?id=${listValue.id}&type=cpu">+</a>
											</c:if>
											<c:if test="${contains == true}">
													<a class="btn btn-secondary m-2"  href="${pageContext.request.contextPath}/web/removeItem?id=${listValue.id}&type=cpu">-</a>
											</c:if>
			                            </div>
			                        </div>
			                    </div>
							</c:forEach>
						</c:if>
	                </div>
	                <div class="productsList memory"  style="width: 100%; display:none">
	                	<c:if test="${not empty memoryList}">
							<c:forEach var="listValue" items="${memoryList}">
								<div class="product-item-template">
									<c:set var="contains" value="false" />
									<c:forEach var="memories" items="${assembledPC.memories}">
											  <c:if test="${memories.id == listValue.id}">
											    <c:set var="contains" value="true" />
											  </c:if>
									</c:forEach>
									<c:if test="${contains == false}">
										<div class="selected-container " onclick="toggleSelected(this,'memory')">
									</c:if>
			                        <c:if test="${contains == true}">
			                        	<div class="selected-container selected-item" onclick="toggleSelected(this,'memory')">
									</c:if>
			                        
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${listValue.image}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${listValue.descr}</span>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${listValue.price}" type="currency"/></span>
			                                </div>
			                                <input type="number" name="quantity" value="1" class="form-control memory-multi">
												
											<c:if test="${contains == false}">
													<a class="btn btn-secondary m-2"  href="${pageContext.request.contextPath}/web/addItem?id=${listValue.id}&type=memory">+</a>
											</c:if>
											<c:if test="${contains == true}">
													<a class="btn btn-secondary m-2"  href="${pageContext.request.contextPath}/web/removeItem?id=${listValue.id}&type=memory">-</a>
											</c:if>
			                               	
			                            </div>
			                        </div>
			                    </div>
							</c:forEach>
						</c:if>
	                </div>
	                <div class="productsList dhdrive" style="width: 100%; display:none">
	                    <c:if test="${not empty hardDriveList}">
							<c:forEach var="listValue" items="${hardDriveList}">
								<div class="product-item-template">
									<c:set var="contains" value="false" />
									<c:if test="${assembledPC.hardDrive.id == listValue.id}">
									   <c:set var="contains" value="true" />
									</c:if>
									<c:if test="${contains == false}">
										<div class="selected-container " onclick="toggleSelected(this,'dhdrive')">
									</c:if>
			                        <c:if test="${contains == true}">
			                        	<div class="selected-container selected-item" onclick="toggleSelected(this,'dhdrive')">
									</c:if>
			                        
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${listValue.image}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${listValue.descr}</span>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${listValue.price}" type="currency"/></span>
			                                </div>
											<c:if test="${contains == false}">
													<a class="btn btn-secondary m-2"  href="${pageContext.request.contextPath}/web/addItem?id=${listValue.id}&type=hardDrive">+</a>
											</c:if>
											<c:if test="${contains == true}">
													<a class="btn btn-secondary m-2"  href="${pageContext.request.contextPath}/web/removeItem?id=${listValue.id}&type=hardDrive">-</a>
											</c:if>
			                            </div>
			                        </div>
			                    </div>
							</c:forEach>
						</c:if>
	                </div>
	                <div class="productsList monitor" style="width: 100%; display:none">
	                    <c:if test="${not empty monitorist}">
							<c:forEach var="listValue" items="${monitorist}">
								<div class="product-item-template">
									<c:set var="contains" value="false" />
									<c:if test="${assembledPC.monitor.id == listValue.id}">
									   <c:set var="contains" value="true" />
									</c:if>
									<c:if test="${contains == false}">
										<div class="selected-container " onclick="toggleSelected(this,'monitor')">
									</c:if>
			                        <c:if test="${contains == true}">
			                        	<div class="selected-container selected-item" onclick="toggleSelected(this,'monitor')">
									</c:if>
			                        
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${listValue.image}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${listValue.descr}</span>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${listValue.price}" type="currency"/></span>
			                                </div>
											<c:if test="${contains == false}">
													<a class="btn btn-secondary m-2"  href="${pageContext.request.contextPath}/web/addItem?id=${listValue.id}&type=monitor">+</a>
											</c:if>
											<c:if test="${contains == true}">
													<a class="btn btn-secondary m-2"  href="${pageContext.request.contextPath}/web/removeItem?id=${listValue.id}&type=monitor">-</a>
											</c:if>
			                            </div>
			                        </div>
			                    </div>
							</c:forEach>
						</c:if>
	                </div>
			</div>
		</div>
           
 	</div>
 
 
</body>
</html>