<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Fill Details</title>
 
</head>
<body>
<% if(request.getSession().getAttribute("shoppingCart") == null){
	 response.sendRedirect("/web/shop");
	} 
%>
	 <jsp:include page="header.jsp" />
	
	<div class="cpu category container" style="display:none">
		<div class="row">
			<div tabindex="-1" class="modal fade" id="details">
					<div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Please fill your details</h5>
					      </div>
					       <form method="post" id="adddetails" class="form-horizontal"	action="addPortalUserDetails">
					      	<div class="modal-body">
								<div class="control-group">
									<div class="controls">
										<input type="text" required	id="name" name="name" class="form-control mt-2" placeholder="Name">
										<input type="text" required	id="surname" name="surname" class="form-control mt-2" placeholder="Surname">
										<input type="text" required	id="city" name="city"  class="form-control mt-2" placeholder="City">
										<input type="text" required id="address" name="address" class="form-control mt-2" placeholder="Address">
										<input type="text" required	id="phone" name="phone" class="form-control mt-2" placeholder="Phone">
										<input type="email"required	id="email" name="email" class="form-control mt-2" placeholder="Email">
									</div>
								</div>
						      </div>
						      <div class="modal-footer">
						        <button type="submit" class="btn btn-primary">Submit</button>
						      </div>
						     </form>
					    </div>
					  </div>
				</div>
				
				
		</div>
	</div> 
 
</body>
</html>