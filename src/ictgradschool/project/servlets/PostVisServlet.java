package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.http.HTTPException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class PostVisServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");
            String vis = req.getParameter("vis");
            int postId= Integer.parseInt(req.getParameter("postId"));

            dao.editPostVis(postId,vis);

//            System.out.println("this is running");
//            req.getRequestDispatcher("mainPage.jsp").forward(req,resp);
            resp.sendRedirect("mainPage.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
