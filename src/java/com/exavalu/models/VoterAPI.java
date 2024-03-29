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
//import java.util.ArrayList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * This model fetches API.
 */
public class VoterAPI extends ActionSupport implements SessionAware, Serializable {

    private String voterId;
    private String firstName;
    private String lastName;
    private String gender;
    private String dob;
    private String state;

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

    /**
     * @return the voterId
     */
    public String getVoterId() {
        return voterId;
    }

    /**
     * @param voterId the voterId to set
     */
    public void setVoterId(String voterId) {
        this.voterId = voterId;
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
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }


    public String dofetchVoterApi() throws Exception {
        String result = "VOTERDETAILS";
        //JDBCUtility jdbcUtility = JDBCUtility.getInstanceOfJDBCUtility();
        String apiUrl = "https://mocki.io/v1/15376a74-e63d-488b-bf89-c960c9fb9881";

        URL obj = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        // optional default is GET
        con.setRequestMethod("GET");
        //add request header
        con.setRequestProperty("Accept", "application/json");
        int responseCode = con.getResponseCode();
        System.out.println(this.voterId);
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

            VoterAPI voterAPI = new VoterAPI();
            voterAPI.setVoterId(myResponse.get("voterId").toString());
            System.out.println(voterAPI.getVoterId());
            voterAPI.setFirstName(myResponse.get("firstName").toString());
            voterAPI.setLastName(myResponse.get("lastName").toString());
            voterAPI.setGender(myResponse.get("gender").toString());
            voterAPI.setDob(myResponse.get("dob").toString());
            voterAPI.setState(myResponse.get("state").toString());

            if (voterAPI.getVoterId().equals(this.voterId)) {
                sessionMap.put("VoterAPI", voterAPI);
            }
        }
        System.out.println(sessionMap);
        return result;
    }
}
