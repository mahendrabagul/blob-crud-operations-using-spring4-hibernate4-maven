<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>BlobCRUD Operations</title>
<style type="text/css">
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,font,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,input
	{
	font-size: 100%;
}

body {
	font-family: sans-serif;
	font-size: 12px;
}

.data,.data td {
	border-collapse: collapse;
	width: 550px;
	border: 1px solid #aaa;
	padding: 2px;
}

.data th {
	background-color: #9ECFFF;
	color: black;
	font-weight: bold;
}

h1,h2,h3 {
	font-family: Trebuchet MS, Liberation Sans, DejaVu Sans, sans-serif;
	font-weight: bold;
}

h1 {
	font-size: 170%;
}

h2 {
	font-size: 140%;
}

h3 {
	font-size: 120%;
}

#wrapper {
	height: 250;
	width: 100%;
	overflow: auto;
}
</style>


<script
	src="${pageContext.request.contextPath}/themes/bootstrap/js/jquery-1.11.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/themes/bootstrap/js/jquery.validate.js"></script>
<link
	href="${pageContext.request.contextPath}/themes/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body>
	<nav role="navigation" class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<h1>
					<a href="#" style="text-decoration: none;"> Spring4-Hibernate4
						CRUD application | Document Manager </a>
				</h1>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<fieldset>
					<legend>Create New Document</legend>

					<form:form method="post" action="save.html" commandName="document"
						enctype="multipart/form-data" role="form">
						<div class="form-group">

							<table class="table" border=2px>
								<tr>
									<td><form:label path="name">Name</form:label></td>
									<td><form:input path="name" class="form-control" /></td>
								</tr>
								<tr>
									<td><form:label path="description">Description</form:label></td>
									<td><form:textarea path="description" class="form-control" /></td>
								</tr>
								<tr>
									<td><form:label path="content">Document</form:label></td>
									<td><input type="file" name="file" id="file"></input></td>
								</tr>
								<tr>
									<td colspan="2"><input class="btn btn-primary"
										type="submit" value="Add Document" /></td>
								</tr>
							</table>
						</div>
					</form:form>
				</fieldset>

				<br />
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-body">
				<fieldset>
					<legend>List of Blob Documents</legend>
					<c:if test="${!empty documentList}">
						<div id="wrapper">

							<table class="data table">
								<thead>
									<tr>
										<th>Name</th>
										<th>Description</th>
										<th>Operations</th>
									</tr>
								</thead>
								<c:forEach items="${documentList}" var="document">
									<tr>
										<td width="100px">${document.name}</td>
										<td width="250px">${document.description}</td>
										<td width="20px"><a
											href="${pageContext.request.contextPath}/download/${document.id}.html"><img
												src="${pageContext.request.contextPath}/img/save_icon.gif"
												border="0" title="Download this document" /></a> <a
											href="${pageContext.request.contextPath}/remove/${document.id}.html"
											onclick="return confirm('Are you sure you want to delete this document?')"><img
												src="${pageContext.request.contextPath}/img/delete_icon.gif"
												border="0" title="Delete this document" /></a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:if>
				</fieldset>
			</div>
		</div>
	</div>
	<!--Bottom(Footer) Content -->

	<div class="navbar navbar-default navbar-fixed-bottom">
		<div class="container">
			<p class="navbar-text pull-left">
				Designed by:<b> Mahendra Bagul (+918484947814)</b>
			</p>
			<p class="navbar-text pull-right">
				Say thanks at <b>bagulm123@gmail.com</b>
			</p>
		</div>
	</div>
	<!-- End of Bottom(Footer) Content -->
</body>
</html>
