package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

public class UserNameCheckServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp );

    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {

            PrintWriter out = resp.getWriter();

            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = req.getParameter("userName");
            System.out.println("conflict check: "+userName);

            String regMsg = dao.usernameConflict(userName, "@");

            System.out.println("conflict check: "+regMsg);

            if (regMsg.equals("Okay")) {

                resp.setContentType("application/text");
                out.print("Okay");
                out.flush();
            } else{
                resp.setContentType("text");
                out.print("Exist");
                out.flush();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
