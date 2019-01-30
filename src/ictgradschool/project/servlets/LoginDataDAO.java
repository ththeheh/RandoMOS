package ictgradschool.project.servlets;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoginDataDAO {
    private final Connection connection;


    public LoginDataDAO(Connection connection) {
        this.connection = connection;
    }

    //GET ALL THE USER INFO
    public List<LoginDataJavabean> allLoginData() throws SQLException {


        List<LoginDataJavabean> loginDataList = new ArrayList<LoginDataJavabean>();

        try (Statement statement = connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("INSERT")) {
                while (resultSet.next()) {

                }
            }

        }

        return loginDataList;
    }


    //Use this method to add new data entries- used in LoginDataServletNew
    public void addLoginData(LoginDataJavabean loginData) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO loginDataTable(userName, actualName, birthday, country, email, description, password, hashedSaltedCode) VALUES (?,?,?,?,?,?,?,?)")) {
            preparedStatement.setString(1, loginData.getUserName());
            preparedStatement.setString(2, loginData.getFirstName());
            preparedStatement.setString(2, loginData.getLastName());
            preparedStatement.setString(3, loginData.getBirthday());
            preparedStatement.setString(4, loginData.getCountry());
            preparedStatement.setString(5, loginData.getEmail());
            preparedStatement.setString(6, loginData.getDescription());
            preparedStatement.setString(7, loginData.getPassword());
            preparedStatement.setString(8, loginData.getHashedSaltedCode());

            //Just indicating how many rows are added
            int numRows = preparedStatement.executeUpdate();
            System.out.println(numRows + " rows added");


        }
    }

    public String validation(String userName, String password) throws SQLException {
        try (Statement statement = this.connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery("SELECT * FROM access_log")) {
                while (resultSet.next()) {
                    if (resultSet.getString(1).equals(userName)) {
                        if (resultSet.getString(7).equals(password)) {
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
