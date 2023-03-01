<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .container{
        width:content-box;
        border-radius: 10px;
       
    }
</style>

<body>

    <div>
        <table class="container" >
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
</body>