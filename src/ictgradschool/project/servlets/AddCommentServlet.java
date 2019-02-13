package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {

            PrintWriter out =  resp.getWriter();;

            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");
            int postId = Integer.parseInt(req.getParameter("postId"));
            int commentId = Integer.parseInt(req.getParameter("commentId"));
            String comment = req.getParameter("comment");
//            System.out.println("this is running" + comment);
            Comment newComment = new Comment(postId, commentId, userName, comment);
            dao.saveComments(newComment);
            String iconPath = dao.getUserInfo(userName).getIconPath();

            String userJsonStr = "{\"userName\":"+"\""+userName+"\""+","+"\"iconPath\":"+"\""+iconPath+"\""+"}";  //not working properly0
            resp.setContentType("text");
            out.print(userJsonStr);
            out.flush();

        } catch (SQLException e1) {
            e1.printStackTrace();
        }

    }

}
