<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.menu {
	display: flex;
	justify-content: space-around;
}

li {
	hover: none;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 50%;
	margin: 0 auto;
}
</style>
<meta charset="ISO-8859-1">
<title>shop cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/demo.css" />" rel="stylesheet">
<link
	href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="w3-top">
		<nav>
			<ul class="w3-navbar w3-pink w3-card-2 w3-medium "
				style="opacity: 0.9">
				<li><a href="/Welcome" class="w3-hover-none"><i
						class="fa fa-home"></i> SHOPCART </a></li>
				<c:choose>
					<c:when test="${LoggedIn}">

						<li style="float: right"><a href="perform_logout"
							class="w3-hover-none"><i class="fa fa-sign-out"></i></a></li>
						<c:choose>
							<c:when test="${!Administrator}">
								<li style="float: right"><a href="viewcart"
									class="w3-hover-none"><i class="fa fa-shopping-cart"></i>(${cartsize})</a></li>
							</c:when>
						</c:choose>

						<li style="float: right"><a href="#" class="w3-hover-none"><i
								class="fa fa-user"></i> Hi, ${name}</a></li>
					</c:when>

					<c:otherwise>
						<li style="float: right"><a href="Register"
							class="w3-hover-none"><i class="fa fa-user-plus"></i></a></li>
						<li style="float: right"><a href="login"
							class="w3-hover-none"><i class="fa fa-sign-in"></i></a></li>
					</c:otherwise>
				</c:choose>
			</ul>

			 <c:choose>
				<%-- <c:when test="${!Administrator}">
					<!-- Category List -->
					<c:if test="${!empty categoryList}">
						<div>
							<ul
								class="w3-navbar w3-light-grey w3-round w3-small menu w3-card-4 "
								Style="width: 70%; margin-left: 15%; margin-top: -2px;">
								<c:forEach items="${categoryList}" var="category">
									<li><a href="${category.name}" class="w3-hover-none"><i
											class="fa fa-list-alt" aria-hidden="true"></i>
											${category.name}</a></li>
								</c:forEach>

							</ul>
						</div>
					</c:if>
				</c:when>
 --%> 
				<c:when test="${Administrator}">
					<ul
						class="w3-navbar w3-light-pink w3-round w3-small menu w3-card-4 "
						Style="width: 70%; margin-left: 15%; margin-top: -2px;">
						<li><a href="product" class="w3-hover-none"><i
								class="fa fa-list" aria-hidden="true"></i> Products</a></li>
						<li><a href="category" class="w3-hover-none"><i
								class="fa fa-list" aria-hidden="true"></i> Category</a></li>
						<li><a href="supplier" class="w3-hover-none"><i
								class="fa fa-list" aria-hidden="true"></i> Supplier</a></li>
					</ul>
				</c:when>
			</c:choose>
		</nav>
	</div>
	<c:choose>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/jsp/cart.jsp">
			</c:import>
		</c:when>

		<c:when test="${IfPaymentClicked}">
			<c:import url="/WEB-INF/jsp/Payment.jsp">
			</c:import>
		</c:when>
	</c:choose>
	<!-- Category List End -->
	<c:choose>
		<c:when test="${IfLoginClicked}">
			<c:import url="/WEB-INF/jsp/logins.jsp">
			</c:import>
		</c:when>

		<c:when test="${IfRegisterClicked}">
			<c:import url="/WEB-INF/jsp/registers.jsp">
			</c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${ProductPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminProductPage.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${CategoryPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminCategoryPage.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${SupplierPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminSupplierPage.jsp"></c:import>
		</c:when>
	</c:choose>

	<!-- carousel -->
	<c:choose>
		<c:when test="${!Administrator}">
			<c:if test="${empty HideOthers}">
				<div>
					<div id="carousel-home" class="carousel slide">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li class=" item1 active"></li>
							<li class="item2"></li>
							<li class="item3"></li>
							<li class="item4"></li>
							<li class="item5"></li>
							<li class="item6"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img
									src="<c:url value="/resources/images/corousel/1.jpg"></c:url>"
									alt="Apple">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item ">
								<img
									src="<c:url value="/resources/images/corousel/2.jpg"></c:url>"
									alt="Apple">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="/resources/images/corousel/3.jpeg"></c:url>"
									alt="Sony">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="/resources/images/corousel/4.jpg"></c:url>"
									alt="HP">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="/resources/images/corousel/5.jpeg"></c:url>"
									alt="Dell">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="/resources/images/corousel/6.png"></c:url>"
									alt="Dell">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" role="button"
							href="#carousel-home" style="color: black"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control " href="#carousel-home"
							role="button" style="color: black"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</c:if>
		</c:when>
	</c:choose>
	<!-- Corousel End -->


	<!-- Product List-->
	<c:if test="${empty HideOthers}">
		<c:choose>
			<c:when test="${!Administrator}">
				<c:if test="${!empty productList}">
					<div>
						<!-- <ul> -->
						<div class="row w3-card-8 w3-margin" style="margin-bottom: 0px">
							<br>
							<c:forEach items="${productList}" var="product">
								<div class="col-xs-2 ">
									<div class="thumbnail">
										<img height="150px" width="150px" alt="${product.id}"
											src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>">
										<div class="caption">
											<p>
												${product.name}
												<c:choose>
													<c:when test="${LoggedIn}">
														<form action="addtoCart/${userId}/${product.id}">
															<input type="number" value="1" name="quantity"
																class="btn btn-xs btn-primary   col-xs-6 ">
															<input type="submit" value="Add" class="btn btn-xs col-xs-6 btn-primary">
														</form>
														
													</c:when>
												</c:choose>
											</p>

										</div>
									</div>
								</div>

								<%-- <li><a href=" ${product.id}" class="w3-hover-none">${product.name}</a></li>
								<li><img alt="Image"
									src="<c:url value="/WEB-INF/resources/images/product/${product.id}.jpg"></c:url>"></li>
								
								<c:choose>
									<c:when test="${LoggedIn}">
											<li><a href="addtoCart/${userId}/${product.id}"
						class="w3-hover-none">Add to Cart</a></li>
										<li>
											<form action="addtoCart/${userId}/${product.id}">
												<input type="number" value="1" name="quantity"> <input
													type="submit" value="Add to Cart">
											</form>
										</li>
									</c:when>
								</c:choose> --%>
							</c:forEach>
						</div>
						<!-- </ul> -->
					</div>
				</c:if>
			</c:when>
		</c:choose>
	</c:if>
	<%-- <div class="row w3-card-8 w3-margin" style="margin-bottom: 0px">
		<br>
		<div class="col-xs-2 ">
			<div class="thumbnail">
				<img height="150px" width="150px" alt="${product.id}"
					src="<c:url value="/WEB-INF/resources/images/product/Lap.jpg"></c:url>">
				<div class="caption">
					<p>
						<input type="number" value="1" name="quantity"
							class="btn btn-xs btn-primary   col-xs-6 "> <a href="#"
							class="btn btn-xs btn-primary col-xs-6" role="button">Add</a>
					</p>
				</div>
			</div>
		</div>
	</div> --%>
	<!-- Product List End -->
	<footer class="footer-distributed w3-card-4 w3-black w3-margin-0"
		style="opacity: 0.9">
		<div class="footer-left">
			<p>Payment Options</p>
			<a href="#"><i class="fa fa-paypal" aria-hidden="true"></i> </a> . <a
				href="#"><i class="fa fa-cc-amex" aria-hidden="true"></i> </a> . <a
				href="#"><i class="fa fa-cc-mastercard" aria-hidden="true"></i>
			</a> . <a href="#"><i class="fa fa-cc-visa" aria-hidden="true"></i> </a>
			. <a href="#"><i class="fa fa-credit-card" aria-hidden="true"></i>
			</a> . <a href="#"><i class="fa fa-google-wallet" aria-hidden="true"></i>
			</a> . <a href="#"><i class="fa fa-cc-stripe" aria-hidden="true"></i>
			</a>
			<p></p>
			<p></p>
			<p>
				shopcart <i class="fa fa-copyright" aria-hidden="true"> 2016</i>
			</p>
			<p></p>
			<div class="footer-icons">
				<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
					class="fa fa-twitter"></i></a> <a href="#"><i
					class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-github"></i></a>
			</div>
		</div>
		<div class="footer-center">
			<div>
				<i class="fa fa-map-marker"></i>
				<p>
					<span>21 Revolution Street</span> Paris, France
				</p>
			</div>
			<div>
				<i class="fa fa-phone"></i>
				<p>+1 555 123456</p>
			</div>
			<div>
				<i class="fa fa-envelope"></i>
				<p>
					<a href="mailto:support@company.com">support@shopcart.com</a>
				</p>
			</div>
		</div>
		<div class="footer-right">
			<p class="footer-company-about">
				<span>About the company</span> <a href="http://www.secura.e-sim.org"
					title="Summus, website template creation">Summus</a> is a web
				design and development studio. We build responsive HTML5 and CSS3
				templates, integrating best web design practices and up-to-date web
				technologies to create great user experiences. We love what we do
				and we hope you do too!
			</p>
		</div>
	</footer>


	<!-- Carousel Script -->
	<!--  -->
	<script>
		$(document).ready(function() {
			// Activate Carousel
			$("#carousel-home").carousel();

			// Enable Carousel Indicators
			$(".item1").click(function() {
				$("#carousel-home").carousel(0);
			});
			$(".item2").click(function() {
				$("#carousel-home").carousel(1);
			});
			$(".item3").click(function() {
				$("#carousel-home").carousel(2);
			});
			$(".item4").click(function() {
				$("#carousel-home").carousel(3);
			});
			$(".item5").click(function() {
				$("#carousel-home").carousel(4);
			});
			$(".item6").click(function() {
				$("#carousel-home").carousel(5);
			});

			// Enable Carousel Controls
			$(".left").click(function() {
				$("#carousel-home").carousel("prev");
			});
			$(".right").click(function() {
				$("#carousel-home").carousel("next");
			});
		});
	</script>
	<!-- Carousel Script End  -->


</body>
</html>
