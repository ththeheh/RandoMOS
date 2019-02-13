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

            int postId =Integer.parseInt(req.getParameter("postId"));
            PostJavaBean showPost = dao.getPost(postId);

            UserInfoJavabean userInfo = dao.getUserInfo(showPost.getUserName());
            showPost.setIconPath(dao.getUserInfo(showPost.getUserName()).getIconPath());

            req.setAttribute("post", showPost);
            req.setAttribute("show",true);
            req.getRequestDispatcher("./post.jsp").forward(req,resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
