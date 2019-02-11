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

//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        try (Connection connection = DBConnection.createConnection()) {
            PrintWriter out = resp.getWriter();
            LoginDataDAO dao = new LoginDataDAO(connection);
            List<PostJavaBean> posts = new ArrayList<>();
            String sort = req.getParameter("sort");
            String order = req.getParameter("order");
//            System.out.println("order value: " + order);
//            System.out.println("sort value: " + sort);

            System.out.println("sorting is running:");
            posts = dao.getLatestPosts();
            for (PostJavaBean postJavaBean : posts) {
                postJavaBean.setIconPath(dao.getUserInfo(postJavaBean.getUserName()).getIconPath());
            }
            System.out.println("order empty?" + order.length());
            // Check cookies first for any stored sorting constraints
            if (order.length() != 0) {
                Cookie[] cookies = req.getCookies();
                if (cookies != null) {
//                    System.out.println("cookies existing: "+cookies.length);
                    Cookie cookie;
                    for (int i = 0; i < cookies.length; i++) {
                        // let's find the cookie
                        cookie = cookies[i];
                        if (cookie.getName().equals("order")) {
                            order = cookie.getValue();
                        }
//                        if (cookie.getName().equals("sort")) {
//                            sort = cookie.getValue();
//                        }
                    }
//                    System.out.println("final cookie: " + order);
//                    if (order.length() == 0) {
//                        System.out.println("no cookie found");
//                        Cookie sortCookie = new Cookie("sort", sort);
//                        sortCookie.setMaxAge(COOKIE_EXPIRATION_TIME);
//                        resp.addCookie(sortCookie);
//
//                        Cookie sortOrderCookie = new Cookie("order", "ascending");
//                        order = "ascending";
//                        sortOrderCookie.setMaxAge(COOKIE_EXPIRATION_TIME);
//                        resp.addCookie(sortOrderCookie);
//                    }

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

                    System.out.println("running comparator!!"+"sort: "+sort+"order: "+order);

                    Comparator<PostJavaBean> comparator = new PostJavaBeanComparator(sort, order);


                    Collections.sort(posts, comparator);

                } else {
                    out.println("Sorting constraints " + sort + " by " + order + " not recognised. Not sorting.");

                }

                // having sorted, toggle the sortOrder for future use
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

            out.println("Found sort column: " + sort + " by " + order);

            // Finally, since sortColumn and order were defined,
            // we remember these sorting constraints for next time by setting them as cookies and as attributes of the Session

            // Create cookie, set their expiration time and then add them to the response (they go into the response header)
            // so that the browser can then store them on its end
//            sortCookie = new Cookie("sort", sort);
//            sortCookie.setMaxAge(COOKIE_EXPIRATION_TIME);
//            resp.addCookie(sortCookie);
//
//            sortOrderCookie = new Cookie("sortOrder", order);
//            sortOrderCookie.setMaxAge(COOKIE_EXPIRATION_TIME);
//            resp.addCookie(sortOrderCookie);


            req.setAttribute("stop", true);             //a cookie
            req.setAttribute("posts", posts);

            System.out.println("Sorted posts will be displayed!");

            req.getRequestDispatcher("mainPage.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }


//                req.getRequestDispatcher("mainPage.jsp").forward(req, resp);


    }
}
