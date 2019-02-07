package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class AddPostServlet extends HttpServlet {
    //Retrieve parameters and store new entries in the database
    //Redirect back to the LoginDataServlet
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {

            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");
            String title = req.getParameter("title");
            String post = req.getParameter("post");

            PostJavaBean newPost = new PostJavaBean(userName, title, post);

            int postId = dao.savePosts(newPost);

            UserInfoJavabean userInfo = dao.getUserInfo(userName);
//set postId
            newPost.setPostId(postId);
//            System.out.println("this is running");

            req.setAttribute("newPost", newPost);
            req.setAttribute("iconPath",userInfo.getIconPath());

            req.getRequestDispatcher("article.jsp").forward(req, resp);
            resp.sendRedirect("article.jsp");
//            resp.sendRedirect("article.jsp");

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
