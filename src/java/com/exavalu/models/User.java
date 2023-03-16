/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;


import com.exavalu.services.AdminService;
import com.exavalu.services.CandidateService;
import com.exavalu.services.PartyService;
import com.exavalu.services.UserService;
import com.exavalu.services.VoterService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * This model is used for user login.
 */
public class User extends ActionSupport implements SessionAware, Serializable {

    private String emailAddress;
    private String firstName;
    private String lastName;
    private String password;
    private String roleId;
    private String voterId;
    private int otp;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getVoterId() {
        return voterId;
    }

    public void setVoterId(String voterId) {
        this.voterId = voterId;
    }

    public int getOtp() {
        return otp;
    }

    public void setOtp(int otp) {
        this.otp = otp;
    }
    
    @SuppressWarnings("PMD")
    public String doLogin() throws Exception {
        String result = "FAILURE";
        //int x = UserService.doLogin(this);
        int x = 100;
        if (this.password.equalsIgnoreCase("") && sessionMap.get("OTP") != null) {
            x = UserService.doLogin2(this);
        } else {
            x = UserService.doLogin(this);
            System.out.print("In else");
            sessionMap.clear();
        }
        if (x == 100) {
            sessionMap.put("Error", "Wrong data");
        } else if (x == 2) {
            result = "ADMIN";
            Admin admin = AdminService.getAdmin(this.emailAddress);
            if (admin.getFirstName() == null) {
                sessionMap.put("Error", "Wrong data");
                return "FAILURE";
            }
            sessionMap.put("Admin", admin);
            List<Candidate> candidateList = CandidateService.getAllCandidates();
            List<Party> partyList = PartyService.getAllParty();

            sessionMap.put("CandidateList", candidateList);
            sessionMap.put("PartyList", partyList);
            List<Voter> voterList = VoterService.getAllVoters();
            sessionMap.put("VoterList", voterList);
            sessionMap.put("totalVoters", voterList.size());
            int verification = VoterService.dogetApproveVoter();
            sessionMap.put("Verification", verification);
            int rejected = VoterService.dogetRejectedVoter();
            sessionMap.put("Rejected", rejected);
            int pending = VoterService.dogetPendingVoter();
            sessionMap.put("Pending", pending);
            int voted = VoterService.dogetVoted();
            sessionMap.put("Voted", voted);
            int notVoted = VoterService.dogetNotVoted();
            sessionMap.put("NotVoted", notVoted);
        } else if (x == 1 && !this.voterId.equalsIgnoreCase("")) {
            result = "VOTER";
            Voter voter = VoterService.getVoter2(this.voterId, this.emailAddress);
            System.out.println(voter.getFirstName());
            if (voter.getFirstName() == null) {
                sessionMap.put("Error", "Wrong data!!");
                return "FAILURE";
            }
            if (Integer.parseInt(voter.getAdminStatus()) == 0) {
                sessionMap.put("Error", "Admin has not approved your profile yet!!");
                System.out.println("Not approved!!");
                return "FAILURE";
            } else if (Integer.parseInt(voter.getAdminStatus()) == 2) {
                sessionMap.put("Error", "Admin has rejected your profile!!");
                System.out.println("Rejected");
                return "FAILURE";
            }
            sessionMap.put("Voter", voter);
            List<Candidate> candidateList = CandidateService.getAllCandidates();
            sessionMap.put("CandidateList", candidateList);
        }

        return result;
    }

    public String dogetParticularVoter() {
        String result = "DETAILSOFVOTER";
        Voter voter = new Voter();
        voter = VoterService.getVoter(this.voterId);

        if (voter != null) {
            sessionMap.put("PVoter", voter);
            result = "DETAILSOFVOTER";
        }

        return result;
    }

    public String sendOtp() {
        Random random = new Random();
        int otp1 = random.nextInt(999999);

        Email.getInstance().sendOTPToRegisterUser(this.emailAddress, otp1);
        System.out.println("send OTP Triggered");
        System.out.println("OTP " + otp1);
        sessionMap.put("OTP", otp1);
        sessionMap.put("User", this);

        return "SUCCESS";
    }

    public String showVoter() {
        String result = "SUCCESS";
        List<Candidate> candidateList = CandidateService.getAllCandidates();
        List<Party> partyList = PartyService.getAllParty();

        sessionMap.put("CandidateList", candidateList);
        sessionMap.put("PartyList", partyList);
        List<Voter> voterList = VoterService.getAllVoters();
        sessionMap.put("VoterList", voterList);
        sessionMap.put("totalVoters", voterList.size());
        int verification = VoterService.dogetApproveVoter();
        sessionMap.put("Verification", verification);
        int rejected = VoterService.dogetRejectedVoter();
        sessionMap.put("Rejected", rejected);
        int pending = VoterService.dogetPendingVoter();
        sessionMap.put("Pending", pending);
        int voted = VoterService.dogetVoted();
        sessionMap.put("Voted", voted);
        int notVoted = VoterService.dogetNotVoted();
        sessionMap.put("NotVoted", notVoted);
        return result;
    }

}
