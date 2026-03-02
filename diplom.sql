-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Мар 02 2026 г., 13:10
-- Версия сервера: 9.6.0
-- Версия PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `diplom`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add order', 8, 'add_order'),
(30, 'Can change order', 8, 'change_order'),
(31, 'Can delete order', 8, 'delete_order'),
(32, 'Can view order', 8, 'view_order'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add review', 10, 'add_review'),
(38, 'Can change review', 10, 'change_review'),
(39, 'Can delete review', 10, 'delete_review'),
(40, 'Can view review', 10, 'view_review'),
(41, 'Can add role', 11, 'add_role'),
(42, 'Can change role', 11, 'change_role'),
(43, 'Can delete role', 11, 'delete_role'),
(44, 'Can view role', 11, 'view_role'),
(45, 'Can add status', 12, 'add_status'),
(46, 'Can change status', 12, 'change_status'),
(47, 'Can delete status', 12, 'delete_status'),
(48, 'Can view status', 12, 'view_status'),
(49, 'Can add review photo', 13, 'add_reviewphoto'),
(50, 'Can change review photo', 13, 'change_reviewphoto'),
(51, 'Can delete review photo', 13, 'delete_reviewphoto'),
(52, 'Can view review photo', 13, 'view_reviewphoto'),
(53, 'Can add order product', 14, 'add_orderproduct'),
(54, 'Can change order product', 14, 'change_orderproduct'),
(55, 'Can delete order product', 14, 'delete_orderproduct'),
(56, 'Can view order product', 14, 'view_orderproduct'),
(57, 'Can add product attribute', 15, 'add_productattribute'),
(58, 'Can change product attribute', 15, 'change_productattribute'),
(59, 'Can delete product attribute', 15, 'delete_productattribute'),
(60, 'Can view product attribute', 15, 'view_productattribute');

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(7, 'shop_app', 'category'),
(8, 'shop_app', 'order'),
(14, 'shop_app', 'orderproduct'),
(9, 'shop_app', 'product'),
(15, 'shop_app', 'productattribute'),
(10, 'shop_app', 'review'),
(13, 'shop_app', 'reviewphoto'),
(11, 'shop_app', 'role'),
(12, 'shop_app', 'status'),
(6, 'shop_app', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-02-24 17:17:10.328416'),
(2, 'contenttypes', '0002_remove_content_type_name', '2026-02-24 17:17:14.260454'),
(3, 'auth', '0001_initial', '2026-02-24 17:17:23.556620'),
(4, 'auth', '0002_alter_permission_name_max_length', '2026-02-24 17:17:25.372826'),
(5, 'auth', '0003_alter_user_email_max_length', '2026-02-24 17:17:25.499560'),
(6, 'auth', '0004_alter_user_username_opts', '2026-02-24 17:17:25.666659'),
(7, 'auth', '0005_alter_user_last_login_null', '2026-02-24 17:17:25.798906'),
(8, 'auth', '0006_require_contenttypes_0002', '2026-02-24 17:17:25.947903'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2026-02-24 17:17:26.390852'),
(10, 'auth', '0008_alter_user_username_max_length', '2026-02-24 17:17:26.565278'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2026-02-24 17:17:26.748821'),
(12, 'auth', '0010_alter_group_name_max_length', '2026-02-24 17:17:27.179971'),
(13, 'auth', '0011_update_proxy_permissions', '2026-02-24 17:17:27.342995'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2026-02-24 17:17:27.468029'),
(15, 'shop_app', '0001_initial', '2026-02-24 17:18:09.648367'),
(16, 'admin', '0001_initial', '2026-02-24 17:18:15.605574'),
(17, 'admin', '0002_logentry_remove_auto_add', '2026-02-24 17:18:15.735969'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2026-02-24 17:18:15.892915'),
(19, 'sessions', '0001_initial', '2026-02-24 17:18:17.887685'),
(20, 'shop_app', '0002_product_is_active', '2026-02-28 16:11:03.243770');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('n3tatmjgrh0idaqfz4bh75alicasktb3', '.eJxVjEEOwiAQRe_C2pAiwwgu3XsGMjCDVA1NSrsy3l2bdKHb_977LxVpXWpcu8xxZHVWRh1-t0T5IW0DfKd2m3Se2jKPSW-K3mnX14nledndv4NKvX5rB3lwXMAmBFcAoQw2BaGj5Yy2ZCOSwIkPNp0CejJghAOh8Q4BmdX7A-SYN-E:1vx1Aq:Rwsy5HlVJ0rf5bkrJxb6SAhu08V8CQjpt5f6QdtFFjY', '2026-03-16 11:10:52.592993');

-- --------------------------------------------------------

--
-- Структура таблицы `products_log`
--

CREATE TABLE `products_log` (
  `id` int NOT NULL,
  `productsName` varchar(1000) NOT NULL,
  `productId` int NOT NULL,
  `actions` text NOT NULL,
  `date_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products_log`
--

INSERT INTO `products_log` (`id`, `productsName`, `productId`, `actions`, `date_at`) VALUES
(1, 'Пион фиолетовый', 1, 'Цена изменена с 1200.00 на 1201.00; ', '2026-03-01 17:09:12'),
(2, 'Пион фиолетовый', 1, 'Товар деактивирован; ', '2026-03-01 17:09:25'),
(3, 'Пион фиолетовый', 1, 'Товар активирован; ', '2026-03-01 17:09:39'),
(4, 'Пион фиолетовый', 1, 'Товар деактивирован ', '2026-03-01 17:44:15'),
(5, 'Пион фиолетовый', 1, 'Товар активирован ', '2026-03-01 17:44:17');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_category`
--

CREATE TABLE `shop_app_category` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `shop_app_category`
--

INSERT INTO `shop_app_category` (`id`, `name`) VALUES
(2, 'Упаковка'),
(1, 'Цветы');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_order`
--

CREATE TABLE `shop_app_order` (
  `id` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `address` longtext,
  `status_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `shop_app_order`
--

INSERT INTO `shop_app_order` (`id`, `created_at`, `total_price`, `address`, `status_id`, `user_id`) VALUES
(1, '2026-02-28 15:58:07.981514', 8907.00, 'Улица Пушкина, дом колотушкина', 3, 1),
(4, '2026-03-01 11:10:31.577535', 4904.00, 'Дом колотушкина', 3, 2),
(5, '2026-03-02 11:10:31.802653', 8607.00, 'Дом колотушкина', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_orderproduct`
--

CREATE TABLE `shop_app_orderproduct` (
  `id` int NOT NULL,
  `count` int UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL
) ;

--
-- Дамп данных таблицы `shop_app_orderproduct`
--

INSERT INTO `shop_app_orderproduct` (`id`, `count`, `order_id`, `product_id`) VALUES
(1, 7, 1, 1),
(3, 5, 1, 2),
(7, 1, 4, 2),
(8, 2, 5, 2),
(9, 4, 4, 1),
(10, 7, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_product`
--

CREATE TABLE `shop_app_product` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `category_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `shop_app_product`
--

INSERT INTO `shop_app_product` (`id`, `name`, `price`, `photo`, `category_id`, `is_active`) VALUES
(1, 'Пион фиолетовый', 1201.00, 'products/product_1_61b7de7446d64386b07b90425fcd8876.png', 1, 1),
(2, 'Упаковка синяя', 100.00, 'products/product_2_cb0fb60adf634411bc3f8d46fb55a30a.png', 2, 1);

--
-- Триггеры `shop_app_product`
--
DELIMITER $$
CREATE TRIGGER `product_update_log` BEFORE UPDATE ON `shop_app_product` FOR EACH ROW BEGIN
    DECLARE actions TEXT DEFAULT '';
    IF OLD.price != NEW.price THEN
        SET actions = CONCAT(actions, 
            'Цена изменена с ', OLD.price, ' на ', NEW.price, ''
        );
    END IF;
    IF OLD.is_active != NEW.is_active THEN
        IF NEW.is_active = 1 THEN
            SET actions = CONCAT(actions, 'Товар активирован ');
        ELSE
            SET actions = CONCAT(actions, 'Товар деактивирован ');
        END IF;
    END IF;

    IF actions != '' THEN
        INSERT INTO products_log (productsName, productId, actions)
        VALUES (NEW.name, NEW.id, actions);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_productattribute`
--

CREATE TABLE `shop_app_productattribute` (
  `id` int NOT NULL,
  `attribute_name` varchar(100) NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_review`
--

CREATE TABLE `shop_app_review` (
  `id` int NOT NULL,
  `text` longtext NOT NULL,
  `score` smallint UNSIGNED NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ;

--
-- Дамп данных таблицы `shop_app_review`
--

INSERT INTO `shop_app_review` (`id`, `text`, `score`, `created_at`, `user_id`) VALUES
(3, 'Очень хороший букет получился. Доставили вовремя, рекомендую!', 5, '2026-03-01 18:00:57.127818', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_reviewphoto`
--

CREATE TABLE `shop_app_reviewphoto` (
  `id` int NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `review_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_role`
--

CREATE TABLE `shop_app_role` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `shop_app_role`
--

INSERT INTO `shop_app_role` (`id`, `name`) VALUES
(2, 'Администратор'),
(1, 'Пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_status`
--

CREATE TABLE `shop_app_status` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `shop_app_status`
--

INSERT INTO `shop_app_status` (`id`, `name`) VALUES
(2, 'В процессе'),
(3, 'Завершён'),
(1, 'Новый');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_user`
--

CREATE TABLE `shop_app_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `telegram` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `shop_app_user`
--

INSERT INTO `shop_app_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `phone`, `telegram`, `created_at`, `role_id`) VALUES
(1, 'pbkdf2_sha256$600000$YH4ywip91MobfQXxkBzIMa$LWaabzIhHnDZuxWKjSJ4zRUHwcLR86Jsq76zlw1qArc=', '2026-03-02 11:10:52.301350', 1, 'memori23', 'Кирил', 'Егоров', 'mer1@ml.com', 1, 1, '2026-02-28 15:39:33.416602', '79998887654', 'qsdfqrwq', '2026-02-28 15:39:33.416602', 2),
(2, 'pbkdf2_sha256$600000$GycY2S0iROtmDcANaF5mer$cK0Ks4qsJ+51whBjCnv8iNtWaIUB55dFLDVhuwLBFPo=', '2026-03-02 11:03:40.280870', 0, 'Pasportmem', 'Андрей', 'Нечаев', 'gdsgsd@hdf.com', 0, 1, '2026-03-02 11:03:37.931032', '80005553535', 'sdgswwqg', '2026-03-02 11:03:37.931032', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_user_groups`
--

CREATE TABLE `shop_app_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_app_user_user_permissions`
--

CREATE TABLE `shop_app_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_shop_app_user_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индексы таблицы `products_log`
--
ALTER TABLE `products_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_app_category`
--
ALTER TABLE `shop_app_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `shop_app_order`
--
ALTER TABLE `shop_app_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_app_order_status_id_65ac447f_fk_shop_app_status_id` (`status_id`),
  ADD KEY `shop_app_order_user_id_5587e9b1_fk_shop_app_user_id` (`user_id`);

--
-- Индексы таблицы `shop_app_orderproduct`
--
ALTER TABLE `shop_app_orderproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_app_orderproduct_order_id_85c6d58e_fk_shop_app_order_id` (`order_id`),
  ADD KEY `shop_app_orderproduct_product_id_8f44e154_fk_shop_app_product_id` (`product_id`);

--
-- Индексы таблицы `shop_app_product`
--
ALTER TABLE `shop_app_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_app_product_category_id_e6ff4323_fk_shop_app_category_id` (`category_id`);

--
-- Индексы таблицы `shop_app_productattribute`
--
ALTER TABLE `shop_app_productattribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_app_productattribut_product_id_attribute_nam_1bb76a5a_uniq` (`product_id`,`attribute_name`);

--
-- Индексы таблицы `shop_app_review`
--
ALTER TABLE `shop_app_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_app_review_user_id_553197ab_fk_shop_app_user_id` (`user_id`);

--
-- Индексы таблицы `shop_app_reviewphoto`
--
ALTER TABLE `shop_app_reviewphoto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_app_reviewphoto_review_id_88b070ee_fk_shop_app_review_id` (`review_id`);

--
-- Индексы таблицы `shop_app_role`
--
ALTER TABLE `shop_app_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `shop_app_status`
--
ALTER TABLE `shop_app_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `shop_app_user`
--
ALTER TABLE `shop_app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `shop_app_user_role_id_60adc0be_fk_shop_app_role_id` (`role_id`);

--
-- Индексы таблицы `shop_app_user_groups`
--
ALTER TABLE `shop_app_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_app_user_groups_user_id_group_id_725690b1_uniq` (`user_id`,`group_id`),
  ADD KEY `shop_app_user_groups_group_id_edd68b78_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `shop_app_user_user_permissions`
--
ALTER TABLE `shop_app_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_app_user_user_permi_user_id_permission_id_b5911f90_uniq` (`user_id`,`permission_id`),
  ADD KEY `shop_app_user_user_p_permission_id_480bef8f_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `products_log`
--
ALTER TABLE `products_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `shop_app_category`
--
ALTER TABLE `shop_app_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `shop_app_order`
--
ALTER TABLE `shop_app_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `shop_app_orderproduct`
--
ALTER TABLE `shop_app_orderproduct`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_app_product`
--
ALTER TABLE `shop_app_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `shop_app_productattribute`
--
ALTER TABLE `shop_app_productattribute`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_app_review`
--
ALTER TABLE `shop_app_review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_app_reviewphoto`
--
ALTER TABLE `shop_app_reviewphoto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `shop_app_role`
--
ALTER TABLE `shop_app_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `shop_app_status`
--
ALTER TABLE `shop_app_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `shop_app_user`
--
ALTER TABLE `shop_app_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `shop_app_user_groups`
--
ALTER TABLE `shop_app_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_app_user_user_permissions`
--
ALTER TABLE `shop_app_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_shop_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_app_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_order`
--
ALTER TABLE `shop_app_order`
  ADD CONSTRAINT `shop_app_order_status_id_65ac447f_fk_shop_app_status_id` FOREIGN KEY (`status_id`) REFERENCES `shop_app_status` (`id`),
  ADD CONSTRAINT `shop_app_order_user_id_5587e9b1_fk_shop_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_app_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_orderproduct`
--
ALTER TABLE `shop_app_orderproduct`
  ADD CONSTRAINT `shop_app_orderproduct_order_id_85c6d58e_fk_shop_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_app_order` (`id`),
  ADD CONSTRAINT `shop_app_orderproduct_product_id_8f44e154_fk_shop_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_app_product` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_product`
--
ALTER TABLE `shop_app_product`
  ADD CONSTRAINT `shop_app_product_category_id_e6ff4323_fk_shop_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_app_category` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_productattribute`
--
ALTER TABLE `shop_app_productattribute`
  ADD CONSTRAINT `shop_app_productattr_product_id_98413523_fk_shop_app_` FOREIGN KEY (`product_id`) REFERENCES `shop_app_product` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_review`
--
ALTER TABLE `shop_app_review`
  ADD CONSTRAINT `shop_app_review_user_id_553197ab_fk_shop_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_app_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_reviewphoto`
--
ALTER TABLE `shop_app_reviewphoto`
  ADD CONSTRAINT `shop_app_reviewphoto_review_id_88b070ee_fk_shop_app_review_id` FOREIGN KEY (`review_id`) REFERENCES `shop_app_review` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_user`
--
ALTER TABLE `shop_app_user`
  ADD CONSTRAINT `shop_app_user_role_id_60adc0be_fk_shop_app_role_id` FOREIGN KEY (`role_id`) REFERENCES `shop_app_role` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_user_groups`
--
ALTER TABLE `shop_app_user_groups`
  ADD CONSTRAINT `shop_app_user_groups_group_id_edd68b78_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `shop_app_user_groups_user_id_f16c6137_fk_shop_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_app_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_app_user_user_permissions`
--
ALTER TABLE `shop_app_user_user_permissions`
  ADD CONSTRAINT `shop_app_user_user_p_permission_id_480bef8f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `shop_app_user_user_p_user_id_8be73bc9_fk_shop_app_` FOREIGN KEY (`user_id`) REFERENCES `shop_app_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
