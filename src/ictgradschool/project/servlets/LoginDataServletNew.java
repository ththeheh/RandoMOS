package ictgradschool.project.servlets;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class LoginDataServletNew extends HttpServlet {
    //Retrieve parameters and store new entries in the database
    //Redirect back to the LoginDataServlet
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {

            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = req.getParameter("userName");
            String firstName = req.getParameter("firstName");
            String lastName =req.getParameter("lastName");
            String birthday = req.getParameter("birthday");
            String country = req.getParameter("country");
            String email = req.getParameter("email");
            String description = req.getParameter("description");
            String password = req.getParameter("password");
            String hashedSaltedCode = req.getParameter("hashedSaltedCode");

            LoginDataJavabean loginData = new LoginDataJavabean();
            loginData.setUserName(userName);
            loginData.setFirstName(firstName);
            loginData.setLastName(lastName);
            loginData.setBirthday(birthday);
            loginData.setCountry(country);
            loginData.setEmail(email);
            loginData.setDescription(description);
            loginData.setPassword(password);
            loginData.setHashedSaltedCode(hashedSaltedCode);

            dao.addLoginData(loginData);

            //sendRedirect to LoginDataServlet
            //refer to web.xml file for url-pattern
            resp.sendRedirect("../loginData");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
