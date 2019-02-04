package ictgradschool.project.servlets;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PostJavaBean implements Serializable {
    private String userName;
    private String iconPath;
    private String title;
    private String post;
    private int postId;
    private List<Comment> comments = new ArrayList<>();

    public PostJavaBean(){}

    public PostJavaBean(String userName, String title, String post) {
        this.userName = userName;
        this.title = title;
        this.post = post;
    }

    public String getUserName() {
        return this.userName;
    }

    public String getIconPath() {
        return this.iconPath;
    }

    public String getTitle(){
        return this.title;
    }

    public String getPost() {
        return this.post;
    }

    public int getPostId() {
        return this.postId;
    }

    public List<Comment> getComments() {
        return this.comments;
    }


    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setIconPath(String iconPath) {
        this.iconPath = iconPath ;
    }

    public void setTitle(String title){
        this.title = title;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }



}
