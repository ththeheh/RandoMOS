package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class AddPostServlet extends HttpServlet {
    //Retrieve parameters and store new entries in the database
    //Redirect back to the LoginDataServlet
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {

            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");
            System.out.println(userName);
            String title = req.getParameter("title");
            System.out.println("add post title: "+title);

            String post = req.getParameter("post");
//            System.out.println("addpost before:"+post);

//            post = post.substring(post.indexOf(">")+1,post.lastIndexOf("<"));

            System.out.println("addpost :"+post);

            LocalDate date = LocalDate.parse(req.getParameter("date"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");
            System.out.println(formatter.format(date));
            PostJavaBean newPost = new PostJavaBean(userName, title, post,formatter.format(date));
            int postId = dao.savePosts(newPost);

            UserInfoJavabean userInfo = dao.getUserInfo(userName);
//set postId
            newPost.setPostId(postId);
            newPost.setIconPath(userInfo.getIconPath());
//            System.out.println("this is running");

            System.out.println("post date"+newPost.getDate());
            req.setAttribute("post", newPost);

            req.getRequestDispatcher("post.jsp").forward(req, resp);
//            resp.sendRedirect("post.jsp");
//            resp.sendRedirect("post.jsp");

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
