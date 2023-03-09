/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.log4j.Logger;

/**
 *
 * @author ASUS
 */
public class Email {

    static String fromEmail = "electioncommisionind@gmail.com";
    static String password = "jbibglbzxwogndjc";
    static String userName = "electioncommisionind";
    
    public static void sendEmailToRegisterUser(String toEmail, String first, String last) {
        String message = "Dear " + first.toUpperCase() + " " + last.toUpperCase() + ",\n" +" We would like to extend our warmest congratulations and gratitude to you for exercising your right to vote.\n"
                + " Your vote is a vital contribution to the democratic process,"
                + " and we appreciate your participation in shaping our community's future.";
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "25");
            
            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(userName, password);
                }
            });
            
            Message mailMessage = new MimeMessage(session);

            //setting up all the messages
            mailMessage.setFrom(new InternetAddress(fromEmail));
            mailMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));
            mailMessage.setSubject("VOTE CONFIRMATION");
            mailMessage.setText(message);
            
            Transport.send(mailMessage);
            
        } catch (AddressException ex) {
            
        } catch (MessagingException ex) {
            
        }
    }
    
    public static void sendEmailToCandidate(String toEmail, String first, String last) {
        String message = "Dear " + first.toUpperCase() + " " + last.toUpperCase() + ",\n" + "We are here to inform you that the results of the election have been declared."
                + " Regardless of the outcome, We want to congratulate "
                + " you for putting yourselves forward as candidates and for participating in the democratic process.\n"
                + "We want to express my appreciation for your efforts and commitment to your cause."
                + " While the outcome may or may not have been in your favor,\n"
                + "We hope that you will continue to stay engaged and active in your communities, "
                + "and use this experience as a stepping stone towards future success.\nGo check it out:http://localhost:8080/OnlineVotingSystem/ShowResult";
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "25");
            
            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(userName, password);
                }
            });
            
            Message mailMessage = new MimeMessage(session);

            //setting up all the messages
            mailMessage.setFrom(new InternetAddress(fromEmail));
            mailMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));
            mailMessage.setSubject("RESULT DECLARED!!");
            mailMessage.setText(message);
            
            Transport.send(mailMessage);
            
        } catch (AddressException ex) {
            
        } catch (MessagingException ex) {
            
        }
    }

//    Random random = new Random(); 
//     int otp = random.nextInt(999999);
// 
    public void sendOTPToRegisterUser(String toEmail, int otp) {
        System.out.println("OTP" + otp);
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "25");
            
            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(userName, password);
                }
            });
            
            Message mailMessage = new MimeMessage(session);

            //setting up all the messages
            mailMessage.setFrom(new InternetAddress(fromEmail));
            mailMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));
            mailMessage.setSubject("Vote Confirmation");
            mailMessage.setText("Your OTP is: " + otp);
            
            Transport.send(mailMessage);
            
        } catch (AddressException ex) {
            
        } catch (MessagingException ex) {
            
        }
    }
    
    private static Email email = null;
    
    public static Email getInstance() {
        if (email == null) {
            email = new Email();
        }
        
        return email;
    }

//    public int getOTP()
//    {
//        return otp;
//    }
}
