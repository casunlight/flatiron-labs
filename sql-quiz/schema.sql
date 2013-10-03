-- Author: Manuel Neuhauser
-- Date:   October 3, 2013

--  1. schema.sql

--  Create a schema.sql file to make the following database structure

--     Users have a name.
--     Quizzes have a name.
--     Questions have content and belong to a quiz. (Each question only belongs to 1 quiz)
--     Choices have content, can be correct or not, and belong to a question.

--     Answers belong to a user, a question, and a choice.

--     Your response should be in the format of a series of sql commands like:

--     CREATE TABLE user ( /* do some sql magic here / ); / etc ... */

DROP TABLE users;
DROP TABLE quizzes;
DROP TABLE questions;
DROP TABLE choices;
DROP TABLE answers;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE quizzes (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  quiz_id INTEGER,
  content TEXT
);

CREATE TABLE choices (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  content TEXT,
  correct INTEGER
);

CREATE TABLE answers (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,
  choice_id INTEGER
);

