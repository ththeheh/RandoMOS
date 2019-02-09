package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.http.HTTPException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class EditPostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
//            String userName = (String) req.getSession().getAttribute("username");
            int postId = Integer.parseInt(req.getParameter("postId"));
            String title = req.getParameter("title");
            String post = req.getParameter("post");
            //update the user info
            post = post.substring(post.indexOf(">")+1,post.lastIndexOf("<"));

            dao.editPost(postId, title, post);
            PostJavaBean showPost = dao.getPost(postId);

            showPost.setIconPath(dao.getUserInfo(showPost.getUserName()).getIconPath());
//            System.out.println("this is running");
            req.setAttribute("post", showPost);
            req.setAttribute("show",true);

            req.getRequestDispatcher("post.jsp").forward(req,resp);
            resp.sendRedirect("post.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
