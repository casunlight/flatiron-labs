-- Author: Manuel Neuhauser
-- Date:   October 3, 2013

--  7. grading.sql

--  Create a grading.sql that will grade each quiz for each user.

--     These should be using joins.

SELECT users.name,
       quizzes.name,
       COUNT(*) AS `correct_answers`

FROM users, answers, choices, quizzes, questions

WHERE users.id     = answers.user_id
  AND choices.id   = answers.choice_id
  AND questions.id = answers.question_id  
  AND quizzes.id   = questions.quiz_id
  AND correct      = 1

GROUP BY users.id, quizzes.id;

