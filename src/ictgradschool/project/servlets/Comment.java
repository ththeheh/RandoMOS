package ictgradschool.project.servlets;

import java.io.Serializable;

public class Comment implements Serializable {
        private String userName;
        private String iconPath;
        private String comment;
        private int postId;

        public Comment(){}

        public Comment(String userName, String iconPath, String comment,int postId) {
            this.userName = userName;
            this.iconPath = iconPath;
            this.comment = comment;
            this.postId = postId;
        }

        public String getUserName() {
            return this.userName;
        }

        public String getIconPath() {
            return this.iconPath;
        }

        public String getComment(){
            return this.comment;
        }

        public int getPostId() {
            return this.postId;
        }

        public void setUserName(String userName) {
            this.userName = userName;
        }

        public void setIconPath(String iconPath) {
            this.iconPath = iconPath ;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

        public void setPostId(int postId) {
            this.postId = postId;
        }
    }

