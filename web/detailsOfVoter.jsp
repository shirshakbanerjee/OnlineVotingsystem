<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <table>

        <tr>
            <td>
                <table>
                    <th>Details of voter:</th>
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

                    </table>
                </td>
            </tr>
            <tr>
                <td>

                    <button type="button" class="btn btn-primary text-light mt-3 w-100" onclick="fetchVapi()">Check voter's identity</button>

                </td>
            </tr>
            <tr>
                <td>

                    <button type="button" class="btn btn-success text-light mt-2 w-100" onclick="functionApprove(${PVoter.voterId})">Approve</button>

            </td>
            <td>

                <button type="button" class="btn btn-danger text-light mt-2 w-100" onclick="functionReject(${PVoter.voterId})">Reject</button>

            </td>
        </tr>
    </table>
</div>