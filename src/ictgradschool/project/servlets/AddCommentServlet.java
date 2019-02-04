package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class AddCommentServlet extends HttpServlet {
    //Retrieve parameters and store new entries in the database
    //Redirect back to the LoginDataServlet
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {

            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = req.getParameter("userName");
            int postId= Integer.parseInt(req.getParameter("postId"));
            int commentId = Integer.parseInt(req.getParameter("commentId"));
            String comment = req.getParameter("comment");

            Comment newComment = new Comment(postId, commentId, userName, comment);

            dao.saveComments(newComment);
            // need to call encoding class to create hashedcode to store
            req.setAttribute("newComment",newComment);
            req.getRequestDispatcher("article.jsp").forward(req, resp);

        } catch (SQLException e1) {
            e1.printStackTrace();
        }


        //sendRedirect to LoginDataServlet
        //refer to web.xml file for url-pattern


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
