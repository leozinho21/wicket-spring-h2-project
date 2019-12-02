<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Manage PC Store</title>
 
</head>
<body>
<% if(request.getSession().getAttribute("user") == null){
	 response.sendRedirect("/admin");
	} 
%>
	 <jsp:include page="header.jsp" />
	 <script>
	 	function toggleCategory(cssClass){
	 		
	 		$('div.category:not(.'+cssClass+")").hide();
	 		if($("div."+cssClass).is(':visible')){
	 			$("div."+cssClass).hide();
	 		}
	 		else{
	 			$("div."+cssClass).show();
	 		}
	 	}
	 	function showModal(id) {
			$('#'+id).modal({
				backdrop: true
			})
		}
	 </script>
 
	<div class="header-container">
	    <a class="logout-link"	href="logout">Logout</a>
	    <div class="page-title p-3 m-3"><h3>Categories</h3></div>
	</div>
	
	<div class="categories">
		<button class="btn btn-secondary cpu"	  onclick="toggleCategory('cpu')">CPU</button>
		<button class="btn btn-secondary memories"onclick="toggleCategory('memory')" >MEMORY</button>
		<button class="btn btn-secondary hddrive" onclick="toggleCategory('hddrive')">HD DRIVE</button>
		<button class="btn btn-secondary monitor" onclick="toggleCategory('monitor')">MONITOR</button>
	</div>
	
	<div class="cpu category container" style="display:none">
		<div class="row">
			<button class="btn btn-warning add-cpu" data-toggle="modal" data-target="#addCpu">Add CPU</button>
		</div>
		<div class="row">
		 	<c:if test="${not empty cpuList}">
	
				<ul class="list-group">
					<c:forEach var="listValue" items="${cpuList}">
						<li class="list-group-item">
							<div class="">
								<c:url value="${listValue.image}" var="image" ></c:url>
								<img class="p-2 m-2 image col-md-2 col-xs-11" src="${image}"/>
								<span class="p-2 m-2 col-md-5 col-xs-7" >${listValue.descr}</span>
								<span class="p-2 m-2 col-md-2 col-xs-11"> <fmt:formatNumber value="${listValue.price}" type="currency"/></span>
								<form method="post" class="form-horizontal"	action="removeCPU">
									<c:url value="${listValue.id}" var="id" ></c:url>
									<input type="text" name="id" style="display:none" value="${id}">
									<button type="submit"class="btn btn-secondary delete"title="Remove this item">X</button>
								</form>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade" id="addCpu" style="display: none;">
					<div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Add new CPU</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form method="post" id="addCpuForm" class="form-horizontal"	action="addCPU">
					      	<div class="modal-body">
					       
								<div class="control-group">
									<div class="controls">
										<input type="text" 	id="image" name="image" class="form-control mt-2" placeholder="Image">
										<input type="text" 	id="descr" name="descr" class="form-control mt-2" placeholder="Description">
										<input type="text" 	id="descr" name="code"  class="form-control mt-2" placeholder="Code">
										<input type="number"id="price" name="price" class="form-control mt-2" placeholder="Price">
									</div>
								</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="submit" class="btn btn-primary">Save changes</button>
						      </div>
						     </form>
					    </div>
					  </div>
				</div>
				
				
		</div>
	</div> 
	
	<div class="memory category container" style="display:none">
		<div class="row">
			<button class="btn btn-warning add-memory" data-toggle="modal" data-target="#addMemory">Add Memory</button>
		</div>
		<div class="row">
		 	<c:if test="${not empty memoryList}">
	
				<ul class="list-group">
					<c:forEach var="listValue" items="${memoryList}">
						<li class="list-group-item">
							<div class="">
								<c:url value="${listValue.image}" var="image" ></c:url>
								<img class="p-2 m-2 image col-md-2 col-xs-11" src="${image}"/>
								<span class="p-2 m-2 col-md-5 col-xs-7" >${listValue.descr}</span>
								<span class="p-2 m-2 col-md-2 col-xs-11"> <fmt:formatNumber value="${listValue.price}" type="currency"/></span>
								<form method="post" class="form-horizontal"	action="removeMemory">
									<c:url value="${listValue.id}" var="id" ></c:url>
									<input type="text" name="id" style="display:none" value="${id}">
									<button type="submit"class="btn btn-secondary delete"title="Remove this item">X</button>
								</form>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade" id="addMemory" style="display: none;">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
					    <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Add new Memory</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					    </div>
					    <form method="post" class="form-horizontal"	action="addMemory">
					      	<div class="modal-body">
								<div class="control-group">
									<div class="controls">
											<input type="text" id="image" name="image" class="form-control mt-2" placeholder="Image">
											<input type="text" id="descr" name="descr" class="form-control mt-2" placeholder="Description">
											<input type="text" 	id="descr" name="code"  class="form-control mt-2" placeholder="Code">
											<input type="number" id="price" name="price" class="form-control mt-2" placeholder="Price">
										</div>
									</div>
						    </div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Save changes</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div> 
	
	<div class="hddrive category container" style="display:none">
		<div class="row">
			<button class="btn btn-warning add-hd-drive" data-toggle="modal" data-target="#addHDDrive">Add HD Drive</button>
		</div>
		<div class="row">
		 	<c:if test="${not empty hardDriveList}">
	
				<ul class="list-group">
					<c:forEach var="listValue" items="${hardDriveList}">
						<li class="list-group-item">
							<div class="">
								<c:url value="${listValue.image}" var="image" ></c:url>
								<img class="p-2 m-2 image col-md-2 col-xs-11" src="${image}"/>
								<span class="p-2 m-2 col-md-5 col-xs-7" >${listValue.descr}</span>
								<span class="p-2 m-2 col-md-2 col-xs-11"> <fmt:formatNumber value="${listValue.price}" type="currency"/></span>
								<form method="post" class="form-horizontal"	action="removeHDDrive">
									<c:url value="${listValue.id}" var="id" ></c:url>
									<input type="text" name="id" style="display:none" value="${id}">
									<button type="submit"class="btn btn-secondary delete"title="Remove this item">X</button>
								</form>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade" id="addHDDrive" style="display: none;">
						<div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Add new HD Drive</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <form method="post" class="form-horizontal"	action="addHDDrive">
						      	<div class="modal-body">
									<div class="control-group">
										<div class="controls">
											<input type="text" id="image" name="image" class="form-control mt-2" placeholder="Image">
											<input type="text" id="descr" name="descr" class="form-control mt-2" placeholder="Description">
											<input type="text" 	id="descr" name="code"  class="form-control mt-2" placeholder="Code">
											<input type="number" id="price" name="price" class="form-control mt-2" placeholder="Price">
										</div>
									</div>
						     	</div>
						    	<div class="modal-footer">
						        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        	<button type="submit" class="btn btn-primary">Save changes</button>
						      	</div>
							</form>
						</div>
					</div>
			</div>
		</div>
	</div> 
	
	<div class="monitor category container" style="display:none">
		<div class="row">
			<button class="btn btn-warning add-monitor" data-toggle="modal" data-target="#addMonitor">Add Monitor</button>
		</div>
		<div class="row">
		 	<c:if test="${not empty monitorList}">
	
				<ul class="list-group">
					<c:forEach var="listValue" items="${monitorList}">
						<li class="list-group-item">
							<div class="">
								<c:url value="${listValue.image}" var="image" ></c:url>
								<img class="p-2 m-2 image col-md-2 col-xs-11" src="${image}"/>
								<span class="p-2 m-2 col-md-5 col-xs-7" >${listValue.descr}</span>
								<span class="p-2 m-2 col-md-2 col-xs-11"> <fmt:formatNumber value="${listValue.price}" type="currency"/></span>
								<form method="post" class="form-horizontal"	action="removeMonitor">
									<c:url value="${listValue.id}" var="id" ></c:url>
									<input type="text" name="id" style="display:none" value="${id}">
									<button type="submit"class="btn btn-secondary delete"title="Remove this item">X</button>
								</form>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade" id="addMonitor" style="display: none;">
						<div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Add new Monitor</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <form method="post" class="form-horizontal"	action="addMonitor">
						      	<div class="modal-body">
									<div class="control-group">
										<div class="controls">
											<input type="text" id="image" name="image" class="form-control mt-2" placeholder="Image">
											<input type="text" id="descr" name="descr" class="form-control mt-2" placeholder="Description">
											<input type="text" 	id="descr" name="code"  class="form-control mt-2" placeholder="Code">
											<input type="number" id="price" name="price" class="form-control mt-2" placeholder="Price">
										</div>
									</div>
						      	</div>
						    	<div class="modal-footer">
						        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        	<button type="submit" class="btn btn-primary">Save changes</button>
						      	</div>
							</form>
						</div>
					</div>
			</div>
		</div>
	</div> 
 
</body>
</html>