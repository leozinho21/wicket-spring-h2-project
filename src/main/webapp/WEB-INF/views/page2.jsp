<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <%@page import="home.estore.core.model.estore.AssembledPC"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Select MS Office</title>
 	<c:url value="/assets/test1.css" var="jstlCss" />
		<link href="${jstlCss}" rel="stylesheet" />
        <c:url value="/assets/page1.css" var="jstlCss3" />
		<link href="${jstlCss3}" rel="stylesheet" />
 
</head>
<body>
   <jsp:include page="header.jsp" />
 
	<div class="bto-header">
		<div class="header-text">Select Ms Office 365 service</div>
        <a class="buy-button" style="color:white"href="${pageContext.request.contextPath}/web/buyPC">Proceed to buy</a>
	</div> 
	
	<div class="product-content">
            
        <div class="product-preview-container jspScrollable" tabindex="0" style="overflow: hidden; padding: 0px; width: 965px;">
                
        	<div class="jspContainer clearfix" >
            	
	            	<div class="productsList cpu" 	  style="width: 100%">
	            		<c:if test="${not empty shoppingCart.microsoftService}">
								<div class="product-item-template">
									<div class="selected-container selected-item" onclick="toggleSelected(this,'cpu')">
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${shoppingCart.microsoftService.imgUrl}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${shoppingCart.microsoftService.name}</span>
			                                	<a target="_blank" href="${shoppingCart.microsoftService.moreUrl}">More</a>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${shoppingCart.microsoftService.price}" type="currency"/></span>
			                                </div>
											
											<a class="btn btn-primary m-2"  href="${pageContext.request.contextPath}/web/removeMsOffice?officeCode=${shoppingCart.microsoftService.code}">Remove</a>
			                            </div>
			                        </div>
			                </div>
			             </c:if>
	            		<c:if test="${not empty office365Family}">
								<div class="product-item-template">
									<div class="selected-container " onclick="toggleSelected(this,'cpu')">
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${office365Family.imgUrl}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${office365Family.name}</span>
			                                	<a target="_blank" href="${office365Family.moreUrl}">More</a>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${office365Family.price}" type="currency"/></span>
			                                </div>
											<a class="btn btn-primary m-2"  href="${pageContext.request.contextPath}/web/buyMsOffice?officeCode=${office365Family.code}">Add</a>
			                            </div>
			                        </div>
			                </div>
			             </c:if>
			             <c:if test="${not empty office365Personal}">
			                <div class="product-item-template">
									<div class="selected-container " onclick="toggleSelected(this,'cpu')">
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${office365Personal.imgUrl}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${office365Personal.name}</span>
			                                	<a href="${office365Personal.moreUrl}">More</a>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${office365Personal.price}" type="currency"/></span>
			                                </div>
											<a class="btn btn-primary m-2"  href="${pageContext.request.contextPath}/web/buyMsOffice?officeCode=${office365Personal.code}">Add</a>	
			                            </div>
			                        </div>
			                </div>
			             </c:if>
	            	</div>
	        	</div>
	        </div>
 		</div>
 
</body>
</html>