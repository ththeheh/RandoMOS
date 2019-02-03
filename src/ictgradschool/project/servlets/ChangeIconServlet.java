package ictgradschool.project.servlets;

import sun.misc.BASE64Decoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class ChangeIconServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) req.getSession().getAttribute("username");

            String iconPath = req.getParameter("iconPath");
            File file = new File(iconPath);
            if (!(file.exists())) {
                boolean success = false;

                BASE64Decoder decoder = new BASE64Decoder();

                try {

                    //decode the image and then write it to the specific location.
                    byte[] decodedBytes = decoder.decodeBuffer(iconPath);

                    String imgFilePath = "./images/icons" + userName;

                    //just overwrite, not append.
                    FileOutputStream out = new FileOutputStream(imgFilePath, false);

                    out.write(decodedBytes);

                    dao.changeIcon(userName, iconPath);

                    out.close();

                    success = true;

                } catch (IOException e) {

                    success = false;

                    e.printStackTrace();

                } catch (SQLException e) {
                    e.printStackTrace();
                }

                resp.getWriter().print(wrapJSON(success));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String wrapJSON(boolean success) {

        return "{'success':" + success + "}";

    }
}

