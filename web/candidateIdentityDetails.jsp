<%-- 
    Document   : candidateIdentityDetails
    Created on : 02-Mar-2023, 11:49:52 pm
    Author     : ANKIT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="candidateAPI" value="${CandidateAPI}"></c:set>
<div>
    <table class="table table-sm  " >
    <th>Details of candidate identity:</th>
    <tr>
        <td>CANDIDATE ID : </td>
        <td><input class="form-control" name="voterId" type="text" class="form-control" id="voterId" placeholder="voterId" readonly value="${candidateAPI.candidateId}"></td>
    </tr>
    <tr>
        <td>FIRST NAME  : </td>
        <td><input class="form-control" name="firstName" type="text" class="form-control" id="firstName" placeholder="firstName" readonly value="${candidateAPI.firstName}"></td>
    </tr>
    <tr>
        <td>LAST NAME : </td>
        <td><input class="form-control" name="lastName" type="text" class="form-control" id="lastName" placeholder="lastName" readonly value="${candidateAPI.lastName}"></td>
    </tr>
     <tr>
        <td>GENDER : </td>
        <td><input class="form-control" name="gender" type="text" class="form-control" id="gender" placeholder="gender" readonly value="${candidateAPI.gender}"></td>
    </tr>
    <tr>
        <td>PARTY NAME : </td>
        <td><input class="form-control" name="partyName" type="text" class="form-control" id="partyName" placeholder="partyName" readonly value="${candidateAPI.partyName}"></td>
    </tr>
   
    <tr>
        <td>AGE : </td>
        <td><input class="form-control" name="age" type="text" class="form-control" id="age" placeholder="age" readonly value="${candidateAPI.age}"></td>
    </tr>
    <tr>
        <td>AGE : </td>
        <td><input class="form-control" name="region" type="text" class="form-control" id="region" placeholder="region" readonly value="${voterAPI.region}"></td>
    </tr>
</table>
    </div>

