<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html>
<head>
<title>MetroTransit - Target</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
<meta name="keywords"
	content="Traventure Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />


<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css" media="all">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" media="all">
<link href="<c:url value="/resources/css/fontawesome-all.min.css" />"
	rel="stylesheet">

<!-- online-fonts -->
<link
	href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<!-- //online-fonts -->

<c:url var="addUrl" value="/getallproviders" />
<c:url var="index" value="/" />


</head>

<body>
	<!-- inner-banner -->
	<div class="inner-banner" id="home">
		<!-- header -->
		<header>
			<div class="container">
				<nav
					class="navbar navbar-expand-lg navbar-light bg-gradient-secondary pt-3">

					<h1>
						<a class="navbar-brand text-white" href="${index}"> <img
							src="<c:url value="/resources/images/logo.png" />"
							class="img-fluid" alt="Responsive image" />MetroTransit <span
							class="text-right">travel any time</span>
						</a>
					</h1>
					<button class="navbar-toggler ml-md-auto" type="button"
						data-toggle="collapse" data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-lg-auto text-center">
							<li class="nav-item   mr-3"><a class="nav-link"
								href="${index}">Home </a></li>
							<li class="nav-item active mr-3"><a class="nav-link"
								href="${addUrl}">Transport <span class="sr-only">(current)</span></a>
							</li>

						</ul>
					</div>

				</nav>
			</div>
		</header>

	</div>
	<!-- breadcrumbs -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${index}">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Transport</li>
		</ol>
	</nav>
	<!-- //breadcrumbs -->
	<!-- services -->
	<section>
		<div>
			<div class="container">
				<table class="table table-striped">
					<thead style="background: #fcf">
						<tr>
							<th>Stop Information : ${businfo}</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nexttrip}" var="direction">
							<c:url var="getnexttrip"
								value="/nexttripdeparture?route=${route}&direction=${nextdirection}&stop=${direction.Text}" />

							<c:if test="${empty direction}">
																No records found!
															</c:if>

							<c:if test="${!empty direction}">

								<tr>
									<td>${direction.Text}</td>
									<td><form:form modelAttribute="nexttripdeparture"
											method="POST" action="${getnexttrip}">

											<input type="hidden" id="code" name="code"
												value="${direction.Value}">
											<input type="submit" value="Go" />
										</form:form></td>
								</tr>

							</c:if>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</section>

	<!-- slide -->
	<section class="slide-main">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 slide"></div>
				<div class="col-md-6 slide-right d-flex">
					<div class="align-self-center px-lg-5 px-md-3 py-5 px-3">
						<h5>you will never miss a great deal if you join our mailing
							list!</h5>

					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- js -->
	<script type="text/javascript"
		src="<c:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<!-- Responsiveslides -->
	<script type="text/javascript"
		src="<c:url value="/resources/js/responsiveslides.min.js"/>"></script>



	<!-- // Responsiveslides -->

	<!-- start-smooth-scrolling -->

	<script type="text/javascript"
		src="<c:url value="/resources/js/move-top.js" />">
		
	</script>
	<script type="text/javascript"
		src="<c:url value="/resources/js/easing.js" />">
		
	</script>
	<script type="text/javascript"
		src="<c:url value="/resources/js/SmoothScroll.min.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/js/bootstrap.js" />">
		
	</script>

</body>

</html>
