DROP TABLE IF EXISTS test_1;
DROP TABLE IF EXISTS test_2;

CREATE TABLE `test_1` (
	`id` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO `test_1` (`id`, `name`) VALUES (1, 'aaa');
INSERT INTO `test_1` (`id`, `name`) VALUES (2, 'bbb');
INSERT INTO `test_1` (`id`, `name`) VALUES (3, 'ccc');


CREATE TABLE `test_2` (
	`id` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO `test_2` (`id`, `name`) VALUES (3, 'hhh');
INSERT INTO `test_2` (`id`, `name`) VALUES (4, 'kkk');
INSERT INTO `test_2` (`id`, `name`) VALUES (5, 'lll');


SELECT t1.*
FROM test_1 t1
LEFT JOIN test_2 t2 ON t1.id = t2.id 
WHERE t2.id IS NULL

