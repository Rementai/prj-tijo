-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 21, 2024 at 04:59 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipes`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'Poultry', 'Poultry dishes'),
(2, 'Pork', 'Pork dishes'),
(3, 'Beef', 'Beef dishes'),
(4, 'Fish', 'Fish dishes'),
(5, 'Vegan', 'Vegan dishes'),
(6, 'Breakfast', 'Delicious ways to jump-start your day.'),
(7, 'Lunch', 'Fast and easy recipes to make your day happier!'),
(8, 'Dinner', 'What\'s for dinner? Save yourself stress in the kitchen with our easy dinner ideas.'),
(9, 'Dessert', 'Discover delicious, dessert recipes for every occasion.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `favorites`
--

CREATE TABLE `favorites` (
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `name`, `unit`) VALUES
(1, 'Chicken Breast', 'g'),
(2, 'Natural yoghurt', 'g'),
(3, 'Olive oil', 'ml'),
(4, 'Grated ginger', 'g'),
(5, 'Cinnamon', 'g'),
(6, 'Cayenne pepper', 'g'),
(7, 'Cumin', 'g'),
(8, 'Tomato Puree', 'ml'),
(9, 'Garlic', 'clove'),
(10, 'Butter', 'g'),
(11, 'Sweet Paprika', 'g'),
(12, 'Garam Masala', 'g'),
(13, 'Sugar', 'g'),
(14, 'Wine vinegar', 'ml'),
(15, 'Cream cheese', 'g'),
(16, 'Beef sirloin', 'g'),
(17, 'Broccoli', 'g'),
(18, 'Soy sauce', 'ml'),
(19, 'Water', 'ml'),
(20, 'Sesame oil', 'ml'),
(21, 'White pepper', 'g'),
(22, 'Potato starch', 'g'),
(23, 'Rice', 'g'),
(24, 'Pork shoulder', 'g'),
(25, 'Onion', 'whole'),
(26, 'Salt', 'g'),
(27, 'Worcestershire sauce', 'ml'),
(28, 'Orange juice', 'ml'),
(29, 'Fresh tuna', 'g'),
(30, 'Pepper', 'g'),
(31, 'Pear', 'whole'),
(32, 'White sesame seeds', 'g'),
(33, 'Balsamic vinegar', 'ml'),
(34, 'Honey', 'ml'),
(35, 'Lentils', 'g'),
(36, 'Millet', 'g');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `hats` tinyint(4) NOT NULL CHECK (`hats` between 1 and 5),
  `rated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`rating_id`, `user_id`, `recipe_id`, `hats`, `rated_at`) VALUES
(1, 21, 1, 5, '2024-11-13 17:51:34'),
(2, 22, 2, 4, '2024-11-13 17:52:22'),
(3, 21, 2, 5, '2024-11-13 17:52:47'),
(6, 1, 1, 5, '2024-11-13 18:04:31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `instructions` text NOT NULL,
  `prep_time` int(11) NOT NULL,
  `cook_time` int(11) NOT NULL,
  `difficulty` enum('easy','medium','hard') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `average_rating` decimal(2,1) DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `user_id`, `title`, `description`, `image`, `instructions`, `prep_time`, `cook_time`, `difficulty`, `created_at`, `updated_at`, `average_rating`) VALUES
(1, NULL, 'Chicken Tikka Masala', 'Pieces of juicy chicken marinated in yogurt and garam masala spices, served in an aromatic tomato sauce.', 'https://img.freepik.com/free-photo/chicken-stir-fried-chili-along-with-bell-pepper-tomatoes-carrots_1150-27215.jpg?t=st=1732200421~exp=1732204021~hmac=1954604507dda960a7615b9d516a6549000221c19ce696aa5a452e6dfc925e4f&w=1380', 'Cut the chicken into cubes of about 2 cm, sprinkle with salt and pepper, put in a bowl with all the marinade ingredients, mix and set aside for at least 30 minutes (though longer is better - a few hours or even overnight in the refrigerator). Bring to room temperature before frying.\r\nRemove the chicken from the marinade and remove excess marinade with paper towels. Grill the meat on a grill pan or fry it in a regular frying pan for a minute on each side over medium heat (the chicken pieces can be threaded onto skewers to make turning them easier). Melt the butter and garlic in a pot. Fry over moderate heat for a minute, add all the spices and stir fry for a minute. Add tomatoes, sugar, wine vinegar, salt, freshly ground pepper and bring to boil. Cover, reduce heat to minimum and simmer covered for 10 minutes, stirring occasionally. Add the fried chicken pieces and cook covered over very low heat for about 10 - 15 minutes, or until the meat is perfectly soft. Finally, remove from heat and add heavy cream. Serve with rice, natural yogurt and bread. Sprinkle with coriander.', 45, 30, 'easy', '2024-10-31 18:40:44', '2024-11-21 14:37:47', 0.0),
(2, NULL, 'Beef and brocolli Stir-Fry', 'A wok-based Chinese cuisine dish with thinly sliced ​​beef and broccoli in a thick sauce, served with rice.', 'https://img.freepik.com/free-photo/fresh-vegetables-stir-fried-healthy-gourmet-lunch-meal-generated-by-ai_188544-56086.jpg?t=st=1730400755~exp=1730404355~hmac=2001762330f337ec8a3ae454b5e21f91c38fccda61f4a26a881797c28550a176&w=1380', 'Put the beef in the freezer beforehand for about half an hour (firmly cooled will cut better, too).\r\nPrepare the side dishes: cook the rice and roast the sesame seeds in a dry frying pan. Wash the broccoli and cut into small florets.Peel and finely grate the ginger and garlic. Mix in a bowl with the remaining sauce ingredients, set aside. Heat a wok or deep frying pan, add 1/2 tbsp oil. Put in the broccoli, season with a pinch of salt and, stirring every now and then, fry for 1 - 2 minutes. Then add a few tablespoons of water every now and then and ‘cook’ the broccoli in this way for about 7 minutes. Remove from the pan and set aside on a plate.Remove the meat from the freezer and cut it into thin strips.Add a tablespoon of oil to the same pan. When hot, put the meat in and fry for 1 minute over a high heat. Turn over to the other side and repeat the frying.Pour in the sauce and bring to the boil. Cook for 2 - 3 minutes, add the broccoli and stir. Serve with cooked rice sprinkled with sesame seeds.', 45, 15, 'medium', '2024-10-31 18:45:51', '2024-10-31 18:45:51', 0.0),
(3, NULL, 'Pulled Pork', 'Pulled pork is pork shoulder roasted for a long time at a low temperature (or slow cooked in the slow cooker). At the end, the meat becomes so soft that it falls apart under the pressure of a fork and tears into thin fibres.', 'https://img.freepik.com/free-photo/closeup-shot-open-juicy-pulled-meat-burger-surrounded-by-greens-blue-plate_181624-44909.jpg?t=st=1730401061~exp=1730404661~hmac=7a960ca1903869cf62e473384795a69c0b1ee5056046ef6c5bd3a8422e36c24e&w=1380', 'Peel the onion and cut into thicker slices, peel the garlic and crush with a knife. Place the onion and garlic in the bottom of a casserole dish (or slow cooker). Pour in the orange juice and optional worcesthershire sauce. Brush the meat with olive oil and rub with the seasoning mix. Place in the roasting pan (lay on top of the onion and garlic). Cover and bake: in the oven for 9 hours (90 degrees C), or in the slow cooker for 7 hours (high setting) or 9 hours (low setting).After removing the meat, separate it with two forks into thin filaments, you can add pieces of onion from the roast and a few spoonfuls of roasting sauce. The bbq sauce added to the meat at the end and stirred in is also great.', 5, 480, 'easy', '2024-10-31 18:49:47', '2024-10-31 18:49:47', 0.0),
(4, NULL, 'Sesame-crusted tuna', 'This sesame-seared tuna is an easy, great-tasting dish. Fresh tuna steaks are coated with sesame seeds, then quickly seared and served rare, so be sure to use good quality fresh tuna.', 'https://img.freepik.com/free-photo/seared-tuna-coated-with-sesame-seeds-with-green-salad_1147-527.jpg?t=st=1730401279~exp=1730404879~hmac=d32944cbcfa9d0f74c1c04d6cd43d79633506553898e75caf9acdb7815c1765b&w=1380', 'Season the tuna with soy sauce, sprinkle with pepper, brush with 1 tbsp olive oil and coat with white sesame seeds. Fry for about a minute on each side (the tuna should remain pink in the centre). Remove from the pan. Peel and slice the pear into eights and cut out the seeds. Pour 1 tbsp olive oil and honey into the pan after the tuna, add the sliced pears and fry for 1-2 minutes, turning occasionally. Pour in the balsamic vinegar and cook for a minute until the pear is soft. Serve the tuna on top of the spinach, with the pear and pan sauce and black sesame rice seasoned with sesame oil.', 5, 10, 'medium', '2024-10-31 18:53:40', '2024-10-31 18:53:40', 0.0),
(5, NULL, 'Vegan meatballs', 'Lentil and millet pullets.', 'https://img.freepik.com/free-photo/high-angle-bowl-with-lettuce-falafel_23-2148814503.jpg?t=st=1730401444~exp=1730405044~hmac=2c112c785400aaed0fdc0603d1400e87de997010a57181d2f7d8d90fdd076e4c&w=1380', 'Fry the onion in olive oil. Combine with the cooked lentils and millet groats, mix everything well and season with salt and pepper. Form small balls from the mixture and coat with olive oil. Fry in olive oil in a well heated pan until browned. Note: the meatballs must be turned very gently and carefully so that they do not fall apart.', 5, 20, 'hard', '2024-10-31 18:56:08', '2024-10-31 18:56:08', 0.0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recipe_categories`
--

CREATE TABLE `recipe_categories` (
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_categories`
--

INSERT INTO `recipe_categories` (`recipe_id`, `category_id`) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipe_id`, `ingredient_id`, `quantity`) VALUES
(1, 1, 100.00),
(1, 2, 50.00),
(1, 3, 5.00),
(1, 4, 2.00),
(1, 5, 2.00),
(1, 6, 2.00),
(1, 7, 2.00),
(1, 8, 150.00),
(1, 9, 1.00),
(1, 10, 10.00),
(1, 11, 2.00),
(1, 12, 5.00),
(1, 13, 3.00),
(1, 14, 5.00),
(1, 15, 15.00),
(2, 4, 2.00),
(2, 9, 1.00),
(2, 13, 15.00),
(2, 16, 100.00),
(2, 17, 150.00),
(2, 18, 30.00),
(2, 19, 75.00),
(2, 20, 15.00),
(2, 21, 1.00),
(2, 22, 5.00),
(2, 23, 75.00),
(3, 3, 15.00),
(3, 6, 5.00),
(3, 7, 5.00),
(3, 9, 5.00),
(3, 13, 5.00),
(3, 24, 2000.00),
(3, 25, 2.00),
(3, 26, 15.00),
(3, 27, 30.00),
(3, 28, 100.00),
(4, 3, 15.00),
(4, 18, 15.00),
(4, 23, 75.00),
(4, 29, 150.00),
(4, 30, 2.00),
(4, 31, 1.00),
(4, 32, 20.00),
(4, 33, 25.00),
(4, 34, 15.00),
(5, 3, 10.00),
(5, 25, 1.00),
(5, 26, 5.00),
(5, 30, 5.00),
(5, 35, 100.00),
(5, 36, 100.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shopping_essentials`
--

CREATE TABLE `shopping_essentials` (
  `essential_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shopping_list`
--

CREATE TABLE `shopping_list` (
  `list_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shopping_list_essentials`
--

CREATE TABLE `shopping_list_essentials` (
  `list_id` int(11) NOT NULL,
  `essential_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shopping_list_items`
--

CREATE TABLE `shopping_list_items` (
  `list_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`, `last_login`) VALUES
(1, 'john123', 'John', 'Doe', 'johndoe@example.com', '$2y$10$IH28rcLMEA144Y01dzqfD.ouQe5DlcDhaEawmXaGVhcx2oqxMVkPW', '2024-11-04 18:18:49', '2024-11-04 18:19:24', '2024-11-04 18:19:24'),
(21, 'halo', 'halo', 'halohalo', 'halo@halo.com', '$2y$10$KKLukFOfM8T3eKOuStMUvOfA.Nr3KKJW..W2FftnfWZgwUUT/v4wu', '2024-11-12 17:15:39', '2024-11-12 17:15:39', NULL),
(22, 'seba', 'Sebastian', 'Mazgaj', 'seba@seba.com', '$2y$10$EODAjY3FnvQq4jK..6jZyeyCp1sFwbeikfVSirEfU9PGKehSCZaEy', '2024-11-12 19:16:37', '2024-11-12 19:16:37', NULL),
(36, 'seba123', 'seba', 'mazgaj', 'test@mail.com', '$2y$10$tP12q1Z9EY7w6s1zU86n2eA4OW09IF9h1VGgtxBHSSSo0FcHG8Ife', '2024-11-14 19:51:18', '2024-11-14 19:51:18', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksy dla tabeli `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`user_id`,`recipe_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indeksy dla tabeli `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indeksy dla tabeli `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`recipe_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indeksy dla tabeli `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `recipe_categories`
--
ALTER TABLE `recipe_categories`
  ADD PRIMARY KEY (`recipe_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksy dla tabeli `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indeksy dla tabeli `shopping_essentials`
--
ALTER TABLE `shopping_essentials`
  ADD PRIMARY KEY (`essential_id`);

--
-- Indeksy dla tabeli `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `shopping_list_essentials`
--
ALTER TABLE `shopping_list_essentials`
  ADD PRIMARY KEY (`list_id`,`essential_id`),
  ADD KEY `essential_id` (`essential_id`);

--
-- Indeksy dla tabeli `shopping_list_items`
--
ALTER TABLE `shopping_list_items`
  ADD PRIMARY KEY (`list_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shopping_essentials`
--
ALTER TABLE `shopping_essentials`
  MODIFY `essential_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopping_list`
--
ALTER TABLE `shopping_list`
  MODIFY `list_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `recipe_categories`
--
ALTER TABLE `recipe_categories`
  ADD CONSTRAINT `recipe_categories_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`),
  ADD CONSTRAINT `recipe_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`),
  ADD CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`);

--
-- Constraints for table `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD CONSTRAINT `shopping_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `shopping_list_essentials`
--
ALTER TABLE `shopping_list_essentials`
  ADD CONSTRAINT `shopping_list_essentials_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `shopping_list` (`list_id`),
  ADD CONSTRAINT `shopping_list_essentials_ibfk_2` FOREIGN KEY (`essential_id`) REFERENCES `shopping_essentials` (`essential_id`);

--
-- Constraints for table `shopping_list_items`
--
ALTER TABLE `shopping_list_items`
  ADD CONSTRAINT `shopping_list_items_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `shopping_list` (`list_id`),
  ADD CONSTRAINT `shopping_list_items_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
