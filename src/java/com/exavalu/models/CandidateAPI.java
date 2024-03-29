/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

//import com.exavalu.utils.JDBCUtility;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.URL;
//import java.util.ArrayList;
import java.util.Map;
//import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
//import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * This model fetches API..
 */
public class CandidateAPI extends ActionSupport implements SessionAware, Serializable {

private String candidateId;
private String firstName;
private String lastName;
private String partyName;
private String age;
private String gender;
private String region;
private String candidateEmail;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

//    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();
//
//    @Override
//    public void setApplication(Map<String, Object> application) {
//        setMap((ApplicationMap) application);
//    }

    @Override
    public void setSession(Map<String, Object> session) {
        setSessionMap((SessionMap<String, Object>) (SessionMap) session);
    }

    /**
     * @return the candidateId
     */
    public String getCandidateId() {
        return candidateId;
    }

    /**
     * @param candidateId the candidateId to set
     */
    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the partyName
     */
    public String getPartyName() {
        return partyName;
    }

    /**
     * @param partyName the partyName to set
     */
    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    /**
     * @return the age
     */
    public String getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(String age) {
        this.age = age;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the region
     */
    public String getRegion() {
        return region;
    }

    /**
     * @param region the region to set
     */
    public void setRegion(String region) {
        this.region = region;
    }
    
    /**
     * @return the candidateEmail
     */
    public String getCandidateEmail() {
        return candidateEmail;
    }

    /**
     * @param candidateEmail the candidateEmail to set
     */
    public void setCandidateEmail(String candidateEmail) {
        this.candidateEmail = candidateEmail;
    }

    /**
     * @return the sessionMap
     */
    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    /**
     * @param sessionMap the sessionMap to set
     */
    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

   

    public String dofetchCandidateApi() throws Exception {
        String result = "SUCCESS";
        //JDBCUtility jdbcUtility = JDBCUtility.getInstanceOfJDBCUtility();
        String apiUrl = "https://mocki.io/v1/2fd2b26a-854a-49e1-8f13-e830f4a7253b";

        URL obj = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        // optional default is GET
        con.setRequestMethod("GET");
        //add request header
        con.setRequestProperty("Accept", "application/json");
        int responseCode = con.getResponseCode();
        System.out.println(this.candidateEmail);
        System.out.println("\nSending 'GET' request to URL : " + apiUrl);
        System.out.println("Response Code : " + responseCode);
        @SuppressWarnings("PMD")
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
//        int c = 0;
//        ArrayList userList = new ArrayList<>();
        JSONParser parse = new JSONParser();

        while ((inputLine = in.readLine()) != null) {

            response.append(inputLine);
        }
        JSONArray jsonArray = (JSONArray) parse.parse(response.toString());
        System.out.println(jsonArray.size());
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject myResponse = (JSONObject) jsonArray.get(i);

            CandidateAPI candidateAPI = new CandidateAPI();
            candidateAPI.setCandidateId(myResponse.get("candidateId").toString());
            System.out.println(candidateAPI.getCandidateId());
            candidateAPI.setFirstName(myResponse.get("firstName").toString());
            candidateAPI.setLastName(myResponse.get("lastName").toString());
            candidateAPI.setGender(myResponse.get("gender").toString());
            candidateAPI.setPartyName(myResponse.get("partyName").toString());
            candidateAPI.setAge(myResponse.get("age").toString());
            candidateAPI.setRegion(myResponse.get("region").toString());
            candidateAPI.setCandidateEmail(myResponse.get("candidateEmail").toString());

            if (candidateAPI.getCandidateEmail().equals(this.getCandidateEmail())) {
                getSessionMap().put("CandidateAPI", candidateAPI);
                getSessionMap().put("InsertCandidateError", "0");
                System.out.println("In if condition"+candidateAPI.getCandidateEmail());
                return result;
            }
            else
            {
                getSessionMap().remove("CandidateAPI");
                System.out.println("In else condition");
                getSessionMap().put("InsertCandidateError", "1");
            }
        }
        System.out.println(getSessionMap());

        return result;
    }


}