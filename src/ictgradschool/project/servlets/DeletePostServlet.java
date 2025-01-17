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
import java.util.ArrayList;
import java.util.List;

public class DeletePostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection connection = DBConnection.createConnection()) {
            List<PostJavaBean> posts = new ArrayList<>();
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");
            int postId = Integer.parseInt(req.getParameter("deletepostid"));
            dao.deletePost(postId);
            posts = dao.getLatestPosts();
            posts.removeIf(value -> value.getVis().equals("no"));

            for (PostJavaBean postJavaBean : posts) {
                postJavaBean.setIconPath(dao.getUserInfo(postJavaBean.getUserName()).getIconPath());
                if (postJavaBean.getVis().equals("yes")) {
                    postJavaBean.setVis("Visible");
                } else {
                    postJavaBean.setVis("Not Visible");
                }
            }

            req.setAttribute("postdelete", "deleted");
            req.setAttribute("stop", true);
            req.setAttribute("posts", posts);

            System.out.println("latest posts will be dispatched");

            req.getRequestDispatcher("./mainPage.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }


    }


}
