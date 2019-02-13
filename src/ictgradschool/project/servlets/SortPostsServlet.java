package ictgradschool.project.servlets;

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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class SortPostsServlet extends HttpServlet {
    private final static int COOKIE_EXPIRATION_TIME = 20 * 60;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DBConnection.createConnection()) {
            PrintWriter out = resp.getWriter();
            LoginDataDAO dao = new LoginDataDAO(connection);
            List<PostJavaBean> posts = new ArrayList<>();
            String sort = req.getParameter("sort");
            String order = req.getParameter("order");
            posts = dao.getLatestPosts();
            for (PostJavaBean postJavaBean : posts) {
                postJavaBean.setIconPath(dao.getUserInfo(postJavaBean.getUserName()).getIconPath());
            }

            // Check cookies first for any stored sorting constraints
            if (order.length() != 0) {
                Cookie[] cookies = req.getCookies();
                if (cookies != null) {
                    Cookie cookie;
                    for (int i = 0; i < cookies.length; i++) {
                        cookie = cookies[i];
                        if (cookie.getName().equals("order")) {
                            order = cookie.getValue();
                        }
                    }
                }

            } else {
                System.out.println("no such cookie found");
                Cookie sortOrderCookie = new Cookie("order", "ascending");
                order = "ascending";
                sortOrderCookie.setMaxAge(COOKIE_EXPIRATION_TIME);
                resp.addCookie(sortOrderCookie);
            }

            // now we may have sorting constraints either from the request parameters, or remembered (from cookies or else the session)

            if (sort != null) {
                if ((sort.equals("date") || sort.equals("title") || sort.equals("username"))
                        &&
                        (order.equals("ascending") || order.equals("descending"))) {
                    // we've been given meaningful sort constraints, so try sorting by them

                    Comparator<PostJavaBean> comparator = new PostJavaBeanComparator(sort, order);


                    Collections.sort(posts, comparator);

                } else {
                    out.println("Sorting constraints " + sort + " by " + order + " not recognised. Not sorting.");

                }

                // having sorted, toggle the order for future use
                if (order.equals("ascending")) {
                    req.setAttribute("order", "descending");
                    Cookie sortColumnCookie = new Cookie("order", "descending");
                    sortColumnCookie.setMaxAge(COOKIE_EXPIRATION_TIME);
                    resp.addCookie(sortColumnCookie);


                } else if (order.equals("descending")) {
                    req.setAttribute("order", "ascending");
                    Cookie sortOrderCookie = new Cookie("order", "ascending");
                    sortOrderCookie.setMaxAge(COOKIE_EXPIRATION_TIME);
                    resp.addCookie(sortOrderCookie);
                }
            }

            // Finally, since sort and order were defined,
            req.setAttribute("stop", true);
            req.setAttribute("posts", posts);

            System.out.println("Sorted posts will be displayed!");

            req.getRequestDispatcher("./mainPage.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
