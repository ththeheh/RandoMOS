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
            String userName = (String) req.getSession().getAttribute("username");
            int postId = Integer.parseInt(req.getParameter("postId"));
            String title = req.getParameter("title");
            String post = req.getParameter("post");
            //update the user info

            dao.editPost(postId, title, post);

            //get the user info and redirect to the profile page.

//            PostJavaBean updatedPost = new PostJavaBean(userName, title, post);
//
//            UserInfoJavabean userInfo = dao.getUserInfo(userName);
////set postId
//            updatedPost.setPostId(postId);
////            System.out.println("this is running");
//
//            req.setAttribute("newPost", updatedPost);
//            req.setAttribute("iconPath",userInfo.getIconPath());
//
//            req.getRequestDispatcher("article.jsp").forward(req, resp);


            //                    req.setAttribute("login", userName); //do later


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
