package ictgradschool.project.servlets;

import com.sun.org.apache.xpath.internal.SourceTree;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class NewPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = req.getParameter("username");
            System.out.println("This is username: " + userName);
            String password = req.getParameter("password");
            System.out.println("This is password" + password);

            //update the user info
            dao.updatePassword(userName, password);

            resp.sendRedirect("loginPage.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
