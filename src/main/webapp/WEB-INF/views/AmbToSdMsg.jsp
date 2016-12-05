<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="net.roseindia.form.AllAmbulanceMsgs"
         import="net.roseindia.dao.UserDAOImpl"

   %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Animal list</title>
<link rel="stylesheet"
      href="./css/styles.css"
      type="text/css"/>
</head>
<body>
<table class="title">
  <tr><th></th></tr>
</table>


<h1>Messages</h1>
 <center>
 <table width="100 % " id='table1'  border="1" cellspacing="2" cellpadding="2"> 
    <tr class="tab-highlighted-2"> 
        <td class="tab-highlighted-2" width="15"> 
          <div align="left">Name</div> 
        </td> 
        <td class="tab-highlighted-2" width="20"> 
          <div align="left">msg</div> 
        </td>
         <td class="tab-highlighted-2" width="20"> 
          <div align="left">status</div> 
        </td>
        <td class="tab-highlighted-2" width="20"> 
          <div align="left"></div> 
        </td>
         <td class="tab-highlighted-2" width="20"> 
          <div align="left"></div> 
        </td>
        
    </tr> 

    <c:forEach items="${ss}" var="view"> 
    	<c:choose> 
    	
    	
    		<c:when test="${view.getstatus() == '1' }"> 
    			 <tr  style='color:grey;'> 
            <td>${view.getuname()}</td> 
            <td>${view.getmsg()}</td>
            <td>${view.getstatus()}</td>
			<td> <button> send</button></td>
						<td> <a><button>done </button> </a></td>
        </tr> 
    		</c:when>
    	
    	
    		<c:otherwise> 
	 <tr> 
            <td>${view.getuname()}</td> 
            <td>${view.getmsg()}</td>
            <td>${view.getstatus()}</td>
			<td> <button> send</button></td>
						<td> <a href="SDacknowledge.html"><button>done </button></a></td>
        </tr> 
    		</c:otherwise>
    	
    	
    	
    	</c:choose>
       
    </c:forEach> 
    
    
</table> 

         </center>

</body></html>