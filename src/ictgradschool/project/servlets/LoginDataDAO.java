package ictgradschool.project.servlets;

import javafx.scene.effect.ImageInput;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.*;

public class LoginDataDAO {
    private Connection connection;


    public LoginDataDAO(Connection connection) {
        this.connection = connection;
    }


    //Use this method to add new data entries- used in LoginDataServletNew
    public void addLoginData(UserInfoJavabean loginData) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_userInfo(userName, firstName,lastName, birthday, country, email, description,icon) VALUES (?,?,?,?,?,?,?,?)")) {
            preparedStatement.setString(1, loginData.getUserName());
            preparedStatement.setString(2, loginData.getFirstName());
            preparedStatement.setString(3, loginData.getLastName());
            preparedStatement.setString(4, loginData.getBirthday());
            preparedStatement.setString(5, loginData.getCountry());
            preparedStatement.setString(6, loginData.getEmail());
            preparedStatement.setString(7, loginData.getDescription());

            //set default icon
            try {
                FileInputStream input =  new FileInputStream(new File("./images/icons/boy1.png"));
                preparedStatement.setBinaryStream(8,input );

//                InputStream is = new BufferedInputStream(input);
//                Image image = ImageIO.read(is);

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }


            //            System.out.println("Row added");
            //Just indicating how many rows are added
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " rows added");
        }

        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO blog_password(userName,hashedCode,salt,iteration) VALUES (?,?,?,?)")) {
            preparedStatement.setString(1, loginData.getUserName());

            //5 length salt
            int iteration = 5;
            int saltLength = 5;
            byte[] saltByte = Passwords.getNextSalt(saltLength);
            String hashedCode = Passwords.base64Encode(Passwords.hash(loginData.getPassword().toCharArray(), saltByte, iteration));
//            System.out.println(hashedCode);


            String salt = new String(saltByte);

            preparedStatement.setString(2, hashedCode);
            preparedStatement.setString(3, salt);
            preparedStatement.setInt(4, iteration);


//            System.out.println("Row added");
            //Just indicating how many rows are added
//            int numRows = preparedStatement.executeUpdate();
//            System.out.println(numRows + " rows added");

        }
    }

    public String validation(String userName, String password) throws SQLException {
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM blog_password")) {
                while (resultSet.next()) {
                    if (resultSet.getString(1).equals(userName)) {
                        //convert password to hashedcode and then compare.
                        String salt = resultSet.getString(3);
                        int iteration = resultSet.getInt(4);
                        byte[] saltByte = salt.getBytes();
                        if (Passwords.isExpectedPassword(password.toCharArray(), saltByte, iteration, Passwords.base64Decode(resultSet.getString(2)))) {
                            return userName;
                        }
                    }
                    return "Not match";
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


                       OutputStream os = new FileOutputStream();

                        loginBean.setIcon((resultSet.getString(8).getBytes()));


                        return loginBean;
                    }
                }
            }
        }
        return null;
    }


    public void editInfo(String userName, String firstName, String lastName, String birthday, String country, String email, String description) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("UPDATE blog_userInfo SET firstName=?, lastName=?,birthday=?,country=?,email=?,description=? WHERE userName=? ")) {

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, birthday);
            preparedStatement.setString(4, country);
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, description);
            preparedStatement.setString(7, userName);
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " rows updated");

        }
    }


    //            System.out.println("Row added");
    //Just indicating how many rows are added
}


//    public List<Post> getOtherPost(String userName) throws SQLException {
//        try (Statement statement = this.connection.createStatement()) {
//            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM loginDataTable")) { // join table.
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



