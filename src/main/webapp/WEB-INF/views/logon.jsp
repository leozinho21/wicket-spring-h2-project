<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>

	<%
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
	%>
 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

	<%@page contentType="text/html"%>
	<%@page pageEncoding="UTF-8"%>





	<head>
	
		<meta http-equiv="Pragma" content="no-cache">
			<meta http-equiv="expires" content="0">
				<title><s:message code="label.storeadministration"
						text="Store administration" />
				</title>


<style type=text/css>
#logon {
	margin: 0px auto;
	width: 550px
}

#login-box {
/* 	width: 333px; */
/* 	height: 352px; */
	padding: 58px 76px 0 76px;
	font: 12px Arial, Helvetica, sans-serif;
}

#login-box h2 {
	padding: 0;
	margin: 0;
	font: bold 36px "Calibri", Arial;
	border-bottom: 2px solid;
	padding-bottom: 0px;
}

#controls {
	margin-left: -50px;
	margin-top: 30px;
}
.sm label {
	color:black;
	font-size: 16px;
}

.sm a {
	color: #EBEBEB;
	font-size: 16px;
}

</style>
<%--  <link type="text/css" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" /> --%>
<%--  <script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js' />" type="text/javascript"></script> --%>

<%-- 		<script src="<c:url value="/resources/js/bootstrap/jquery.js" />"></script> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js"></script>
 	<link type="text/css" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" />
 	<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
 	<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js' />" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value="/assets/jquery-cookie.js"/>"></script>
		<script src="<c:url value="/assets/bootstrap-modal.js" />"></script>




				<script language="javascript">
				
				function getUserInformation() {
					
					var userName = $('#username').val();
			        
					if(!userName){
					    alert("<s:message code="message.username.required" text="User name is required" />");
				    }
 		        }
				
				

	$(document)
			.ready(
					function() {
						
						var username = $.cookie('usernamecookie');
						if (username != null && username != '') {
							$('#username').val(username);
							$('#remember').attr('checked', true);
						}

						$("#formSubmitButton")
								.click(
										function() {
											
											

											var hasError = false;
											$('#username_help').html("");
											$('#password_help').html("");
											
											
											if ($('#remember').attr('checked')) {
												$.cookie('usernamecookie', $(
														'#username').val(), {
													expires : 1024,
													path : '/'
												});
											} else {
												$.cookie('usernamecookie',
														null, {
															expires : 1024,
															path : '/'
														});
											}
											if ($.trim($('#username').val()) == '') {
												hasError = true;
												$('#username_help')
														.html(
																"<font color='red' size='4'><strong>*</strong></font>");
											}

											if ($.trim($('#password').val()) == '') {
												hasError = true;
												$('#password_help')
														.html(
																"<font color='red' size='4'><strong>*</strong></font>");
											}

											if (!hasError) {
												$("#logonForm").submit();
											}

										});

					});
</script>
	</head>

	<body>

		<div id="tabbable" class="sm">
			
			<br />
			<br />

			<div id="logon" class="container">

				<div class="row">
					<c:if test="${not empty param.login_error}">
						<div class="alert alert-error">
							<s:message code="errors.invalidcredentials"
								text="Invalid username or password" />
						</div>
					</c:if>
				</div>

				<div id="login-box">


					<div class="row">
						<div style="float: left; width: 180px;">
							<p class="lead">
								<s:message code="button.label.logon" text="Login"></s:message>
							</p>
						</div>
					</div>

					<div class="row">
						<div id="controls">

							<form method="post" id="logonForm" class="form-horizontal" action="<c:url value="login"/>">
								<div class="control-group">
									<label class="control-label mt-2" for="inputUser">
										<s:message code="label.username" text="Username" />
									</label>
									<div class="controls">
										<input type="text" id="username" name="username"
											placeholder="<s:message code="label.username" text="Username" />"class="form-control">
											<span id="username_help" class="help-inline"></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label mt-2" for="inputPassword">
										<s:message code="label.password" text="Password" />
									</label>

									<div class="controls">
										<input type="password" id="password" name="password"
											placeholder="<s:message code="label.password" text="Password"/>"class="form-control">
											<span id="password_help" class="help-inline"></span>
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<a href="#" class="btn btn-primary mt-3" id="formSubmitButton"> Submit </a>
									</div>
								</div>
							</form>
						</div>
					</div>
		
					<!-- code for reset password-username prompt   sajid shajahan -->
				</div>
			</div>
		</div>

	</body>
</html>