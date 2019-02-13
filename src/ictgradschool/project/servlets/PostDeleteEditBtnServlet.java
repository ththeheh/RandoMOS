package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class PostDeleteEditBtnServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        String userName = (String) req.getSession().getAttribute("username");
        String postUserName = req.getParameter("postUserName");

          if (postUserName.equals(userName)) {
            String succ = "success";
            resp.setContentType("text");
            out.print(succ);
            out.flush();
        } else {
            resp.setContentType("text");
            String succ = "fail";

            out.print(succ);
            out.flush();
        }

    }

}