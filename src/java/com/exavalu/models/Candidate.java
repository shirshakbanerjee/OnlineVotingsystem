/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

/**
 *
 * @author SHIRSHAK
 */
import com.exavalu.services.CandidateService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

public class Candidate extends ActionSupport implements ApplicationAware, SessionAware, Serializable{
    private int candidateId;
    private String firstName;
    private String lastName;
    private String partyName;
    private String age;
    private String gender;
    private String region;
    private int candidateStatus;
    
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
        if(success)
        {
            result = "SUCCESS";
            System.out.println("Returning success from doInsert candidate");
            ArrayList candidateList = CandidateService.getAllCandidates();
            sessionMap.put("CandidateList",candidateList);
        }
        else
        {
            System.out.println("Returning failure from doInsert candidate");
        }
        return result;
    }
    
}
