/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;


import com.exavalu.services.CandidateService;
import com.exavalu.services.PartyService;
import com.exavalu.services.VoterService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
//import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
//import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * This model performs candidate functionalities like editing details, adding and deleting.
 */
public class Candidate extends ActionSupport implements SessionAware, Serializable {

    private int candidateId;
    private String firstName;
    private String lastName;
    private String partyName;
    private String age;
    private String gender;
    private String region;
    private int candidateStatus;
    private File image;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

//    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();
//
//    @Override
//    public void setApplication(Map<String, Object> application) {
//        map = (ApplicationMap) application;
//    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public int getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(int candidateId) {
        this.candidateId = candidateId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public int getCandidateStatus() {
        return candidateStatus;
    }

    public void setCandidateStatus(int candidateStatus) {
        this.candidateStatus = candidateStatus;
    }

    public String doInsertCandidate() throws Exception {
        String result = "FAILURE";
        boolean success = CandidateService.doSaveCandidate(this);           
        if (success) {
            result = "SUCCESS";
            System.out.println("Returning success from doInsert candidate");
            List<Candidate> candidateList = CandidateService.getAllCandidates();           
            sessionMap.put("CandidateList", candidateList);            
        } else {
            System.out.println("Returning failure from doInsert candidate");
        }
        return result;
    }

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }

    private String imageData;

    public void setImageData(String imageData) {
        this.imageData = imageData;
    }

    public String getImageData() {
        return imageData;
    }

    public String showCandidate() throws Exception {
        String res = "FAILURE";
        List<Candidate> candidate = CandidateService.getAllCandidates();

        if (!candidate.isEmpty()) {
            sessionMap.put("CandidateList", candidate);
            res = "SUCCESS";
        }
        return res;
    }

    public String editCandidate() throws Exception {
        String res = "FAILURE";
        Candidate candidate = CandidateService.getCandidateById(this.candidateId);
        System.out.println(candidate.getCandidateId());
        System.out.println(this.candidateId);

        if (candidateId != 0) {
            sessionMap.put("Candidate", candidate);
            res = "SUCCESS";
        }
        return res;
    }

    public String deleteCandidate() throws Exception {
        String res = "FAILURE";
        boolean result = CandidateService.deleteCandidate(this.candidateId);

        List<Candidate> candidateList = CandidateService.getAllCandidates();
        System.out.println(result);
        if (result) {
            sessionMap.put("CandidateList", candidateList);
            res = "SUCCESS";
        }
        return res;
    }

    public String doSave() throws Exception {
        String result = "FAILURE";
//        Employee emp = (Employee) sessionMap.get("Emp");
        System.out.println("LORD SHOUVIK TEAM LEAD");
        boolean success=false;
        if(this.image!=null)
        {
             //System.out.println("IF____LORD SHOUVIK TEAM LEAD");
            success = CandidateService.updateCandidate(this, this.candidateId);
        }
        else
        {
             //System.out.println("ELSE_____LORD SHOUVIK TEAM LEAD");
            success = CandidateService.updateCandidate2(this, this.candidateId);
        }
        if (success) {
            System.out.println("returning Success from doSave method");
            result = "SUCCESS";
            List<Candidate> candidateList = CandidateService.getAllCandidates();
            sessionMap.put("CandidateList", candidateList);
        } else {
            System.out.println("returning Failure from doSave method");
        }

        return result;
    }
    
    private String candidateEmail;

    public String getCandidateEmail() {
        return candidateEmail;
    }

    public void setCandidateEmail(String candidateEmail) {
        this.candidateEmail = candidateEmail;
    }
    
    public String doPreInsertCandidate() throws Exception {
        String result = "SUCCESS";
        ArrayList stateList = VoterService.getStates();
        sessionMap.put("StateList", stateList);
        ArrayList partyList = PartyService.getAllParty();
        sessionMap.put("PartyList", partyList);
        return result;
    }
}




