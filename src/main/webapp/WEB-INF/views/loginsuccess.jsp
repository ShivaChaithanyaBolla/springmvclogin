<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- db -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  db -->
<!-- 
<%
  if (session == null)
  {
	  String address = "/loginform.html";
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    dispatcher.forward(request,response);
  }
%>
 -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
    <!-- BOOTSTRAP STYLES-->
    <spring:url value="/resources/assets/css/bootstrap.css" var="CSS" />
    <link href="${CSS}" rel="stylesheet" />


    <!-- FONTAWESOME STYLES-->
    <spring:url value="/resources/assets/css/font-awesome.css" var="CSS1" />
    <link href="${CSS1}" rel="stylesheet" />

    <!-- CUSTOM STYLES-->
    <spring:url value="/resources/assets/css/custom.css" var="CSS2" />
    <link href="${CSS2}" rel="stylesheet" />

    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <!--Header files for rooms -->
    <spring:url value="/resources/assets/css/css_room/normalize.css" var="CSS3" />
    <link href="${CSS3}" rel="stylesheet" />

    <spring:url value="/resources/assets/css/css_room/font-awesome-4.3.0/css/font-awesome.min.css" var="CSS4" />
    <link href="${CSS4}" rel="stylesheet" />

    <spring:url value="/resources/assets/css/css_room/style1.css" var="CSS5" />
    <link href="${CSS5}" rel="stylesheet" />

    <spring:url value="/resources/assets/js/Js_room/modernizr.custom.js" var="js" />
    <script src="${js}"></script>


    <!-- Start Images -->
    <spring:url value="/resources/assets/img/img1/authors/empty.png" var="emptyroom" />
    <spring:url value="/resources/assets/img/img1/authors/reserved.png" var="reserved" />
    <spring:url value="/resources/assets/img/asaa.png" var="user_image" />

    <!-- End Images -->

    <!-- Database connectivity-->
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/springexamples" user="root" password="" />

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
                    scrollTop: $(".floor_2").offset().top
                },
                'slow');
        }

        function myFunction1() {
            $('html,body').animate({
                    scrollTop: $(".floor_1").offset().top
                },
                'slow');
        }
    </script>
    <!--  floor change -->



    <!-- Header files for rooms -->
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> Welcome, Chaithanya &nbsp; <a href="#" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center">
                        <img src="${user_image}" class="user-image img-responsive" />
                    </li>


                    <li>
                        <a href="home.html"><i class="fa fa-dashboard fa-3x"></i> Home</a>
                    </li>
                    <li>
                        <a class="active-menu" href="room_booking.html"><i class="fa fa-desktop fa-3x"></i> Rooms</a>
                    </li>
                    <li>
                        <a href="appointments.html"><i class="fa fa-table fa-3x"></i> Appointments</a>
                    </li>
                    <li>
                        <a href="sendm.html"><i class="fa fa-edit fa-3x"></i> Message</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Rooms</h2>
                    <!--     <h5>Welcome Jhon Deo , Love to see you back. </h5>
					 -->
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <div class="row">
                    <!-- Container for rooms -->
                    <div class="container">
                        <button id="menu-toggle" class="menu-toggle"><span>Menu</span>
                        </button>
                        <div id="theSidebar" class="sidebar" style="width:0px;left:-40px;">
                        </div>
                        <div id="theGrid" class="main">
                            <!-- First Floor -->
                            <section class="grid">
                                <c:set var="count" value="0" />
                                <c:forEach var="row" items="${result.rows}">
                                    <c:if test='${row.floor == "1"}'>
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

                                    <c:if test='${row.floor == "2"}'>

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
                                        <c:set var="count" value="2" />

                                    </c:if>

                                    <c:if test='${row.floor == "3"}'>

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
                                        <c:set var="count" value="3" />

                                    </c:if>



                                    <c:if test='${row.floor == "4"}'>

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
                                        <c:set var="count" value="4" />

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
                                                        SELECT role from users WHERE user_name=
                                                        <c:out value="${loginForm.userName}" />;
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

      <form method="POST" action="welcome">
      <input type="hidden" value='<c:out value="${row.RoomNo}"/>' name="roomnumber"/>
    <table>
        <tr>
            <td>patient Name :</td>
            <td><input type="text" id="name" name="name"/></td>
        </tr>
        <tr>
            <td>Doctor name :</td>
            <td><input type="text" id="password" name="password"/></td>
        </tr>
		<tr>
            <td>Start Date</td>
            <td><input type="text" id="sdate" name="sdate"/></td>
        </tr>
        <tr>
            <td>End Date</td>
            <td><input type="text" id="edate" name="edate"/></td>
        </tr>
        </table>
        <tr>
            <td colspan="2"><input type="submit"></td>
        </tr>
    </table>
</form>

<!-- <form action="messageForm.html" > 

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
                                                                            <p>
                                                                                <input type="text" class="book_room_input" id="patient_name_booking" value=""/>
                                                                            </p>
                                                                            <p>
                                                                                <input type="text" class="book_room_input" id="doctor_name_booking" value=""/>
                                                                            </p>
                                                                            <p>
                                                                                <input type="text" class="book_room_input" id="start_date" value=""/>
                                                                            </p>
                                                                            <p>
                                                                                <input type="text" class="book_room_input" id="end_date" value=""/>
                                                                            </p>

                                                                        </div>
                                                                    </div>
                                                                    <input type="submit" id="free_room" onclick="Insert_data()" class="button book_room" type="button" value="Book">
<!-- </form> -->
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
                                                        SELECT * from room_booking WHERE RoomNo =
                                                        <c:out value="${row.RoomNo}" />;
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
      <form method="POST" action="freeRoom">
<input value='<c:out value="${row.RoomNo}"/>' name="roomFree" type="hidden"/>
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
                                                                    <p>
                                                                        <c:out value="${row1.patient_name}" />
                                                                    </p>
                                                                    <p>
                                                                        <c:out value="${row1.doctor_name}" />
                                                                    </p>
                                                                    <p>
                                                                        <c:out value="${row1.start_date}" />
                                                                    </p>
                                                                    <p>
                                                                        <c:out value="${row1.end_date}" />
                                                                    </p>

                                                                </div>
                                                            </div>
                                                            <input type="submit">
</form>
                                                        </div>
                                                    </c:forEach>
                                                    <!-- Room Booked -->
                                                </c:otherwise>
                                            </c:choose>
                                        </article>

                                    </c:forEach>
                                </div>
                                <button class="close-button"><i class="fa fa-close"></i><span>Close</span>
                                </button>
                            </section>
                        </div>
                    </div>
                    <!-- /container -->
                    <!-- Container for rooms -->

                    <spring:url value="/resources/assets/js/Js_room/main.js" var="JS1" />
                    <spring:url value="/resources/assets/js/Js_room/classie.js" var="JS2" />

                    <script src="${JS1}"></script>
                    <script src="${JS2}"></script>



                </div>
                <!-- /. ROW  -->
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <spring:url value="/resources/assets/js/jquery-1.10.2.js" var="JS3" />
    <script src="${JS3}"></script>

    <!-- BOOTSTRAP SCRIPTS -->
    <spring:url value="/resources/assets/js/bootstrap.min.js" var="JS4" />
    <script src="${JS4}"></script>

    <!-- METISMENU SCRIPTS -->
    <spring:url value="/resources/assets/js/jquery.metisMenu.js" var="JS5" />
    <script src="${JS5}"></script>

    <!-- CUSTOM SCRIPTS -->
    <spring:url value="/resources/assets/js/custom.js" var="JS6" />
    <script src="${JS6}"></script>
    
    <script>
    	$(".book_room").click(function() {
    		var PN = document.getElementById("patient_name_booking").value;
    		var DN = document.getElementById("doctor_name_booking").value;
    		var SD = document.getElementById("start_date").value;
    		var ED = document.getElementById("end_date").value;
    		
<!--    		$.ajax({
                type: "GET",
                url: '@Url.Action("BookRoomController", "book_room")',
                contentType: "application/json; charset=utf-8",
                data: { id: appId , status: selectedItem },
                dataType: "json",
                success: function() { alert('Success'); }

                });
    -->		

    		$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "${home} messageForm.html",
    			data : { id: PN , status: DN },//JSON.stringify(search),
    			dataType : 'json',
    			success : function(data) {
    				alert('Success');
    			}
    		});
    		
    		
    	});
    </script>


</body>

</html>