package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

public class ChangeIconLibServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    try (Connection connection = DBConnection.createConnection()) {

        LoginDataDAO dao = new LoginDataDAO(connection);
        String userName = (String) req.getSession().getAttribute("username");

        String iconName = req.getParameter("iconName");

        System.out.println(iconName);

        dao.changeIcon(userName,iconName);

        PrintWriter out = resp.getWriter();
        out.print("success");

    } catch (SQLException e1) {
        e1.printStackTrace();
    }

}
}
