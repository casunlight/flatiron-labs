-- Author: Manuel Neuhauser
-- Date:   October 3, 2013
--  BONUS

--  Add Indexes to optimize queries.

--  Explore explain and see if you can understand performance.

CREATE INDEX `questions_quiz_id_idx` ON questions(quiz_id);
CREATE INDEX `choices_question_id_idx` ON choices(question_id);
CREATE INDEX `choices_correct_idx` ON choices(correct);
CREATE INDEX `answers_user_id_idx` ON answers(user_id);
CREATE INDEX `answers_choice_id_idx` ON answers(choice_id);
CREATE INDEX `answers_question_id_idx` ON answers(question_id);