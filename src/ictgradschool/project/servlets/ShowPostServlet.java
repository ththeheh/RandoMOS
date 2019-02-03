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

            int postId = req.getParameter("postId"); // <a href="MyServlet?data=MyData">Go to server</a> format to be added in .jsp file for the postId on clicked.

            String userName = (String) req.getSession().getAttribute("username");

            PostJavaBean post = new PostJavaBean(postId);

            req.setAttribute("postId", postId);
            req.getRequestDispatcher("article.jsp").forward(req,resp);
            resp.sendRedirect("article.jsp");
//                    req.setAttribute("login", userName); //do later


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
