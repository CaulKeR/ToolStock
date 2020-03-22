create table `tool_stock`.`tool_type`
(
    `id`          integer(10) unsigned not null auto_increment unique,
    `title`       varchar(255)         not null,
    `delete_date` date DEFAULT NULL,
    primary key (`id`)
) engine = InnoDB
  default charset = utf8mb4;

create table `tool_stock`.`tool_status`
(
    `id`    integer(10) unsigned not null auto_increment unique,
    `title` varchar(255)         not null unique,
    primary key (`id`)
) engine = InnoDB
  default charset = utf8mb4;

create table `tool_stock`.`tool_catalogue`
(
    `id`              integer(10) unsigned not null auto_increment unique,
    `tool_type_id`    integer(10) unsigned not null,
    `title`           varchar(255)         not null,
    `receipt_date`    date                 not null,
    `write_off_date`  date                 not null,
    `production_date` date                 not null,
    `shelf_life`      integer(4),
    `delete_date`     date DEFAULT NULL,
    primary key (`id`),
    foreign key (`tool_type_id`) references `tool_stock`.tool_type (`id`) on delete restrict
) engine = InnoDB
  default charset = utf8mb4;

create table `tool_stock`.`tool`
(
    `id`                integer(10) unsigned not null auto_increment unique,
    `code`              varchar(255)         not null unique,
    `tool_catalogue_id` integer(10) unsigned not null,
    `tool_status_id`    integer(10) unsigned not null,
    `delete_date`       date default null,
    primary key (`id`),
    foreign key (`tool_catalogue_id`) references `tool_stock`.tool_catalogue (`id`) on delete restrict,
    foreign key (`tool_status_id`) references `tool_stock`.tool_status (`id`) on delete restrict
) engine = InnoDB
  default charset = utf8mb4;

create table `tool_stock`.`position`
(
    `id`    integer(10) unsigned not null auto_increment unique,
    `title` varchar(255)         not null,
    primary key (`id`)
) engine = InnoDB
  default charset = utf8mb4;

create table `tool_stock`.`worker`
(
    `id`              integer(10) unsigned not null auto_increment unique,
    `first_name`      varchar(255)         not null,
    `last_name`       varchar(255)         not null,
    `patronymic`      varchar(255),
    `position_id`     integer(10) unsigned not null,
    `birth_date`      date                 not null,
    `employment_date` date                 not null,
    `delete_date`     date default null,
    primary key (`id`),
    foreign key (`position_id`) references `tool_stock`.`position` (`id`) on delete restrict
) engine = InnoDB
  default charset = utf8mb4;

create table `tool_stock`.`equipment`
(
    `id`          integer(10) unsigned not null auto_increment unique,
    `code`        varchar(255)         not null unique,
    `title`       varchar(255)         not null,
    `width`       decimal(8, 3) unsigned,
    `length`      decimal(8, 3) unsigned,
    `height`      decimal(8, 3) unsigned,
    `delete_date` date DEFAULT NULL,
    primary key (`id`)
) engine = InnoDB
  default charset = utf8mb4;

create table `tool_stock`.`equipment_tool_type`
(
    `equipment_id` integer(10) unsigned not null,
    `tool_type_id` integer(10) unsigned not null,
    primary key (`equipment_id`, `tool_type_id`),
    foreign key (`equipment_id`) references `tool_stock`.equipment (`id`) on delete restrict,
    foreign key (`tool_type_id`) references `tool_stock`.tool_type (`id`) on delete restrict
) engine = InnoDB
  default charset = utf8mb4;

create table `tool_stock`.`technological_map`
(
    `id`             integer(10) unsigned not null auto_increment unique,
    `tool_id`        integer(10) unsigned not null,
    `equipment_id`   integer(10) unsigned not null,
    `worker_id`      integer(10) unsigned not null,
    `manager_id`     integer(10) unsigned not null,
    `issuing_date`   date                 not null,
    `reception_date` date                 not null,
    primary key (`id`),
    foreign key (`tool_id`) references `tool_stock`.tool (`id`) on delete restrict,
    foreign key (`equipment_id`) references `tool_stock`.equipment (`id`) on delete restrict,
    foreign key (`worker_id`) references `tool_stock`.worker (`id`) on delete restrict,
    foreign key (`manager_id`) references `tool_stock`.worker (`id`) on delete restrict
) engine = InnoDB
  default charset = utf8mb4;