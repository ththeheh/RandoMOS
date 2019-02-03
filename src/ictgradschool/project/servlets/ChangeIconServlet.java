package ictgradschool.project.servlets;

import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
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

                    System.out.println(iconPath);
                    //decode the image and then write it to the specific location.
                    BufferedImage image = ImageIO.read(new File(iconPath));


                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();


                    ImageIO.write(image, "png", outputStream);


//                    File icon = new File(iconPath);
//
//                    FileInputStream iconFile1 = new FileInputStream(icon);
//
//                    //to be tested.
//
                    ServletContext servletContext = getServletContext();
                    String fullImagePath = servletContext.getRealPath("images");

                    System.out.println(fullImagePath);

                    String imgFilePath = fullImagePath+"/"+userName+".png";
//                    File iconFile = new File(imgFilePath);
//
//                    //just overwrite, not append.
                    FileOutputStream out = new FileOutputStream(imgFilePath, false);

                    byte[] iconBytes=outputStream.toByteArray();

                    out.write(iconBytes);

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
            else { dao.changeIcon(userName,iconPath);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String wrapJSON(boolean success) {

        return "{'success':" + success + "}";

    }
}

