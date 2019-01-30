DROP TABLE IF EXISTS passwordTable;
DROP TABLE IF EXISTS loginDataTable;

CREATE TABLE IF NOT EXISTS loginDataTable (
  userName         VARCHAR(50)  NOT NULL,
  firstName        VARCHAR(50)  NOT NULL,
  lastName         VARCHAR(50)  NOT NULL,
  birthday         VARCHAR(50),
  country          VARCHAR(50),
  email            VARCHAR(50),
  description      VARCHAR(500),
  PRIMARY KEY (userName)
);



INSERT INTO loginDataTable (userName, firstName, lastName, birthday, country, email, description) VALUES
  ('ykim706', 'Mary', 'Kim', '04/29/1995', 'South Korea', 'ykim706@aucklanduni.ac.nz',
   'I embrace all kinds of people.');

CREATE TABLE IF NOT EXISTS passwordTable (
  userName          VARCHAR(50)  NOT NULL,
  hashedCode        VARCHAR(200)  NOT NULL,
  salt              VARCHAR(50)  NOT NULL,
  iteration         INT NOT NULL,
  PRIMARY KEY (userName),
  FOREIGN KEY (userName) REFERENCES loginDataTable (userName)
);

INSERT INTO passwordTable (userName, hashedCode, salt, iteration) VALUES
  ('ykim706', 'H5bHYphCYU+DSWU3jR7WVrSNeRTwD76fUIL5+pel3rlBtqg27BrHId2LibN8smMGbW+LLAyHQMHBInNDh46Wlw==','ADBE1',10);



# There would be many comments for one article and there would also be many comments that one user makes
CREATE TABLE IF NOT EXISTS articleComment (
  articleTitle VARCHAR(50) NOT NULL,
  comment      VARCHAR(500),
  PRIMARY KEY (comment)
);

INSERT INTO articleComment(articleTitle, comment) VALUES
  ("How to cook the best homemade hotpot", "This helped me to throw a perfect housewarming party!");



CREATE TABLE IF NOT EXISTS userComment (
  userName VARCHAR(50) NOT NULL,
  comment  VARCHAR(500),
  PRIMARY KEY (comment),

);

INSERT INTO userComment(userName, comment) VALUES
  ("ykim706", );