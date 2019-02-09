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
    //Retrieve parameters and store new entries in the database
    //Redirect back to the LoginDataServlet

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

                System.out.println("this is running: "+regMsg);
                resp.setContentType("application/text");
//            resp.setCharacterEncoding("UTF-8");
                out.print("Okay");
                out.flush();
            } else{
                System.out.println("user name is taken!");
                resp.setContentType("text");
//            resp.setCharacterEncoding("UTF-8");
                out.print("Exist");
                out.flush();
            }
            //sendRedirect to LoginDataServlet
            //refer to web.xml file for url-pattern
//            resp.sendRedirect("re.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
