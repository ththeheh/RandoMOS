package ictgradschool.project.servlets;

import java.io.Serializable;

public class LoginDataJavabean implements Serializable {
    private String userName;
    private String firstName;
    private String lastName;
    private String birthday;
    private String country;
    private String email;
    private String description;
    private String password;
    private String hashedSaltedCode;
    public boolean valid;

    public LoginDataJavabean(String userName, String firstName, String lastName, String birthday, String country, String email, String description, String password, String hashedSaltedCode){
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthday = birthday;
        this.country = country;
        this.email = email;
        this.description = description;
        this.password = password;
        this.hashedSaltedCode = hashedSaltedCode;
    }

    public LoginDataJavabean(){}

    public String getUserName() {
        return userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getCountry() {
        return country;
    }

    public String getEmail() {
        return email;
    }

    public String getDescription() {
        return description;
    }

    public String getPassword() {
        return password;
    }

    public String getHashedSaltedCode() {
        return hashedSaltedCode;
    }

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

    public void setHashedSaltedCode(String hashedSaltedCode) {
        this.hashedSaltedCode = hashedSaltedCode;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }
}


