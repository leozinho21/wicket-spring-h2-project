<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Checkout</title>
 <c:url value="/assets/test1.css" var="jstlCss" />
		<link href="${jstlCss}" rel="stylesheet" />
        <c:url value="/assets/page1.css" var="jstlCss3" />
		<link href="${jstlCss3}" rel="stylesheet" />
</head>
<body>
   <jsp:include page="header.jsp" />
  
  	<div class="bto-header">
		<div class="header-text">Select Ms Office 365 service</div>
        <a class="buy-button" style="color:white"href="${pageContext.request.contextPath}/web/addPortalUserDetails">Checkout</a>
	</div> 
	
   <fmt:setLocale value="en_US" scope="session"/>
 
 	<div class="page-title">Assembled PC preview</div>
 	
	<div class="product-content">
            
        <div class="product-preview-container jspScrollable" tabindex="0" style="overflow: hidden; padding: 0px; width: 965px;">
                
        	<div class="jspContainer clearfix" >
 				<div class="productsList" 	  style="width: 100%;">
					<div class="product-item-template">
						<div class="selected-container selected-item">
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${assembledPC.cpu.image}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${assembledPC.cpu.descr}</span>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${assembledPC.cpu.price}" type="currency"/></span>
			                                </div>
			                            </div>
			         	</div>
	                 </div>
	                 <c:forEach var="listValue" items="${assembledPC.memories}">
								<div class="product-item-template">
			                        	<div class="selected-container selected-item">
			                        
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
			                            </div>
			                        </div>
			                    </div>
					</c:forEach>
					<div class="product-item-template">
			                    <div class="selected-container selected-item" >
			                        
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${assembledPC.hardDrive.image}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${assembledPC.hardDrive.descr}</span>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${assembledPC.hardDrive.price}" type="currency"/></span>
			                                </div>
			                            </div>
			                   </div>
			         </div>
			         <div class="product-item-template">
			                    <div class="selected-container selected-item" >
			                        
			                            <div class="selected-check-icon">
			                                <img src="/assets/images/icons/check-icon.png">
			                            </div>
			                            <div class="product-template-top">
			                                <div class="product-image">
			                                	<c:url value="${assembledPC.monitor.image}" var="image" ></c:url>
												<img class="" src="${image}"/>
			                                </div>
			                                <div class="product-title">
			                                    <span class="" >${assembledPC.monitor.descr}</span>
			                                </div>
			                            </div>
			                            <div class="product-template-middle">
			                                <div class="product-price">
			                                    <span class=""><fmt:formatNumber value="${assembledPC.monitor.price}" type="currency"/></span>
			                                </div>
			                            </div>
			                   </div>
			         </div>
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
			                            </div>
			                        </div>
			                </div>
			             </c:if>
				</div>
				<div class="product-checkout-price">
                            <span class="header">Total</span>
                            <span class="price"><fmt:formatNumber value="${totalPrice}" type="currency"/></span>
                 </div>
			</div>
		</div>
	</div>
 
</body>
</html>