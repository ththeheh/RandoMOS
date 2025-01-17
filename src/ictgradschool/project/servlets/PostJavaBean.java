package ictgradschool.project.servlets;

import javafx.scene.input.DataFormat;

import javax.xml.crypto.Data;
import java.io.Serializable;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PostJavaBean implements Serializable, Comparable<PostJavaBean> {
    private String userName;
    private String iconPath;
    private String title;
    private String post;
    private int postId;
    private List<Comment> comments = new ArrayList<>();
    private String date;
    private String vis;

    public PostJavaBean(){}


    public PostJavaBean(String userName, String title, String post, int postId, String date, String vis) {
        this.userName = userName;
        this.title = title;
        this.post = post;
        this.postId = postId;
        this.date = date;
        this.vis=vis;
    }

    public PostJavaBean(String userName, String title, String post, int postId, String date) {
        this.userName = userName;
        this.title = title;
        this.post = post;
        this.postId = postId;
        this.date = date;
    }

    public PostJavaBean(String userName, String title, String post, String date) {
        this.userName = userName;
        this.title = title;
        this.post = post;
        this.date = date;
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

    public String getDate() {
        return date;
    }

    public List<Comment> getComments() {
        return this.comments;
    }

    public String getVis(){return this.vis;}


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

    public void setDate(String date){
        this.date = date;
    }

    public void setVis(String vis) {this.vis=vis;};

    @Override
    public int compareTo(PostJavaBean o) {
        DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String thisDateStr = this.date;
        LocalDate thisdateLocal = LocalDate.parse(thisDateStr, inputFormat);
        String otherDateStr = o.date;
        LocalDate otherdateLocal = LocalDate.parse(otherDateStr, inputFormat);

          return otherdateLocal.compareTo(thisdateLocal);
    }


    //compare date, title

}
