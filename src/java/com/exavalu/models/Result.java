/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.CandidateService;
import com.exavalu.services.ResultService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.Serializable;
import java.sql.Time;
//import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
//import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
//import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * This model is used for getting election results.
 */
public class Result extends ActionSupport implements SessionAware, Serializable {

    private String candidateId;
    private String candidateName;
    private String firstName;
    private String lastName;
    private String votes;
    private String states;
    private String count;
    //@SuppressWarnings("PMD")
    private List stateNames;
    //@SuppressWarnings("PMD")
    private List stateVote;
    private String partyName;
    private Time voteTime;
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

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    
    public List getStateNames() {
        return stateNames;
    }

   
    public void setStateNames(List stateNames) {
        this.stateNames = stateNames;
    }

    
    public List getStateVote() {
        return stateVote;
    }

    
    public void setStateVote(List stateVote) {
        this.stateVote = stateVote;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public Time getVoteTime() {
        return voteTime;
    }

    public void setVoteTime(Time voteTime) {
        this.voteTime = voteTime;
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

    public String getResult() {
        String result = "FAILURE";
        int adminResultStatus = ResultService.getAdminResultStatus();
        if (adminResultStatus == 1 || adminResultStatus == 999) {
            return "FAILURE";
        }
        List<Result> resultList = ResultService.calculateResult();
        Iterator itr = resultList.iterator();
       List<Result> stateList = ResultService.calculateState();
        Iterator itr2 = stateList.iterator();
        List<Result> partyList = ResultService.calculateParty();
        Iterator itr3 = partyList.iterator();
        ArrayList<Integer> timeList = new ArrayList();
        timeList.add(ResultService.calculateTime("06:00:00", "07:00:00"));
        timeList.add(ResultService.calculateTime("07:00:00", "08:00:00"));
        timeList.add(ResultService.calculateTime("08:00:00", "09:00:00"));
        timeList.add(ResultService.calculateTime("09:00:00", "10:00:00"));
        timeList.add(ResultService.calculateTime("10:00:00", "11:00:00"));
        timeList.add(ResultService.calculateTime("11:00:00", "12:00:00"));
        timeList.add(ResultService.calculateTime("12:00:00", "13:00:00"));
        timeList.add(ResultService.calculateTime("13:00:00", "14:00:00"));
        timeList.add(ResultService.calculateTime("14:00:00", "15:00:00"));
        timeList.add(ResultService.calculateTime("15:00:00", "16:00:00"));
        timeList.add(ResultService.calculateTime("16:00:00", "17:00:00"));
        timeList.add(ResultService.calculateTime("17:00:00", "18:00:00"));

        if (itr.hasNext() && itr2.hasNext() && itr3.hasNext()) {
            System.out.println("Returning success from results!!");
            sessionMap.put("ResultList", resultList);
            sessionMap.put("StateList", stateList);
            sessionMap.put("PartyList", partyList);
            sessionMap.put("TimeList", timeList);

            //Calculating The Winner
            List<Result> allCandidates;
            allCandidates = ResultService.calculateResult();
            Iterator itrC;
            itrC = allCandidates.iterator();
            List<Result> allParty;
            allParty = ResultService.calculateParty();
            Iterator itrP;
            itrP = allParty.iterator();
            String wName = "";
            String wParty = "";
            String wpName = "";
            String images = "";
            int wVotes = -1;
            int wpVotes = -1;

            while (itrC.hasNext()) {
                Result candidate = (Result) itrC.next();
                if (Integer.parseInt(candidate.getVotes()) >= wVotes) {
                    wName = candidate.getFirstName() + " " + candidate.getLastName();
                    wParty = candidate.getPartyName();
                    wVotes = Integer.parseInt(candidate.getVotes());
                    images = candidate.getImageData();
                }
            }
            Result winnerCandidate = new Result();
            winnerCandidate.setFirstName(wName);
            winnerCandidate.setPartyName(wParty);
            winnerCandidate.setVotes(String.valueOf(wVotes));
            winnerCandidate.setImageData(images);
            System.out.println("Winner is " + winnerCandidate.getFirstName());
            sessionMap.put("WinnerCandidate", winnerCandidate);

            while (itrP.hasNext()) {
                Result party = (Result) itrP.next();
                if (Integer.parseInt(party.getCount()) >= wpVotes) {
                    wpName = party.getPartyName();
                    wpVotes = Integer.parseInt(party.getCount());
                }
            }
            Result winnerParty = new Result();
            winnerParty.setPartyName(wpName);
            winnerParty.setVotes(String.valueOf(wpVotes));
            System.out.println("Winner is " + winnerParty.getPartyName());
            sessionMap.put("WinnerParty", winnerParty);

            result = "SUCCESS";
        } else {
            System.out.println("Some Error occured in results!!");
//            sessionMap.put("VoteMsg", "Some Problem has Occured");
        }
        return result;
    }

    public String getCandidateResult() {
        String result = "FAILURE";
        Result candidateResult = ResultService.candidateResult(this.firstName);
        if (candidateResult.getStateVote() != null) {
            System.out.println("Returning success from Candidate results!!");
            sessionMap.put("CandidateResults", candidateResult);
            result = "SUCCESS";
        } else {
            System.out.println("Some Error occured in Candidate results!!");
//            sessionMap.put("VoteMsg", "Some Problem has Occured");
        }
        return result;
    }

    public String declareResult() {
        String result = "FAILURE";
        boolean success = ResultService.setAdminStatus();
        boolean success2 = ResultService.setAdminResultStatus(0);
        if (success && success2) {
            System.out.println("Returning success from seclare results");
            sessionMap.put("DeclareResultMsg", "Result Declared!!");
            List<Candidate> candidateEmail = CandidateService.getAllCandidates();
            Iterator itr = candidateEmail.iterator();
            while (itr.hasNext()) {
                Candidate candidate = (Candidate) itr.next();
                System.out.println(candidate.getCandidateEmail());
                Email.sendEmailToCandidate(candidate.getCandidateEmail(), candidate.getFirstName(), candidate.getLastName());
            }
            result = "SUCCESS";
        }
        return result;
    }

    public String beginVoting() {
        String result = "FAILURE";
        boolean success = ResultService.setAdminResultStatus(1);
        if (success) {
            sessionMap.put("DeclareResultMsg", "Result Declared!!");
            result = "SUCCESS";
        }
        return result;
    }

}
