/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import java.util.Locale;
import java.util.Properties;
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
 * This model is used for email integration
 */
public class Email {

    static Logger log = Logger.getLogger(Email.class.getName());
//    static String fromEmail = "cleanandbuild@gmail.com";
//    static String password = "dopuncolmlxiocua";
//    static String userName = "nitishsah02";
    static String fromEmail = "electioncommisionind@gmail.com";
    static String password = "fxghizswynhbuifb";
    static String userName = "electioncommisionind";

    @SuppressWarnings("PMD")
    public static void sendEmailToRegisterUser(String toEmail, String first, String last) {
//        String message = "Dear " + first.toUpperCase(Locale.US) + " " + last.toUpperCase(Locale.US) + ",\n" + " We would like to extend our warmest congratulations and gratitude to you for exercising your right to vote.\n"
//                + " Your vote is a vital contribution to the democratic process,"
//                + " and we appreciate your participation in shaping our community's future.\n\n"
//                + "Regards,\nelectionindia1";

        String message = "<html><body style='font-family: Arial, sans-serif; font-size: 14px;'>"
                + "<p>Dear <b>" + first.toUpperCase(Locale.US) + " " + last.toUpperCase(Locale.US) + "</b>,</p>"
                + "<p>We would like to extend our warmest congratulations and gratitude to you for exercising your right to vote.</p>"
                + "<p>Your vote is a vital contribution to the democratic process, and we appreciate your participation in shaping our community's future.</p>"
                + "<p style='color: #007bff;'><i>Regards,</i><br><span style='color: #FFA500'>Vote</span> <span style='color: #008000'>India</span></p></body></html>";
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
            //mailMessage.setText(message);
            mailMessage.setContent(message, "text/html; charset=utf-8");

            Transport.send(mailMessage);

        } catch (AddressException ex) {
            log.error("Error in Email " + ex);
        } catch (MessagingException ex) {
            log.error("Error in Email " + ex);
        }
    }

    @SuppressWarnings("PMD")
    public static void sendEmailToCandidate(String toEmail, String first, String last) {
//        String message = "Dear " + first.toUpperCase(Locale.US) + " " + last.toUpperCase(Locale.US) + ",\n" + "We are here to inform you that the results of the election have been declared."
//                + " Regardless of the outcome, We want to congratulate "
//                + " you for putting yourselves forward as candidates and for participating in the democratic process.\n"
//                + "We want to express my appreciation for your efforts and commitment to your cause."
//                + " While the outcome may or may not have been in your favor,\n"
//                + "We hope that you will continue to stay engaged and active in your communities, "
//                + "and use this experience as a stepping stone towards future success.\nGo check it out:http://localhost:8080/OnlineVotingSystem/ShowResult \n"
//                + "Regards,\nelectionindia1";

        String message = "<html><body style='font-family: Arial, sans-serif; font-size: 14px;'>"
                + "<p>Dear <b>" + first.toUpperCase(Locale.US) + " " + last.toUpperCase(Locale.US) + "</b>,</p>"
                + "<p>We are here to inform you that the results of the election have been declared. Regardless of the outcome, We want to congratulate you for putting yourselves forward as candidates and for participating in the democratic process.</p>"
                + "<p>We want to express my appreciation for your efforts and commitment to your cause. While the outcome may or may not have been in your favor,</p>"
                + "<p>We hope that you will continue to stay engaged and active in your communities, and use this experience as a stepping stone towards future success.</p>"
                + "<p>Go check it out:<a href='http://localhost:8080/OnlineVotingSystem/ShowResult'>http://localhost:8080/OnlineVotingSystem/ShowResult</a></p>"
                + "<p style='color: #007bff;'><i>Regards,</i><br><span style='color: #FFA500'>Vote</span> <span style='color: #008000'>India</span></p></body></html>";

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
            //mailMessage.setText(message);
            mailMessage.setContent(message, "text/html; charset=utf-8");


            Transport.send(mailMessage);

        } catch (AddressException ex) {
            log.error("Error in sendEmailToCandidate " + ex);
        } catch (MessagingException ex) {
            log.error("Error in sendEmailToCandidate " + ex);
        }
    }

    @SuppressWarnings("PMD")

    public void sendOTPToRegisterUser(String toEmail, int otp) {
        try {
            // Set up email properties
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "25");

            // Create session with authentication
            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(userName, password);
                }
            });

            // Create message with HTML formatting
            Message mailMessage = new MimeMessage(session);
            String message = "<html><body style='font-family: Arial, sans-serif; font-size: 14px;'>"
                    + "<p>Dear User,</p>"
                    + "<p>Thank you for registering with our service. Your One-Time Password (OTP) is:</p>"
                    + "<p style='font-size: 24px; font-weight: bold; color: #007bff;'>" + otp + "</p>"
                    + "<p>Please enter this OTP to complete your registration.</p>"
                    + "<p style='color: #007bff;'><i>Regards,</i><br><span style='color: #FFA500'>Vote</span> <span style='color: #008000'>India</span></p></body></html>";
            mailMessage.setContent(message, "text/html");

            // Set message details and send
            mailMessage.setFrom(new InternetAddress(fromEmail));
            mailMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));
            mailMessage.setSubject("OTP for Registration");

            Transport.send(mailMessage);

        } catch (AddressException ex) {
            if (log.isDebugEnabled()) {
                log.error("Error in sendOTPToRegisterUser " + ex);
            }
        } catch (MessagingException ex) {
            if (log.isDebugEnabled()) {
                log.error("Error in sendOTPToRegisterUser " + ex);
            }
        }
    }

    private static Email email = null;

    @SuppressWarnings("PMD")
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
