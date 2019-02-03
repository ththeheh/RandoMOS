package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
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
            String lastName = req.getParameter("lastName");
            String birthday = req.getParameter("birthday");
            String country = req.getParameter("country");
            String email = req.getParameter("email");
            String description = req.getParameter("description");
            String password = req.getParameter("password");
            String iconPath = req.getParameter("icon");




//            Do hashedCode here and store; and when comparing password, we need to get the hashedcode out from database and then crack it to password and compare.
//            String hashedSaltedCode = req.getParameter("hashedSaltedCode");
//            System.out.println(password);

            UserInfoJavabean loginData = new UserInfoJavabean(userName, firstName, lastName, birthday, country, email, description, password,iconPath);
            // need to call encoding class to create hashedcode to store
            String regMsg = dao.usernameConflict(userName, email);
            if (regMsg.equals("Okay")) {
                dao.addLoginData(loginData);
            } else{
                req.setAttribute("regMsg",regMsg );
                req.getRequestDispatcher("reg.jsp").forward(req, resp);
            }


            //sendRedirect to LoginDataServlet
            //refer to web.xml file for url-pattern
            resp.sendRedirect("loginPage.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
