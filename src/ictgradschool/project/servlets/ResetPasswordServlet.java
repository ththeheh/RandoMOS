package ictgradschool.project.servlets;

import javax.mail.internet.InternetHeaders;
import javax.mail.internet.MimeBodyPart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");

        String mailProtocol = "smtp";

        String mailHost = "smtp.gmail.com";

        String mailPort = "587";

        String mailId = "ththeheh@gmail.com";

        String mailPassword = "Park1234";


        String fromName = "From RandoMOS";

        String fromEmail = "ththeheh@gmail.com";

        String toName = "To" + email;

        String toEmail = email;

        String mailTitle = "Reset your password";




//        String link = "db.sporadic.nz/web/newPassword.jsp";
        String link = "http://localhost:8083/resetNewPassword.jsp";

        String mailContents = "Click this link to reset your password \n" + link;

        String debugMode = "false";

        String authMode = "true";


        try {


            boolean debug = Boolean.valueOf(debugMode).booleanValue();


            Properties mailProps = new Properties();

            mailProps.put("mail.smtp.starttls.enable", "true");

            mailProps.setProperty("mail.transport.protocol", mailProtocol);

            mailProps.put("mail.debug", debugMode);

            mailProps.put("mail.smtp.host", mailHost);

            mailProps.put("mail.smtp.port", mailPort);

            mailProps.put("mail.smtp.connectiontimeout", "5000");

            mailProps.put("mail.smtp.timeout", "5000");

            mailProps.put("mail.smtp.auth", authMode);


            Session msgSession = null;

            if (authMode.equals("true")) {

                Authenticator auth = new MyAuthentication(mailId, mailPassword);

                msgSession = Session.getInstance(mailProps, auth);

            } else {

                msgSession = Session.getInstance(mailProps, null);

            }


            msgSession.setDebug(debug);


            MimeMessage msg = new MimeMessage(msgSession);

            msg.setFrom(new InternetAddress(fromEmail, fromName));

            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName));

            msg.setSubject(mailTitle);

            msg.setContent(mailContents, "text/html; charset=euc-kr");

            Transport t = msgSession.getTransport(mailProtocol);

            try {

                t.connect();

                t.sendMessage(msg, msg.getAllRecipients());

            } finally {

                t.close();

            }


        } catch (Exception e) {

            e.printStackTrace();

        }

        resp.sendRedirect("loginPage.jsp");
    }



    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}





