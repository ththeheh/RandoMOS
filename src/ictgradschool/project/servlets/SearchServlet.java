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
import java.util.List;

public class SearchServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String keyW = req.getParameter("keyWord");
            List<PostJavaBean> posts= dao.search(keyW);

            for(PostJavaBean postJavaBean:posts){
                postJavaBean.setIconPath(dao.getUserInfo(postJavaBean.getUserName()).getIconPath());
            }

            req.setAttribute("stop",true);
            req.setAttribute("posts", posts);

            System.out.println("your search posts will be dispatched");

            req.getRequestDispatcher("mainPage.jsp").forward(req, resp);

            } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}