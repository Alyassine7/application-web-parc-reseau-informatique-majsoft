-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 10 août 2024 à 12:33
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `administrateur_reseau`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite_utilisateur`
--

CREATE TABLE `activite_utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `derniere_activite` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `activite_utilisateur`
--

INSERT INTO `activite_utilisateur` (`id_utilisateur`, `derniere_activite`) VALUES
(23, '2024-08-01 22:26:26'),
(29, '2024-08-10 10:41:38'),
(43, '2024-08-04 17:43:38');

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `poste` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `connexion`
--

INSERT INTO `connexion` (`id`, `nom`, `prenom`, `poste`, `mail`, `password`) VALUES
(23, 'zagarino', 'rakotomalala', 'marketing', 'zaga@gmail.com', 'a     '),
(29, 'alyas', 'mohamed', 'informaticien', 'alyassian20@gmail.com', 'alyassine'),
(43, 'anelka', 'zafiniry', 'technicien', 'anelka@gmail.com', '123456789'),
(47, 'selon', 'rakotomalala', 'informaticien', 'selon@gmail.com', '123456789');

-- --------------------------------------------------------

--
-- Structure de la table `idconnexion`
--

CREATE TABLE `idconnexion` (
  `id` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `idconnexion`
--

INSERT INTO `idconnexion` (`id`, `mail`, `password`) VALUES
(1, 'alyassian20@gmail.com', 'alyassine');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite_utilisateur`
--
ALTER TABLE `activite_utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Index pour la table `idconnexion`
--
ALTER TABLE `idconnexion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite_utilisateur`
--
ALTER TABLE `activite_utilisateur`
  ADD CONSTRAINT `activite_utilisateur_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `connexion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
