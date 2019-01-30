DROP TABLE IF EXISTS loginDataTable;
DROP TABLE IF EXISTS articleComment;
CREATE TABLE IF NOT EXISTS loginDataTable (
  userName         VARCHAR(50)  NOT NULL,
  firstName        VARCHAR(50)  NOT NULL,
  lastName         VARCHAR(50)  NOT NULL,
  birthday         VARCHAR(50),
  country          VARCHAR(50),
  email            VARCHAR(50),
  description      VARCHAR(500),
  password         VARCHAR(50)  NOT NULL,
  hashedSaltedCode VARCHAR(100) NOT NULL,
  PRIMARY KEY (userName)
);

INSERT INTO loginDataTable (userName, firstName, lastName, birthday, country, email, description, password) VALUES
  ('ykim706', 'Mary', 'Kim', '04/29/1995', 'South Korea', 'ykim706@aucklanduni.ac.nz',
   'I embrace all kinds of people.', 'park1234');

# There would be many comments for one article and there would also be many comments that one user makes
CREATE TABLE IF NOT EXISTS articleComment (
  articleTitle VARCHAR(50) NOT NULL,
  comment      VARCHAR(500),
  PRIMARY KEY (comment)
);



CREATE TABLE IF NOT EXISTS userComment (
  userName VARCHAR(50) NOT NULL,
  comment  VARCHAR(500),
  PRIMARY KEY (comment)
);