ALTER TABLE `customer_ask`
DROP INDEX `pro_id`,
ADD INDEX `pro_id`(`pro_id`, `customer_id`) USING BTREE
