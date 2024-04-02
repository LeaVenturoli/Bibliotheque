-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 02 mars 2024 à 18:16
-- Version du serveur : 10.11.7-MariaDB-cll-lve
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `u948915415_bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `ID` int(11) NOT NULL,
  `ID_LIVRE` varchar(100) DEFAULT NULL,
  `ID_UTILISATEUR` varchar(10) DEFAULT NULL,
  `DATE_PRET` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `ID` int(11) NOT NULL,
  `ID_UTILISATEUR` varchar(10) DEFAULT NULL,
  `NOM_LIVRE` varchar(100) DEFAULT NULL,
  `TOME` float DEFAULT NULL,
  `AUTEUR` varchar(50) DEFAULT NULL,
  `GENRE` varchar(50) DEFAULT NULL,
  `EDITIONS` varchar(255) DEFAULT NULL,
  `NOTE` varchar(64) DEFAULT NULL,
  `DATE_AJOUT` date DEFAULT NULL,
  `IMAGES` varchar(255) DEFAULT NULL,
  `LECTURE` tinyint(1) DEFAULT NULL,
  `SOUHAIT` tinyint(1) DEFAULT 0,
  `EMPRUNT` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`ID`, `ID_UTILISATEUR`, `NOM_LIVRE`, `TOME`, `AUTEUR`, `GENRE`, `EDITIONS`, `NOTE`, `DATE_AJOUT`, `IMAGES`, `LECTURE`, `SOUHAIT`, `EMPRUNT`) VALUES
(1, '11', 'Lieutenant Eve Dallas', 23, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', 'Nora roberts 23-24.jpg', NULL, 0, 0),
(2, '11', 'Lieutenant Eve Dallas', 24, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', 'Nora roberts 23-24.jpg', NULL, 0, 0),
(3, '11', 'Par accident', NULL, 'Harlan Coben', 'Roman Noir', 'Belfond Noir', NULL, '2023-12-25', '9782714475367_1_75.jpg', NULL, 0, 0),
(4, '11', 'Glacé comme la mort', NULL, 'James Hayman', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-25', 'IMG_7134.jpg', NULL, 0, 0),
(5, '11', 'Les réponses', NULL, 'Elizabeth Little', 'Roman policier', '10/18', NULL, '2023-12-25', '61HSsLUqMrL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(6, '11', 'Entre mes doigts coule le sable', NULL, 'Sophie Tal Men', 'Roman sentimental', 'Le livre de poche', NULL, '2023-12-25', 'IMG_7136.jpg', NULL, 0, 0),
(7, '11', 'A quelques secondes près', NULL, 'Harlan Coben', 'Roman policier', 'Pocket', NULL, '2023-12-25', 'CVT_-quelques-secondes-pres_4438.jpg', NULL, 0, 0),
(8, '11', 'Nature morte aux miettes de pain', NULL, 'Anna Quindlen', 'Roman sentimental', 'Pocket', NULL, '2023-12-25', 'CVT_Nature-morte-aux-miettes-de-pain_8279.jpg', NULL, 0, 0),
(9, '11', 'Crimes par trois', NULL, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', '41hhj7uo0CL._SX195_.jpg', NULL, 0, 0),
(10, '11', 'Ceux qui tombent', NULL, 'Michael Connelly', 'Roman policier', 'Le livre de poche', NULL, '2023-12-25', 'téléchargement.jpeg', NULL, 0, 0),
(11, '11', 'La loi du plus faible', NULL, 'John Grisham', 'Roman policier', 'Pocket', NULL, '2023-12-25', '71wUE8DGhfL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(12, '11', 'En famille', NULL, 'Hector Malot', 'Roman jeunesse', 'Cle', NULL, '2023-12-25', '51ROQnQMjfL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(13, '11', 'La jeune fille dans le jardin', NULL, 'Kamala Nair', 'Roman sentimental', 'Pocket', NULL, '2023-12-25', 'CVT_La-jeune-fille-dans-le-jardin_6903.jpg', NULL, 0, 0),
(14, '11', 'Lieutenant Eve Dallas', 32, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', 'IMG_7138.jpg', NULL, 0, 0),
(15, '11', 'Lieutenant Eve Dallas', 38, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', '41vaVqMl8nL._SX195_.jpg', NULL, 0, 0),
(16, '11', 'Les trois sœurs', NULL, 'Nora Roberts', 'Roman sentimental', ' J\'ai Lu', NULL, '2023-12-25', '51bWEfaYjAL._SX195_.jpg', NULL, 0, 0),
(17, '11', 'Deux petits pas sur le sable mouillé', NULL, 'Anne-Dauphine Julliand', 'L’auto-biographie', 'Les arènes', NULL, '2023-12-25', 'dexu_petits_pas.jpg', NULL, 0, 0),
(18, '11', 'Où es-tu', NULL, 'Marc Levy', 'Roman sentimental', 'Pocket', NULL, '2023-12-25', 'IMG_7139.jpg', NULL, 0, 0),
(19, '11', 'Ce que je n\'oserai jamais te dire', NULL, 'Bruno Combes', 'Roman sentimental', 'J\'ai Lu', NULL, '2023-12-25', 'IMG_7140.jpg', NULL, 0, 0),
(20, '11', 'Tous au gîte', NULL, 'Monika Peetz', 'Comédie', 'Pocket', NULL, '2023-12-25', '71RJvLHtYML._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(21, '11', 'Fais-le pour maman', NULL, 'François-Xavier Dillard', 'Roman Thriller', 'Pocket', NULL, '2023-12-25', '71guErFpd+L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(22, '11', 'Tu comprendras quand tu seras plus grande', NULL, 'Virginie Grimaldi', 'Roman sentimental', 'Le livre de poche', NULL, '2023-12-25', '714CmHorYiL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(23, '11', 'J\'ai toujours cette musique dans la tête', NULL, 'Agnès Martin-Lugand', 'Roman Thriller', 'Pocket', NULL, '2023-12-25', 'J-ai-toujours-cette-musique-dans-la-tete.jpg', NULL, 0, 0),
(24, '11', 'La délicatesse du homard', NULL, 'Laure Manel', 'Roman sentimental', 'Le livre de poche', NULL, '2023-12-25', '9782253088172-001-T.jpeg', NULL, 0, 0),
(25, '11', 'Très chère Sadie', NULL, 'Sophie Kinsella', 'Comédie', ' Pocket', NULL, '2023-12-25', '71syV6dTuUL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(26, '11', 'Une vraie famille', NULL, 'Valentin Musso', 'Roman policier', 'Points', NULL, '2023-12-25', '61McosL-+qL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(27, '11', 'Retour en Irlande', NULL, 'Maeve Binchy', 'Roman d’aventure', 'Pocket', NULL, '2023-12-25', '71nRK6TXCaL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(28, '11', 'Après toi', NULL, 'Jojo Moyes', 'Roman sentimental', 'Milady', NULL, '2023-12-25', '81MzPQiuiwL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(29, '11', 'Jeûne et jolies', NULL, 'Monika Peetz', 'Roman feel-good', 'Pocket', NULL, '2023-12-25', 'Jeune-et-Jolies.jpg', NULL, 0, 0),
(30, '11', 'La merveilleuse boutique de crèmes glacées de Viviane', NULL, 'Abby Clements', 'Roman feel-good', 'Pocket', NULL, '2023-12-25', '710b3JkavPL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(31, '11', 'For ever', NULL, 'Carol Higgins Clark', 'Roman Thriller', 'Le livre de poche', NULL, '2023-12-25', '9782253127093-001-T.jpeg', NULL, 0, 0),
(33, '11', '48 heures pour mourir', NULL, 'Andreas Gruber', 'Roman policier', 'France Loisirs', NULL, '2023-12-25', 'téléchargement (1).jpeg', NULL, 0, 0),
(34, '11', 'Au petit bonheur la chance', NULL, 'Aurélie Valognes', 'Roman feel-good', 'Mazarine', NULL, '2023-12-25', '215483_1_raw.jpg', NULL, 0, 0),
(35, '11', 'Faute de preuves', NULL, 'Harlan Coben', 'Roman policier', 'Pocket', NULL, '2023-12-25', 'IMG_7141.jpg', NULL, 0, 0),
(36, '11', 'Avec toutes nos amitiés', NULL, 'Cathy Kelly', 'Roman sentimental', 'Pocket', NULL, '2023-12-25', '71ETWg8cmKL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(37, '11', 'Le ventre de Paris', NULL, 'Zola', 'Roman de littérature contemporaine', 'Le livre de poche', NULL, '2023-12-25', '9782253005629_1_75.jpg', NULL, 0, 0),
(38, '11', 'Germinal', NULL, 'Zola', 'Roman de littérature contemporaine', 'Le livre de poche', NULL, '2023-12-25', '9782253094142_1_75.jpg', NULL, 0, 0),
(39, '11', 'Noir comme la mer', NULL, 'Mary Higgins Clark', 'Roman policier', ' Le livre de poche', NULL, '2023-12-25', 'none_3d741c110eeca54a26e900e2c1e72aa9_3d741c1.jpeg', NULL, 0, 0),
(40, '11', 'Lieutenant Eve Dallas', 50, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', '9782290251317.jpg', NULL, 0, 0),
(41, '11', 'Lieutenant Eve Dallas ', 51, 'Nora Roberts', 'Roman policier', '   J\'ai Lu', NULL, '2023-12-25', '51UIAIBngUL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(42, '11', 'Il nous restera ça', NULL, 'Virginie Grimaldi', 'Roman feel-good', 'Fayard', NULL, '2023-12-25', '9782213717081-001-T.jpeg', NULL, 0, 0),
(43, '11', 'L\'inconnu de la forêt', NULL, 'Harlan Coben', 'Roman policier', 'Pocket', NULL, '2023-12-25', '9782266316361ORI.jpg', NULL, 0, 0),
(44, '11', 'Défis pour un MacGregor', NULL, 'Nora Roberts', 'Roman de littérature contemporaine', 'Harlequin', NULL, '2023-12-25', '61NBDIzui3L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(45, '11', 'Ne t\'enfuis plus', NULL, 'Harlan Coben', 'Roman policier', 'Pocket', NULL, '2023-12-25', 'Ne-t-enfuis-plus.jpg', NULL, 0, 0),
(46, '11', 'Lieutenant Eve Dallas', 49, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', '51+h6FNul-L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(47, '11', 'Lieutenant Eve Dallas', 48, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', '9782290225103.jpg', NULL, 0, 0),
(48, '11', 'Gagner n\'est pas jouer', NULL, 'Harlan Coben', 'Roman policier', 'Pocket', NULL, '2023-12-25', '61umNThTmSL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(49, '11', 'L\'assommoir', NULL, 'Zola', 'Roman de littérature contemporaine', 'Folio Classique', NULL, '2023-12-25', 'téléchargement (2).jpeg', NULL, 0, 0),
(50, '11', 'Une fille comme elle', NULL, 'Marc Levy', 'Roman sentimental', 'Pocket', NULL, '2023-12-25', '71vDw4F1t9L._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(51, '11', 'Le bonheur n\'a pas de rides', NULL, 'Anne-Gaëlle Huon', 'Roman feel-good', 'Le livre de poche', NULL, '2023-12-25', '41Gwi3pL++L.jpg', NULL, 0, 0),
(52, '11', 'L\'appel de l\'ange', NULL, 'Guillaume Musso', 'Roman policier', 'XO Editions', NULL, '2023-12-25', 'APPEL-DE-L-ANGE.jpg', NULL, 0, 0),
(53, '11', 'Une mère sous influence', NULL, 'Patricia MacDonald', 'Roman policier', 'Le livre de poche', NULL, '2023-12-25', '71GC54pXW6L._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(54, '11', 'L\'oiseau de mauvais augure', NULL, 'Camilla Läckberg', 'Roman Thriller', 'Actes Sud', NULL, '2023-12-25', 'CVT_270644_aj_m_5312.jpg', NULL, 0, 0),
(55, '11', 'L\'école des femmes', NULL, 'Molière', 'Comédie', 'Flammarion', NULL, '2023-12-25', 'téléchargement (3).jpeg', NULL, 0, 0),
(56, '11', 'Une vie', NULL, 'Guy de Maupassant', 'Roman de littérature contemporaine', 'Petits Classiques', NULL, '2023-12-25', '9782035842787-T.jpg', NULL, 0, 0),
(57, '11', 'La moustache', NULL, 'Emmanuel Carrère', 'Roman Fantasy', 'Folio', NULL, '2023-12-25', '81quTrmnO4L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(58, '11', 'Petits poème en prose', NULL, 'Charles Baudelaire', 'Poésie en prose', 'Pocket', NULL, '2023-12-25', '71PW2PuJxTL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(59, '11', 'La chance de ma vie', NULL, 'Annie Dalton', 'Roman d’aventure', 'Pocket', NULL, '2023-12-25', 'CVT_CVT_Ange-et-compagnie-numero-1--La-Chance-de-ma-vie_6582.webp', NULL, 0, 0),
(60, '11', 'Cette nuit-là', NULL, 'Linwood Barclay', 'Roman Thriller', 'J\'ai Lu', NULL, '2023-12-25', '31qs4-C3KqL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(61, '11', 'L\'histoire avec ma cousine', NULL, 'Chris Donner', 'Roman de littérature contemporaine', 'Neuf de l\'école des loisirs', NULL, '2023-12-25', '31ju9O01-cL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(62, '11', 'L\'ombre de l\'autre femme', NULL, 'Dorothy Koomson', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-25', 'IMG_7143.jpg', NULL, 0, 0),
(63, '11', 'Séquestrée', NULL, 'Chevy Stevens', 'Roman Thriller', 'Pocket', NULL, '2023-12-25', '71MYcPd0mWL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(64, '11', 'Une affaire conjugale', NULL, 'Eliette Abecassis', 'Roman Fantasy', 'Piment', NULL, '2023-12-25', 'téléchargement (4).jpeg', NULL, 0, 0),
(65, '11', 'Le crime était signé', NULL, 'Lionel Olivier', 'Roman Thriller', 'Fayard', NULL, '2023-12-25', '91lTP2Jt3xL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(66, '11', 'Plus fort que le doute', NULL, 'Nicci French', 'Roman policier', 'Pocket', NULL, '2023-12-25', '51ofTTy7TuL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(67, '11', 'Lieutenant Eve Dallas', 3, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', 'Serie-Lieutenant-Eve-Dallas-Au-benefice-du-crime-No3-Nora-Roberts-500x500.jpg', NULL, 0, 0),
(68, '11', 'Cuisine sanglante', NULL, 'Minette Walters', 'Roman Noir', 'Pocket', NULL, '2023-12-25', 'téléchargement (5).jpeg', NULL, 0, 0),
(69, '11', 'Un week-end entre amis', NULL, 'Madelaine Wickham', 'Roman humoristique', 'Petits Classiques', NULL, '2023-12-25', 'téléchargement (6).jpeg', NULL, 0, 0),
(70, '11', 'Mes amis Mes amours', NULL, 'Marc Levy', 'Roman sentimental', 'Pocket', NULL, '2023-12-25', 'CVT_6217_368618.webp', NULL, 0, 0),
(71, '11', 'Le collectionneur', NULL, 'Nora Roberts', 'Roman Thriller', 'Michel Lafon', NULL, '2023-12-25', '9782749927060_1_75.jpg', NULL, 0, 0),
(72, '11', 'La vie qui m\'attendait', NULL, 'Julien Sandrel', 'Roman feel-good', 'Calmann Lévy', NULL, '2023-12-25', '1342915-la-vie-qui-m-attendait-de-julien-sandrel.jpg', NULL, 0, 0),
(73, '11', 'Lieutenant Eve Dallas', 52, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-25', '51zFjXn2ouL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(74, '11', 'L\'infini des possibles', NULL, 'Lori Nelson Spielman', 'Roman de littérature contemporaine', 'Pocket', NULL, '2023-12-25', 'linfini_des_possibles-4980392-264-432.jpg', NULL, 0, 0),
(75, '11', 'Qui aurait pu croire...', NULL, 'Pascale Legardinier', 'Roman Fantasy', 'J\'ai Lu', NULL, '2023-12-25', '51D+GZg-YJL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(76, '11', 'Tout est fatal', NULL, 'Stephen King', 'Roman d’horreur', 'Albin Michel', NULL, '2023-12-25', 'ad13701-2003.jpg', NULL, 0, 0),
(77, '11', 'Un été irrésistible', NULL, 'Nora Roberts', 'Roman sentimental', 'Harlequin', NULL, '2023-12-25', 'un_ete_irresistible-4977488-264-432.jpg', NULL, 0, 0),
(78, '11', 'La bienveillance au travail', NULL, 'Docteur Philippe Rodet', 'Le guide pratique', 'Eyrolles', NULL, '2023-12-25', 'La-bienveillance-au-travail.jpg', NULL, 0, 0),
(79, '11', 'Le siècle des égarés', NULL, 'Julia de Funès', 'L’essai', 'L\'observatoire', NULL, '2023-12-25', 'Le-Siecle-des-egares.jpg', NULL, 0, 0),
(80, '11', 'La comédie (in)humaine', NULL, 'Nicolas Bouzou, Julia de Funès', 'L’essai', 'J\'ai Lu', NULL, '2023-12-25', '51P8Oe-2HBL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(81, '11', 'Demain', NULL, 'Guillaume Musso', 'Roman Thriller', 'XO Editions', NULL, '2023-12-25', 'demain_1.jpg', NULL, 0, 0),
(82, '11', 'La grande mascarade', NULL, 'A.B. Winter', 'Roman Fantasy', 'First roman', NULL, '2023-12-25', 'La-grande-mascarade.jpg', NULL, 0, 0),
(83, '11', 'Jamais sans ma fille', NULL, 'Betty Mahmoody William Hoffer', 'L’auto-biographie', 'France Loisirs', NULL, '2023-12-25', 'Livre-Jamais-sans-ma-fille-Betty-Mahmoody.webp', NULL, 0, 0),
(84, '11', 'La fille du docteur Duprey', NULL, 'Elisabeth Hyde', 'Roman policier', 'France Loisirs', NULL, '2023-12-25', '81thMFaFKuL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(85, '11', 'Alice en danger', NULL, 'Ed McBain', 'Roman Thriller', 'Suspense', NULL, '2023-12-25', '71-U5TEikTL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(86, '11', 'Possession', NULL, 'Peter James', 'Roman d’horreur', 'France Loisirs', NULL, '2023-12-25', '51N28uHIjeL.jpg', NULL, 0, 0),
(87, '11', 'Sans foi ni loi', NULL, 'Karin Slaughter', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-25', '51HHUu2xF5L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(88, '11', 'Les enfants du massacre', NULL, 'Giorgio Scerbanenco', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-25', '9782264027191.jpg', NULL, 0, 0),
(89, '11', 'Maudits sauvages', NULL, 'Bernard Clavel', 'L’essai', 'France Loisirs', NULL, '2023-12-25', 'CVT_50861_aj_m_3067.webp', NULL, 0, 0),
(90, '11', 'Mon enfance assassinée', NULL, 'Patricia Pattyn', 'La biographie', 'France Loisirs', NULL, '2023-12-25', '513X0IVo7vL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(91, '11', 'Mémoire d\'une nuit d\'orage', NULL, 'Nancy Pickard', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-25', 'memoire_dune_nuit_dorage-1234728-264-432.jpg', NULL, 0, 0),
(92, '11', 'Le berceau vide', NULL, 'Jessica Auerbach', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-25', '61q-zACEjPL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(93, '11', 'Linda', NULL, 'Eric Lax', 'Roman de littérature contemporaine', 'France Loisirs', NULL, '2023-12-25', 'linda-54300-264-432.jpg', NULL, 0, 0),
(94, '11', 'Maman a tort', NULL, 'Michel Bussi', 'Roman Thriller', 'Presses de la cité', NULL, '2023-12-25', 'CVT_26978_aj_m_5638.webp', NULL, 0, 0),
(95, '11', 'Lundi mélancolie', NULL, 'Nicci French', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-25', 'téléchargement (7).jpeg', NULL, 0, 0),
(96, '11', 'L\'avion sans elle', NULL, 'Michel Bussi', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-25', 'avion-sans-elle-michel-bussi.jpg', NULL, 0, 0),
(97, '11', 'La place de l\'autre', NULL, 'S. Brown', 'Roman Fantasy', 'France Loisirs', NULL, '2023-12-25', '51D547V27XL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(98, '11', 'Une fois dans ma vie', NULL, 'Gilles Legardinier', 'Roman de littérature contemporaine', 'Flammarion', NULL, '2023-12-25', '61VLoEWZ-kL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(99, '11', 'Central Park', NULL, 'Guillaume Musso', 'Roman Thriller', 'Noyelles', NULL, '2023-12-25', 'CVT_CVT_Central-Park_5496.webp', NULL, 0, 0),
(100, '11', 'Sur la route de Tara', NULL, 'Maeve Binchy', 'Roman sentimental', 'Pocket', NULL, '2023-12-25', 'Sur-la-route-de-Tara.jpg', NULL, 0, 0),
(101, '11', 'Bonjour tristesse', NULL, 'Françoise Sagan', 'Roman de littérature contemporaine', 'France Loisirs', NULL, '2023-12-25', 'téléchargement (8).jpeg', NULL, 0, 0),
(102, '11', 'Le secret du mari', NULL, 'Liane Moriarty', 'Roman de littérature contemporaine', 'Le livre de poche', NULL, '2023-12-25', 'téléchargement (9).jpeg', NULL, 0, 0),
(103, '11', 'Au voleur !', NULL, 'Carol Higgins Clark', 'Roman policier', 'Le livre de poche', NULL, '2023-12-25', 'téléchargement (10).jpeg', NULL, 0, 0),
(104, '11', 'ça peut pas rater !', NULL, 'Gilles Legardinier', 'Roman de littérature contemporaine', 'Pocket', NULL, '2023-12-25', '9782385770211ORI.jpg', NULL, 0, 0),
(105, '11', 'Nymphéas Noirs', NULL, 'Michel Bussi', 'Roman Thriller', 'Pocket', NULL, '2023-12-25', '9ffb6139c4ae75b7a887aca1fdde.jpg', NULL, 0, 0),
(106, '11', 'L\'horizon à l\'envers', NULL, 'Marc Levy', 'Roman de littérature contemporaine', 'Pocket', NULL, '2023-12-25', '61UjLBD0xRL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(107, '11', 'Au pays des ombres', NULL, 'Gilbert Galerne', 'Roman Thriller', 'Fayard', NULL, '2023-12-25', '61AQuTRUi3L._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(108, '11', 'La délicatesse', NULL, 'David Foenkinos', 'Roman de littérature contemporaine', 'Piment', NULL, '2023-12-25', 'R320142327.jpg', NULL, 0, 0),
(109, '11', 'La sirène', NULL, 'Camilla Läckberg', 'Roman Thriller', 'Babel noir', NULL, '2023-12-25', 'LocalImageExists.jpeg', NULL, 0, 0),
(110, '11', 'La faiseuse d\'anges', NULL, 'Camilla Läckberg', 'Roman Thriller', 'Babel noir', NULL, '2023-12-25', 'téléchargement (11).jpeg', NULL, 0, 0),
(111, '11', 'L\'enfant rebelle', NULL, 'Christian Labore', 'Roman de littérature contemporaine', 'Pocket', NULL, '2023-12-25', '71yS3kqCVML._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(112, '11', 'La lettres de Rose', NULL, 'Clarisse Sabard', 'Roman de littérature contemporaine', 'Charleston', NULL, '2023-12-25', '51GUzgYEogL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(113, '11', 'Demain est un autre jour', NULL, 'Lori Nelson Spielman', 'Roman de littérature contemporaine', 'Pocket', NULL, '2023-12-25', 'CVT_Demain-est-un-autre-jour_5039.webp', NULL, 0, 0),
(114, '11', 'Le jour où ma vie a vraiment dérapé', NULL, 'Eve Borelli', 'Roman sentimental', 'Harper Collins', NULL, '2023-12-25', '71PlEZ38M7L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(115, '11', 'La jeune fille et la nuit', NULL, 'Guillaume Musso', 'Roman Thriller', 'Calmann Lévy', NULL, '2023-12-25', 'téléchargement (12).jpeg', NULL, 0, 0),
(116, '11', 'Tu me manques', NULL, 'Harlan Coben', 'Roman policier', 'France Loisirs', NULL, '2023-12-25', 'téléchargement (13).jpeg', NULL, 0, 0),
(117, '11', 'Un appartement à Paris', NULL, 'Guillaume Musso', 'Roman Thriller', 'XO Editions', NULL, '2023-12-25', '61-fEpl40IL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(118, '11', 'Lieutenant Eve Dallas', 35, 'Nora Roberts', 'Roman policier', ' J\'ai Lu', NULL, '2023-12-25', '51QTicN2VqL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(119, '11', 'L\'amour et tout ce qui va avec', NULL, 'Kristan Higgins', 'Roman feel-good', 'Mosaic Poche', NULL, '2023-12-25', 'CVT_LAmour-et-tout-ce-qui-va-avec_8178.webp', NULL, 0, 0),
(120, '11', 'Vous revoir', NULL, 'Marc Levy', 'Roman sentimental', 'Pocket', NULL, '2023-12-25', '61CFkQX9IWL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(121, '11', 'L\'année du flamant rose', NULL, 'Anne de Kinkelin', 'Roman de littérature contemporaine', 'Pocket', NULL, '2023-12-25', 'L-Annee-du-flamant-rose.jpg', NULL, 0, 0),
(122, '11', 'Le temps est assassin', NULL, 'Michel Bussi', 'Roman Thriller', 'Presses de la cité', NULL, '2023-12-25', 'téléchargement (14).jpeg', NULL, 0, 0),
(123, '11', 'La dernière des Stanfield', NULL, 'Marc Levy', 'Roman Thriller', 'Robert Laffont', NULL, '2023-12-25', '28_metadata-image-15297344.jpeg', NULL, 0, 0),
(124, '11', 'Que serais-je sans toi ?', NULL, 'Guillaume Musso', 'Roman sentimental', 'XO Editions', NULL, '2023-12-25', 'CVT_7924_676491.webp', NULL, 0, 0),
(125, '11', '7 ans après ...', NULL, 'Guillaume Musso', 'Roman Thriller', 'XO Editions', NULL, '2023-12-25', 'guillaume-musso_7-ans-apres.jpg', NULL, 0, 0),
(126, '11', 'On est pas sérieux quand on à dix-sept ans', NULL, 'Barbara Samson', 'L’auto-biographie', 'France Loisirs', NULL, '2023-12-25', '9782253139478-001-T.jpeg', NULL, 0, 0),
(127, '11', 'Trois jours avant Nöel', NULL, 'Mary Higgins Clark', 'Roman policier', ' France Loisirs', NULL, '2023-12-25', '9782744147661-fr.jpg', NULL, 0, 0),
(128, '11', 'Ce soir et à jamais', NULL, 'Nora Roberts', 'Roman sentimental', 'J\'ai Lu', NULL, '2023-12-26', 'Ce-soir-et-a-jamais.jpg', NULL, 0, 0),
(129, '11', 'Encore une danse', NULL, 'Katherine Pancol', 'Roman sentimental', 'Le livre de poche', NULL, '2023-12-26', '71dNvrx7t+S._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(130, '11', 'Si je te retrouvais', NULL, 'Nora Roberts', 'Roman sentimental', 'J\'ai Lu', NULL, '2023-12-26', '71QmhYj3J4L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(131, '11', 'Le secret des fleurs', 1, 'Nora Roberts', 'Roman sentimental', 'J\'ai Lu', NULL, '2023-12-26', '61xZgiylqqL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(132, '11', 'La petite fille qui disparut deux fois', NULL, 'Andrea Kane', 'Roman Thriller', 'Harlequin', NULL, '2023-12-26', '814rVd5bAYL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(133, '11', 'Lieutenant Eve Dallas', 13, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '3656db086588714080b86617ca7e2bef662a335f89f437bb2dd13091c37bc4e9.jpg', NULL, 0, 0),
(134, '11', 'Lieutenant Eve Dallas', 14, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '3656db086588714080b86617ca7e2bef662a335f89f437bb2dd13091c37bc4e9.jpg', NULL, 0, 0),
(135, '11', 'Hanna était seule à la maison', NULL, 'Carin Gerhardsen', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-26', '615tr+PpqKL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(136, '11', 'Lieutenant Eve Dallas', 31, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '41B1YVq1y2L._SX195_.jpg', NULL, 0, 0),
(137, '11', 'Minute, papillon !', NULL, 'Aurélie Valognes', 'Roman humoristique', 'Mazarine', NULL, '2023-12-26', '9782863744529-001-X.webp', NULL, 0, 0),
(138, '11', 'Lieutenant Eve Dallas', 7, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', 'lieutenant_eve_dallas_tomes_7_8-399469-264-432.jpg', NULL, 0, 0),
(139, '11', 'Lieutenant Eve Dallas', 8, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', 'lieutenant_eve_dallas_tomes_7_8-399469-264-432.jpg', NULL, 0, 0),
(140, '11', 'Arnaque à Hollywood', NULL, 'Carol Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2023-12-26', '81s7dFBddXL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(141, '11', 'Une chanson douce', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2023-12-26', '1-une-chanson-douce-de-mary-higgins-clark-aux-editions-albin-michel-c72.jpg', NULL, 0, 0),
(142, '11', 'Et nous nous reverrons ...', NULL, 'Mary Higgins Clark', 'Roman sentimental', 'Le livre de poche', NULL, '2023-12-26', 'et_nous_nous_reverrons-78585-264-432.jpg', NULL, 0, 0),
(143, '11', 'Ce soir je veillerais sur toi', NULL, 'Carol Higgins Clark', 'Roman Thriller', 'Albin Michel', NULL, '2023-12-26', '9782226305206_1_75.jpg', NULL, 0, 0),
(145, '11', 'Sous haute tension', NULL, 'Harlan Coben', 'Roman Thriller', 'Belfond', NULL, '2023-12-26', 'Sous-haute-tension.jpg', NULL, 0, 0),
(146, '11', 'six ans déjà', NULL, 'Harlan Coben', 'Roman Thriller', 'Pocket', NULL, '2023-12-26', 'six_ans_deja-560571-264-432.jpg', NULL, 0, 0),
(147, '11', 'La saga des O\'Hurley', NULL, 'Nora Roberts', 'Roman sentimental', 'Mosaic Poche', NULL, '2023-12-26', '91fTmMuAHbL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(148, '11', 'Lieutenant Eve Dallas', 36, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61ILxakGNGL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(149, '11', 'Le mec de la tombe d\'à côté', NULL, 'Katarina Mazetti', 'Roman sentimental', 'Piment', NULL, '2023-12-26', 'none_a9572776af3a7b9b4184c59a26fef9ac_a957277.jpeg', NULL, 0, 0),
(150, '11', 'Ressac mortel', NULL, 'A.J Waines', 'Roman policier', 'Les escales', NULL, '2023-12-26', '91sUw9O4BhL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(151, '11', 'Les années perdues', NULL, 'Mary Higgins Clark', 'Roman policier', 'Suspense', NULL, '2023-12-26', '1634217269.jpeg', NULL, 0, 0),
(152, '11', 'Complètement cramé !', NULL, 'Gilles Legardinier', 'Roman feel-good', 'Pocket', NULL, '2023-12-26', 'ROD0128527.jpg', NULL, 0, 0),
(153, '11', 'La vengeance aux yeux noirs', NULL, 'Lisa Gardner', 'Roman Thriller', 'Le livre de poche', NULL, '2023-12-26', 'téléchargement (15).jpeg', NULL, 0, 0),
(154, '11', 'Le dîner', NULL, 'Herman Koch', 'Roman Thriller', '10/18', NULL, '2023-12-26', 'CVT_Le-diner_360.webp', NULL, 0, 0),
(155, '11', 'Vent de glace', NULL, 'Patricia Cornwell', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', '9782253175971_1_75.jpg', NULL, 0, 0),
(156, '11', 'Et soudain tout change', NULL, 'Gilles Legardinier', 'Roman feel-good', 'Pocket', NULL, '2023-12-26', 'Et-soudain-tout-change.jpg', NULL, 0, 0),
(157, '11', 'Dors bien cette nuit', NULL, 'Karen Rose', 'Roman Thriller', 'Mosaic Poche', NULL, '2023-12-26', '911WR6T5EnL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(158, '11', 'L\'enfant perdu', NULL, 'John Hart', 'Roman policier', 'France Loisirs', NULL, '2023-12-26', '41u50OWgRAL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(159, '11', 'Avant d\'aller dormir', NULL, 'S.J. Watson', 'Roman Thriller', 'Pocket', NULL, '2023-12-26', '51xC47IJOnL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(160, '11', 'La fille du train', NULL, 'Paula Hawkins', 'Roman Thriller', 'Sonatine', NULL, '2023-12-26', 'RO30343500.jpg', NULL, 0, 0),
(161, '11', 'L\'instant présent', NULL, 'Guillaume Musso', 'Roman de littérature contemporaine', 'XO Editions', NULL, '2023-12-26', 'M02845637799-large.jpg', NULL, 0, 0),
(162, '11', 'Lieutenant Eve Dallas', 25, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61oMZM9ZEAL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(163, '11', 'Lieutenant Eve Dallas', 26, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61oMZM9ZEAL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(164, '11', 'Lieutenant Eve Dallas', 21, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61TiWzd3SdL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(165, '11', 'Lieutenant Eve Dallas', 22, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61TiWzd3SdL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(166, '11', 'Lieutenant Eve Dallas', 11, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61-sGF8BxmL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(167, '11', 'Lieutenant Eve Dallas', 12, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61-sGF8BxmL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(168, '11', 'Lieutenant Eve Dallas', 34, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', 'CVT_CVT_Lieutenant-Eve-Dallas-Tome-34-_19.webp', NULL, 0, 0),
(169, '11', 'L\'été des enfants rois', NULL, 'René Barral', 'Roman de littérature contemporaine', 'De Borée', NULL, '2023-12-26', '71yXrt-ibTL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(170, '11', 'Les écureuils de Central Park sont tristes le lundi', NULL, 'Katherine Pancol', 'Roman sentimental', 'Le livre de poche', NULL, '2023-12-26', 'les_ecureuils_de_central_park_sont_tristes_le_lundi-174563-264-432.jpg', NULL, 0, 0),
(171, '11', 'Les âmes vagabondes', NULL, 'Stephenie Meyer', 'Roman d’aventure', 'Le livre de poche', NULL, '2023-12-26', '22569855734.jpg', NULL, 0, 0),
(172, '11', 'Une femme sous la menace', NULL, 'Nora Roberts', 'Roman sentimental', 'Michel Lafon', NULL, '2023-12-26', 'une femme.jpg', NULL, 0, 0),
(173, '11', 'Quelqu\'un pour qui trembler', NULL, 'Gilles Legardinier', 'Roman sentimental', 'fleuve', NULL, '2023-12-26', 'Quelqu-un-pour-qui-trembler.jpg', NULL, 0, 0),
(174, '11', 'Affaires de cœurs', NULL, 'Nora Roberts', 'Roman sentimental', 'J\'ai Lu', NULL, '2023-12-26', '61het5t5sGL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(175, '11', 'Et je danse, aussi', NULL, 'Anne-Laure Bondoux et Jean-Claude Mourlevat', 'Roman feel-good', 'fleuve', NULL, '2023-12-26', 'Et-je-danse-aui-tome-1.jpg', NULL, 0, 0),
(176, '11', 'Snjor', NULL, 'Ragnar Jonasson', 'Roman Thriller', 'Points', NULL, '2023-12-26', '61yXnzXnwWL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(177, '11', 'Le bleu de tes yeux', NULL, 'Mary Higgins Clark', 'Roman Thriller', 'Albin Michel', NULL, '2023-12-26', '810DsbZACGL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(178, '11', 'Tu ne m\'échapperas pas', NULL, 'Lisa Gardner', 'Roman Thriller', 'Le livre de poche', NULL, '2023-12-26', 'images.jpg', NULL, 0, 0),
(179, '11', 'Désolée, je suis attendue', NULL, 'Agnès Martin-Lugand', 'Roman sentimental', 'Pocket', NULL, '2023-12-26', '61Vr7zm9H4L._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(180, '11', 'Meurtrière malgré elle', NULL, 'Rachel Butler', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '5129UI68ymL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(181, '11', 'Angie, 13 ans, disparue...', NULL, 'Liz Coley', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-26', 'index.jpg', NULL, 0, 0),
(182, '11', 'Si c\'était à refaire', NULL, 'Marc Levy', 'Roman policier', 'Pocket', NULL, '2023-12-26', '81DCJrKPn7L._AC_UF350,350_QL80_.jpg', NULL, 0, 0),
(183, '11', 'Une saison à la petite boulangerie', NULL, 'Jenny Colgan', 'Roman humoristique', 'Pocket', NULL, '2023-12-26', 'inde.jpg', NULL, 0, 0),
(184, '11', 'J\'ai épousé un inconnu', NULL, 'Patricia MacDonald', 'Roman Thriller', 'Le livre de poche', NULL, '2023-12-26', '81Mp3C08CmL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(185, '11', 'L\'élégance du hérisson', NULL, 'Muriel Barbery', 'Roman philosophique', 'Folio', NULL, '2023-12-26', 'MurielBarbery.jpg', NULL, 0, 0),
(186, '11', 'L\'affaire cendrillon', NULL, 'Mary Higgins Clark', 'Roman Thriller', 'Le livre de poche', NULL, '2023-12-26', '9782253095118-001-T.jpeg', NULL, 0, 0),
(187, '11', 'Le lac des rêves', NULL, 'Kim Edwards', 'Roman sentimental', 'Belfond', NULL, '2023-12-26', '81xqh2F5yyL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(188, '11', 'Da Vinci code', NULL, 'Dan Brown', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-26', '81WxCI8QOvL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(189, '11', 'Anges & démon', NULL, 'Dan Brown', 'Roman Thriller', 'France Loisirs', NULL, '2023-12-26', 'ange.jpg', NULL, 0, 0),
(190, '11', 'Le roi n\'a pas sommeil', NULL, 'Cécile Coulon', 'Roman Noir', 'Points', NULL, '2023-12-26', 'IMG_7145.jpg', NULL, 0, 0),
(191, '11', 'Lieutenant Eve Dallas', 5, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61OYwjlOGkL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(192, '11', 'Une seconde chance', NULL, 'Mary Higgins Clark', 'Roman Thriller', 'Le livre de poche', NULL, '2023-12-26', 'téléchargement (16).jpeg', NULL, 0, 0),
(193, '11', 'Le temps des regrets', NULL, 'Mary Higgins Clark', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', '9782253014539-001-T.jpeg', NULL, 0, 0),
(194, '11', 'A cœur ouvert', NULL, 'Ingrid Chauvin', 'L’auto-biographie', 'J\'ai Lu', NULL, '2023-12-26', '61UvFgw5ePL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(195, '11', 'Mort aveugle', NULL, 'Karin Slaughter', 'Roman Thriller', 'Mosaic Poche', NULL, '2023-12-26', '91NzFq8mCTL._AC_UF894,1000_QL80_.jpg', NULL, 0, 0),
(196, '11', 'Lieutenant Eve Dallas', 4, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '2635943388.jpg', NULL, 0, 0),
(197, '11', 'La ferme du bout du monde', NULL, 'Sarah Vaughan', 'Roman historique', 'Le livre de poche', NULL, '2023-12-26', '9782253074052-001-T.jpeg', NULL, 0, 0),
(198, '11', 'La dernière réunion des filles de la station-service', NULL, 'Fannie Flagg', 'Roman historique', 'Pocket', NULL, '2023-12-26', '71za9Xi6qJL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(199, '11', 'Ma grand-mère vous passe le bonjour', NULL, 'Fredrik Backman', 'Roman feel-good', 'Pocket', NULL, '2023-12-26', 'CVT_Ma-grand-mere-vous-passe-le-bonjour_3445.jpg', NULL, 0, 0),
(200, '11', 'Demain j\'arrête !', NULL, 'Gilles Legardinier', 'Roman feel-good', 'Pocket', NULL, '2023-12-26', '71pkwZD1d6L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(201, '11', 'Mission à haut risque', NULL, 'Nora Roberts', 'Roman policier', 'Harlequin', NULL, '2023-12-26', 'Miion-a-haut-risque.jpg', NULL, 0, 0),
(202, '11', 'Lieutenant Eve Dallas', 53, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '41L2IXReAXL.jpg', NULL, 0, 0),
(203, '11', 'Un sentiment plus fort que la peur', NULL, 'Marc Levy', 'Roman d’aventure', 'Pocket', NULL, '2023-12-26', '61GIA0lUytL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(204, '11', 'Pars avec lui', NULL, 'Agnès Ledig', 'Roman sentimental', 'Pocket', NULL, '2023-12-26', '71I8kz7q6bL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(205, '11', 'Lieutenant Eve Dallas', 43, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '51gIyX1OyQL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(206, '11', 'Au bonheur des Dames', NULL, 'Zola', 'Roman de littérature contemporaine', 'Le livre de poche', NULL, '2023-12-26', '9782253002864-001-T.jpeg', NULL, 0, 0),
(207, '11', 'Thérèse Raquin', NULL, 'Zola', 'Roman de littérature contemporaine', 'Le livre de poche', NULL, '2023-12-26', 'images.jpeg', NULL, 0, 0),
(208, '11', 'Le poids des mensonges', NULL, 'Patricia MacDonald', 'Roman Thriller', 'Le livre de poche', NULL, '2023-12-26', 'le_poids_des_mensonges.jpg', NULL, 0, 0),
(209, '11', 'Lieutenant Eve Dallas', 37, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61TTrt1U47L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(210, '11', 'Trop beau pour être vrai', NULL, 'Kristan Higgins', 'Roman sentimental', 'Mosaic Poche', NULL, '2023-12-26', '', NULL, 0, 0),
(211, '11', 'Le concile de Pierre', NULL, 'Jean-Christophe Grangé', 'Roman Thriller', 'livre de poche', NULL, '2023-12-26', 'le_concile_de_pierre-519-264-432.jpg', NULL, 0, 0),
(212, '11', 'Marie-Tempête', NULL, 'Janine Boissard', 'Roman sentimental', 'Pocket', NULL, '2023-12-26', 'Marie-tempete.jpg', NULL, 0, 0),
(213, '11', 'Jeux d\'interieur', NULL, 'Basset Clidière', 'Livres de recettes de cuisine', 'Guide Marabout', NULL, '2023-12-26', 'in.jpg', NULL, 0, 0),
(214, '11', 'Une autre idée du bonheur', NULL, 'Marc Levy', 'Roman sentimental', 'Pocket', NULL, '2023-12-26', '71ZO0a2uZuL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(215, '11', 'Minuit 2', NULL, 'Stephen King', 'Roman Noir', 'j\'ai lu', NULL, '2023-12-26', 'nde.jpg', NULL, 0, 0),
(216, '11', 'Filles de Shanghai', NULL, 'Lisa See', 'Roman humoristique', 'J\'ai Lu', NULL, '2023-12-26', '61DM9sjnWzL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(217, '11', 'Histoire de Bretagne ', NULL, 'Henri Poisson', '', 'COOP BREIZH', NULL, '2023-12-26', 'imges.jpg', NULL, 0, 0),
(218, '11', 'Lieutenant Eve Dallas', 41, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '619-16AWguL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(219, '11', 'De tes nouvelles', NULL, 'Agnès Ledig', 'Roman sentimental', 'Pocket', NULL, '2023-12-26', 'A1ITfQROdkL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(221, '11', 'Serre moi fort', NULL, 'Claire Favan', 'Roman Thriller', 'Pocket', NULL, '2023-12-26', '61u4csq56ZL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(222, '11', 'Les secrets de Shancarrig', NULL, 'Maeve Binchy', 'Roman sentimental', 'Pocket', NULL, '2023-12-26', '71L+kdLZ36L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(224, '11', 'Les derniers jours de nos pères', NULL, 'Joël Dicker', 'Roman historique', 'De Fallois', NULL, '2023-12-26', '811j-0i-IwL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(225, '11', 'L\'amie du diable', NULL, 'Peter Robinson', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', '815-rVlufZL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(226, '11', 'Les apparences', NULL, 'Gillian Flynn', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', '91PIok+bnEL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(227, '11', 'Tu as promis que tu vivrais pour moi', NULL, 'Carène PONTE', 'Roman feel-good', 'Pocket', NULL, '2023-12-26', '71lCn2ggKeL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(228, '11', 'Juste avant le bonheur', NULL, 'Agnès Ledig', 'Roman sentimental', 'Pocket', NULL, '2023-12-26', '807b4bafb184e627a3bd74e1a3cd.jpg', NULL, 0, 0),
(229, '11', 'On la trouve plutôt jolie', NULL, 'Michel Bussi', 'Roman policier', 'Pocket', NULL, '2023-12-26', 'libriweb.jpeg', NULL, 0, 0),
(230, '11', 'Les yeux de diamant', NULL, 'Carol Higgins Clark', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', 'libriweb (1).jpeg', NULL, 0, 0),
(231, '11', 'Lieutenant Eve Dallas', 33, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '9782290056561_1_75.jpg', NULL, 0, 0),
(232, '11', 'La ouceur des hommes', NULL, 'SIMONETTA GREGGIO', '', 'Le livre de poche', NULL, '2023-12-26', '9782253116073-001-T.jpeg', NULL, 0, 0),
(233, '11', 'Un cœur en flammes', NULL, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '51Fa6rQKzSL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(234, '11', 'Sans défense', NULL, 'Harlan Coben', 'Roman policier', 'Belfond Noir', NULL, '2023-12-26', 'Sans-defense.jpg', NULL, 0, 0),
(235, '11', 'Sans Raison', NULL, 'Patricia CORNWELL', 'Roman Thriller', 'Le livre de poche', NULL, '2023-12-26', '715a8+Fk5kL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(236, '11', 'Le piège de la belle au bois dormant', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2023-12-26', '71CuFnKY5bL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(237, '11', 'Lieutenant Eve Dallas', 39, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2023-12-26', '61Bi36n4WjL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(238, '11', 'Avant qu\'il ne soit trop tard ', NULL, 'Barbara d\'Amatto', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', 'Avant-qu-il-ne-soit-trop-tard.jpg', NULL, 0, 0),
(239, '11', 'La plage de la mariée', NULL, 'Clarisse Sabard', 'Roman sentimental', 'Charleston', NULL, '2023-12-26', 'téléchargement (17).jpeg', NULL, 0, 0),
(240, '11', 'La fille cachée', NULL, 'Lisa Gardner', 'Roman Thriller', 'poche', NULL, '2023-12-26', '81v+djCtUcL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(241, '11', 'Ne t\'arrête pas', NULL, 'Michelle Gagnon', 'Roman Thriller', 'Nathan', NULL, '2023-12-26', '119780588.jpg', NULL, 0, 0),
(242, '11', 'Un grand amour peut en cacher un autre', NULL, 'Kristan Higgins', 'Roman sentimental', 'Harper Collins', NULL, '2023-12-26', '9791033916604.jpg', NULL, 0, 0),
(243, '11', 'La double mort de Linda', NULL, 'Patricia MACDONALD', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', '9782253076629-475x500-1.jpg', NULL, 0, 0),
(244, '11', 'La sœur de l\'ombre', NULL, 'Patricia MacDonald', 'Roman sentimental', 'Le livre de poche', NULL, '2023-12-26', '9782253092940-001-T.jpeg', NULL, 0, 0),
(245, '11', 'Un étranger dans la maison', NULL, 'Patricia MACDONALD', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', 'inx.jpg', NULL, 0, 0),
(246, '11', 'Chute libre', NULL, 'Carol HIGGINS CLARK', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', '14742702-3784-4843-a6b4-5791950a5075.jpg', NULL, 0, 0),
(247, '11', 'La villa', NULL, 'Nora ROBERTS', 'Roman policier', 'j\'ai lu', NULL, '2023-12-26', '61gw7DPf2GL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(248, '11', 'Les arcanes du Chaos', NULL, 'Maxime CHATTAM', 'Roman policier', 'Pocket', NULL, '2023-12-26', 'dex.jpg', NULL, 0, 0),
(249, '11', 'La maison des aravis', NULL, 'Françoise Bourdin', 'Roman sentimental', 'Pocket', NULL, '2023-12-26', 'IMG_7153.jpg', NULL, 0, 0),
(250, '11', 'Comprendre et soigner son enfant', 2, 'Dr Julien Cohen-Solal', 'Roman d’apprentissage', 'J\'ai Lu', NULL, '2023-12-26', 'IMG_7152.jpg', NULL, 0, 0),
(251, '11', 'Nos rêves de Castlebay', NULL, 'Maeve BINCHY', 'Roman feel-good', 'Pocket', NULL, '2023-12-26', '71+iLdGBe5L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(252, '11', 'La seconde chance d\'Ines', NULL, 'Fabienne Glineur', 'Roman de littérature contemporaine', 'Pocket', NULL, '2023-12-26', 'iex.jpg', NULL, 0, 0),
(253, '11', 'Mars et Venus', 1, 'John Gray', 'Roman sentimental', 'France Loisirs', NULL, '2023-12-26', 'IMG_7151.jpg', NULL, 0, 0),
(254, '11', 'Au pays des vivants', NULL, 'Nicci French', 'Roman Thriller', 'Pocket', NULL, '2023-12-26', 'IMG_7150.jpg', NULL, 0, 0),
(255, '11', 'L\'éducation sentimentale ', NULL, 'Gustave Flaubert', 'Roman de littérature contemporaine', 'Classiques Français', NULL, '2023-12-26', 'imag.jpg', NULL, 0, 0),
(256, '11', 'Darling Lilly', NULL, 'Michael Connelly', 'Roman policier', 'POINTS', NULL, '2023-12-26', '71BjSto2rNL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(257, '11', 'Le roman de l\'été', NULL, 'Nicolas FARGUES', 'Roman de littérature contemporaine', 'FOLIO', NULL, '2023-12-26', 'ndex.jpg', NULL, 0, 0),
(258, '11', 'Une épouse et une mère parfaite', NULL, 'Alexandra FRYE', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', 'inex.jpg', NULL, 0, 0),
(259, '11', 'Intimidation', NULL, 'Harlan COBEN', 'Roman policier', 'Pocket', NULL, '2023-12-26', 'intimidation-981850-264-432.jpg', NULL, 0, 0),
(260, '11', 'Ca a commencé comme ça', NULL, 'Angéla MORELLI', 'Roman feel-good', 'H', NULL, '2023-12-26', 'Ca-a-commence-comme-ca.jpg', NULL, 0, 0),
(261, '11', 'La fortune des Rougons', NULL, 'ZOLA', 'Roman de littérature contemporaine', ' Le livre de poche', NULL, '2023-12-26', '9782253161189-001-T.jpeg', NULL, 0, 0),
(262, '11', 'Bien frappé', NULL, 'Carol HIGGINS CLARK', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', 'imas.jpg', NULL, 0, 0),
(263, '11', 'Tous complices', NULL, 'Nicci FRENCH', 'Roman policier', 'Pocket', NULL, '2023-12-26', '618hgb9vPGL._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(264, '11', 'La mariée était en blanc', NULL, 'Mary Higgins Clark', 'Roman policier', ' Le livre de poche', NULL, '2023-12-26', 'images.jpg', NULL, 0, 0),
(265, '11', 'Petits Secrets Grands Mensonges', NULL, 'Liane MORIARTY', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', '9782253073697-001-T.jpeg', NULL, 0, 0),
(266, '11', 'En route pour Compostelle', NULL, 'Monika PEETZ', 'Roman feel-good', 'Pocket', NULL, '2023-12-26', 'idex.jpg', NULL, 0, 0),
(267, '11', 'Amis et rien de Plus', NULL, 'Kristan HIGGINS', 'Roman feel-good', 'poche', NULL, '2023-12-26', 'indx.jpg', NULL, 0, 0),
(268, '11', 'Le livre des Baltimores', NULL, 'Joel DICKER', 'Roman de littérature contemporaine', 'poche', NULL, '2023-12-26', 'Le-livre-des-baltimore.jpg', NULL, 0, 0),
(269, '11', 'Les couleurs de la vie ', NULL, 'Lorraine FOUCHET', 'Roman feel-good', 'Le livre de poche', NULL, '2023-12-26', 'inde.jpg', NULL, 0, 0),
(270, '11', 'Canada', NULL, 'Richard FORD', '', 'POINTS', NULL, '2023-12-26', '9782757845240_1_75.jpg', NULL, 0, 0),
(271, '11', 'Sauver sa Peau', NULL, 'Lisa GARDNER', 'Roman policier', 'Le livre de poche', NULL, '2023-12-26', 'Sauver-sa-peau.jpg', NULL, 0, 0),
(272, '11', 'Le premier jour du reste de ta vie', NULL, 'Virginie Grimaldi', 'Roman feel-good', 'Le livre de poche', NULL, '2023-12-26', '710uUrN409L._AC_UF1000,1000_QL80_.jpg', NULL, 0, 0),
(273, '11', 'Disparu à jamais', NULL, 'Harlan COBEN', 'Roman policier', 'Pocket', NULL, '2023-12-26', 'index.jpg', NULL, 0, 0),
(274, '11', 'Les fleurs du repentir', NULL, 'Tamara McKINLEY', 'Roman de littérature contemporaine', 'poche', NULL, '2023-12-26', 'Les-fleurs-du-repentir.jpg', NULL, 0, 0),
(275, '11', 'Ne pleure pas ma belle', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'IMG_7662.jpg', NULL, 0, 0),
(276, '11', 'Fontbrune', NULL, 'Brigitte Le Varlet', 'Roman sentimental', ' Albin Michel', NULL, '2024-02-24', 'Le varlet.jpg', NULL, 0, 0),
(278, '11', 'Nous n\'irons plus au bois', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'Nous n\'ions plus au bois.jpg', NULL, 0, 0),
(279, '11', 'Le bal du gouverneur', NULL, 'Marie-France Pisier', 'Roman Fantasy', 'Grasset et Fasquelle', NULL, '2024-02-24', 'le bal du gouverneur.jpg', NULL, 0, 0),
(280, '11', 'Double je', NULL, 'Sylvie Granotier', 'Roman Thriller', 'Albin Michel', NULL, '2024-02-24', 'Double jeu.jpg', NULL, 0, 0),
(281, '11', 'Le suspect', NULL, 'Michael Robotham', 'Roman Thriller', 'Jean-Claude Lattès', NULL, '2024-02-24', 'Le suspect.jpg', NULL, 0, 0),
(282, '11', 'Chris, la voleuse', NULL, 'Paul May', 'Roman policier', 'Garancière', NULL, '2024-02-24', 'Rouge.jpg', NULL, 0, 0),
(283, '11', 'Chris fille perdue sans collier', NULL, 'Paul May', 'Roman policier', 'Garancière', NULL, '2024-02-24', 'Rouge.jpg', NULL, 0, 0),
(284, '11', 'Le shangaïé', NULL, 'André Le Gal', 'Roman d’aventure', 'Jean-Claude Lattès', NULL, '2024-02-24', 'Le shangaïé.jpg', NULL, 0, 0),
(285, '11', 'La maison du guet', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'La maison du guet.jpg', NULL, 0, 0),
(286, '11', 'Loving', NULL, 'Danielle Steel', 'Roman sentimental', 'Presses de la cité', NULL, '2024-02-24', 'Loving.jpg', NULL, 0, 0),
(287, '11', 'Aventures d\'Arthur Gordon Pym', NULL, 'Edgar Allan Poe', 'Roman d’aventure', 'Editions D\'antan', NULL, '2024-02-24', 'Aventures d\'Arthur Gordon Pym.jpg', NULL, 0, 0),
(288, '11', 'Le poids du silence', NULL, 'Isabelle Maréchal', 'Roman sentimental', 'Anne Carrière', NULL, '2024-02-24', 'Le poids du silence.jpg', NULL, 0, 0),
(289, '11', 'Le nouveau guide pratique du droit', NULL, 'Jean Lagadec', 'Roman d’apprentissage', 'Editions Solar', NULL, '2024-02-24', 'Le nouveau guide pratique du droit.jpg', NULL, 0, 0),
(290, '11', 'Mémoires mortes', NULL, 'Patricia Cornwell', 'Roman policier', 'Editions des 2 terres', NULL, '2024-02-24', 'Mémoires mortes.jpg', NULL, 0, 0),
(291, '11', 'Une si longue nuit', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'Une si longue nuit.jpg', NULL, 0, 0),
(292, '11', 'La maison du clair de lune', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'La maison du clair de lune.jpg', NULL, 0, 0),
(293, '11', 'Dans la rue où vit celle que j\'aime', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'Dans la rue où vit celle que j\'aime.jpg', NULL, 0, 0),
(294, '11', 'Ce que vivent les roses', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'Ce que vivent les roses.jpg', NULL, 0, 0),
(295, '11', 'La nuit du renard', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'La nuit du renard.jpg', NULL, 0, 0),
(296, '11', 'Un cri dans la nuit', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'Un cri dans la nuit.jpg', NULL, 0, 0),
(297, '11', 'Zoya', NULL, 'Danielle Steel', 'Roman sentimental', 'Presses de la cité', NULL, '2024-02-24', 'Zoya.jpg', NULL, 0, 0),
(298, '11', 'La soupe aux cailloux', NULL, 'Martine Provis', 'L’auto-biographie', 'Editions Carrère', NULL, '2024-02-24', 'La soupe aux cailloux.jpg', NULL, 0, 0),
(299, '11', 'Madame royale', NULL, 'André Castelot', 'La biographie', 'Editions Rombaldi', NULL, '2024-02-24', 'Madame-Royale.jpg', NULL, 0, 0),
(300, '11', 'Dans les bois', NULL, 'Harlan Coben', 'Roman Thriller', 'Belfond', NULL, '2024-02-24', 'Dans les bois.jpg', NULL, 0, 0),
(301, '11', 'A découvert', NULL, 'Harlan Coben', 'Roman policier', 'Fleuve noir', NULL, '2024-02-24', 'A découvert.jpg', NULL, 0, 0),
(302, '11', 'Remède mortel', NULL, 'Harlan Coben', 'Roman Thriller', 'France Loisirs', NULL, '2024-02-24', 'Remède mortel.jpg', NULL, 0, 0),
(303, '11', 'Histoire d\'une fille de ferme', NULL, 'Guy de Maupassant', 'La nouvelle', 'France Loisirs', NULL, '2024-02-24', 'Histoire d\'une fille de ferme.jpg', NULL, 0, 0),
(304, '11', 'Lieutenant Eve Dallas', 15, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', 'Lieutenant eve dallas 15-16.jpg', NULL, 0, 0),
(305, '11', 'Lieutenant Eve Dallas', 16, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', 'Lieutenant eve dallas 15-16.jpg', NULL, 0, 0),
(306, '11', 'Des hommes d\'Etat', NULL, 'Bruno Le Maire', 'La biographie', 'Grasset et Fasquelle', NULL, '2024-02-24', 'Des hommes d\'Etat.jpg', NULL, 0, 0),
(307, '11', 'Lieutenant Eve Dallas', 54, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '54.jpg', NULL, 0, 0),
(308, '11', 'Psychopompe', NULL, 'Amélie Nothomb', 'L’auto-biographie', 'Albin Michel', NULL, '2024-02-24', 'Psychopompe.jpg', NULL, 0, 0),
(309, '11', 'Trois vies par semaine', NULL, 'Michel Bussi', 'Roman policier', 'Pocket', NULL, '2024-02-24', 'Trois vies par semaine.jpg', NULL, 0, 0),
(310, '11', 'L\'appel du lac', NULL, 'Carol Goodman', 'Roman policier', 'France Loisirs', NULL, '2024-02-24', 'L\'appel du lac.jpg', NULL, 0, 0),
(311, '11', 'Promets-moi', NULL, 'Harlan Coben', 'Roman Thriller', 'France Loisirs', NULL, '2024-02-24', 'Promet mois.jpg', NULL, 0, 0),
(312, '11', 'Le secret des fleurs', 3, 'Nora Roberts', 'Roman sentimental', 'J\'ai Lu', NULL, '2024-02-24', 'Le secret des fleurs 3.jpg', NULL, 0, 0),
(313, '11', 'Merci pour ce moment', NULL, 'Valérie Trierweiler', 'L’auto-biographie', 'Les arènes', NULL, '2024-02-24', 'Merci pour ce moment.jpg', NULL, 0, 0),
(314, '11', 'la fille de Brooklyn', NULL, 'Guillaume Musso', 'Roman policier', 'XO Editions', NULL, '2024-02-24', 'la fille de Brooklyn.jpg', NULL, 0, 0),
(315, '11', 'Du sang sur le green', NULL, 'Harlan Coben', 'Roman Thriller', 'Pocket', NULL, '2024-02-24', 'Du sang sur le green.jpg', NULL, 0, 0),
(316, '11', 'A un détail près', NULL, 'Kristan Higgins', 'Roman sentimental', 'Harper Collins', NULL, '2024-02-24', 'A un détail près.jpg', NULL, 0, 0),
(317, '11', 'Entre ciel et Lou', NULL, 'Lorraine Fouchet', 'Roman feel-good', 'Le livre de poche', NULL, '2024-02-24', 'Entre ciel et Lou.jpeg', NULL, 0, 0),
(318, '11', 'Parce que je t\'aime', NULL, 'Guillaume Musso', 'Roman sentimental', 'Pocket', NULL, '2024-02-24', 'Parce que je t\'aime.jpg', NULL, 0, 0),
(319, '11', 'Ne lâche pas ma main', NULL, 'Michel Bussi', 'Roman policier', 'Pocket', NULL, '2024-02-24', 'Ne lâche pas ma main.jpg', NULL, 0, 0),
(320, '11', 'Célibataire longue durée', NULL, 'Véronique Poulain', 'Roman feel-good', 'Le livre de poche', NULL, '2024-02-24', 'Célibataire longue durée.jpeg', NULL, 0, 0),
(321, '11', 'L\'échappée belle', NULL, 'Anna Gavalda', 'Roman feel-good', 'France Loisirs', NULL, '2024-02-24', 'L\'échappée belle.jpeg', NULL, 0, 0),
(322, '11', 'Pour l\'amour d\'une île', NULL, 'Armelle Guilcher', 'Roman policier', 'Pocket', NULL, '2024-02-24', 'Pour l\'amour d\'une île.jpg', NULL, 0, 0);
INSERT INTO `livres` (`ID`, `ID_UTILISATEUR`, `NOM_LIVRE`, `TOME`, `AUTEUR`, `GENRE`, `EDITIONS`, `NOTE`, `DATE_AJOUT`, `IMAGES`, `LECTURE`, `SOUHAIT`, `EMPRUNT`) VALUES
(323, '11', 'Lieutenant Eve Dallas', 17, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '17-18.jpg', NULL, 0, 0),
(324, '11', 'Lieutenant Eve Dallas', 18, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '17-18.jpg', NULL, 0, 0),
(325, '11', 'Danse pour moi', NULL, 'Mary Jane Clark', 'Roman Thriller', 'France Loisirs', NULL, '2024-02-24', 'Danse pour moi.jpg', NULL, 0, 0),
(326, '11', 'La boîte à musique', NULL, 'Mary Higgins Clark', 'Roman policier', 'Le livre de poche', NULL, '2024-02-24', 'La boîte à musique.jpg', NULL, 0, 0),
(327, '11', 'Les amants de minuit', NULL, 'Nora Roberts', 'Roman policier', 'Harlequin', NULL, '2024-02-24', 'Les amants de minuit.jpg', NULL, 0, 0),
(328, '11', 'Deux petites filles en bleu', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'Deux petites filles en bleu.jpg', NULL, 0, 0),
(329, '11', 'Deux petites filles en bleu', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'Deux petites filles en bleu.jpg', NULL, 0, 0),
(330, '11', 'La fille dans le rétroviseur', NULL, 'Linwood Barclay', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', 'La fille dans le rétroviseur.jpg', NULL, 0, 0),
(331, '11', 'Et soudain le silence', NULL, 'Belva Plain', 'Roman policier', 'Pocket', NULL, '2024-02-24', 'Et-soudain-le-silence.jpg', NULL, 0, 0),
(332, '11', 'Toi que j\'aimais tant', NULL, 'Mary Higgins Clark', 'Roman policier', 'Le livre de poche', NULL, '2024-02-24', 'Toi que j\'aimais tant.jpg', NULL, 0, 0),
(333, '11', 'Lieutenant Eve Dallas', 40, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '40.jpg', NULL, 0, 0),
(334, '11', 'Les oubliés du dimanche', NULL, 'Valérie Perrin', 'Roman sentimental', 'Le livre de poche', NULL, '2024-02-24', 'Les oubliés du dimanche.jpg', NULL, 0, 0),
(335, '11', 'Lieutenant Eve Dallas', 6, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '6.jpg', NULL, 0, 0),
(336, '11', 'Une autre vie', NULL, 'S.J. Watson', 'Roman policier', 'Pocket', NULL, '2024-02-24', 'Une autre vie.jpg', NULL, 0, 0),
(337, '11', 'Le secret des fleurs', 2, 'Nora Roberts', 'Roman sentimental', 'J\'ai Lu', NULL, '2024-02-24', 'Le secret des fleurs 2.jpg', NULL, 0, 0),
(338, '11', 'L\'été de toutes les peurs', NULL, 'Mary Jane Clark', 'Roman policier', 'Suspense', NULL, '2024-02-24', 'L\'été de toutes les peurs.jpg', NULL, 0, 0),
(339, '11', 'Lieutenant Eve Dallas', 42, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '42.jpg', NULL, 0, 0),
(340, '11', 'Accroche-toi Anna !', NULL, 'Isabel Wolff', 'Roman sentimental', 'Pocket', NULL, '2024-02-24', 'Accroche-toi Anna !.jpg', NULL, 0, 0),
(341, '11', 'Irish coffee', 10, 'Carol Higgins Clark', 'Roman policier', 'Suspense', NULL, '2024-02-24', 'Irish coffee.jpg', NULL, 0, 0),
(342, '11', 'Les chaînes du secret', NULL, 'Mary Jane Clark', 'Roman policier', 'Suspense', NULL, '2024-02-24', 'Les chaînes du secret.jpg', NULL, 0, 0),
(343, '11', 'Le val de l\'espoir', NULL, 'Marie-Bernadette Dupuy', 'Roman sentimental', 'Le livre de poche', NULL, '2024-02-24', 'Le val de l\'espoir.jpeg', NULL, 0, 0),
(344, '11', 'Un doux pardon', NULL, 'Lori Nelson Spielman', 'Roman feel-good', 'Pocket', NULL, '2024-02-24', 'Un doux pardon.jpg', NULL, 0, 0),
(345, '11', 'La maison des enfants', NULL, 'Janine Boissard', 'Roman policier', 'Pocket', NULL, '2024-02-24', 'La maison des enfants.jpg', NULL, 0, 0),
(346, '11', 'Lieutenant Eve Dallas', 19, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '19-20.jpg', NULL, 0, 0),
(347, '11', 'Lieutenant Eve Dallas', 20, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '19-20.jpg', NULL, 0, 0),
(348, '11', 'On regrettera plus tard', NULL, 'Agnès Ledig', 'Roman sentimental', 'Pocket', NULL, '2024-02-24', 'On regrettera plus tard.jpg', NULL, 0, 0),
(349, '11', 'Lieutenant Eve Dallas', 55, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '55.jpg', NULL, 1, 0),
(350, '11', 'Quand reviendras-tu ?', NULL, 'Mary Higgins Clark', 'Roman policier', 'Le livre de poche', NULL, '2024-02-24', '52611446_10655389.jpg', NULL, 0, 0),
(351, '11', 'Juste un regard', NULL, 'Harlan Coben', 'Roman policier', 'Pocket', NULL, '2024-02-24', 'Juste un regard.jpg', NULL, 0, 0),
(352, '11', 'Et puis Paulette ...', NULL, 'Barbara Constantine', 'Roman feel-good', 'Le livre de poche', NULL, '2024-02-24', 'Et puis Paulette ....jpg', NULL, 0, 0),
(353, '11', 'Lieutenant Eve Dallas', 9, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '9-10.jpg', NULL, 0, 0),
(354, '11', 'Lieutenant Eve Dallas', 10, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '9-10.jpg', NULL, 0, 0),
(355, '11', 'Lieutenant Eve Dallas', 1, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '1-2.jpg', NULL, 0, 0),
(356, '11', 'Lieutenant Eve Dallas', 2, 'Nora Roberts', 'Roman policier', 'J\'ai Lu', NULL, '2024-02-24', '1-2.jpg', NULL, 0, 0),
(357, '11', 'Ombres chinoises', NULL, 'Lisa See', 'Roman Noir', 'J\'ai Lu', NULL, '2024-02-24', 'Ombres chinoises.jpg', NULL, 0, 0),
(358, '11', 'La nuit est mon royaume', NULL, 'Mary Higgins Clark', 'Roman policier', 'Albin Michel', NULL, '2024-02-24', 'La nuit est mon royaume.jpg', NULL, 0, 0),
(360, '11', 'La clinique du docteur H.', NULL, 'Mary Higgins Clark', 'Roman policier', 'France Loisirs', NULL, '2024-02-24', 'La clinique du docteur H..jpg', NULL, 0, 0),
(361, '11', 'Souviens-toi', NULL, 'Mary Higgins Clark', 'Roman policier', 'France Loisirs', NULL, '2024-02-24', 'Souviens-toi.jpg', NULL, 0, 0),
(362, '11', 'Vingt mille lieues sous les mers', NULL, 'Jules Verne', 'Roman d’aventure', 'Prodifu', NULL, '2024-02-24', 'verne.jpg', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `ID_UTILISATEUR` int(11) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  `MAIL` varchar(150) NOT NULL,
  `MDP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`ID_UTILISATEUR`, `NOM`, `PRENOM`, `MAIL`, `MDP`) VALUES
(1, 'Venturoli', 'Léa', 'leaventu@gmail.com', '58769e20f6254d3113ca2c068c1d4707eceef4b995bac77dfbae0de915286020'),
(11, 'Venturoli', 'Jackie', 'venturoli.jackie@gmail.com', 'df56fc10ad5dce155ed6bd61134ab28121889d630b5c6b8adfba65d4f626b80b'),
(12, 'Humbert', 'Hugo', 'Humbert.hugo77@hotmail.com', 'dd63b876611f7d8a7e7c05c5c1a5619f8f322da049543fa214b68e3d7d32693f'),
(20, 'mahaut', 'coline', 'coline.mht@gmail.com', 'f8c1cb64f6c1e1ac437f48c9e3c98cfc6f997da6c21458be548262685668088a'),
(21, 'Mc', 'Da', 'damienciobanu@gmail.com', '249e70cd40628f493e431425446b61f0e3c4a7b80cb2f7392dbced47baff2bc5'),
(33, 'Hemart', 'Lucas', 'lucashemart933@gmail.com', '2232fd8c777e75dd08a72930644956b5a80338a7df3a23e5c643561b13d9505a');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`ID_UTILISATEUR`),
  ADD UNIQUE KEY `MAIL` (`MAIL`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `ID_UTILISATEUR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
