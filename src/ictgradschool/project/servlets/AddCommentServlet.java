package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

public class AddCommentServlet extends HttpServlet {
    //Retrieve parameters and store new entries in the database
    //Redirect back to the LoginDataServlet
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {

            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");
            int postId = Integer.parseInt(req.getParameter("postId"));
            int commentId = Integer.parseInt(req.getParameter("commentId"));
            String comment = req.getParameter("comment");

//            System.out.println("this is running" + comment);

            Comment newComment = new Comment(postId, commentId, userName, comment);

            dao.saveComments(newComment);
//            System.out.println("running ok");
            // need to call encoding class to create hashedcode to store
//            req.setAttribute("newComment", newComment);
//            req.getRequestDispatcher("article.jsp").forward(req, resp);

            req.setAttribute("userName",userName);
            req.setAttribute("iconPath",dao.getUserInfo(userName).getIconPath());
            req.getRequestDispatcher("article.jsp").forward(req, resp);

        } catch (SQLException e1) {
            e1.printStackTrace();
        }


        //sendRedirect to LoginDataServlet
        //refer to web.xml file for url-pattern


    }

}