<%-- 
    Document   : candidateIdentityDetails
    Created on : 02-Mar-2023, 11:49:52 pm
    Author     : ANKIT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="candidateAPI" value="${CandidateAPI}"></c:set>
<c:set var='error' value='${InsertCandidateError}'/>

<form  enctype="multipart/form-data" action="AddCandidate" method="post" id="formSubmit"> 

    <div class="form-floating position-relative">
        <input type="text" class="form-control" id="candidateEmail" placeholder="Email Address" name="candidateEmail" value="${candidateAPI.candidateEmail}">
        <label for="floatingInput">Email Address</label>                                            
        <!--<button type="button" id="verifyButton" class="btn btn-primary position-absolute end-0 top-50 translate-middle-y btn-danger" onclick="fetchCandidateApi(); document.getElementById('submitButton').disabled = false;"> Verify</button>-->
        <c:if  test="${error!=null}">
            <c:if test="${error==1}">
                <button type="button" id="verifyButton" class="btn btn-primary position-absolute end-0 top-50 translate-middle-y btn-danger" onclick="fetchCandidateApi(); document.getElementById('submitButton').disabled = false;">Verify</button>
            </c:if>
            <c:if test="${error==0}">
                <!--<button type="button" id="verifyButton" class="btn btn-primary position-absolute end-0 top-50 translate-middle-y" onclick="fetchCandidateApi(); document.getElementById('submitButton').disabled = false;">Verified</button>-->
                <button type="button" id="verifyButton" class="btn btn-success position-absolute end-0 top-50 translate-middle-y" onclick="fetchCandidateApi(); document.getElementById('submitButton').disabled = false;">
                    <i class="bi bi-check-circle"></i> Verified
                </button>
            </c:if>
        </c:if>
    </div>
    <p></p>
    <div class="form-floating">
        <input type="text" class="form-control" id="floatingInput" placeholder="First Name" name="firstName" value="${candidateAPI.firstName}">
        <label for="floatingInput">First Name</label>
    </div>
    <p></p>
    <div class="form-floating">
        <input type="text" class="form-control" id="floatingPassword" placeholder="Last Name" name="lastName" value="${candidateAPI.lastName}">
        <label for="floatingPassword">Last Name</label>
    </div>
    <p></p>
    <div class="form-floating">
        <select name="partyName" class="form-control" id="partyName" required>
            <option value="" hidden> Select your Party</option>
            <c:forEach var="party" items="${PartyList}">
                <option value="${party.getPartyName()}" <c:if test="${candidateAPI.partyName == party.getPartyName()}">selected</c:if>> ${party.getPartyName()}  </option>
            </c:forEach>
        </select><label for="floatingInput">Party Name</label>
    </div>
    <p></p>
    <div class="form-floating">
        <input type="text" class="form-control" id="age" placeholder="Age" name="age" value="${candidateAPI.age}">
        <label for="age">Age</label>
    </div>
    <p></p>
    <div class="form-floating">
        <select name="gender" class="form-control" id="gender" required>
            <option value="" hidden>Select Gender</option>
            <option value="male" <c:if test="${candidateAPI.gender == 'male'}">selected</c:if>>Male</option>
            <option value="female"  <c:if test="${candidateAPI.gender == 'female'}">selected</c:if>> Female  </option>
            </select><label for="floatingInput">Gender</label>
        </div>
        <p></p>
        <div class="form-floating">
            <select name="region" class="form-control " id="stateName" value="${candidateAPI.region}">
            <option value="">Select State</option>
            <c:forEach var="state" items="${StateList}">
                <option value="${state.getStateName()}" <c:if test="${candidateAPI.region == state.getStateName()}">selected</c:if>>
                    ${state.getStateName()}
                </option>
            </c:forEach>
        </select><label for="floatingInput">State Name</label>
    </div>
    <div class="form-floating text-center">    
        <br>
        <input type="file" class="form-control" placeholder="Image" id="image-file" name="image" onchange="previewImage(event)" required>
        <label for="floatingInput">Upload photo</label>
        <p> </p>
        <br>
        <img id="image-preview" style="max-width: 200px; max-height: 200px;">
    </div>
    <p></p>
    <br>
    <c:if  test="${error!=null}">
        <c:if test="${error==1}">
            <div class="alert-danger text-center btn-outline-dark bg-danger" style="color: #ccffff; border-radius: 10px; padding: 20px">
                Candidate Data Not Found!!
            </div>
        </c:if>
        <c:if test="${error==0}">
            <div class="alert-danger text-center btn-outline-dark bg-primary" style="color: #ccffff; border-radius: 10px; padding: 20px">
                Candidate Data Found!!
            </div>
        </c:if>
    </c:if>
    <p></p>
    <button class="w-100 btn btn-lg btn-info mb-2" id="submitButton" type="submit">Submit</button>


    <!--                                    <a href="Logout">
                                            <button type="button" class="w-100 btn btn-lg btn-secondary">Cancel</button>
                                        </a>-->
</form>
