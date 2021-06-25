/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.helper;

import java.io.File;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.*;

public class MailSending {

    private String from;
    private String to;
    private String subject;
    private String message;

    public MailSending(String from, String to, String subject, String message) {
        this.from = from;
        this.to = to;
        this.subject = subject;
        this.message = message;
    }

    public MailSending(String to, String message) {
        this.to = to;
        this.message = message;
    }

    public static boolean sentMail(String from, String to, String subject, String message) {
        Boolean mailsent = false;

        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.debug", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

//code end here stackoverflow
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("aryan.santosh.97@gmail.com", "9810667915");
            }

        });

        session.setDebug(true);

        //Step 2 : compose the message [text,multi media]
        MimeMessage m = new MimeMessage(session);

        try {

            //from email
            m.setFrom(new InternetAddress(from));

            //adding recipient to message
            m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            //adding subject to message
            m.setSubject(subject);

            //adding text to message
            m.setText(message);

            //send 
            //Step 3 : send the message using Transport class
            Transport.send(m);

            mailsent = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mailsent;
    }

    public static Boolean sentMailByYahoo(String to, String otp,String header) {
        Boolean r = false;

        String OTP = otp;
        String from = "santdeveloper@yahoo.com ";
//        String pass = "startcareer@1997yahoo";
//        String to = "aryan.santosh.97@gmail.com";
        String host = "smtp.mail.yahoo.com";
//        Properties pro = System.getProperties();
//        pro.put("mail.smtp.starttls.enable", "true");
//        pro.put("mail.smtp.host", host);
//        pro.put("mail.smtp.user", from);
//        pro.put("mail.smtp.password", pass);
//        pro.put("mail.smtp.port", "587");
//        pro.put("mail.smtp.auth", "true");
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
//        props.setProperty("mail.host", "smtp.gmail.com");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.debug", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "xqgyizxhdubmycww");
//                return new PasswordAuthentication("sikshasetu", "xqgyizxhdubmycww");
            }

        });
        session.setDebug(true);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(header);
            message.setText(OTP);

//           sending messa/ge
            Transport transport = session.getTransport("smtp");
            transport.connect(host, "santdeveloper@yahoo.com", "xqgyizxhdubmycww");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
//            Transport.send(message);
            System.out.println("message send successully");
            r = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

}
