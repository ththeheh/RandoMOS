package ictgradschool.project.servlets;

import java.io.Serializable;

public class Post implements Serializable {
    private String userName;
    private String title;
    private String post;

    public Post() {
    }

    public Post(String userName, String title, String post) {
        this.userName = userName;
        this.title = title;
        this.post = post;
    }


    public String getUserName() {
        return this.userName;
    }

    public String getTitle() {
        return this.title;
    }

    public String getPost() {
        return this.post;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPost(String post) {
        this.post = post;
    }


}
