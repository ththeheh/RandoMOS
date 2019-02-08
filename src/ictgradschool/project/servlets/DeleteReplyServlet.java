package ictgradschool.project.servlets;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

    public class DeleteReplyServlet extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);
        }
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            try (Connection connection = DBConnection.createConnection()) {
                LoginDataDAO dao = new LoginDataDAO(connection);
//                System.out.println("servlet is running");
                String userName = (String)req.getSession().getAttribute("username");
                int postId = Integer.parseInt(req.getParameter("postId"));
                int replyId =  Integer.parseInt(req.getParameter("replyId"));
                dao.deleteReply(postId,replyId);
                System.out.println(postId);

                PrintWriter out = resp.getWriter();

                resp.setContentType("text");
//            resp.setCharacterEncoding("UTF-8");
                out.print("success");
                out.flush();

            } catch (SQLException e) {
                throw new ServletException(e);
            }


        }


    }
