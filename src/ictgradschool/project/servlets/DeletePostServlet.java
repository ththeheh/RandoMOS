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

public class DeletePostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //check if username that user enters matches what we have in our database
        //create a new session.

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            System.out.println("servlet is running");
            String userName = (String)req.getSession().getAttribute("username");
            int postId = Integer.parseInt(req.getParameter("deletepostid"));
            dao.deletePost(postId);

            req.setAttribute("postdelete","deleted");

            System.out.println(postId);

            //add postdelted to mainpage for alert("Your post is deleted").

            req.getRequestDispatcher("mainPage.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }


    }


}
