package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class AddPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {

            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");
            String title = req.getParameter("title");
            System.out.println("add post title: " + title);
            String post = req.getParameter("post");
            post = post.substring(0, post.indexOf("<div"));

            LocalDate date = LocalDate.parse(req.getParameter("date"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");
//            System.out.println(formatter.format(date));
            PostJavaBean newPost = new PostJavaBean(userName, title, post, formatter.format(date));
            int postId = dao.savePosts(newPost);

            UserInfoJavabean userInfo = dao.getUserInfo(userName);
//set postId
            newPost.setPostId(postId);
            newPost.setIconPath(userInfo.getIconPath());
//            System.out.println("post date"+newPost.getDate());
            req.setAttribute("post", newPost);

            req.getRequestDispatcher("./post.jsp").forward(req, resp);

        } catch (SQLException e1) {
            e1.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
