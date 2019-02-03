package ictgradschool.project.servlets;

import java.io.Serializable;
import java.util.List;

public class PostJavaBean implements Serializable {
    private String userName;
    private String iconPath;
    private String title;
    private String post;
    private int postId;
    private List<Comment> comments;

    public PostJavaBean(){}

    public PostJavaBean(String userName, String iconPath, String title, String post, int postId, List<Comment> comments) {
        this.userName = userName;
        this.iconPath = iconPath;
        this.title = title;
        this.post = post;
        this.postId = postId;
        this.comments = comments;
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

    public List<Comment> comments() {
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
