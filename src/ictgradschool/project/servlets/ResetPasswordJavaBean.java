package ictgradschool.project.servlets;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ResetPasswordJavaBean implements Serializable{
    private String userName;
    private int randomPassword;

    public ResetPasswordJavaBean(){}

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getRandomPassword() {
        return randomPassword;
    }

    public void setRandomPassword(int randomPassword) {
        this.randomPassword = randomPassword;
    }

    public ResetPasswordJavaBean(String userName, int randomPassword) {
        this.userName = userName;
        this.randomPassword = randomPassword;
    }


}
