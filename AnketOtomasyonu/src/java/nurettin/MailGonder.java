/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nurettin;

import java.security.Security;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailGonder {

private static final String SMTP_HOST_NAME = "smtp.gmail.com";

private static final String SMTP_PORT = "465";

private static String emailMsgTxt =null;

private static String emailSubjectTxt = null;

// mailin kimden gittiğini gösteren adres.Gerçek gmail adresin

private static final String

        emailFromAddress = "nurettintoparli@gmail.com";

private static final String SSL_FACTORY =

        "javax.net.ssl.SSLSocketFactory";

// mail göndermek istediğimiz adresler

private static String sendTo = null;

private static MailGonder instance = null;

private MailGonder() { }


public static MailGonder getinstance()

{

        if (instance == null)

                instance = new MailGonder();

        return instance;

}

public static void setEmailMsgTxt(String emailMsgTxt) {

    MailGonder.emailMsgTxt = emailMsgTxt;

}

public static void setEmailSubjectTxt(String emailSubjectTxt) {

    MailGonder.emailSubjectTxt = emailSubjectTxt;

}

public static void setSendTo(String sendTo) {

    MailGonder.sendTo = sendTo;

}

public void sendSSLMessage() throws MessagingException {

Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

Properties props = new Properties();

props.put("mail.smtp.host", SMTP_HOST_NAME);

props.put("mail.smtp.auth", "true");

props.put("mail.debug", "true");

props.put("mail.smtp.port", SMTP_PORT);

props.put("mail.smtp.socketFactory.port", SMTP_PORT);

props.put("mail.smtp.socketFactory.class", SSL_FACTORY);

props.put("mail.smtp.socketFactory.fallback", "false");

Session session = Session.getDefaultInstance(props,

new javax.mail.Authenticator() {

protected PasswordAuthentication getPasswordAuthentication() {

// buraya gmail mail adresinizi ve sifrenizi girmelisiniz.

return new PasswordAuthentication("nurettintoparli@gmail.com",

    "N");

}

});

Message msg = new MimeMessage(session);

InternetAddress addressFrom = new InternetAddress(emailFromAddress);

msg.setFrom(addressFrom);

InternetAddress addressTo = new InternetAddress(sendTo);

msg.setRecipient(Message.RecipientType.TO, addressTo);

msg.setSubject(emailSubjectTxt);

msg.setContent(emailMsgTxt, "text/plain");

Transport.send(msg);

}  }