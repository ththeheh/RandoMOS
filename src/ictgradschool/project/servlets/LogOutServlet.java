package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LogOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession() != null) {
            req.getSession().invalidate();
        }

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            List<PostJavaBean> posts = new ArrayList<>();
            posts = dao.getLatestPosts();
            System.out.println(posts);

            posts.removeIf(value -> value.getVis().equals("no"));

            for (PostJavaBean postJavaBean : posts) {
                postJavaBean.setIconPath(dao.getUserInfo(postJavaBean.getUserName()).getIconPath());
                if (postJavaBean.getVis().equals("yes")) {
                    postJavaBean.setVis("Visible");
                } else {
                    postJavaBean.setVis("Not Visible");
                }
            }

            req.setAttribute("stop", true);
            req.setAttribute("posts", posts);

            System.out.println("latest posts will be dispatched");

            req.getRequestDispatcher("./mainPage.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
