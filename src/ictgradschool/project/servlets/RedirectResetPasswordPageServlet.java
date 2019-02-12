package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class RedirectResetPasswordPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            int randomcode = Integer.parseInt(req.getParameter("randomcode"));
            System.out.println("This is randomcode: "+randomcode);

            //update the user info
            if(dao.getUserByRandomCode(randomcode)!=null){
                resp.sendRedirect("resetNewPassword.jsp");
            }else{
                resp.sendRedirect("reg.jsp");  //somebody try to hack.
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
