package ictgradschool.project.servlets;

import java.io.File;
import java.io.Serializable;

public class UserInfoJavabean implements Serializable {
    private String userName;
    private String firstName;
    private String lastName;
    private String birthday;
    private String country;
    private String email;
    private String description;
    private String password;
    private String iconPath="../web/images/icons/boy1.png";
//    private String hashedSaltedCode;
    public boolean valid;

    public UserInfoJavabean(){}

    public UserInfoJavabean(String userName, String firstName, String lastName, String birthday, String country, String email, String description, String password){
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthday = birthday;
        this.country = country;
        this.email = email;
        this.description = description;
        this.password = password;
    }


    public String getUserName() {
        return this.userName;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public String getBirthday() {
        return this.birthday;
    }

    public String getCountry() {
        return this.country;
    }

    public String getEmail() {
        return this.email;
    }

    public String getDescription() {
        return this.description;
    }

    public String getPassword() {
        return this.password;
    }

    public String getIconPath(){return this.iconPath;}

//    public String getHashedSaltedCode() {
//        return hashedSaltedCode;
//    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPassword(String password) {
        this.password = password;
    }

//    public void setHashedSaltedCode(String hashedSaltedCode) {
//        this.hashedSaltedCode = hashedSaltedCode;
//    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public void setIconPath(String iconPath){
        this.iconPath = iconPath;
    }
}


