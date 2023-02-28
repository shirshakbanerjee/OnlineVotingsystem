/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.ResultService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;


/**
 *
 * @author Admin
 */
public class Result extends ActionSupport implements ApplicationAware, SessionAware, Serializable{
    
    private String candidateId;
    private String candidateName;
    private String firstName;
    private String votes;
    private String states;
    private String count;
    
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

    public String getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public String getVotes() {
        return votes;
    }

    public void setVotes(String votes) {
        this.votes = votes;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getStates() {
        return states;
    }

    public void setStates(String states) {
        this.states = states;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
    
    public String getResult()
    {
        String result="FAILURE";
        ArrayList resultList = ResultService.calculateResult();
        Iterator itr=resultList.iterator();
        ArrayList stateList = ResultService.calculateState();
        Iterator itr2=stateList.iterator();
        if(itr.hasNext() && itr2.hasNext())
        {
            System.out.println("Returning success from results!!");
            sessionMap.put("ResultList", resultList);
            sessionMap.put("StateList", stateList);
            result="SUCCESS";
        }
        else{
            System.out.println("Some Error occured in results!!");
//            sessionMap.put("VoteMsg", "Some Problem has Occured");
        }
        return result;
    }
    
}
