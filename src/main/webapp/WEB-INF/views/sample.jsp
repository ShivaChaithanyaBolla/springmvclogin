
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- db -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--  db -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
	<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<!-- let's add tag srping:url -->
<spring:url value="/resources/css_js/css1/style1.css" var="CSS" />
<spring:url value="/resources/css_js/css1/style1.css.map" var="CSS1" />
<spring:url value="/resources/css_js/css1/normalize.css" var="CSS2" />
<spring:url value="/resources/css_js/js1/modernizr.custom.js" var="js" />
<spring:url value="/resources/css_js/fonts1/font-awesome-4.3.0/css/font-awesome.min.css" var="CSS3" />


<link href="${CSS}" rel="stylesheet" />
<link href="${CSS1}" rel="stylesheet" />
<!-- <link href="${CSS2}" rel="stylesheet" />  -->
<link href="${CSS3}" rel="stylesheet" />

<script src="${js}"></script>


<!-- Start Images -->
<spring:url value="/resources/css_js/img1/authors/empty.png" var="emptyroom" />
<spring:url value="/resources/css_js/img1/authors/reserved.png" var="reserved" />
<spring:url value="/resources/css_js/img1/authors/3.png" var="image3" />


<!-- End Images -->

<!-- Finish adding tags -->
<!-- Database connectivity-->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/springexamples"
     user="root"  password=""/>
     
<!-- Database connectivity-->
<!-- retrieve room numbers -->
<sql:query dataSource="${snapshot}" var="result">
SELECT * from room;
</sql:query>
<!-- retrieve room numbers -->

<!--  floor change -->
<script>
function myFunction() {
    $('html,body').animate({
        scrollTop: $(".floor_2").offset().top},
        'slow');
}
function myFunction1() {
    $('html,body').animate({
        scrollTop: $(".floor_1").offset().top},
        'slow');
}
</script>
<!--  floor change -->

	</head>
	<body>
		<div class="container">
			<button id="menu-toggle" class="menu-toggle"><span>Menu</span></button>
			<div id="theSidebar" class="sidebar">
			</div>
			<div id="theGrid" class="main">
			<!-- First Floor -->
				<section class="grid">
														  <c:set var="count" value="0" />
				
					<c:forEach var="row" items="${result.rows}">	
							          <c:if test='${row.floor == "1"}' > 	  	
						<a class="grid__item" href="#">
							<h2 class="title title--preview">
								<c:out value="${row.RoomNo}"/>
							</h2>
							<div class="loader"></div>
							<span class="category">Operating Room</span>
							<div class="meta meta--preview">
								<c:choose>
								<c:when test="${row.status == '0' }"> 
									<img class="meta__avatar" src="${emptyroom}" alt="empty" /> 
								</c:when>
								<c:otherwise>
									<img class="meta__avatar" src="${reserved}" alt="reserved" /> 					
								</c:otherwise>	
								</c:choose>
								
							</div>
						</a>
										  </c:if>
										  
										  <c:if test='${row.floor == "2"}' >
											
											<c:if test="${count ==  0}">
										  <div class="hello" style="display:block; width: 100%; padding: 20px; text-align: center;">
										  <button style="padding:5px; text-align: center; font-weight: 900px; width: 100%">Floor:
										  <c:out value="${ row.floor}" />
										  
										  </button>
										  
										  </div> 	
										  </c:if>
						<a class="grid__item" href="#">
							<h2 class="title title--preview">
								<c:out value="${row.RoomNo}"/>
							</h2>
							<div class="loader"></div>
							<span class="category">Operating Room</span>
							<div class="meta meta--preview">
								<c:choose>
								<c:when test="${row.status == '0' }"> 
									<img class="meta__avatar" src="${emptyroom}" alt="empty" /> 
								</c:when>
								<c:otherwise>
									<img class="meta__avatar" src="${reserved}" alt="reserved" /> 					
								</c:otherwise>	
								</c:choose>
								
							</div>
						</a>
						<c:set var="count" value="2"/>
							
										  </c:if>
										  
										    <c:if test='${row.floor == "3"}' >
											
											<c:if test="${count ==  2}">
										  <div class="hello" style="display:block; width: 100%; padding: 20px; text-align: center;">
										  <button style="padding:5px; text-align: center; font-weight: 900px; width: 100%">Floor:
										  <c:out value="${ row.floor}" />
										  
										  </button>
										  
										  </div> 	
										  </c:if>
						<a class="grid__item" href="#">
							<h2 class="title title--preview">
								<c:out value="${row.RoomNo}"/>
							</h2>
							<div class="loader"></div>
							<span class="category">Operating Room</span>
							<div class="meta meta--preview">
								<c:choose>
								<c:when test="${row.status == '0' }"> 
									<img class="meta__avatar" src="${emptyroom}" alt="empty" /> 
								</c:when>
								<c:otherwise>
									<img class="meta__avatar" src="${reserved}" alt="reserved" /> 					
								</c:otherwise>	
								</c:choose>
								
							</div>
						</a>
						<c:set var="count" value="3"/>
							
										  </c:if>
										  
										  
										  
										   <c:if test='${row.floor == "4"}' >
											
											<c:if test="${count ==  3}">
										  <div class="hello" style="display:block; width: 100%; padding: 20px; text-align: center;">
										  <button style="padding:5px; text-align: center; font-weight: 900px; width: 100%">Floor:
										  <c:out value="${ row.floor}" />
										  
										  </button>
										  
										  </div> 	
										  </c:if>
						<a class="grid__item" href="#">
							<h2 class="title title--preview">
								<c:out value="${row.RoomNo}"/>
							</h2>
							<div class="loader"></div>
							<span class="category">Operating Room</span>
							<div class="meta meta--preview">
								<c:choose>
								<c:when test="${row.status == '0' }"> 
									<img class="meta__avatar" src="${emptyroom}" alt="empty" /> 
								</c:when>
								<c:otherwise>
									<img class="meta__avatar" src="${reserved}" alt="reserved" /> 					
								</c:otherwise>	
								</c:choose>
								
							</div>
						</a>
						<c:set var="count" value="4"/>
							
										  </c:if>
									  
									  
					</c:forEach>
				</section>
				<section class="content">
					<div class="scroll-wrap">
				
						<c:forEach var="row" items="${result.rows}">  
										<article class="content__item">
											<c:choose> 
												<c:when test='${row.status == "0" }'>
													<!-- Room Not reserved -->
														<span class="category category--full">Operating Room</span>
																		<h2 class="title title--full">
																		<c:out value="${row.RoomNo}"/>
																		
																		</h2>
																		<div class="meta meta--full">
																			<img class="meta__avatar" src="${emptyroom}" alt="author01" />
																		</div>
<!-- retrieve room numbers -->
<sql:query dataSource="${snapshot}" var="result2">
SELECT role from users WHERE user_name="<c:out value="${loginForm.userName}" />";
</sql:query>
<!-- retrieve room numbers -->								
<c:forEach var="row2" items="${result2.rows}"> 
																		<c:choose>
																		<c:when test='${row2.role == "doctor" && row.type == "ward" }'>
																				<div id="inner_container" class="inner_container">	
																				<p> </p>									
																		 		<div class=inner2>
																 				<button class="button send_message">Send message to service desk</button>					 		
																		 		</div>
																		 		</div>
																		</c:when>
																		<c:otherwise> 
																				<div id="inner_container" class="inner_container">	
																		<p> </p>									
													
																 		<div class=inner2>
																 		<div class="inner2-left">
																 		<p></p>
																 					<p>Patient Name:</p>		
																 					<p>Doctor Name:</p>				
																 					<p>Start Date:</p>
																 					<p>End Date:</p>
																 		</div>
																 		<div class="inner2-right">
																 		<p></p>
																 					<p><input type="text" class="book_room_input" /></p>		
																 					<p><input type="text" class="book_room_input" /></p>	
																 				    <p><input type="text" class="book_room_input" /></p>
																 				    <p><input type="text" class="book_room_input" /></p>
																 		
																 		</div>
																 		</div>		
																 		<input type="submit" id="free_room" class="button book_room" type="button" value="Book"></button>
																 																 																	 	
																 		</div>
																		</c:otherwise>
																		</c:choose>
																		
																 		
</c:forEach>
													<!--  Room not reserved -->
												</c:when>
												<c:otherwise>
													<!-- Room Booked -->
														<!---  -->
														<sql:query dataSource="${snapshot}" var="result1">
														SELECT * from room_booking WHERE RoomNo = <c:out value="${row.RoomNo}"/>;
														</sql:query>
														<!---- ---->
																<c:forEach var="row1" items="${result1.rows }">
																		<span class="category category--full">Operating Room</span>
																		<h2 class="title title--full">
																		<c:out value="${row.RoomNo}"/>
																		
																		</h2>
																		<div class="meta meta--full">
																			<img class="meta__avatar" src="${emptyroom}" alt="author01" />
																		</div>
																		<div id="inner_container" class="inner_container">	
																		<p> </p>									
													
																 		<div class=inner2>
																 		<div class="inner2-left">
																 		<p></p>
																 					<p>Patient Name:</p>		
																 					<p>Doctor Name:</p>				
																 					<p>Start Date:</p>
																 					<p>End Date:</p>
																 		</div>
																 		<div class="inner2-right">
																 		<p></p>
																 					<p><c:out value="${row1.patient_name}"/></p>		
																 					<p><c:out value="${row1.doctor_name}"/></p>	
																 				    <p><c:out value="${row1.start_date}"/></p>
																 				    <p><c:out value="${row1.end_date}"/></p>
																 		
																 		</div>
																 		</div>		
																 		<button id="free_room" class="button free_room" type="button">Free this room</button>
																 																 																	 	
																 		</div>
																 </c:forEach>
													<!-- Room Booked -->
												</c:otherwise>
											</c:choose>
										</article>	

						</c:forEach>
					</div>
					<button class="close-button"><i class="fa fa-close"></i><span>Close</span></button>
				</section>
			</div>
		</div><!-- /container -->
		<spring:url value="/resources/css_js/js1/main.js" var="JS1" />
		<spring:url value="/resources/css_js/js1/classie.js" var="JS2" />
		
		<script src="${JS1}"></script>
		<script src="${JS2}"></script>
		
		 
		
	</body>
</html>
