package com.example.demo.service;


import com.example.demo.model.CallBack;
import com.example.demo.model.User;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.env.Environment;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletContext;
import java.io.File;
import java.util.Objects;
import java.util.ResourceBundle;

@Service
public class SendEmailService {

    private final Environment env;

    private final JavaMailSender mailSender;

    private final ServletContext context;


    public SendEmailService(Environment env, JavaMailSender mailSender, ServletContext context) {
        this.env = env;
        this.mailSender = mailSender;
        this.context = context;
    }
    public void sendRegistrationMail(User user) {
        MimeMessagePreparator mimeMessagePreparator = mimeMessage -> {
            ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages",Objects.requireNonNull(
                    Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
            mimeMessage.setFrom(new InternetAddress(Objects.requireNonNull(env.getProperty("email.sender"))));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getUsername()));
            mimeMessage.setSubject(resourceBundle.getString("emailReg"));

            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

            helper.setText("<html><body><img src='cid:logo'>" +
                    "<h1>" + resourceBundle.getString("emailHi") + " " + user.getName() + "!</h1>" +
                    "<p>" + resourceBundle.getString("emailRegThs") + "</p>" +
                    "</body></html>", true);
        };

        try {
            mailSender.send(mimeMessagePreparator);
        } catch (MailException e) {
            e.printStackTrace();
        }
    }

    public void sendAcceptOrDeniedMail(User user, CallBack callBack) {
        MimeMessagePreparator mimeMessagePreparator = mimeMessage -> {
            ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages",Objects.requireNonNull(
                    Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
            mimeMessage.setFrom(new InternetAddress(Objects.requireNonNull(env.getProperty("email.sender"))));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getUsername()));
            mimeMessage.setSubject(resourceBundle.getString("emailRequest"));

            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

            helper.setText( resourceBundle.getString("emailHi") + user.getName() + "!" +
                    resourceBundle.getString("emailRequest") + callBack.getCourseCallBack().getLanguage() + " - " + callBack.getCourseCallBack().getLevel() + " " +
                    resourceBundle.getString("emailResponse") + resourceBundle.getString(callBack.getStatus().toString()));

            helper.setText("<html><body><img src='cid:logo'>" +
                    "<h1>" + resourceBundle.getString("emailHi") + user.getName() + "!</h1>" +
                    "<p>" +  resourceBundle.getString("emailRequest") + callBack.getCourseCallBack().getLanguage() + " - " + callBack.getCourseCallBack().getLevel() + " " +"<p>"+
                    "<p>" +   resourceBundle.getString("emailResponse") + resourceBundle.getString(callBack.getStatus().toString()) +  "<p>" +
                    "</body></html>", true);
        };

        try {
            mailSender.send(mimeMessagePreparator);
        } catch (MailException e) {
            e.printStackTrace();
        }
    }

}
