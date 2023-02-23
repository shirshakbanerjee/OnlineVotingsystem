<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
    
        
        <!-- Uncomment below if you prefer to use an image logo -->


        <nav id="navbar" class="navbar">
          
               
          <h1><b style="color:red">VOTE INDIA</b></h1>
                <ul>
                    <li><a class="nav-link scrollto active text-white" href="#hero">Home</a></li>
                    <li><a class="nav-link scrollto text-white" href="#login">Login</a></li>
                    <li><a class="nav-link scrollto text-white" href="#signup">Sign-up</a></li>
                    <li><a class="nav-link scrollto text-white" href="#electionresult">Election Result</a></li>               
                    <li class="dropdown text-white"><a href="#"><span class="text-white">About us</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="#services">Services</a></li>
                            <li class="dropdown"><a href="#"><span>Team</span> <i class="bi bi-chevron-right"></i></a>
                                <ul>
                                    <li><a href="#Anjali">Anjali Kumari</a></li>
                                    <li><a href="#Ankit">Ankit Raj</a></li>
                                    <li><a href="#Nitish">Nitish Sah</a></li>
                                    <li><a href="#Priyanka">Priyanka Jaiswal</a></li>
                                    <li><a href="#Shirshak">Shirshak Banerjee</a></li>
                                    <li><a href="#Shouvik">Shouvik Samaddar</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Portfolio</a></li>              
                        </ul>
                    </li>
                    <li><a class="nav-link scrollto text-white" href="#contact">Contact</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
                 
           
 
            <c:if test="${User.roleId==2}">
          <h1><b style="color:red">VOTE INDIA</b></h1>
                <ul>

                    <li><a class="nav-link scrollto text-white" href="#login">LOGOUT</a></li>              
                    <li><a class="nav-link scrollto text-white" href="#contact">SUPPORT</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
           
            </c:if>
               
             <c:if test="${User==1}">
                    <img src="assets/img/menuLogo.png" alt="" width="100" height="150"></a>
          <h1><b style="color:red">VOTE INDIA</b></h1>
                <ul>
                    <li><a class="nav-link scrollto text-white" href="#contact">SHOW VOTERS</a></li>
                    <li><a class="nav-link scrollto text-white" href="#login">ADD CANDIDATE</a></li>              
                    <li><a class="nav-link scrollto text-white" href="#contact">PENDING REQUESTS</a></li>                    
                     <li><a class="nav-link scrollto text-white" href="#contact">LOGOUT</a></li>                    
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
                 </c:if>    
           
        </nav><!-- .navbar -->

    </div>
</html>
