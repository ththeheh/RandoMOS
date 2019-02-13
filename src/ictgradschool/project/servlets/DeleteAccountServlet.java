package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeleteAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userName;
        List<UserInfoJavabean> accs = new ArrayList<>();
        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);

            String admin = req.getParameter("admin");
            if (admin != null) {
                userName = req.getParameter("userName");
                dao.deleteAccount(userName);
                accs = dao.getAccounts();
                req.setAttribute("accounts", accs);
                req.getRequestDispatcher("./admin.jsp").forward(req, resp);
            } else {
                userName = (String) req.getSession().getAttribute("username");
                req.getSession().setAttribute(null, userName);

                req.setAttribute("stop", false);
                req.setAttribute("delete", "deleted");
                req.getRequestDispatcher("./mainPage.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }


    }
}
