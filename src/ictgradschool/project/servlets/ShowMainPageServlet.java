package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class ShowMainPageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);



            String userName =  (String) req.getSession().getAttribute("userName");

            if(userName == null){
                //make another method in dao
//                dao.randomArticle();
            }else{


                int postId = (int) req.getSession().getAttribute("postId");
                //make method- getPost(userName)
                PostJavaBean postBean = dao.getPost(postId);

                req.setAttribute("posts", postBean);
                req.getRequestDispatcher("mainPage.jsp").forward(req,resp);
                resp.sendRedirect("mainPage.jsp");
            }






        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
