<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body>
    <c:set var="voterAPI" value="${VoterAPI}"></c:set>
    <div class="row" style="position: relative;width: 100%">
      <div class="col-md-6 ms-auto" style="width: 100%">
            <table class="table table-striped"  >
                <th>Details of voter identity:</th>
                <tr>
                    <td>VOTER ID : </td>
                    <td><input class="form-control" name="voterId" type="text" class="form-control" id="voterId" placeholder="voterId" readonly value="${voterAPI.voterId}"></td>
            </tr>
            <tr>
                <td>FIRST NAME  : </td>
                <td><input class="form-control" name="firstName" type="text" class="form-control" id="firstName" placeholder="firstName" readonly value="${voterAPI.firstName}"></td>
            </tr>
            <tr>
                <td>LAST NAME : </td>
                <td><input class="form-control" name="lastName" type="text" class="form-control" id="lastName" placeholder="lastName" readonly value="${voterAPI.lastName}"></td>
            </tr>
            <tr>
                <td>DOB : </td>
                <td><input class="form-control" name="dob" type="text" class="form-control" id="dob" placeholder="dob" readonly value="${voterAPI.dob}"></td>
            </tr>
            <tr>
                <td>GENDER : </td>
                <td><input class="form-control" name="gender" type="text" class="form-control" id="gender" placeholder="gender" readonly value="${voterAPI.gender}"></td>
            </tr>
            <tr>
                <td>STATE : </td>
                <td><input class="form-control" name="state" type="text" class="form-control" id="state" placeholder="state" readonly value="${voterAPI.state}"></td>
            </tr>
        </table>
        </div>
    </div>
</body><!-- comment -->