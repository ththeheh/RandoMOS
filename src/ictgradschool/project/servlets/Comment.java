package ictgradschool.project.servlets;

import java.io.Serializable;
import java.util.List;

public class Comment implements Serializable {
    protected String userName;
    protected String comment;
    protected int postId;
    protected int commentId;
    protected List<Reply> replies;
    public Comment() {
    }

    public Comment(String userName, int postId, int commentId, String comment, List<Reply> replies) {
        this.userName = userName;
        this.comment = comment;
        this.postId = postId;
        this.commentId = commentId;
        this.replies = replies;
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

    public List<Reply> getReply(){
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

    public void setCommentId (int commentId){
        this.commentId = commentId;
    }

    public void setReplies(List<Reply> replies){
        this.replies = replies;
    }
}

