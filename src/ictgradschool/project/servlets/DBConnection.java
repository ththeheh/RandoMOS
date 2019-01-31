package ictgradschool.project.servlets;

import java.io.File;
import java.io.FileInputStream;
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


//        dbProps.setProperty("url", "jdbc:mysql://db.sporadic.nz/hxu829");
//        dbProps.setProperty("useSSL", "false");
//        dbProps.setProperty("user", "hxu829");
//        dbProps.setProperty("password", "FairMoralScarceTimeUnequaled");

        return DriverManager.getConnection(dbProps.getProperty("url"), dbProps);

    }

    private static Properties loadProperties() {

//        File file = new File("jdbc.properties");
//        System.out.println(file.getName());

        try (InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("jdbc.properties")) {

            Properties props = new Properties();
            System.out.println(in);
            props.load(in);
            return props;

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

    }

}
