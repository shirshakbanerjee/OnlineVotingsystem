/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

/**
 *
 * @author SHIRSHAK
 */
import com.exavalu.services.UserService;
import com.exavalu.services.VoterService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Admin
 */
public class Voter extends ActionSupport implements ApplicationAware, SessionAware, Serializable{

    private int voterId;
    private String emailAddress;
    private String password;
    private String firstName;
    private String lastName;
    private String age;
    private String gender;
    private String state;
    private String adminStatus;
    private String votingStatus;
    private String dob;
    private String stateCode;
    private String stateName;
    private String candidateId;
    
    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();
    
    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }
    
    public int getVoterId() {
        return voterId;
    }

    public void setVoterId(int voterId) {
        this.voterId = voterId;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAdminStatus() {
        return adminStatus;
    }

    public void setAdminStatus(String adminStatus) {
        this.adminStatus = adminStatus;
    }

    public String getVotingStatus() {
        return votingStatus;
    }

    public void setVotingStatus(String votingStatus) {
        this.votingStatus = votingStatus;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }
    
    public String doPreSignup() throws Exception {
        String result = "SUCCESS";
        ArrayList stateList = VoterService.getStates();
        sessionMap.put("StateList", stateList);
        
        return result;
    }
    
    public String doSignup() throws Exception {
        String result = "FAILURE";
        
        Voter voter = VoterService.getVoter(String.valueOf(this.voterId));
        if(voter.getFirstName()!=null)
        {
            System.out.println("returning Failure from doSignup method");
            return "FAILURE";
        }
        boolean success = VoterService.doSignup1(this.emailAddress,this.password,this.firstName,this.lastName,1,this.voterId);
        boolean success1 = VoterService.doSignup2(this);

        if (success && success1) {
            System.out.println("returning Success from doSignup method");
            result = "SUCCESS";
            
        } else {
            System.out.println("returning Failure from doSignup method");
        }

        return result;
    }
    
    public String doVote()
    {
        String result="FAILURE";
        boolean success = VoterService.doVoteService(this);
        User user=UserService.getUser(this.voterId);
        if(success)
        {
            Email.sendEmailToRegisterUser(user.getEmailAddress());
            VoterService.voted(this.voterId);
            Voter voter=VoterService.getVoter(String.valueOf(this.voterId));
            sessionMap.put("Voter", voter);
            sessionMap.put("VoteMsg", "Your vote has been registered");
            result="SUCCESS";
        }
        else{
            sessionMap.put("VoteMsg", "Some Problem has Occured");
        }
        return result;
    }
    
    public String doVerifiedByAdmin() {
        String result = "FAILURE";
        boolean verification = VoterService.doVerification(String.valueOf(this.voterId));
        if (verification) {

            //String updateMsg = "FNOL ID =" + this.fnolId + "::processed successfully";
            //sessionMap.put("UpdateMsg", updateMsg);
//            sessionMap.put("ApiResultMsg",null);
//            sessionMap.put("HideAnchorTag", null);
//            sessionMap.put("RejectionMsg", null);
            Voter voter = new Voter();
            voter = VoterService.getVoter(String.valueOf(this.voterId));
            sessionMap.put("PVoter", voter);

            result = "SUCCESS";
        }
        //this.dogetAllFNOL();
        return result;
    }
    public String doRejectByAdmin() {
        String result = "FAILURE";
        boolean verification = VoterService.doAdminReject(String.valueOf(this.voterId));
        if (verification) {

            //String updateMsg = "FNOL ID =" + this.fnolId + "::processed successfully";
            //sessionMap.put("UpdateMsg", updateMsg);
//            sessionMap.put("ApiResultMsg",null);
//            sessionMap.put("HideAnchorTag", null);
//            sessionMap.put("RejectionMsg", null);
            Voter voter = new Voter();
           voter = VoterService.getVoter(String.valueOf(this.voterId));
            sessionMap.put("PVoter", voter);
            result = "SUCCESS";
        }
        //this.dogetAllFNOL();
        return result;
    }
    
}