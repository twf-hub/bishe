USE `jiaxiaoyuyuexuexixitong`;

SET FOREIGN_KEY_CHECKS = 0;

DELETE epq
FROM `exam_paper_question` epq
LEFT JOIN `exam_paper` ep ON epq.`exam_paper_id` = ep.`id`
LEFT JOIN `exam_question` eq ON epq.`question_id` = eq.`id`
WHERE ep.`id` IS NULL OR eq.`id` IS NULL;

SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE `coach`
  ADD UNIQUE KEY `uk_coach_username` (`username`),
  ADD UNIQUE KEY `uk_coach_phone` (`phone`),
  ADD UNIQUE KEY `uk_coach_id_card` (`id_card`);

ALTER TABLE `user`
  ADD UNIQUE KEY `uk_user_username` (`username`),
  ADD UNIQUE KEY `uk_user_phone` (`user_phone`),
  ADD UNIQUE KEY `uk_user_id_number` (`user_id_number`);

ALTER TABLE `users`
  ADD UNIQUE KEY `uk_users_username` (`username`);

ALTER TABLE `coach_reservation`
  ADD UNIQUE KEY `uk_coach_reservation_registration_number` (`registration_number`),
  ADD CONSTRAINT `fk_coach_reservation_coach`
    FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_coach_reservation_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `study_material`
  ADD UNIQUE KEY `uk_study_material_number` (`material_number`);

ALTER TABLE `material_collection`
  ADD CONSTRAINT `fk_material_collection_material`
    FOREIGN KEY (`material_id`) REFERENCES `study_material` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  ADD CONSTRAINT `fk_material_collection_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `material_comment`
  ADD CONSTRAINT `fk_material_comment_material`
    FOREIGN KEY (`material_id`) REFERENCES `study_material` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  ADD CONSTRAINT `fk_material_comment_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `message_board`
  ADD CONSTRAINT `fk_message_board_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `exam_record`
  ADD UNIQUE KEY `uk_exam_record_uuid` (`examrecord_uuid_number`),
  ADD CONSTRAINT `fk_exam_record_paper`
    FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_exam_record_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `exam_details`
  ADD CONSTRAINT `fk_exam_details_question`
    FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_exam_details_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `wrong_question`
  ADD CONSTRAINT `fk_wrong_question_paper`
    FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_wrong_question_question`
    FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_wrong_question_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `exam_paper_question`
  ADD CONSTRAINT `fk_exam_paper_question_paper`
    FOREIGN KEY (`exam_paper_id`) REFERENCES `exam_paper` (`id`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  ADD CONSTRAINT `fk_exam_paper_question_question`
    FOREIGN KEY (`question_id`) REFERENCES `exam_question` (`id`)
    ON UPDATE CASCADE ON DELETE RESTRICT;