package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class ShowPostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);

//            String userName = (String) req.getSession().getAttribute("username");
//            System.out.println("this is the post Id"+req.getParameter("postId"));
            int postId =Integer.parseInt(req.getParameter("postId"));
//            req.setAttribute("postId", postId);
            PostJavaBean showPost = dao.getPost(postId);


            UserInfoJavabean userInfo = dao.getUserInfo(showPost.getUserName());
            showPost.setIconPath(dao.getUserInfo(showPost.getUserName()).getIconPath());
            System.out.println("this is the post username"+showPost.getUserName());
//            System.out.println("this is running");

            req.setAttribute("post", showPost);
            req.setAttribute("show",true);

            req.getRequestDispatcher("post.jsp").forward(req,resp);
            resp.sendRedirect("post.jsp");
//                    req.setAttribute("login", userName); //do later


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
