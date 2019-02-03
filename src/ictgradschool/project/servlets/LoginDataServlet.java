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

public class LoginDataServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //check if username that user enters matches what we have in our database
        //create a new session.
        HttpSession session = req.getSession();

        PrintWriter out = resp.getWriter();

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = req.getParameter("username");
            String password = req.getParameter("password");

//            System.out.println(userName);
//            System.out.println(password);

            try {
                String usernameinfo = dao.validation(userName, password);
                if (!usernameinfo.equals("Not match") && !usernameinfo.equals("Not exist")) {

                    session.setAttribute("username", userName);
//                   System.out.println(session.getAttribute("username"));

                    resp.sendRedirect("mainPage.jsp");            //if the username is a username, send to mainpage
//                    req.setAttribute("login", userName); //do later

////to get postlist from DAO.
//                    req.setAttribute("otherPosts",otherPostList);
//                    req.setAttribute("myPosts",myPostList);


                } else {
                    //ask for register or reenter.
                    req.setAttribute("usernameinfo", usernameinfo);
                    //I need to know the filename for jsp file to dispatch the data
                    req.getRequestDispatcher("loginPage.jsp").forward(req, resp);
                }
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


}
