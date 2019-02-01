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

public class DeleteAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //check if username that user enters matches what we have in our database
        //create a new session.

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String)req.getSession().getAttribute("username");
            dao.deleteAccount(userName);

            req.setAttribute("delete","deleted");
            req.getRequestDispatcher("mainPage.jsp").forward(req, resp);
            resp.sendRedirect("mainPage.jsp");
            } catch (SQLException e) {
                throw new ServletException(e);
            }


    }


}
