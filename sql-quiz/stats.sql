-- Author: Manuel Neuhauser
-- Date:   October 3, 2013

--  8. stats.sql

--  Create a stats.sql that will show the percentage or total right answers.

--  Do percentage if you want to try to use MATH functions within SQL This will need to use joins too and might get complicated.

SELECT users.name,
       quizzes.name,
       ((COUNT(*)*100)/5) ||'%' AS `percentage_correct`

FROM users, answers, choices, quizzes, questions

WHERE users.id     = answers.user_id
  AND choices.id   = answers.choice_id
  AND questions.id = answers.question_id  
  AND quizzes.id   = questions.quiz_id
  AND correct      = 1

GROUP BY users.id, quizzes.id;

