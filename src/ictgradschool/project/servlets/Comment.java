package ictgradschool.project.servlets;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Comment implements Serializable {

    protected int postId;
    protected int commentId;
    protected String comment;
    protected String userName;
    protected String iconPath;
    protected List<Reply> replies = new ArrayList<>();

    public Comment() {
    }

    public Comment(int postId, int commentId, String userName, String comment, List<Reply> replies, String iconPath) {
        this.userName = userName;
        this.comment = comment;
        this.postId = postId;
        this.commentId = commentId;
        this.replies = replies;
    }

    public Comment(int postId, int commentId, String userName, String comment) {
        this.userName = userName;
        this.comment = comment;
        this.postId = postId;
        this.commentId = commentId;
    }

    public String getUserName() {
        return this.userName;
    }

    public String getComment() {
        return this.comment;
    }

    public int getPostId() {
        return this.postId;
    }

    public int getCommentId() {
        return this.commentId;
    }

    public String getIconPath() {
        return this.iconPath;
    }


    public List<Reply> getReply() {
        return this.replies;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public void setReplies(List<Reply> replies) {
        this.replies = replies;
    }

    public String setIconPath(String iconPath) {
        return this.iconPath = iconPath;
    }

}

