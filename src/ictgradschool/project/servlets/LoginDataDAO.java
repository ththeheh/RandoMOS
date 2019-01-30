package ictgradschool.project.servlets;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoginDataDAO {
    private Connection connection;


    public LoginDataDAO(Connection connection) {
        this.connection = connection;
    }


    //Use this method to add new data entries- used in LoginDataServletNew
    public void addLoginData(LoginDataJavabean loginData) throws SQLException {
        try (PreparedStatement preparedStatement = this.connection.prepareStatement("INSERT INTO loginDataTable(userName, firstName,lastName, birthday, country, email, description, hashedSaltedCode) VALUES (?,?,?,?,?,?,?,?)")) {
            preparedStatement.setString(1, loginData.getUserName());
            preparedStatement.setString(2, loginData.getFirstName());
            preparedStatement.setString(3, loginData.getLastName());
            preparedStatement.setString(4, loginData.getBirthday());
            preparedStatement.setString(5, loginData.getCountry());
            preparedStatement.setString(6, loginData.getEmail());
            preparedStatement.setString(7, loginData.getDescription());

            String hashedCode = Passwords.base64Encode(Passwords.insecureHash(loginData.getPassword()));
//            System.out.println(hashedCode);

            preparedStatement.setString(8, hashedCode);

//            System.out.println("Row added");
            //Just indicating how many rows are added
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " rows added");

        }
    }

    public String validation(String userName, String password) throws SQLException {
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM loginDataTable")) {
                while (resultSet.next()) {
                    if (resultSet.getString(1).equals(userName)) {
                        //convert password to hashedcode and then compare.
                        if (resultSet.getString(8).equals(password)) {
                            return userName;
                        } else {
                            return "Not match";
                        } //change later
                    } else {
                        return "Not exist";
                    }
                }
            }
        }
        return null;
    }


}
