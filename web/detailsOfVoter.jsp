<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>


<body>
    <div class="row" >
      <div class="col-md-6" style="width: 100%">
    
        <table class="table table-striped" >
            <br><!-- comment -->
            <th>Details of voter</th>
            <tr>
                <td>
                    <!--                <table>-->

            <tr>
                <td>VOTER ID : <strong>${PVoter.voterId}</strong></td>
            </tr>
            <tr>
                <td>FIRST NAME : <strong>${PVoter.firstName}</strong></td>
            </tr>
            <tr>
                <td>LAST NAME : <strong>${PVoter.lastName}</strong></td>
            </tr>
            <tr>
                <td>DOB : <strong>${PVoter.dob}</strong></td>
            </tr>
            <tr>
                <td>GENDER : <strong>${PVoter.gender}</strong> </td>
            </tr>
            <tr>
                <td>STATE : <strong>${PVoter.state}</strong> </td>
            </tr>
            <tr>
                <td>ADMIN STATUS :<strong> 

                        <c:if test="${PVoter.adminStatus ==1}">
                            <p  style="color:green">Approved</p></c:if>
                        <c:if test="${PVoter.adminStatus==0}">
                            <p  style="color:blue">Pending</p></c:if>
                        <c:if test="${PVoter.adminStatus==2}">
                            <p  style="color:red">Rejected</p></c:if>
                        </strong></td>

                </tr>
                <tr>
                    <td>
                        
                        <button type="button" class="btn btn-primary text-light mt-1 btn-lg " onclick="fetchVapi(${PVoter.voterId})">Check voter</button>
                </td>       

            </tr>
            <tr>                
                <td>
                    <button type="button" class="btn btn-success text-light mt-2 btn-sm" onclick="functionApprove(${PVoter.voterId})">Approve&checkmark;</button>
                    <button type="button" class="btn btn-danger text-light mt-2 btn-sm" onclick="functionReject(${PVoter.voterId})">Reject&cross;</button>
                </td>
            </tr>
        </table>
                </div>
    </div>
               
</body>