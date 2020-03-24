-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 24 2020 г., 15:31
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rocket`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1584972558);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1584972558, 1584972558);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Имя',
  `email` varchar(255) NOT NULL COMMENT 'E-mail',
  `comment` text NOT NULL COMMENT 'Комментарий',
  `post_id` int(11) NOT NULL COMMENT 'Пост ID',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'Статус',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Дата создания',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `comment`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Altynbek', 'Altynbek@mail.com', 'Good', 1, 1, '2020-03-24 09:31:47', '2020-03-24 09:31:47'),
(2, 'Test2', 'test2@mail.com', 'Testttt2, testtttt2', 1, 1, '2020-03-24 09:32:48', '2020-03-24 09:32:48'),
(3, 'admin', 'admin@admin.com', 'Tesss3 ', 1, 1, '2020-03-24 10:57:52', '2020-03-24 09:57:52'),
(4, 'admin', 'admin@admin.com', '<p>Любые изменения настоящей Политики будут размещаться непосредственно на официальном веб-сайте Corsair по адресу http://www.corsair.com/privacy_policy.aspx. В случае существенного изменения правил сбора и обработки данных компания Corsair обязуется на 30 дней разместить на своем сайте заметное уведомление обо всех изменениях и разослать сообщения всем пользователям, предоставившим свой электронный адрес.</p>\r\n', 2, 1, '2020-03-24 11:13:43', '2020-03-24 11:13:43'),
(5, 'admin', 'admin@admin.com', '<p>The need to continue to collect information, including through questionnaires, and to post updated information on the website of OHCHR were also emphasized.</p>\r\n', 2, 1, '2020-03-24 12:02:30', '2020-03-24 12:02:30');

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `translation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `meta_models`
--

CREATE TABLE `meta_models` (
  `id` int(11) NOT NULL,
  `meta_tag_id` int(11) NOT NULL COMMENT 'Мета-тег',
  `model` varchar(255) NOT NULL COMMENT 'Класс модели',
  `model_id` int(11) NOT NULL COMMENT 'ID записи модели'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `meta_pages`
--

CREATE TABLE `meta_pages` (
  `id` int(11) NOT NULL,
  `meta_tag_id` int(11) NOT NULL COMMENT 'Мета-тег',
  `module` varchar(255) NOT NULL COMMENT 'Название модуля',
  `controller` varchar(255) NOT NULL COMMENT 'Название контроллера',
  `action` varchar(255) NOT NULL COMMENT 'Название экшена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT 'Дата создания',
  `updated_at` datetime DEFAULT NULL COMMENT 'Дата редактирования'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `meta_tag_translations`
--

CREATE TABLE `meta_tag_translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(255) NOT NULL COMMENT 'Язык перевода',
  `meta_tag_id` int(11) NOT NULL COMMENT 'Мета-тег',
  `title` varchar(255) DEFAULT NULL COMMENT 'Заголовок',
  `description` text DEFAULT NULL COMMENT 'Описание',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'Ключевые слова',
  `image` varchar(255) DEFAULT NULL COMMENT 'Изображение',
  `type` varchar(255) DEFAULT NULL COMMENT 'Тип страницы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('Da\\User\\Migration\\m000000_000001_create_user_table', 1584972300),
('Da\\User\\Migration\\m000000_000002_create_profile_table', 1584972301),
('Da\\User\\Migration\\m000000_000003_create_social_account_table', 1584972302),
('Da\\User\\Migration\\m000000_000004_create_token_table', 1584972303),
('Da\\User\\Migration\\m000000_000005_add_last_login_at', 1584972303),
('Da\\User\\Migration\\m000000_000006_add_two_factor_fields', 1584972303),
('Da\\User\\Migration\\m000000_000007_enable_password_expiration', 1584972303),
('Da\\User\\Migration\\m000000_000008_add_last_login_ip', 1584972303),
('Da\\User\\Migration\\m000000_000009_add_gdpr_consent_fields', 1584972303),
('m000000_000000_base', 1584972281),
('m140506_102106_rbac_init', 1584972287),
('m140609_093837_addI18nTables', 1584972283),
('m170613_185652_create_settings_table', 1584972291),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1584972287),
('m180325_173325_create_settings_group_table', 1584972292),
('m180327_163555_add_key_column_to_settings_group_table', 1584972292),
('m180424_121052_create_meta_tags_table', 1584972293),
('m180424_121053_create_meta_tag_translations_table', 1584972293),
('m180424_121054_create_meta_models_table', 1584972294),
('m180424_121055_create_meta_pages_table', 1584972295),
('m180523_151638_rbac_updates_indexes_without_prefix', 1584972288),
('m180818_060550_create_settings_translations_table', 1584972296),
('m180919_103846_update_index_meta_tag_translations_table', 1584972296),
('m200323_141416_create_posts_table', 1584973336),
('m200324_051722_create_comments_table', 1585027881);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'Заголовок',
  `slug` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL COMMENT 'Текст',
  `published_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Дата публикации',
  `is_active` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'Активность',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Дата создания',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Дата обновления'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `text`, `published_at`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Как написать хорошую новость на сайт?', 'kak-napisat-khoroshuyu-novost-na-sayt', '<p>Это не особенно сложно. Чтобы материал читали и понимали, можно следовать формуле 5W+H, знать о перевернутой пирамиде и помнить несколько главных принципов. Давайте обо всем по порядку.</p>\r\n\r\n<p>Любая качественная новость обязана отвечать на ключевые вопросы:</p>\r\n\r\n<p>- &nbsp;What? (Что?)</p>\r\n\r\n<p>- &nbsp;Who? (Кто?)</p>\r\n\r\n<p>- &nbsp;Where? (Где?)</p>\r\n\r\n<p>- &nbsp;When? (Когда?)</p>\r\n\r\n<p>- &nbsp;Why? (Почему/Зачем?)</p>\r\n\r\n<p>- &nbsp;How? (Как?)</p>\r\n\r\n<p>Как видите, пять вопросов начинаются с буквы &laquo;W&raquo;, а последний &mdash; с &laquo;H&raquo;. Это и есть формула 5W+H.</p>\r\n\r\n<p>Новость можно считать хорошей, если в самом ее начале даются ответы хотя бы на 3 вопроса. Остальные раскрываются следом. Практикуясь в создании новостей, проверяйте себя, пропуская свой текст через эти вопросы.</p>\r\n', '2020-03-23 14:35:00', 1, '2020-03-23 14:39:43', '2020-03-23 14:39:43'),
(2, 'Какими бывают новости?', 'kakimi-byvayut-novosti', '<p>Краткими и подробными. Объем текста прямо зависит от характера новостного события. Выпуск новой модели принтера можно осветить очень коротко. Внедрение сетки тарифов в одной тысяче знаков не описать. Больше требуемых подробностей &mdash; длинней тело новости.</p>\r\n\r\n<p>Мягкими и жесткими.&nbsp;В мягкой новости читателя интригуют заголовком и коротким первым абзацем (лидом), раскрывая сюжет уже после. Структура новостных статей этого типа соответствует принципу нарастающего интереса. Мягкая новость постепенно знакомит читателя с фактом, сохраняя атмосферу интриги.</p>\r\n\r\n<p>Жесткая новость строится проще &mdash; линейно. Лид четко рассказывает суть происшедшего, а основное тело статьи сообщает подробности. Затем можно дать предысторию, осветив вес процесс развития темы.</p>\r\n\r\n<p>Сложно-составными. Такая новость объединяет два (или несколько) логически связанных факта.</p>\r\n\r\n<p>Скажем, хостинг-компания пишет о вводе специального тарифа для сайтов на базе WordPress. Сразу после этого сообщается, что перейти на тариф пожелали более 35 % ранее опрошенных клиентов. Первый факт дополнен вторым. В этом случае лид сообщает обо всех событиях сразу.</p>\r\n\r\n<p>Новости для онлайна &mdash; совсем не новости для печати. Перелистнуть бумажную страницу все-таки чуть сложнее, чем сделать очередной клик. Отсюда возникает специфика. Новостные статьи для web должны быть короче, проще, информативней.</p>\r\n', '2020-03-23 13:35:00', 1, '2020-03-23 16:32:26', '2020-03-23 16:32:26'),
(3, 'Три полезных совета по созданию новостей для сайта', 'tri-poleznykh-soveta-po-sozdaniyu-novostey-dlya-sayta', '<p>-&nbsp;Старайтесь соблюдать график. Заполнять news-колонку следует не наскоками, а по четкому расписанию. Например, по 2 материала в неделю. Регулярность важна. Новостные поводы есть всегда &mdash; нужно лишь немного подумать.</p>\r\n\r\n<p>-&nbsp;Оставайтесь над ситуацией.&nbsp;Хороший новостной автор всегда беспристрастен. Эмоции, выводы и призывы лучше оставить для продающих текстов. Не стоит использовать личное местоимение &laquo;я&raquo;, если только вы не приводите чью-то цитату. Рассказчик как бы отсутствует, не привлекая к себе внимания.</p>\r\n\r\n<p>-&nbsp;Пишите простым языком. Еще одно важное правило написания новостей! Короткие предложения и абзацы намного легче воспринимаются. Люди быстро сканируют информацию. Завершив черновик, постарайтесь отвлечься. Спустя какое-то время перечитайте черновой текст.&nbsp;Нет ли в новости лишних слов,&nbsp;без которых легко обойтись? Нашли &mdash; решительно удаляйте.</p>\r\n', '2020-03-13 01:35:00', 1, '2020-03-23 16:48:39', '2020-03-23 16:48:39'),
(4, 'Эпилог ', 'epilog', '<p>Друзья, мы коротко рассказали о том, как писать новости для сайта. Новостные статьи важны. В конечном счете, они тоже работают на продажи! Есть множество сайтов с заросшими паутиной &mdash; или вовсе пустыми &mdash; news-колонками. Когда-то сделали и забросили, поскольку некому заниматься&hellip;</p>\r\n\r\n<p>Типичная ситуация, особенно, в малом бизнесе.</p>\r\n\r\n<p>Обращайтесь к администраторам сайтов. Предлагайте свои услуги в качестве авторов новостей. Начнете с них, а там &mdash; вполне вероятно &mdash; потребуется ведение корпоративного блога или что-то еще. Создание новостей на сайт &mdash; работа вовсе не скучная. Находите новых клиентов и пишите отличные новости! Все получится.</p>\r\n\r\n<p>А если же вы &mdash; представитель бизнеса, то, наверное, уже понимаете, где можно заказать отличные новости для сайта. Правильно, именно здесь!</p>\r\n\r\n<p>Добра вам!</p>\r\n', '2020-03-23 13:35:00', 1, '2020-03-23 16:49:03', '2020-03-23 16:49:03'),
(5, 'В чем польза web-новостей?', 'v-chem-pol-za-web-novostey', '<p>Для начала давайте выясним, зачем вообще нужны новости на сайте. Полноценная новостная колонка &mdash; не прихоть и не каприз. Она решает, как минимум, 4 очень важные задачи:</p>\r\n\r\n<p>- &nbsp;Информируют. Да, да, просто информируют читателей о тех или иных событиях. Сегодня люди все еще интересуются новостями отрасли и событиями из жизни компаний, а потому нужно постоянно подкармливать читателя свежими порциями информации.</p>\r\n\r\n<p>- &nbsp;Повышают лояльность к бренду. Посетитель сайта видит, что сайт живой, актуальный, рабочий. Что вы подумаете, наткнувшись на пустой или давно брошенный новостной раздел? Правильно. У вас сложится впечатление, что эта компания не работает. Доисторические даты статей, размещенных на сайте, просто отпугивают клиентов. Элементарная психология.</p>\r\n\r\n<p>Напротив, если компания заполняет свой собственный новостной раздел, это явно идет ей на пользу. Потенциальные покупатели видят, что фирма держится на плаву. Возникает доверие к бренду. Актуальные новостные статьи демонстрируют успешность в бизнесе. Наконец, это солидно.</p>\r\n\r\n<p>- &nbsp;Привлекают дополнительный трафик. Речь идет о сугубо информационных запросах, однако зачем игнорировать их? Пусть работают &mdash; тоже дело. Этот добавочный трафик не только можно, но даже нужно конвертировать в реальную прибыль с заказов. Почему нет?</p>\r\n\r\n<p>- &nbsp;Нравятся поисковым роботам. Обновляемая новостная колонка ускоряет web-индексацию. Сайт раскручивается быстрее. Если не пополнять свой ресурс свежими материалами хотя бы несколько месяцев, его позиции упадут. Нужен свежий контент! Написание уникальных новостей для сайта &mdash; отличный способ понравиться Яндекс и Google без чрезмерных затрат.</p>\r\n', '2020-03-23 14:35:00', 1, '2020-03-23 16:49:33', '2020-03-23 16:49:33'),
(6, 'Заказывайте наверняка', 'zakazyvayte-navernyaka', '<p>Сегодня заказать коммерческий текст &laquo;как у всех&raquo; крайне просто. Для этого вам достаточно будет обратиться в любое агентство, биржу или сайт фриланса. Увы, даже за большие деньги вам никто не гарантирует качество текстов для бизнеса.</p>\r\n\r\n<p>Мы же предлагаем вам гораздо большее: &nbsp;помощь от профессиональных авторов, которые обладают богатым опытом успешного сотрудничества с крупными компаниями и работают на серьезный результат. Нам важна оплата, не скроем, но удовлетворение от работы важно еще больше.</p>\r\n\r\n<p>Заказывая написание коммерческих текстов на этом сайте, вы получите материалы, которые будут соответствовать всем главным требованиям бизнеса:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Сильная продающая составляющая</p>\r\n\r\n<p>Яркий стиль (от официально-делового до позитивно-дружелюбного)</p>\r\n\r\n<p>Отличный имиджевый потенциал</p>\r\n\r\n<p>Наличие сильных и проверенных &laquo;фишек&raquo;</p>\r\n\r\n<p>Четкая структура коммерческого текста</p>\r\n\r\n<p>Умная SEO-оптимизация (при необходимости)</p>\r\n\r\n<p>Какие бы задачи ни стояли перед вашей компанией, мы обязательно найдем решение. И даже не одно!</p>\r\n\r\n<p>Почему мы так уверенно это говорим? Потому что помимо умения писать профессиональные коммерческие тексты, копирайтеры агентства обладают хорошим, достаточно глубоким пониманием маркетинга.</p>\r\n\r\n<p>Десятки наших клиентов уже убедились, что помимо коммерческих текстов, они всегда могут рассчитывать на консультации, советы и рекомендации, касающихся маркетинговой составляющей.</p>\r\n', '2020-03-23 14:35:00', 0, '2020-03-23 16:50:33', '2020-03-23 16:50:33');

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `timezone`, `bio`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `key` varchar(75) NOT NULL,
  `value` text DEFAULT NULL,
  `type` int(11) NOT NULL,
  `type_settings` text DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL COMMENT 'Settings group',
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `title`, `key`, `value`, `type`, `type_settings`, `group_id`, `position`) VALUES
(1, 'Admin title', 'admin-header', 'Bridge', 1, NULL, 2, 1),
(2, 'Footer-copyright', 'footer-copyright', '&beta;ridge © 2020 by <a href=\"https://github.com/naffiq\" target=\"_blank\">naffiq</a>', 2, NULL, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `settings_group`
--

CREATE TABLE `settings_group` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT 'Group name',
  `description` text DEFAULT NULL COMMENT 'Group description',
  `icon` varchar(255) DEFAULT NULL COMMENT 'Group icon',
  `position` int(11) DEFAULT NULL COMMENT 'Order',
  `key` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings_group`
--

INSERT INTO `settings_group` (`id`, `title`, `description`, `icon`, `position`, `key`) VALUES
(1, 'Seo and Analytics', NULL, 'fa-bar-chart', 1, 'seo-and-analytics'),
(2, 'Admin', NULL, 'fa-wrench', 2, 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `settings_translations`
--

CREATE TABLE `settings_translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(255) NOT NULL COMMENT 'Язык перевода',
  `settings_id` int(11) NOT NULL COMMENT 'Настройка',
  `value` text DEFAULT NULL COMMENT 'Значение'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings_translations`
--

INSERT INTO `settings_translations` (`id`, `lang`, `settings_id`, `value`) VALUES
(1, 'en-US', 1, 'Bridge'),
(2, 'ru-RU', 1, 'Bridge'),
(3, 'kk-KZ', 1, 'Bridge'),
(4, 'en-US', 2, '&beta;ridge © 2020 by <a href=\"https://github.com/naffiq\" target=\"_blank\">naffiq</a>'),
(5, 'ru-RU', 2, '&beta;ridge © 2020 by <a href=\"https://github.com/naffiq\" target=\"_blank\">naffiq</a>'),
(6, 'kk-KZ', 2, '&beta;ridge © 2020 by <a href=\"https://github.com/naffiq\" target=\"_blank\">naffiq</a>');

-- --------------------------------------------------------

--
-- Структура таблицы `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `source_message`
--

CREATE TABLE `source_message` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `token`
--

CREATE TABLE `token` (
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `confirmed_at` int(11) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `last_login_at` int(11) DEFAULT NULL,
  `last_login_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_tf_key` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT 0,
  `password_changed_at` int(11) DEFAULT NULL,
  `gdpr_consent` tinyint(1) DEFAULT 0,
  `gdpr_consent_date` int(11) DEFAULT NULL,
  `gdpr_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `unconfirmed_email`, `registration_ip`, `flags`, `confirmed_at`, `blocked_at`, `updated_at`, `created_at`, `last_login_at`, `last_login_ip`, `auth_tf_key`, `auth_tf_enabled`, `password_changed_at`, `gdpr_consent`, `gdpr_consent_date`, `gdpr_deleted`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$P5qFlsiN.GIyynMlNYqo4u7J4msGinjPH7BdWqEr5Fvq59uWVFeaS', 'EsfBrN2N_Ot8WMt15FExW8vB226LZgf_', NULL, NULL, 0, 1584972557, NULL, 1584972557, 1584972557, NULL, NULL, '', 0, 1584972557, 0, NULL, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`,`language`);

--
-- Индексы таблицы `meta_models`
--
ALTER TABLE `meta_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_meta_models-meta_tag_id` (`meta_tag_id`);

--
-- Индексы таблицы `meta_pages`
--
ALTER TABLE `meta_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_meta_pages-meta_tag_id` (`meta_tag_id`);

--
-- Индексы таблицы `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `meta_tag_translations`
--
ALTER TABLE `meta_tag_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_meta_tag_translations-lang-meta_tag_id` (`meta_tag_id`,`lang`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `unq_settings_key` (`key`),
  ADD KEY `fk_settings_to_settings_group` (`group_id`);

--
-- Индексы таблицы `settings_group`
--
ALTER TABLE `settings_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Индексы таблицы `settings_translations`
--
ALTER TABLE `settings_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_settings_translations-settings_id-lang` (`settings_id`,`lang`),
  ADD KEY `idx_settings_id` (`settings_id`);

--
-- Индексы таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_social_account_provider_client_id` (`provider`,`client_id`),
  ADD UNIQUE KEY `idx_social_account_code` (`code`),
  ADD KEY `fk_social_account_user` (`user_id`);

--
-- Индексы таблицы `source_message`
--
ALTER TABLE `source_message`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `idx_token_user_id_code_type` (`user_id`,`code`,`type`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_username` (`username`),
  ADD UNIQUE KEY `idx_user_email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `meta_models`
--
ALTER TABLE `meta_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `meta_pages`
--
ALTER TABLE `meta_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `meta_tag_translations`
--
ALTER TABLE `meta_tag_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `settings_group`
--
ALTER TABLE `settings_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `settings_translations`
--
ALTER TABLE `settings_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `source_message`
--
ALTER TABLE `source_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_source_message_message` FOREIGN KEY (`id`) REFERENCES `source_message` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `meta_models`
--
ALTER TABLE `meta_models`
  ADD CONSTRAINT `fk_meta_models-meta_tag_id` FOREIGN KEY (`meta_tag_id`) REFERENCES `meta_tags` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `meta_pages`
--
ALTER TABLE `meta_pages`
  ADD CONSTRAINT `fk_meta_pages-meta_tag_id` FOREIGN KEY (`meta_tag_id`) REFERENCES `meta_tags` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `meta_tag_translations`
--
ALTER TABLE `meta_tag_translations`
  ADD CONSTRAINT `fk_meta_tag_translations-meta_tag_id` FOREIGN KEY (`meta_tag_id`) REFERENCES `meta_tags` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `fk_settings_to_settings_group` FOREIGN KEY (`group_id`) REFERENCES `settings_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `settings_translations`
--
ALTER TABLE `settings_translations`
  ADD CONSTRAINT `fk_settings_translations-settings_id` FOREIGN KEY (`settings_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
