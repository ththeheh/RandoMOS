package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class ProfInfoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");

            UserInfoJavabean userBean = dao.getUserInfo(userName);
            req.setAttribute("userInfo", userBean);
            req.getRequestDispatcher("./profilePage.jsp").forward(req,resp);
            resp.sendRedirect("./profilePage.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
