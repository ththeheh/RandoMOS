package ictgradschool.project.servlets;

public class Reply extends Comment {
    private int replyId;


    public Reply(){
        super();
    }

    public Reply(String userName, int postId, int commentId, int replyId, String reply ){
        this.userName = userName;
        this.postId = postId;
        this.commentId = commentId;
        this.replyId = replyId;
        this.comment = reply;
            }

    public int getReplyId(){
        return this.replyId;
    }

    public void setReplyId(){
        this.replyId = replyId;
    }
}
