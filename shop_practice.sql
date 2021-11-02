-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2021 at 10:37 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_practice`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `total_off_price` double NOT NULL,
  `date` text COLLATE utf32_persian_ci NOT NULL,
  `title` text COLLATE utf32_persian_ci NOT NULL,
  `tedad` varchar(11) COLLATE utf32_persian_ci NOT NULL,
  `image` text COLLATE utf32_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `total_price`, `total_off_price`, `date`, `title`, `tedad`, `image`) VALUES
(222222257, 850000, 300000, '1400/5/23', '[Fortnite , F1 2021]', '[1, 3]', '[https://par30games.net/wp-content/uploads/2021/02/Fortnite-PS4-Game.jpg, https://par30games.net/wp-content/uploads/2021/06/F1-2021-PS4-Game.jpg]');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(255) NOT NULL,
  `name` varchar(225) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(225) COLLATE utf8_persian_ci NOT NULL,
  `content` text COLLATE utf8_persian_ci NOT NULL,
  `product_id` int(10) NOT NULL,
  `date` text COLLATE utf8_persian_ci NOT NULL,
  `fav` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `name`, `email`, `content`, `product_id`, `date`, `fav`) VALUES
(1, 'علیرضا جهانی', 'ali15@gmail.com', 'به نظرم همه چیز این محصول عالیه فقط از بابت قیمت اگر ارزون تر میشد خیلی بهتر بود', 3, '1400/4/02', 1),
(2, 'محمدرضا علیزاده', 'mm199@gmail.com', 'اگر مثل من دوست دارید همه چیزتون عالی باشه این محصول رو بهتون پیشنهاد میکنم', 5, '1400/4/20', 0),
(3, 'محمود عزیزی', 'mahi16@hotmail.com', 'این محصول از نظر من اصلا هم خوب نیست', 3, '1400/4/02', 1),
(4, 'شاهین نجفی', 'shahin@gmail.com', 'عالی ممنون ازتون', 6, '1400/3/25', 1),
(5, 'محمود محمودی', 'mahi16@hotmail.com', 'من پولمو میخوام', 9, '1400/4/08', 1),
(6, 'نرگس ربی', 'narges@gmail.com', 'به همتون پیشنهاد میکنم', 3, '1400/4/20', 1),
(7, 'علیرضا جهانبخش', 'alirezaK@gmail.com', 'یک محصول کاملا رویایی', 6, '1400/3/25', 0),
(8, 'نسترن نسرتی', 'nan@gmail.com', 'آشغال همه چیز جنس چینی آشغاله', 4, '1400/4/02', 0),
(9, 'کیمیا علیطاده', 'kimichra@gmail.com', 'منکه خوشم نیومد فقط بلدن الکی جیب مردم رو خالی کنن', 4, '1400/4/20', 1),
(10, 'عارفه داوری', 'aref@gmail.com', 'خیلی خوب بود پیشنهاد میکنم بخرید', 9, '1400/3/05', 0),
(11, 'مرجان آقائي', 'mari@yahoo.com', 'خرید خوبی بود', 2, '1400/4/02', 1),
(12, 'سپهر نعمتی', 'sepehrNemati@gmail.com', 'بسیار کاربردی', 6, '1400/3/25', 1),
(13, 'بهروز محمدی', 'beh@gmail.com', 'باهاش کلی طراحی انجام دادم و راضی ام', 5, '1400/4/20', 1),
(14, 'رحیم پاکدلان فرد', 'rahim@gmail.com', 'سی دیش از همه لحاظ خوب بود', 6, '1400/3/25', 0),
(15, 'سعید محبی', 'saiied@gmail.com', 'با توجه به قیمت مناسب و بسته بندی خوب و لیست ارایه دروس خوبی که دارد خریدش را پیشنهاد میکنم . البته هنوز استفاده نکردم .', 2, '1400/4/02', 0),
(16, 'سینا حسینی مقدم', 'sin@gmail.com', 'علاوه بر امکانات خوب نصب نسبتا آسونی داشت..', 7, '1400/3/25', 1),
(17, 'هادی خرمی', 'hadie@gmail.com', 'عالی بود ر نصب کردنش هم راحت بود مطابق راهنمای نصب داخل نرم افزار', 2, '1400/4/08', 1),
(18, 'مرتضی چهارمحالی', 'morigher@gmail.com', 'عالی و آموزشی است و ذهن فرزندتان را باز و خلاق میسازد', 7, '1400/3/05', 0),
(19, 'مهدی جمالی', 'mahdi@gmail.com', 'برای من ۵ یا ۶ تا قطعه کم داشت و کارم گیر افتاد\r\nای کاش یه محصول رو کامل به دستت میرسوندن', 9, '1400/4/02', 1),
(20, 'جواد مظفرزاده', 'jevad@gmail.com', 'یه کم پیچیده اس ولی اگر دریت مونتاژ بشه بد نیست', 1, '1400/4/20', 0),
(21, 'مهدی اصغری', 'mehti@gmail.com', 'سلام\r\nمن خریدم\r\nیک قطعه توش کم بود\r\nای کاش از هر قطعه یه دونه زاپاس تو گذاشته بودند\r\nپیشنهاد می کنم بخرید\r\nچون در کل خوب بود', 5, '1400/4/02', 0),
(22, 'محمد رعد', 'mohammad@gmail.com', 'حرکت خوبی است ، منتها باید از حالت سنتی فروش کالا یک قدم پا فراتر گذاشته و در مسیر آموزش و هدایت اصولی و دریافت بازخورد آن قدم بگذارد.', 9, '1400/3/25', 1),
(23, 'امیر علی فتاحی', 'amiiir@gmail.com', 'باسلام حتما بخوانید\r\nمن الان یک ماه که دارم روش کار میکنم ترانزیستور و یکی از ای سی ها سوخت چرا برای اینکه در در دفترچه ذکر نشده که چه کارهایی باید انجام بدیم تا قطعات سالم بمونن\r\nواما درمورد پشتیبان عالی است تمام سوال ها رو با دقت جواب میده‌', 4, '1400/4/20', 0),
(24, 'صفدر بربری', 'barbarSafdar@gmail.com', 'برای من که اولین کیت بود یه کم سخته', 5, '1400/4/02', 1),
(25, 'امنه رضایی', 'amene@gmail.com', 'قطعات اصلی کار ناقصه.بنابراین کارمونتاژ ناقص میمونه ....هر قسمت که جلو بری میبینی نقص قطعه داری.از کجا باید تهیه بشه.....سطحش هم برای دبیرستانه', 1, '1400/3/25', 1),
(26, 'محمد اصل فلاح', 'mohammad@gmail.com', 'من برای دختر هفت ساله ام گرفتم . خیلی راضی ام .\r\nبا سپاس از شما', 5, '1400/4/08', 0),
(27, 'رضا اسماعیلی', 'reza@gmail.com', 'خیلی خوبه ارزش داره ولی مال من درس کار نمیکنه\r\nخوبیش اینه خیلی راهنما داره و پشتیبانی خوب', 6, '1400/3/05', 0),
(28, 'بهمن ولی پور', 'tir@gmail.com', 'با سلام\r\nکیت فوق‌العاده آیه.خریدش رو پیشنهاد میدم فقط کاش راهنمای چاپی هم داخل بستش بود\r\n\r\nنقاط قوت\r\nعالی در سطح بالا\r\nوسایل قابل قبول\r\nخوش ساخت\r\nدر سطح دانشگاه\r\nنقاط ضعف\r\nعدم وجود راهنمای چاپی\r\nراهنمایی ناقص\r\nعدم خدمات پس از فروش', 8, '1400/4/20', 0),
(29, 'مصطفی بهادری', 'faghatbahador@gmail.com', 'خیلی سطح بالا توضیح داده شده است', 1, '1400/3/25', 1),
(30, 'امیررضا کمالی', 'amirrezaKemal@gmail.com', 'من تا به حال سی دی های آموزشی زیاد خریده بودم ولی این یکی اصلا خوب توضیح نمیده و فرد با حالت توضیحات حوصله شما را سر می برد', 1, '1400/4/02', 1),
(31, 'رضا صاعدی', 'rez@gmail.com', 'به موقع به دستم رسید .لطفا از اساتیدی اسفاده بشه که قدرت بیانشون مناسب باشه و تن صداشون تحت یک خط صاف نباشه', 8, '1400/3/25', 1),
(32, 'علی قزلباش', 'ali@gmail.com', 'اگه هیچ اطلاعاتی راجع به بورس ندارید خیلی خوبه\r\nولی اگه مبتدی نیستید زیاد به کارتون نمیاد', 1, '1400/3/05', 0),
(33, 'متین کمی', 'matinkamikeyfi@gmail.com', 'متاسفانه این نرم افزار رو خریدم که از هرجهت ضعیفه\r\nچه طراحی نرم افزار که فقط یه پاورپوینته و از روی پاورپوینت مطالب رو میخونه تصاویر بسیار نارسا و بی کیفیت مطالب بسیار پراکنده و بدون انسجام و پیش پا افتاده\r\nاصلا جنبه آموزشی نداره و صرفا یه کپی پیست مطالب اینترنت بیشتر نبود', 1, '1400/4/08', 0),
(34, 'یاسر رضائیان', 'manyaseram@gmail.com', 'میشه گفت یک انتخاب مناسب برای مبتدی هاست ولی خیلی از مطالب ابتر مونده مثل توضیح فیبوناچی و فیلتر ها و ...', 8, '1400/3/25', 0),
(35, 'محمد ستایش روحی', 'mohammad@gmail.com', 'همچیزو یاد میده با همه چیز آشنا میشی خیلی خوبه فقط وقت دارید بخرید تو بیکاری آموزش ببیند وقت مرده نداشته باشد من خودم همین کارو کردم پیشنهاد میکنم عالی هستش', 1, '1400/3/05', 0),
(36, 'فائزه داداشی', 'faeze@gmail.com', 'کتاب خوبیه برای اونایی که هیچ اطلاعاتی راجع به بورس ندارن\r\nتقریبا همه چیو کامل توضیح داده', 1, '1400/4/02', 0),
(37, 'سروش محمدعلی زاده', 'soroosh@gmail.com', 'گر هیچ اشنایی با بورس و اصطلاحات معمولی اون ندارین این کتاب شروع خیلی خوبیه', 2, '1400/3/25', 0),
(38, 'علی رجایی', 'mrrajayi@gmail.com', 'با این قیمت اصلا نمی ارزه خیلی از مطالبش کاربردی نیست و فقط جهت اطلاع و آگاهی هست کتاب کاملی نیست .و نسبت به قیمتش نمی ارزه', 7, '1400/4/08', 0),
(39, 'مهدی معظمی گودرزی', 'mehti@gmail.com', 'بسیارعالی ومناسب', 2, '1400/3/05', 1),
(40, 'سپیده کشاورز', 'sepide@gmail.com', 'برای شروع خوبه اما کافی نیست باید کتاب های دیگر نیز استفاده کنید.', 7, '1400/4/20', 0),
(41, 'سمانه جباری', 'smjabar@gmail.com', 'خوشحالم از اینکه هر چی میخام با کیفیت میتونم از دیجی کالا تهیه کنم لطفاً محصولات فرهنگی را بیشتر وبا تخفیف ارائه بدید', 6, '1400/4/02', 0),
(42, 'جواد شعبانی', 'jevad@gmail.com', 'بینید تو این مجموعه 4 تا dvd هستش، یعنی دوتا پک دوتایی، تو هر پک یکی از dvd ها افیس 2019 هستش،یعنی دوتا از ذی دی دی ها فقط نرم افزار افیس هستن، دوتای دیگ هم تقریبا یک پنجم دی وی دی پر شده، بقیه خالیه، به عبارتی میشد چهار تا دی وی دی، بشه دوتا', 2, '1400/3/25', 0),
(43, 'حامد الماسی', 'hamed@gmail.com', 'پولتون رو دور نریزین اصلا وقت نذاشتن، یکی برا خودش حرف میزنه انگار ن انگار میخاد آموزش بده\r\nبرا خودش الکی میچرخه میگه اینو بخرین این راحته این سایت قشنگیه اینو ولش کن کلا انگار داره با یکی حرف میزنه ک از خودش بهتر میفهمه و این راه رو کامل رفته.', 7, '1400/3/05', 1),
(44, 'بهرام خیرنیا', 'bahram@gmail.com', 'اگه دنبال آموزش بازاریابی دیجیتال و بورس تکنیکال هستید به شدت توصیه می شه', 2, '1400/3/25', 0),
(45, 'محمد ابراهیم رادمرد', 'mamad@gmail.com', 'خوبه ولی برای من طرح اصلی فوتوشاپ منظم و وسط نیست', 3, '1400/4/08', 0),
(46, 'اهورا کرمی', 'kerm@gmail.com', 'ps مخفف همون فتوشاپ هستش . این پیکسل طرفدارای خاص خودش رو داره و معمولا گرافیست ها و کسانی که کار تصویر انجام میدن براشون جذابه همچین چیزی .', 3, '1400/4/20', 1),
(82, 'mehrab bozorgi', 'mehrab.bozorgi@gmail.com', 'xxxxxxxxxxxxxx', 1, '1400/4/22', 0),
(83, 'mehrab bozorgi', 'mehrab.bozorgi@gmail.com', 'ccccccccccccccccc', 2, '1400/4/22', 0),
(84, 'mehrab bozorgi', 'mehrab.bozorgi@gmail.com', 'ccccccccccccccccc', 2, '1400/4/22', 1),
(85, 'mehrab bozorgi', 'mehrab.bozorgi@gmail.com', 'aaaaaaaaaaaaaaaaa', 5, '1400/4/22', 0),
(86, 'mehrab bozorgi', 'mehrab.bozorgi@gmail.com', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', 1, '1400/4/22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf32_persian_ci NOT NULL,
  `image` text COLLATE utf32_persian_ci NOT NULL,
  `after_price` double NOT NULL,
  `befor_price` double NOT NULL,
  `description` text COLLATE utf32_persian_ci NOT NULL,
  `image_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `year` text COLLATE utf32_persian_ci NOT NULL,
  `kid_age` text COLLATE utf32_persian_ci NOT NULL,
  `size` text COLLATE utf32_persian_ci NOT NULL,
  `tedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `title`, `image`, `after_price`, `befor_price`, `description`, `image_id`, `comment_id`, `year`, `kid_age`, `size`, `tedad`) VALUES
(1, 'F1 2021', 'https://par30games.net/wp-content/uploads/2021/06/F1-2021-PS4-Game.jpg', 150000, 200000, 'مسابقات اتومبیل‌رانی در سراسر دنیا طرفداران زیادی داشته و همچنین سبک‌های مختلفی از این مسابقات وجود دارد.از رالی در جاده‌های خاکی گرفته تا مسابقات ناسکار و همچنین فرمول یک. این رشته ورزشی در دنیای بازی‌های ویدیویی نیز حضور پررنگی داشته و عناوین زیادی با این سوژه منتشرشده است. بازی F1 2021 از استودیو Codemasters یکی از همین بازی‌هاست که مسابقات فرمول یک را با جزییات بسیار بالایی برای شما فراهم کرده تا از تجربه آن لذت ببرید.', 1, 1, '2021', '15+', '45', 1),
(2, 'Fortnite ', 'https://par30games.net/wp-content/uploads/2021/02/Fortnite-PS4-Game.jpg', 400000, 550000, 'ه‌جرئت می‌توان Fortnite را یکی از بازی‌های موفق و بسیار پرطرفدار صنعت گیم در بخش چند نفرِ و آنلاین دانست، این بازی که توسط استدیوی Epic Games توسعه داده‌شده نخستین بار در سال 2011 برای کامپیوترهای شخصی در دسترس قرار گرفت. بازی Fortnite در ابتدا تنها یک بازی سوم شخص ماجراجویانه بود که کاربران باید در آن با جستجو در محیط بازی و جمع‌آوری آیتم‌های مختلف در بازی پیشرفت می‌کردند. پس از شکست خوردن ایده‌ی اولیه‌ی بازی و عدم استقبال مخاطبان، استدیوی Epic Games تغییرات گسترده‌ای در گیم پلی بازی به وجود آورد، این استدیوی در قدم اول بخش داستانی را به‌طور کامل از بازی خود حذف نمود و گیم پلی Fortnite را به بخش آنلاین محدود کرد، این عمل باعث شد که تعداد مخاطبان بازی طی مدت‌زمان اندکی بسیار افزایش یابد، به صورتی که در حال حاضر بازی Fortnite یکی از پرمخاطب‌ترین بازی‌های آنلاین است.\r\nبه طرفداران قول داده که در نسخه نهایی حالت‌ها و بخش‌های بیشتری به بازی اضافه خواهند شد.', 2, 2, '2018', '15+', '42', 1),
(3, 'Ninja Gaiden Master Collection', 'https://par30games.net/wp-content/uploads/2021/06/Ninja-Gaiden-Master-Collection-PS4-Game.jpg', 75000, 150000, 'سبک اکشن و شوتر اول‌شخص تاریخچه جذاب و طولانی‌ای دارد و یکی از سبک‌های اصلی در دنیای بازی‌های ویدیویی محسوب می‌شود. هیچ سبکی به‌خوبی شوتر اول‌شخص نمی‌تواند گیم پلی مهیج و جذاب پدید آورد. عنوان Sniper: Ghost Warrior Contracts 2 از استودیو CI Games این سبک را با نوآوری جدیدی ارائه داده که در آن به‌جای مبارزات اکشن و سریع، دقت، تمرکز و نقشه ریختن مهم است چراکه شما را در نقش یک تک‌تیرانداز ماهر و حرفه‌ای قرار می‌دهد.', 3, 3, '2020', '18+', '80', 1),
(4, 'Sniper Ghost Warrior Contracts 2', 'https://par30games.net/wp-content/uploads/2021/05/Sniper-Ghost-Warrior-Contracts-2-PS4-Game.jpg', 125000, 200000, 'سبک اکشن و شوتر اول‌شخص تاریخچه جذاب و طولانی‌ای دارد و یکی از سبک‌های اصلی در دنیای بازی‌های ویدیویی محسوب می‌شود. هیچ سبکی به‌خوبی شوتر اول‌شخص نمی‌تواند گیم پلی مهیج و جذاب پدید آورد. عنوان Sniper: Ghost Warrior Contracts 2 از استودیو CI Games این سبک را با نوآوری جدیدی ارائه داده که در آن به‌جای مبارزات اکشن و سریع، دقت، تمرکز و نقشه ریختن مهم است چراکه شما را در نقش یک تک‌تیرانداز ماهر و حرفه‌ای قرار می‌دهد.', 4, 4, '2021', '18+', '100', 1),
(5, 'Cyberpunk 2077', 'https://par30games.net/wp-content/uploads/2020/11/Cyberpunk-2077-PS4-Game.jpg', 550000, 650000, 'آینده‌ی بشری یکی از جنجال‌برانگیزترین بحث‌هایی است که هرروز میان اقشار مختلفی دنبال می‌شود. فیلم‌های هالیوودی همگی یک سایبرپانک هایی را به ما نشان داده‌اند که هوش مصنوعی موفق به شکست روند سنتی شده و همه‌چیز به‌صورت مکانیزه و با سیستم‌های رایانه‌ای پیش رود. مهم‌ترین نکته، کنترل شهرها توسط ابر کمپانی‌هایی است که پیش‌بینی‌ها در مورد نئولیبرالیسم را تقویت می‌کنند. استودیو CD Projekt RED مدت‌هاست در حال ساخت یک بازی بر اساس آینده موردبحث است و پس از عرضه موفق بازی The Witcher 3، این بازی Cyberpunk 2077 است که به دنبال دیوانه کردن طرفداران بازی‌های ویدیویی است.', 5, 5, '2021', '18+', '160', 1),
(6, 'Call of Duty Black Ops Cold War', 'https://par30games.net/wp-content/uploads/2020/11/Call-of-Duty-Black-Ops-Cold-War-PS4-Game.jpg', 400000, 550000, 'دنیا به دو قسمت شرق و غرب تقسیم‌شده و شکاف عجیبی میان حکومت‌های مختلف ایجادشده است؛ به سال 1980 میلادی و آخرین سال‌های عمر جنگ سرد خوش‌آمدید! فرانچایز Call of Duty تابه‌حال داستان‌های خیالی زیادی در مورد جنگ میان روسیه و آمریکا ساخته و این بار مستقیماً به قلب جنگ سرد و تنش عجیبی که میان شوروی و ایالات‌متحده وجود دارد پرداخته است. شرکت Activision برای نسخه جدید سری بازی ندای وظیفه، سنت همیشگی‌اش را کنار گذاشت و پس از انتشار Call of Duty Modern Warfare بار دیگر به سری بازی Black Ops برگشته و این بار فضای پیچیده‌ای را با جلوه‌های بصری بسیار زیبایی به تصویر کشیده که نمونه آن را تابه‌حال در هیچ شوتر اول‌شخصی مشاهده نکرده‌ایم. همراه جدیدترین ساخته استودیو Treyarch، بازی Call of Duty Black Ops Cold War شوید و دیوانگی را با تفنگ‌های سرکش مزه کنید.', 6, 6, '2020', '18+', '170', 1),
(7, 'Call of Duty Modern Warfare', 'https://par30games.net/wp-content/uploads/2019/10/Call-of-Duty-Modern-Warfare-PS4-Game.jpg', 650000, 750000, 'قرن 21 بدون شک با ورود تروریست‌ها به دل خود، قرن خون‌بار و ترسناکی بوده است. از سویی هرروز یک گروهک نظامی سروکله‌اش پیدا می‌شود و از سوی دیگر نیز قدرت‌های برتر هرروز به مخارج جنگ خود با این افراطی‌گری‌ها اضافه می‌کنند. سری بازی Call of Duty اما سابقه زیادی در به نمایش گذاشتن جنگ دارد و حالا استودیو Infinity Ward دست‌به‌کار بزرگی زده است و هر چه در چنته داشته است را رو کرده است. این بار دیگر سخن از کلیشه تکراری جنگ با روسیه و شوروی نیست؛ دغدغه‌های بزرگی سر درآورده‌اند و امنیت دنیا روبه روی خطر بزرگی قرارگرفته است.', 7, 7, '2019', '18+', '100', 1),
(8, 'Assassin’s Creed Valhalla', 'https://par30games.net/wp-content/uploads/2020/11/Assassin%E2%80%99s-Creed-Valhalla-PS4-Game.jpg', 400000, 550000, 'سال 873 قبل از میلاد فرارسیده است. نروژ که یکی از مقرهای اصلی وایکینگ‌هاست، در حال آماده‌سازی برای کشورگشایی و تغییر صفحات تاریخ است. دنیا به دنبال برداشتن قدم‌های تازه‌ای است که چهره اروپا را برای همیشه تغییر می‌دهد. بازی Assassin’s Creed Valhalla سفری اعجاب‌انگیز به قلب حکومت وایکینگ‌ها، همراه قهرمانی شجاع به نام Eivor و برادرش Sigurd است که رهبری قبیله‌شان در حمله‌ای همه‌جانبه به سمت سرزمین آنگلوساکسون و همان انگلستان امروزی را دنبال می‌کنند. شرکت یوبی‌سافت تابه‌حال نسخه‌های مختلفی از فرانچایز Assassin’s Creed روانه بازار کرده و پس از مسافرت به لندن، فرانسه، مصر باستان و یونان، حالا وقت آن رسیده به دوره‌ی تاریخی وایکینگ‌ها برویم و همراه شخصیت جدیدی که رگه‌هایی از آساسینز در آن دیده نمی‌شود، حمله‌ای همه‌جانبه به انگلستان را تجربه کنیم.', 8, 8, '2020', '18+', '75', 1),
(9, 'Marvel’s Spider Man Miles Morales', 'https://par30games.net/wp-content/uploads/2020/10/Marvels-Spider-Man-Miles-Morales-PS4-Game.jpg', 350000, 450000, 'در طول تاریخ قهرمان‌هایی بوده‌اند که نجات‌بخش انسان‌ها شده‌اند و با قرار گرفتن جلوی شر، جهان را از نابودی نجات داده‌اند. عصر حاضر با خیال‌پردازی‌هایی آدمی همراه بود و در قالب این فانتزی‌ها، ابرقهرمانی‌هایی با نیروهای فرا بشری پیدا شدند که دروازه‌ای از هیجان را به روی ما گشودند. اسپایدرمن یا مرد عنکبوتی یکی از محبوب‌ترین ابرقهرمان‌هایی است که تابه‌حال خلق‌شده و به‌تنهایی، اندازه‌ی تمامی ابرقهرمان‌های دیگر، سود به جیب سونی و مارول می‌ریزد. استودیو Insomniac Games در سال 2018 با انتشار بازی Marvel’s Spider-Man زلزله‌ای مهیب در صنعت بازی‌های ویدیویی ایجاد کرد و عاشقان زیادی برای خود دست و پا کرد. این استودیو حالا با دنباله ی این بازی برگشته و این Marvel’s Spider Man Miles Morales است که عاشقان مرد عنکبوتی را بار دیگر به آسمان‌خراش‌های زیبای نیویورک برمی‌گرداند.', 9, 9, '2021', '12+', '80', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `image_slide` text COLLATE utf32_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image_id`, `image_slide`) VALUES
(1, 1, 'https://par30games.net/wp-content/uploads/2021/06/F1-2021-5.jpg'),
(2, 1, 'https://par30games.net/wp-content/uploads/2021/06/F1-2021-6.jpg'),
(3, 1, 'https://par30games.net/wp-content/uploads/2021/06/F1-2021-1.jpg'),
(4, 2, 'https://par30games.net/wp-content/uploads/2017/12/Fortnite-1.jpg'),
(5, 2, 'https://par30games.net/wp-content/uploads/2017/12/Fortnite-8.jpg'),
(6, 2, 'https://par30games.net/wp-content/uploads/2017/12/Fortnite-5.jpg'),
(7, 3, 'https://par30games.net/wp-content/uploads/2021/06/Ninja-Gaiden-Master-Collection-6.jpg'),
(8, 3, 'https://par30games.net/wp-content/uploads/2021/06/Ninja-Gaiden-Master-Collection-7.jpg'),
(9, 3, 'https://par30games.net/wp-content/uploads/2021/06/Ninja-Gaiden-Master-Collection-8.jpg'),
(10, 4, 'https://par30games.net/wp-content/uploads/2021/05/Sniper-Ghost-Warrior-Contracts-2-2.jpg'),
(11, 4, 'https://par30games.net/wp-content/uploads/2021/05/Sniper-Ghost-Warrior-Contracts-2-1.jpg'),
(12, 4, 'https://par30games.net/wp-content/uploads/2021/05/Sniper-Ghost-Warrior-Contracts-2-8.jpg'),
(13, 4, 'https://par30games.net/wp-content/uploads/2021/05/Sniper-Ghost-Warrior-Contracts-2-7.jpg'),
(14, 5, 'https://par30games.net/wp-content/uploads/2020/11/Cyberpunk-2077-1.jpg'),
(15, 5, 'https://par30games.net/wp-content/uploads/2020/11/Cyberpunk-2077-8.jpg'),
(16, 5, 'https://par30games.net/wp-content/uploads/2020/11/Cyberpunk-2077-6.jpg'),
(17, 6, 'https://par30games.net/wp-content/uploads/2020/09/Call-of-Duty-Black-Ops-Cold-War-1-1.jpg'),
(18, 6, 'https://par30games.net/wp-content/uploads/2020/09/Call-of-Duty-Black-Ops-Cold-War-8.jpg'),
(19, 6, 'https://par30games.net/wp-content/uploads/2020/09/Call-of-Duty-Black-Ops-Cold-War-7.jpg'),
(20, 7, 'https://par30games.net/wp-content/uploads/2019/10/Call-of-Duty-Modern-Warfare-1.jpg'),
(21, 7, 'https://par30games.net/wp-content/uploads/2019/10/Call-of-Duty-Modern-Warfare-8.jpg'),
(22, 7, 'https://par30games.net/wp-content/uploads/2019/10/Call-of-Duty-Modern-Warfare-7.jpg'),
(23, 8, 'https://par30games.net/wp-content/uploads/2020/11/Assassin%E2%80%99s-Creed-Valhalla-5.jpg'),
(24, 8, 'https://par30games.net/wp-content/uploads/2020/11/Assassin%E2%80%99s-Creed-Valhalla-3.jpg'),
(25, 8, 'https://par30games.net/wp-content/uploads/2020/11/Assassin%E2%80%99s-Creed-Valhalla-1.jpg'),
(26, 8, 'https://par30games.net/wp-content/uploads/2020/11/Assassin%E2%80%99s-Creed-Valhalla-8.jpg'),
(27, 9, 'https://par30games.net/wp-content/uploads/2020/10/Marvels-Spider-Man-Miles-Morales-8.jpg'),
(28, 9, 'https://par30games.net/wp-content/uploads/2020/10/Marvels-Spider-Man-Miles-Morales-7.jpg'),
(29, 9, 'https://par30games.net/wp-content/uploads/2020/10/Marvels-Spider-Man-Miles-Morales-6.jpg'),
(30, 9, 'https://par30games.net/wp-content/uploads/2020/10/Marvels-Spider-Man-Miles-Morales-4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf32_persian_ci NOT NULL,
  `email` text COLLATE utf32_persian_ci NOT NULL,
  `phone` text COLLATE utf32_persian_ci NOT NULL,
  `password` text COLLATE utf32_persian_ci NOT NULL,
  `address` text COLLATE utf32_persian_ci NOT NULL,
  `token` text COLLATE utf32_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_persian_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `password`, `address`, `token`) VALUES
(12, 'mehrab bozorgi', 'mehrab.bozorgi@gmail.com', '09033539345', '123123123', 'بابل چهارراه امیرکبیر فردوس 9', '639854e807863dd75a77828d5c7ed5221f91c509f5bb0c8de146c67b44babbf4e6584cc0ee70bb94b33ae8d95d21859c7b553660d43a3cc2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222222259;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
