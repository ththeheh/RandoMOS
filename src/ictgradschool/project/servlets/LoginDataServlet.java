package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class LoginDataServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //check if username that user enters matches what we have in our database
        //
        HttpSession session = req.getSession();

        PrintWriter out = resp.getWriter();

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = req.getParameter("userName");
            String password = req.getParameter("password");
            try {
                String usernameinfo = dao.validation(userName, password);
                if (!usernameinfo.equals("Not match") && !usernameinfo.equals("Not exist")) {
                    resp.sendRedirect(Mainpage.jsp);            //if the username is a username, send to mainpage
                    req.setAttribute("login", userName);       //do later
                } else {
                    req.setAttribute("usernameinfo", usernameinfo);

                    //I need to know the filename for jsp file to dispatch the data
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    //Retrieving data using DAO from database
    private List<LoginDataJavabean> displayAccessLogList(PrintWriter out) throws SQLException {
        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            List<LoginDataJavabean> loginDataList = dao.allLoginData();
            return loginDataList;
        }
    }
}
