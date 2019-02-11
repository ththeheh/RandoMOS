package ictgradschool.project.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ShowMainPageServlet extends HttpServlet {

//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        try (Connection connection = DBConnection.createConnection()) {
            LoginDataDAO dao = new LoginDataDAO(connection);
            List<PostJavaBean> posts = new ArrayList<>();
            String userName = (String) req.getSession().getAttribute("username");
            String userPost = req.getParameter("userPost");


            if (userPost == null) {

                //make another method in dao
                //getRandomPost()- not completed yet
                posts = dao.getLatestPosts();
                System.out.println(posts);
                if ((req.getSession().getAttribute("admin") == null)) {

                    posts.removeIf(value -> value.getVis().equals("no"));

//                     for(PostJavaBean postJavaBean:posts){
//                         System.out.println("the visibility of this post is: "+postJavaBean.getVis());
//                         if(postJavaBean.getVis().equals("no")){
//                             posts.remove(postJavaBean);
//                         }
                }

                for (PostJavaBean postJavaBean : posts) {
                    postJavaBean.setIconPath(dao.getUserInfo(postJavaBean.getUserName()).getIconPath());
                    if(postJavaBean.getVis().equals("yes")){
                        postJavaBean.setVis("Visible");
                    }else{
                        postJavaBean.setVis("Not Visible");
                    }
                }

                req.setAttribute("stop", true);
                req.setAttribute("posts", posts);



                System.out.println("latest posts will be dispatched");

                req.getRequestDispatcher("mainPage.jsp").forward(req, resp);

//                req.getRequestDispatcher("mainPage.jsp").forward(req, resp);


            } else {

                posts = dao.getUserPosts(userName);

                for (PostJavaBean postJavaBean : posts) {
                    postJavaBean.setIconPath(dao.getUserInfo(postJavaBean.getUserName()).getIconPath());
                }

                req.setAttribute("stop", true);
                req.setAttribute("posts", posts);

                System.out.println("your posts will be dispatched");

                req.getRequestDispatcher("mainPage.jsp").forward(req, resp);

//                resp.sendRedirect("mainPage.jsp");

            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
