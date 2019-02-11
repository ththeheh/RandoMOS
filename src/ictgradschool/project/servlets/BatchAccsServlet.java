package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BatchAccsServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String failUserName = "The following userNames can not be registered because they already exist!: ";
        String failEmail = "The following emails can not be registered because they already exist!: ";
//        PrintWriter out = response.getWriter();

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String batchAccsInfo = request.getParameter("batchAccs");
//            String batchAccsInfo = "hihihi  hi hi hi";
            System.out.println(batchAccsInfo);
            try (Scanner scanner = new Scanner(batchAccsInfo)) {
                scanner.useDelimiter(";|\\r\\n\"");
                while(scanner.hasNext()){
                    String userName = scanner.next();
                    String password = scanner.next();
                    String firstName = scanner.next();
                    String lastName = scanner.next();
                    String birthday = scanner.next();
                    String country = scanner.next();
                    String email = scanner.next();
                    String description = scanner.next();
                    System.out.println("one line is read!!"+userName+password+firstName+lastName+birthday+country+email+"descrip"+description);


                    UserInfoJavabean loginData = new UserInfoJavabean(userName, firstName, lastName, birthday, country, email, description, password);
                    // need to call encoding class to create hashedcode to store
                    String regMsg = dao.usernameConflict(userName, email);
                    if (regMsg.equals("Okay")) {
                        dao.addLoginData(loginData);
                        dao.setPassword(loginData);
                    } else if (regMsg.equals("username")) {
                        failUserName += userName + ", ";

                    } else {
                        failEmail += email + ", ";
                    }}

                    //sendRedirect to LoginDataServlet
                    //refer to web.xml file for url-pattern

                List<UserInfoJavabean> accs = new ArrayList<>();

                accs = dao.getAccounts();

                request.setAttribute("accounts", accs);

                System.out.println("all accounts will be dispatched");

                request.getRequestDispatcher("admin.jsp").forward(request, response);

//                response.setContentType("text");
//                out.print(failUserName + "\n" + failEmail);
//                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

