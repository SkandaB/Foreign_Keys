CREATE TABLE User
(
  id INT NOT NULL,
  full_name INT,
  Street INT NOT NULL,
  City INT NOT NULL,
  unit_number INT NOT NULL,
  zip_code INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Tag
(
  id INT NOT NULL,
  name INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE User_email
(
  email INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (email, id),
  FOREIGN KEY (id) REFERENCES User(id)
);

CREATE TABLE Post
(
  id INT NOT NULL,
  created_timestamp INT NOT NULL,
  user_id INT NOT NULL,
  body INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES User(id)
);

CREATE TABLE Vote
(
  id INT NOT NULL,
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  id INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES Post(id),
  FOREIGN KEY (id) REFERENCES User(id)
);

CREATE TABLE Comment
(
  number INT NOT NULL,
  post_id INT NOT NULL,
  user_id INT NOT NULL,
  body INT NOT NULL,
  id INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (number, id),
  FOREIGN KEY (id) REFERENCES Post(id),
  FOREIGN KEY (id) REFERENCES User(id)
);

CREATE TABLE Question
(
  id INT NOT NULL,
  post_id INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES Post(id)
);

CREATE TABLE Answer
(
  id INT NOT NULL,
  post_id INT NOT NULL,
  question_id INT NOT NULL,
  accepted INT NOT NULL,
  id INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES Question(id),
  FOREIGN KEY (id) REFERENCES Post(id)
);

CREATE TABLE Question_Tag
(
  id INT NOT NULL,
  id INT NOT NULL,
  PRIMARY KEY (id, id),
  FOREIGN KEY (id) REFERENCES Question(id),
  FOREIGN KEY (id) REFERENCES Tag(id)
);
