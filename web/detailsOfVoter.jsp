<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <table>

        <tr>
            <td>
                <table>
                    <th>Details of voter:</th>
                    <tr>
                        <td>VOTER ID : <strong>${Voter.voterId}</strong></td>
                    </tr>
                    <tr>
                        <td>FIRST NAME : <strong>${Voter.firstName}</strong></td>
                    </tr>
                    <tr>
                        <td>LAST NAME : <strong>${Voter.lastName}</strong></td>
                    </tr>
                    <tr>
                        <td>DOB : <strong>${Voter.dob}</strong></td>
                    </tr>
                    <tr>
                        <td>GENDER : <strong>${Voter.gender}</strong> </td>
                    </tr>
                    <tr>
                        <td>STATE : <strong>${Voter.state}</strong> </td>
                    </tr>
                    <tr>
                        <td>ADMIN STATUS :<strong> 
                                <c:if test="${Voter.adminStatus ==1}">
                                    <p  style="color:green">Verified</p></c:if>
                                    <c:if test="${Voter.adminStatus==0}">
                                    <p  style="color:red">not Verified</p></c:if>
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

                    <button type="button" class="btn btn-success text-light mt-2 w-100" onclick="functionApprove(${Voter.voterId})">Approve</button>

            </td>
            <td>

                <button type="button" class="btn btn-danger text-light mt-2 w-100" onclick="functionReject(${Voter.voterId})">Reject</button>

            </td>
        </tr>
    </table>
</div>