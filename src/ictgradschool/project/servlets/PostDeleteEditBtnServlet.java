package ictgradschool.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class PostDeleteEditBtnServlet extends HttpServlet {
    //Retrieve parameters and store new entries in the database
    //Redirect back to the LoginDataServlet
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        String userName = (String) req.getSession().getAttribute("username");
        String postUserName = req.getParameter("postUserName");

        System.out.println(postUserName);
        System.out.println("this is the session username"+userName);
        System.out.println(userName);
        System.out.println(postUserName.equals(userName));

        if (postUserName.equals(userName)) {
            //can not do userName.equals(postUserName) as .equals(null) not working.
//                System.out.println("equal");
            String succ = "success";
//            resp.setCharacterEncoding("UTF-8");
            out.print(succ);
            out.flush();
            System.out.println("equal");
        } else {
            System.out.println("not equal");

            resp.setContentType("text");
//            resp.setCharacterEncoding("UTF-8");
            String succ = "fail";

            out.print("fail");
            out.flush();
        }

    }

}