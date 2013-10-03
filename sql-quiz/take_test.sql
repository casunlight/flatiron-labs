-- Author: Manuel Neuhauser
-- Date:   October 3, 2013

--  6. take_test.sql

--  Create a take_test.sql for each user that multi inserts their answers for.

--  Every user has taken both quizzes and answered all questions.

--     User 1 has gotten a perfect
--     User 2 has answer 3/5 correct.
--     User 3 has answered 1/5 correct.



DELETE FROM answers;
INSERT INTO answers(user_id, question_id, choice_id) VALUES
  -- User 1
  (1, 1, 1),
  (1, 2, 7),
  (1, 3, 11),
  (1, 4, 15),
  (1, 5, 20),
  (1, 6, 24),
  (1, 7, 25),
  (1, 8, 30),
  (1, 9, 33),
  (1, 10, 40),

  -- User 2
  (2, 1, 2),
  (2, 2, 6),
  (2, 3, 11),
  (2, 4, 15),
  (2, 5, 20),
  (2, 6, 24),
  (2, 7, 25),
  (2, 8, 30),
  (2, 9, 34),
  (2, 10, 39),

  -- User 3
  (3, 1, 1),
  (3, 2, 8),
  (3, 3, 12),
  (3, 4, 16),
  (3, 5, 19),
  (3, 6, 23),
  (3, 7, 28),
  (3, 8, 32),
  (3, 9, 36),
  (3, 10, 40);

