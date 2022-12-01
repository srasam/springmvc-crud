<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>
<title>List Customers</title>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css" />
<script type="text/javascript" charset="utf8"
				src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
			<script type="text/javascript" charset="utf8"
				src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<!-- reference our style sheet -->

<!-- <link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" /> -->

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Customer Management</h2>
		</div>
	</div>

	<div id="container">

		<div id="content">

			<!-- add customer button -->
			<input type="button" value="Add New Customer"
				onclick="window.location.href='addCustomerForm'; return false;"
				class="add-button" />
			<!--  add our html table here -->

			<table id="table_id">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">

					<c:url var="updateLink" value="/customer/UpdateForm">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>

						<td><a href="${updateLink}">edit</a> | <a
							href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete the customer?'))) return false">delete</a></td>
					</tr>

				</c:forEach>

			</table>
			
			<script>
				$(function() {
					$("#table_id").dataTable();
				});
			</script>


		</div>

	</div>


</body>

</html>









