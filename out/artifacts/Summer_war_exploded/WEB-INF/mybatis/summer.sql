CREATE TABLE user (
  id                  INT(11) AUTO_INCREMENT,
  object_id           CHAR(32),
  status              INT(1),
  create_at           DATETIME,
  update_at           DATETIME,

  name                VARCHAR(3),
  email               VARCHAR(32),
  mobile_phone_number CHAR(11),
  id_number           CHAR(18),
  password            VARCHAR(32),
  type                INT(1),

  PRIMARY KEY (id)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;

CREATE TABLE ticket (
  id             INT(11) AUTO_INCREMENT,
  object_id      CHAR(32),
  status         INT(1),
  create_at      DATETIME,
  update_at      DATETIME,

  train_no       VARCHAR(5),
  carriage_no    INT(2),
  seat_no        CHAR(2),
  from_city      VARCHAR(16),
  to_city        VARCHAR(16),
  departure_time DATETIME,
  price          DOUBLE,

  PRIMARY KEY (id)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;

CREATE TABLE train (
  id               INT(11) AUTO_INCREMENT,
  object_id        CHAR(32),
  status           INT(1),
  create_at        DATETIME,
  update_at        DATETIME,

  `number`               VARCHAR(5),
  carriage_total   INT(2),
  remainder_ticket INT(5),
  from_city        VARCHAR(16),
  to_city          VARCHAR(16),
  departure_time   DATETIME,
  ticket_price DOUBLE,

  PRIMARY KEY (id)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;

# CREATE TABLE `order` (
#   id        INT(11) AUTO_INCREMENT,
#   object_id CHAR(32),
#   status    INT(1),
#   create_at DATETIME,
#   update_at DATETIME,
#
#   user_id   INT(11),
#   ticket_id INT(11),
#
#   PRIMARY KEY (id)
# )
#   ENGINE = INNODB
#   DEFAULT CHARSET = UTF8;