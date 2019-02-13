package ictgradschool.project.servlets;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;

import javax.swing.text.DateFormatter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class LoginDataDAO {
    private Connection connection;


    public LoginDataDAO(Connection connection) {
        this.connection = connection;
    }

//    This is our DAO for methods, they are self-explanatory


    public void addLoginData(UserInfoJavabean loginData) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_userInfo(userName, firstName,lastName, birthday, country, email, description,iconPath,type) VALUES (?,?,?,?,?,?,?,?,?)")) {
            preparedStatement.setString(1, loginData.getUserName());
            preparedStatement.setString(2, loginData.getFirstName());
            preparedStatement.setString(3, loginData.getLastName());
            preparedStatement.setString(4, loginData.getBirthday());
            preparedStatement.setString(5, loginData.getCountry());
            preparedStatement.setString(6, loginData.getEmail());
            preparedStatement.setString(7, loginData.getDescription());
            preparedStatement.setString(8, loginData.getIconPath());
            preparedStatement.setString(9, "user");

            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " user account added");
        }
    }

    public void setPassword(UserInfoJavabean loginData) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_password(userName,hashedCode,salt,iteration) VALUES (?,?,?,?)")) {
            preparedStatement.setString(1, loginData.getUserName());
            int iteration = 10;
            int saltLength = 2;
            byte[] saltByte = Passwords.getNextSalt(saltLength);
            String hashedCode = Passwords.base64Encode(Passwords.hash(loginData.getPassword().toCharArray(), saltByte, iteration));
            String salt = new String(saltByte);
            preparedStatement.setString(2, hashedCode);
            preparedStatement.setString(3, salt);
            preparedStatement.setInt(4, iteration);
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " hashed password table added");

        }
    }

    public void updatePassword(String userName, String newPassword) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("UPDATE blog_password SET hashedCode=?,salt=?,iteration=? WHERE userName=? ")) {

            int iteration = 10;
            int saltLength = 2;
            byte[] saltByte = Passwords.getNextSalt(saltLength);
            String hashedCode = Passwords.base64Encode(Passwords.hash(newPassword.toCharArray(), saltByte, iteration));
            String salt = new String(saltByte);
            preparedStatement.setString(1, hashedCode);
            preparedStatement.setString(2, salt);
            preparedStatement.setInt(3, iteration);
            preparedStatement.setString(4, userName);

            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " user password updated");

        }

    }

    public int randomCode(String userName) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_randomcode(userName, randomCode) VALUES (?,?)")) {
            preparedStatement.setString(1, userName);
            int randomNum = (int) (Math.floor(Math.random() * 900000) + 100000);
            preparedStatement.setInt(2, randomNum);
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " user randomcode generated");

            return randomNum;
        }
    }

    public String getUserByRandomCode(int randomcode) throws SQLException {
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_randomcode")) {
                while (resultSet.next()) {
                    if (resultSet.getInt(2) == randomcode) {
                        return resultSet.getString(1);
                    }
                }
            }
        }
        return null;
    }


    public String validation(String userName, String password) throws SQLException {
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_password")) {
                while (resultSet.next()) {
                    if (resultSet.getString(1).equals(userName)) {
                        String salt = resultSet.getString(3);
                        int iteration = resultSet.getInt(4);

                        byte[] saltByte = salt.getBytes();
                        if (Passwords.isExpectedPassword(password.toCharArray(), saltByte, iteration, Passwords.base64Decode(resultSet.getString(2)))) {
                            return userName;
                        } else {
                            return "Notmatch";
                        }
                    }
                }
            }
            return "Notexist";

        }

    }


    public boolean checkAdmin(String userName) throws SQLException {
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_userInfo")) {
                while (resultSet.next()) {
                    if (resultSet.getString(1).equals(userName)) {
                        return resultSet.getString(9).equals("admin");
                    }
                }
            }
        }
        return false;
    }


    public String usernameConflict(String userName, String email) throws SQLException {
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_userInfo")) {
                while (resultSet.next()) {
                    if (resultSet.getString(1).equals(userName)) {
                        return "username";
                    }

                    if (resultSet.getString(6).equals(email)) {
                        return "email";
                    }
                }


            }
        }
        return "Okay";

    }

    public UserInfoJavabean getUserInfo(String userName) throws SQLException {
        UserInfoJavabean loginBean = new UserInfoJavabean();
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_userInfo")) {
                while (resultSet.next()) {
                    if (resultSet.getString(1).equals(userName)) {
                        loginBean.setUserName(resultSet.getString(1));
                        loginBean.setFirstName(resultSet.getString(2));
                        loginBean.setLastName(resultSet.getString(3));
                        loginBean.setBirthday(resultSet.getString(4));
                        loginBean.setCountry(resultSet.getString(5));
                        loginBean.setEmail(resultSet.getString(6));
                        loginBean.setDescription(resultSet.getString(7));
                        loginBean.setIconPath("./icons/" + (resultSet.getString(8)));

                        return loginBean;
                    }
                }
            }
        }
        return null;
    }

    public PostJavaBean getPost(int postId) throws SQLException {
        PostJavaBean post = new PostJavaBean();
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_post")) {
                while (resultSet.next()) {
                    if (resultSet.getInt(1) == (postId)) {
                        post.setUserName(resultSet.getString(2));
                        post.setPostId(resultSet.getInt(1));
                        post.setTitle(resultSet.getString(3));
                        post.setPost(resultSet.getString(4));
                        post.setDate(resultSet.getString(5));
                        post.setComments(getComments(postId));
                        return post;
                    }
                }
            }


        }
        return null;
    }

    public List<PostJavaBean> getUserPosts(String userName) throws SQLException {

        List<PostJavaBean> posts = new ArrayList<>();

        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_post")) {

                while (resultSet.next()) {

                    if (userName.equals(resultSet.getString(2))) {
                        int postId = resultSet.getInt(1);
                        String title = resultSet.getString(3);
                        String post = resultSet.getString(4);
                        String date = resultSet.getString(5);

                        PostJavaBean userPost = new PostJavaBean(userName, title, post, postId, date);
                        posts.add(userPost);
                    }
                }

                System.out.println("user posts are returned here");

                Collections.sort(posts);

                return posts;

            }

        }
    }

    public List<Comment> getComments(int postId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_userComment")) {
                while (resultSet.next()) {
                    if (resultSet.getInt(1) == (postId)) {
                        String userName = resultSet.getString(3);
                        int commentId = resultSet.getInt(2);
                        String comment = resultSet.getString(4);
                        System.out.println("this comment is loaded into post" + comment);
                        String iconPath = getUserInfo(userName).getIconPath();
                        System.out.println("this iconPath is loaded into post" + iconPath);
                        List<Reply> replies = getReplies(postId, commentId);
                        comments.add(new Comment(postId, commentId, userName, comment, replies, iconPath));

                        System.out.println("the comment Id loaded: " + commentId);
                    }
                }
            }
        }
        return comments;
    }

    public List<Reply> getReplies(int postId, int commentId) throws SQLException {
        List<Reply> replies = new ArrayList<>();
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_userReply")) {
                while (resultSet.next()) {
                    if (resultSet.getInt(1) == postId && resultSet.getInt(2) == (commentId)) {
                        String userName = resultSet.getString(4);
                        int replyId = resultSet.getInt(3);
                        String reply = resultSet.getString(5);
                        String iconPath = getUserInfo(userName).getIconPath();

                        System.out.println("this reply is loaded into post" + reply);
                        System.out.println("this iconPath is loaded into post" + iconPath);

                        replies.add(new Reply(postId, commentId, replyId, userName, reply, iconPath));

                    }
                }
            }
        }
        return replies;
    }


    public void editInfo(String userName, String firstName, String lastName, String birthday, String
            country, String description) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("UPDATE blog_userInfo SET firstName=?, lastName=?,birthday=?,country=?,description=? WHERE userName=? ")) {

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, birthday);
            preparedStatement.setString(4, country);
            preparedStatement.setString(5, description);
            preparedStatement.setString(6, userName);
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " user profile updated");

        }
    }

    public void editPost(int postId, String postTitle, String post, String date) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("UPDATE blog_post SET postTitle=?, post=?, date=? WHERE postId=? ")) {

            preparedStatement.setString(1, postTitle);
            preparedStatement.setString(2, post);

            preparedStatement.setInt(4, postId);
            preparedStatement.setInt(4, postId);

            preparedStatement.setString(3, date);
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " post updated");

        }
    }


    public void changeIcon(String userName, String iconPath) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("UPDATE blog_userInfo SET iconPath=? WHERE userName=? ")) {

            preparedStatement.setString(1, iconPath);
            preparedStatement.setString(2, userName);

            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " user icon  updated");

        }
    }

    public void deleteAccount(String userName) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_userReply WHERE userName = ?;")) {
            preparedStatement.setString(1, userName);
            preparedStatement.executeUpdate();

        }

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_userComment WHERE userName = ?;")) {
            preparedStatement.setString(1, userName);
            preparedStatement.executeUpdate();

        }

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_writeArt WHERE userName = ?;")) {
            preparedStatement.setString(1, userName);
            preparedStatement.executeUpdate();

        }

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_post WHERE userName = ?;")) {
            preparedStatement.setString(1, userName);
            preparedStatement.executeUpdate();

        }

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_password WHERE userName = ?;")) {
            preparedStatement.setString(1, userName);
            preparedStatement.executeUpdate();
        }


        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_userInfo WHERE userName = ?;")) {
            preparedStatement.setString(1, userName);
            preparedStatement.executeUpdate();


        }

    }


    public void deletePost(int postId) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_userReply WHERE postId = ?;")) {
            preparedStatement.setInt(1, postId);
            System.out.println("replies deleted!");
            preparedStatement.executeUpdate();
        }

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_userComment WHERE postId = ?;")) {
            preparedStatement.setInt(1, postId);
            System.out.println("comments deleted!");
            preparedStatement.executeUpdate();
        }

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_post WHERE postId = ?;")) {
            preparedStatement.setInt(1, postId);


            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " post deleted");
        }
    }

    public int savePosts(PostJavaBean post) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_post(userName, postTitle, post,date,visible) VALUES (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, post.getUserName());
            preparedStatement.setString(2, post.getTitle());
            preparedStatement.setString(3, post.getPost());
            preparedStatement.setString(4, post.getDate());
            preparedStatement.setString(5, "yes"); //default


            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " post added");


            ResultSet rs = preparedStatement.getGeneratedKeys();
            rs.next();
            return rs.getInt(1);
        }

    }


    public void saveComments(Comment comment) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_userComment(postId, commentId, userName, comment) VALUES (?,?,?,?)")) {
            preparedStatement.setInt(1, comment.getPostId());
            preparedStatement.setInt(2, comment.getCommentId());

            System.out.println(comment.getUserName());

            preparedStatement.setString(3, comment.getUserName());
            preparedStatement.setString(4, comment.getComment());


            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " comment added");
        }
    }

    public void saveReplies(Reply reply) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_userReply(postId, commentId, replyId, userName, reply) VALUES (?,?,?,?,?)")) {
            preparedStatement.setInt(1, reply.getPostId());
            preparedStatement.setInt(2, reply.getCommentId());
            preparedStatement.setInt(3, reply.getReplyId());
            preparedStatement.setString(4, reply.getUserName());
            preparedStatement.setString(5, reply.getComment());

            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " reply added");
        }
    }


    public List<PostJavaBean> getLatestPosts() throws SQLException {

        List<PostJavaBean> posts = new ArrayList<>();

        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_post")) {
                while (resultSet.next()) {
                    DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");

                    String dateLocalStr = resultSet.getString(5);
                    System.out.println(dateLocalStr);
                    LocalDate dateLocal = LocalDate.parse(dateLocalStr, inputFormat);
                    LocalDate today = LocalDate.now();
                    System.out.println("today date" + today);
                    if (dateLocal.compareTo(today) > 0) {
                        continue;
                    }

                    int postId = resultSet.getInt(1);
                    String userName = resultSet.getString(2);
                    String title = resultSet.getString(3);
                    String post = resultSet.getString(4);
                    String date = resultSet.getString(5);
                    String vis = resultSet.getString(6);
                    PostJavaBean mainPost = new PostJavaBean(userName, title, post, postId, date, vis);

                    posts.add(mainPost);
                }

                System.out.println("posts are returned here");

                Collections.sort(posts);

                return posts;

            }

        }
    }


    public void deleteReply(int postId, int replyId) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_userReply WHERE postId = ? AND replyId = ?")) {
            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, replyId);

            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " reply deleted");
        }
    }


    public void deleteComment(int postId, int commentId) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_userReply WHERE postId = ? AND commentId = ? ")) {
            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, commentId);
            preparedStatement.executeUpdate();

        }
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("DELETE FROM blog_userComment WHERE postId = ? AND commentId = ?")) {
            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, commentId);
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " comment and all replies deleted");
        }

    }

    public List<PostJavaBean> search(String keyWord) throws SQLException {
        List<PostJavaBean> posts = new ArrayList<>();

        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_post")) {
                while (resultSet.next()) {
                    DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                    String dateLocalStr = resultSet.getString(5);
                    System.out.println(dateLocalStr);
                    LocalDate dateLocal = LocalDate.parse(dateLocalStr, inputFormat);
                    LocalDate today = LocalDate.now();
                    System.out.println("today date" + today);
                    if (dateLocal.compareTo(today) > 0) {
                        continue;
                    }

                    if (resultSet.getString(2).contains(keyWord) || resultSet.getString(3).contains(keyWord) || resultSet.getString(5).contains(keyWord)) {

                        int postId = resultSet.getInt(1);
                        String userName = resultSet.getString(2);
                        String title = resultSet.getString(3);
                        String post = resultSet.getString(4);
                        String date = resultSet.getString(5);
                        PostJavaBean searchPost = new PostJavaBean(userName, title, post, postId, date);
                        posts.add(searchPost);
                    }

                    System.out.println("posts are returned here");

                    Collections.sort(posts);

                }
                return posts;
            }
        }
    }

    public List<UserInfoJavabean> getAccounts() throws SQLException {

        List<UserInfoJavabean> accs = new ArrayList<>();
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_userInfo")) {
                while (resultSet.next()) {
                    String userName = resultSet.getString(1);
                    String fName = resultSet.getString(2);
                    String lName = resultSet.getString(3);
                    String bday = resultSet.getString(4);
                    String country = resultSet.getString(5);
                    String email = resultSet.getString(6);
                    String description = resultSet.getString(7);
                    String iconPath = "./icons/" + (resultSet.getString(8));
                    accs.add(new UserInfoJavabean(userName, fName, lName, bday, country, email, description, iconPath));
                }
                return accs;
            }
        }
    }

    public void editPostVis(int postId, String vis) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("UPDATE blog_post SET visible=? WHERE postId=?")) {

            preparedStatement.setString(1, vis);
            preparedStatement.setInt(2, postId);

            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " post visibility updated");

        }

    }

}






