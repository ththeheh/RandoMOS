package ictgradschool.project.servlets;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ChangeIconUploadServlet extends HttpServlet {

    private File uploadsFolder;
    private File tempFolder;

    @Override
    public void init() throws ServletException {
        super.init();
        //get the upload folder;
        this.uploadsFolder = new File(getServletContext().getRealPath("/icons"));
        if (!uploadsFolder.exists()) {
            uploadsFolder.mkdirs();
        }

        //create the temp folder that the file-upload mechanism needs
        this.tempFolder = new File(getServletContext().getRealPath("/WEB-INF/temp"));
        if (!tempFolder.exists()) {
            tempFolder.mkdirs();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            String userName = (String) request.getSession().getAttribute("username");

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(10 * 1024);
            factory.setRepository(tempFolder);
            ServletFileUpload upload = new ServletFileUpload(factory);

            response.setContentType("text/html");

            PrintWriter out = response.getWriter();

            try {
                List<FileItem> fileItems = upload.parseRequest(request);
                File fullsizeImageFile = null;

                for (FileItem fi : fileItems) {
                    if (!fi.isFormField() && (fi.getContentType().equals("image/png")) || fi.getContentType().equals("image/jpg")) {
                        fullsizeImageFile = new File(uploadsFolder, userName + ".png");
                        if (fullsizeImageFile.exists()) {
                            if (fullsizeImageFile.delete()) {
                                System.out.println("File deleted successfully");
                            }
                        }
                        fi.write(fullsizeImageFile);
                    }
                }

            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

            dao.changeIcon(userName, userName + ".png");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

