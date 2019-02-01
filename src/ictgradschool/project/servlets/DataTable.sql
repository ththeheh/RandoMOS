DROP TABLE IF EXISTS blog_userComment;
DROP TABLE IF EXISTS blog_writeArt;
DROP TABLE IF EXISTS blog_post;
DROP TABLE IF EXISTS blog_password;
DROP TABLE IF EXISTS blog_userInfo;

CREATE TABLE IF NOT EXISTS blog_userInfo (
  userName         VARCHAR(50)  NOT NULL,
  firstName        VARCHAR(50)  NOT NULL,
  lastName         VARCHAR(50)  NOT NULL,
  birthday         VARCHAR(50),
  country          VARCHAR(50),
  email            VARCHAR(50),
  description      VARCHAR(500),
  iconPath         VARCHAR(100) NOT NULL,
    PRIMARY KEY (userName)
);



INSERT INTO blog_userInfo (userName, firstName, lastName, birthday, country, email, description, icon) VALUES
  ('ykim706', 'Mary', 'Kim', '04/29/1995', 'South Korea', 'ykim706@aucklanduni.ac.nz',
   'I embrace all kinds of people.','./images/icons/boy1.png');

CREATE TABLE IF NOT EXISTS blog_password (
  userName          VARCHAR(50)  NOT NULL,
  hashedCode        VARCHAR(200)  NOT NULL,
  salt              VARCHAR(50)  NOT NULL,
  iteration         INT NOT NULL,
  PRIMARY KEY (userName),
  FOREIGN KEY (userName) REFERENCES blog_userInfo (userName)
);

INSERT INTO blog_password (userName, hashedCode, salt, iteration) VALUES
  ('ykim706', 'H5bHYphCYU+DSWU3jR7WVrSNeRTwD76fUIL5+pel3rlBtqg27BrHId2LibN8smMGbW+LLAyHQMHBInNDh46Wlw==','ADBE1',10);



# There would be many comments for one post and there would also be many comments that one user makes
CREATE TABLE IF NOT EXISTS blog_post (
    userName VARCHAR(50) NOT NULL,
  postId INT AUTO_INCREMENT,
  postTitle VARCHAR(50) NOT NULL,
  post      VARCHAR(1000) NOT NULL,
  comment      VARCHAR(100),
  PRIMARY KEY (username,postId)
    FOREIGN KEY (userName) REFERENCES blog_userInfo (userName),
);

INSERT INTO blog_post(username,postTitle,post,comment) VALUES
  ('ykim706','Lorem Ipsum','How to cook the best homemade hotpot', 'This helped me to throw a perfect housewarming party!');

CREATE TABLE IF NOT EXISTS blog_writeArt(
  userName VARCHAR(50) NOT NULL,
  postId INT AUTO_INCREMENT,
  PRIMARY KEY (userName, postId),
  FOREIGN KEY (userName) REFERENCES blog_userInfo (userName),
  FOREIGN KEY (postId) REFERENCES blog_post (postId)
);

INSERT INTO blog_writeArt(userName, postId) VALUES
  ('ykim706', 1);


CREATE TABLE IF NOT EXISTS blog_userComment (
  userName VARCHAR(50) NOT NULL,
  postId INT AUTO_INCREMENT,
  postTitle VARCHAR(50) NOT NULL,
  comment  VARCHAR(100),
  PRIMARY KEY (userName),
  FOREIGN KEY (userName) REFERENCES blog_userInfo (userName),
  FOREIGN KEY ( postId,postTitle) REFERENCES post (postId,postTitle)

);

INSERT INTO blog_userComment(userName, postId,postTitle,comment) VALUES
  ('ykim706', '1','How to cook the best homemade hotpot','This helped me to throw a perfect housewarming party!');