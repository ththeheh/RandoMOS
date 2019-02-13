package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

public class LoginDataServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //check if username that user enters matches what we have in our database
        //create a new session.
        HttpSession session = req.getSession();

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = req.getParameter("username");
            String password = req.getParameter("password");
            try {

                String usernameinfo = dao.validation(userName, password);
                if (!usernameinfo.equals("Notmatch") && !usernameinfo.equals("Notexist")) {

                    session.setAttribute("username", userName);
                    session.setAttribute("admin", dao.checkAdmin(userName));


                    resp.sendRedirect("./mainPage.jsp");            //if the username is a username, send to mainpage
//to get postlist from DAO.

                } else {
                    //ask for register or reenter.
                    Cookie cookie = new Cookie("usernameinfo", usernameinfo);
                    cookie.setMaxAge(5);
                    resp.addCookie(cookie);
                    req.getRequestDispatcher("./loginPage.jsp").forward(req, resp);
                }
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


}
