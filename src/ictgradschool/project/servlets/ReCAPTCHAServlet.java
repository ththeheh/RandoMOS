package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class ReCAPTCHAServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String recaptcha_response = req.getParameter("g-recaptcha-response");
        System.out.println(recaptcha_response);

        HttpURLConnection conn = (HttpURLConnection) new URL("https://www.google.com/recaptcha/api/siteverify").openConnection();
        String para = "secret=6LfUG5EUAAAAAF6cl_dxnsnfAtNXGOFJwjxAOl8w" + "&response=" + recaptcha_response;
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        DataOutputStream writer = new DataOutputStream(conn.getOutputStream());
        writer.writeBytes(para);
        writer.flush();
        writer.close();

        int responseCode = conn.getResponseCode();
        StringBuffer responseBody = new StringBuffer();
        if (responseCode == 200) {

            BufferedInputStream inputStream = new BufferedInputStream(conn.getInputStream());
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            String line;
            while ((line = reader.readLine()) != null) {
                responseBody.append(line);
            }
            inputStream.close();

            if (responseBody.toString().indexOf("\"success\": true") > -1){}
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
    }
}


