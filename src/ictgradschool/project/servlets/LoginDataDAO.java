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


    //Use this method to add new data entries- used in LoginDataServletNew
    public void addLoginData(UserInfoJavabean loginData) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_userInfo(userName, firstName,lastName, birthday, country, email, description,iconPath) VALUES (?,?,?,?,?,?,?,?)")) {
            preparedStatement.setString(1, loginData.getUserName());
            preparedStatement.setString(2, loginData.getFirstName());
            preparedStatement.setString(3, loginData.getLastName());
            preparedStatement.setString(4, loginData.getBirthday());
            preparedStatement.setString(5, loginData.getCountry());
            preparedStatement.setString(6, loginData.getEmail());
            preparedStatement.setString(7, loginData.getDescription());
            preparedStatement.setString(8, loginData.getIconPath());
            //set default icon
            //            System.out.println("Row added");
            //Just indicating how many rows are added
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " user account added");
        }
    }

    public void setPassword(UserInfoJavabean loginData) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_password(userName,hashedCode,salt,iteration) VALUES (?,?,?,?)")) {
            preparedStatement.setString(1, loginData.getUserName());

            //5 length salt
            int iteration = 10;
            int saltLength = 2;
            byte[] saltByte = Passwords.getNextSalt(saltLength);
            String hashedCode = Passwords.base64Encode(Passwords.hash(loginData.getPassword().toCharArray(), saltByte, iteration));
//            System.out.println(hashedCode);


            String salt = new String(saltByte);

            preparedStatement.setString(2, hashedCode);
            preparedStatement.setString(3, salt);
            preparedStatement.setInt(4, iteration);

            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " hashed password table added");

        }
    }

    public String validation(String userName, String password) throws SQLException {
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_password")) {
                while (resultSet.next()) {
                    if (resultSet.getString(1).equals(userName)) {

                        System.out.println("find the username: " + userName);
                        //convert password to hashedcode and then compare.
                        String salt = resultSet.getString(3);
                        int iteration = resultSet.getInt(4);
                        System.out.println("ths salt got is " + salt);
                        byte[] saltByte = salt.getBytes();
                        if (Passwords.isExpectedPassword(password.toCharArray(), saltByte, iteration, Passwords.base64Decode(resultSet.getString(2)))) {
                            return userName;
                        } else {
                            return "Not match";
                        }
                    }
                }
            }
            return "Not exist";

        }

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

                        loginBean.setIconPath("../images/icons/" + (resultSet.getString(8)));

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
//        PostJavaBean mainPost = new PostJavaBean();
        List<PostJavaBean> posts = new ArrayList<>();

        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_post")) {

                while (resultSet.next()) {
//                    System.out.println(resultSet.getRow());
//                int randomRow = (int) (Math.floor(Math.random() * 3) + 1);
//                resultSet.absolute(resultSet.getRow());
                    if (userName.equals(resultSet.getString(2))) {
                        int postId = resultSet.getInt(1);
                        String title = resultSet.getString(3);
                        String post = resultSet.getString(4);
                        String date = resultSet.getString(5);
//                        System.out.println(date);
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
            country, String email, String description) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("UPDATE blog_userInfo SET firstName=?, lastName=?,birthday=?,country=?,email=?,description=? WHERE userName=? ")) {

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, birthday);
            preparedStatement.setString(4, country);
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, description);
            preparedStatement.setString(7, userName);
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

            LocalDate localDate = LocalDate.parse(date);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");
            preparedStatement.setString(3, formatter.format(localDate));
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
            //may need to think about if can delete comments under one username and check how the tables are joined.
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

            //may need to think about if can delete comments under one username and check how the tables are joined.
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " post deleted");
        }
    }

    public int savePosts(PostJavaBean post) throws SQLException {

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_post(userName, postTitle, post,date) VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, post.getUserName());
            preparedStatement.setString(2, post.getTitle());
            preparedStatement.setString(3, post.getPost());
            preparedStatement.setString(4, post.getDate());

            //Just indicating how many rows are added
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " post added");

            //get automatic key
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

            preparedStatement.setString(3, comment.getUserName()); //can not be null
            preparedStatement.setString(4, comment.getComment());

            //Just indicating how many rows are added
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

            //Just indicating how many rows are added
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " reply added");
        }
    }


    public List<PostJavaBean> getLatestPosts() throws SQLException {
//        PostJavaBean mainPost = new PostJavaBean();
        List<PostJavaBean> posts = new ArrayList<>();

        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_post")) {
                while (resultSet.next()) {

                    DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//                    DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//                    String dateLocalStr = LocalDate.parse(resultSet.getString(5), inputFormat).format(outputFormat);
                    String dateLocalStr = resultSet.getString(5);
                    System.out.println(dateLocalStr);
                    LocalDate dateLocal = LocalDate.parse(dateLocalStr, inputFormat);
                    LocalDate today = LocalDate.now();
                    System.out.println("today date" + today);
                    if (dateLocal.compareTo(today) > 0) {
                        continue;
                    }
                    ;

                    int postId = resultSet.getInt(1);
                    String userName = resultSet.getString(2);
                    String title = resultSet.getString(3);
                    String post = resultSet.getString(4);
                    String date = resultSet.getString(5);
                    PostJavaBean mainPost = new PostJavaBean(userName, title, post, postId, date);
//                mainPost1.setPostId(postId);
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

            //may need to think about if can delete comments under one username and check how the tables are joined.
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " reply deleted");
        }
    }


    public void deleteComment(int postId, int commentId) throws SQLException {
//        System.out.printf(postId+"   "+commentId);

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


        //may need to think about if can delete comments under one username and check how the tables are joined.

    }

    public List<PostJavaBean> search(String keyWord) throws SQLException {
        List<PostJavaBean> posts = new ArrayList<>();

        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_post")) {
                while (resultSet.next()) {
                    DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//                    DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//                    String dateLocalStr = LocalDate.parse(resultSet.getString(5), inputFormat).format(outputFormat);
                    String dateLocalStr = resultSet.getString(5);
                    System.out.println(dateLocalStr);
                    LocalDate dateLocal = LocalDate.parse(dateLocalStr, inputFormat);
                    LocalDate today = LocalDate.now();
                    System.out.println("today date" + today);
                    if (dateLocal.compareTo(today) > 0) {
                        continue;
                    }

                    System.out.println("hahaha"+resultSet.getString(2));

                    if (resultSet.getString(2).contains(keyWord) || resultSet.getString(3).contains(keyWord) || resultSet.getString(5).contains(keyWord)) {

                        int postId = resultSet.getInt(1);
                        String userName = resultSet.getString(2);
                        String title = resultSet.getString(3);
                        String post = resultSet.getString(4);
                        String date = resultSet.getString(5);
                        PostJavaBean searchPost = new PostJavaBean(userName, title, post, postId, date);
//                mainPost1.setPostId(postId);
                        posts.add(searchPost);
                    }

                    System.out.println("posts are returned here");

                    Collections.sort(posts);

                }
                return posts;
            }
        }
    }
}



//    public List<Post> getMyPost(String userName) throws SQLException {
//        UserInfoJavabean loginBean = new UserInfoJavabean();
//        try (Statement statement = this.connection.createStatement()) {
//            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM loginDataTable")) {
//                while (resultSet.next()) {
//                    if (resultSet.getString(1).equals(userName)) {
//                        loginBean.setUserName(resultSet.getString(1));
//                        loginBean.setFirstName(resultSet.getString(2));
//                        loginBean.setLastName(resultSet.getString(3));
//                        loginBean.setBirthday(resultSet.getString(4));
//                        loginBean.setCountry(resultSet.getString(5));
//                        loginBean.setEmail(resultSet.getString(6));
//                        loginBean.setDescription(resultSet.getString(7));
//                        return loginBean;
//                    }
//                }
//            }
//        }
//        return null;
//    }



