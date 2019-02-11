DROP TABLE IF EXISTS blog_userReply;
DROP TABLE IF EXISTS blog_userComment;
DROP TABLE IF EXISTS blog_writeArt;
DROP TABLE IF EXISTS blog_post;
DROP TABLE IF EXISTS blog_password;
DROP TABLE IF EXISTS blog_userInfo;

# some databases are refactored to be simpler, e.g. blog_comment, dropped title as id can represent id.

CREATE TABLE IF NOT EXISTS blog_userInfo (
  userName    VARCHAR(50)  NOT NULL,
  firstName   VARCHAR(50)  NOT NULL,
  lastName    VARCHAR(50)  NOT NULL,
  birthday    VARCHAR(50),
  country     VARCHAR(50),
  email       VARCHAR(50),
  description VARCHAR(500),
  iconPath    VARCHAR(100) NOT NULL,
  type       VARCHAR(10),
  PRIMARY KEY (userName)
);


INSERT INTO blog_userInfo (userName, firstName, lastName, birthday, country, email, description, iconPath, type) VALUES
  ('ykim706', 'Mary', 'Kim', '1995-04-25', 'South Korea', 'ykim706@aucklanduni.ac.nz',
   'I embrace all kinds of people.', 'boy1.png','admin');

CREATE TABLE IF NOT EXISTS blog_password (
  userName   VARCHAR(50)  NOT NULL,
  hashedCode VARCHAR(200) NOT NULL,
  salt       VARCHAR(50)  NOT NULL,
  iteration  INT          NOT NULL,
  PRIMARY KEY (userName),
  FOREIGN KEY (userName) REFERENCES blog_userInfo (userName)
);

INSERT INTO blog_password (userName, hashedCode, salt, iteration) VALUES
  ('ykim706', 'Pp21M0PH52EkTu+TI+8z2flyIoy2svf3S+zQlYVE6JBFr0p/6exiNa6S6wIJqCLMN/oOwL9aZNbwvEr6+g9AvQ==', 'š ', 10);

# There would be many comments for one post and there would also be many comments that one user makes
CREATE TABLE IF NOT EXISTS blog_post (
  postId    INT AUTO_INCREMENT,
  userName  VARCHAR(50)   NOT NULL,
  postTitle VARCHAR(50)   NOT NULL,
  post      VARCHAR(1000) NOT NULL,
  date      VARCHAR(30) NOT NULL,
  PRIMARY KEY (postId),
  FOREIGN KEY (userName) REFERENCES blog_userInfo (userName)
);

INSERT INTO blog_post (postId, userName, postTitle, post, date) VALUES
  (1, 'ykim706', 'Lorem Ipsum', 'How to cook the best homemade hotpot','11/02/2019');

CREATE TABLE IF NOT EXISTS blog_writeArt (
  postId   INT AUTO_INCREMENT,
  userName VARCHAR(50) NOT NULL,
  PRIMARY KEY (postId),
  FOREIGN KEY (postId) REFERENCES blog_post (postId)
);

INSERT INTO blog_writeArt (userName, postId) VALUES
  ('ykim706', 1);


CREATE TABLE IF NOT EXISTS blog_userComment (
  postId    INT AUTO_INCREMENT,
  commentId INT         NOT NULL,
  userName  VARCHAR(50) NOT NULL,
  --  postTitle VARCHAR(50) NOT NULL,
  comment   VARCHAR(100),
  PRIMARY KEY (postId, commentId),
  FOREIGN KEY (userName) REFERENCES blog_userInfo (userName),
  FOREIGN KEY (postId) REFERENCES blog_post (postId)

);


INSERT INTO blog_userComment (postId, commentId, userName, comment) VALUES
  (1, 1, 'ykim706', 'This helped me to throw a perfect housewarming party!');


CREATE TABLE IF NOT EXISTS blog_userReply (
  postId    INT AUTO_INCREMENT,
  commentId INT         NOT NULL,
  replyId   INT         NOT NULL,
  userName  VARCHAR(50) NOT NULL,
  reply     VARCHAR(100),
  PRIMARY KEY (postId, commentId, replyId),
  FOREIGN KEY (userName) REFERENCES blog_userInfo (userName),
  FOREIGN KEY (postId,commentId) REFERENCES blog_userComment (postId,commentId)
#   FOREIGN KEY (commentId) REFERENCES blog_userComment (commentId)
);

INSERT INTO blog_userReply (postId, commentId, replyId, userName,reply) VALUES
  (1, 1,4, 'ykim706', 'This is awesome!!!');


