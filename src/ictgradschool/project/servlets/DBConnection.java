package ictgradschool.project.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

    static {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection createConnection() throws SQLException {

        Properties dbProps = loadProperties();

        return DriverManager.getConnection(dbProps.getProperty("url"), dbProps);

    }

    private static Properties loadProperties() {

        try (InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("jdbc.properties")) {

            Properties props = new Properties();
            props.load(in);
            return props;

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

    }

}
