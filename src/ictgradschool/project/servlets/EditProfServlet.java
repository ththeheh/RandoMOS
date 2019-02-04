package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class EditProfServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");

            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String birthday = req.getParameter("birthday");
            String country = req.getParameter("country");
            String email = req.getParameter("email");
            String description = req.getParameter("description");

            //update the user info
            dao.editInfo(userName,firstName,lastName,birthday,country,email,description);

            //get the user info and redirect to the profile page.
            UserInfoJavabean updatedBean = dao.getUserInfo(userName);
            req.setAttribute("userInfo", updatedBean);
            req.getRequestDispatcher("profilePage-New.jsp").forward(req,resp);

            System.out.println("the line before redirect"+email);

         //                    req.setAttribute("login", userName); //do later


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
