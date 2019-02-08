package ictgradschool.project.servlets;

public class Reply extends Comment {
    private int replyId;


    public Reply(){
        super();
    }

    public Reply( int postId, int commentId, int replyId, String userName, String reply ){
        this.userName = userName;
        this.postId = postId;
        this.commentId = commentId;
        this.replyId = replyId;
        this.comment = reply;
            }


    public Reply( int postId, int commentId, int replyId, String userName, String reply, String iconPath ){
        this.userName = userName;
        this.postId = postId;
        this.commentId = commentId;
        this.replyId = replyId;
        this.comment = reply;
        this.iconPath = iconPath;
    }

    public int getReplyId(){
        return this.replyId;
    }

    public void setReplyId(int replyId){
        this.replyId = replyId;
    }
}
