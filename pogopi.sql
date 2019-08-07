-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mer. 07 août 2019 à 20:10
-- Version du serveur :  5.7.9
-- Version de PHP :  7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pogopi`
--

-- --------------------------------------------------------

--
-- Structure de la table `abilitie`
--

CREATE TABLE `abilitie` (
  `id` int(3) UNSIGNED NOT NULL,
  `description_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_fr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_fr` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `abilitie`
--

INSERT INTO `abilitie` (`id`, `description_en`, `description_fr`, `name_en`, `name_fr`) VALUES
(1, 'The Pokémon gradually regains HP in rain.', 'Le Pokémon récupère progressivement des PV lorsqu’il pleut.', 'Rain Dish', 'Cuvette'),
(2, 'Powers up Fire-type moves when the Pokémon’s HP is low.', 'Augmente la puissance des capacités de type Feu du Pokémon quand il a perdu une certaine quantité de PV.', 'Blaze', 'Brasier'),
(3, 'Boosts the Sp. Atk stat in harsh sunlight, but HP decreases every turn.', 'Quand le soleil brille, l’Attaque Spéciale du Pokémon augmente mais il perd des PV à chaque tour.', 'Solar Power', 'Force Soleil'),
(4, 'Powers up Grass-type moves when the Pokémon’s HP is low.', 'Augmente la puissance des capacités de type Plante du Pokémon quand il a perdu une certaine quantité de PV.', 'Overgrow', 'Engrais'),
(5, 'Boosts the Pokémon’s Speed stat in harsh sunlight.', 'Augmente la Vitesse du Pokémon s’il y a du soleil.', 'Chlorophyll', 'Chlorophylle'),
(6, 'Powers up Water-type moves when the Pokémon’s HP is low.', 'Augmente la puissance des capacités de type Eau du Pokémon quand il a perdu une certaine quantité de PV.', 'Torrent', 'Torrent'),
(7, 'Enables a sure getaway from wild Pokémon.', 'Permet de fuir n’importe quel Pokémon sauvage.', 'Run Away', 'Fuite'),
(8, 'The Pokémon draws in all Electric-type moves.  Instead of being hit by Electric-type moves,  it boosts its Sp. Atk.', 'Le Pokémon détourne sur lui les capacités de type Électrik et les neutralise, tout en montant son Attaque Spéciale.', 'Lightning Rod', 'Paratonnerre'),
(9, 'The Pokémon intimidates opposing Pokémon upon entering battle, lowering their Attack stat.', 'Le Pokémon rugit lorsqu’il arrive au combat, ce qui intimide l’ennemi et baisse son Attaque.', 'Intimidate', 'Intimidation'),
(10, 'Becomes competitive and deals more damage to Pokémon of the same gender, but deals less to Pokémon of the opposite gender.', 'Le Pokémon déteste la concurrence et inflige plus de dégâts si l’ennemi est du même sexe. Par contre, il en inflige moins si l’ennemi est du sexe opposé.', 'Rivalry', 'Rivalité'),
(11, 'Boosts the Pokémon’s Speed stat in a sandstorm.', 'Augmente la Vitesse lors des tempêtes de sable.', 'Sand Rush', 'Baigne Sable'),
(12, 'Powers up moves if they become critical hits when attacking.', 'Lorsque le Pokémon porte un coup critique, les dégâts infligés augmentent encore plus que d’habitude.', 'Sniper', 'Sniper'),
(13, 'Boosts the Sp. Atk stat sharply when a stat is lowered.', 'Augmente beaucoup l’Attaque Spéciale du Pokémon quand ses stats baissent.', 'Competitive', 'Battant'),
(14, 'Unnerves opposing Pokémon and makes them unable to eat Berries.', 'Fait stresser l’ennemi, ce qui l’empêche de manger des Baies.', 'Unnerve', 'Tension'),
(15, 'Raises evasion if the Pokémon is confused.', 'Augmente l’Esquive du Pokémon s’il est confus.', 'Tangled Feet', 'Pieds Confus'),
(16, 'The Pokémon may heal its own status conditions by shedding its skin.', 'Le Pokémon soigne parfois ses altérations de statut en muant.', 'Shed Skin', 'Mue'),
(17, 'The Pokémon can use “not very effective” moves to deal regular damage. ', 'Permet à une capacité « pas très efficace » d’infliger des dégâts comme si elle était efficace normalement.', 'Tinted Lens', 'Lentiteintée'),
(18, 'The Pokémon’s intensely focused, and that protects the Pokémon from flinching.', 'Le Pokémon a un mental à toute épreuve qui empêche les capacités ennemies de lui faire peur.', 'Inner Focus', 'Attention'),
(19, 'Restores a little HP when withdrawn from battle.', 'Restaure un peu de PV si le Pokémon est retiré du combat.', 'Regenerator', 'Régé-Force'),
(20, 'Boosts the Pokémon’s evasion in a sandstorm.', 'Augmente l’Esquive du Pokémon lors des tempêtes de sable.', 'Sand Veil', 'Voile Sable'),
(21, 'A hard shell protects the Pokémon from critical hits.', 'Le Pokémon est protégé des coups critiques par sa carapace.', 'Shell Armor', 'Coque Armure'),
(22, 'It cannot be knocked out with one hit. One-hit KO moves cannot knock it out, either.', 'Le Pokémon encaisse toujours au moins une attaque s’il a tous ses PV. Il est également immunisé contre les capacités pouvant mettre K.O. en un coup.', 'Sturdy', 'Fermeté'),
(23, 'The Pokémon awakens twice as fast as other Pokémon from sleep.', 'Le Pokémon se réveille deux fois plus rapidement que les autres.', 'Early Bird', 'Matinal'),
(24, 'Contact with the Pokémon may burn the attacker.', 'Peut brûler l’attaquant lorsque le Pokémon subit une attaque directe.', 'Flame Body', 'Corps Ardent'),
(25, 'Boosts the Pokémon’s Speed stat in rain.', 'Augmente la Vitesse du Pokémon s’il pleut.', 'Swift Swim', 'Glissade'),
(26, 'May poison a target when the Pokémon makes contact.', 'Peut empoisonner l’ennemi par simple contact.', 'Poison Touch', 'Toxitouche'),
(27, 'Powers up moves that have recoil damage.', 'Augmente la puissance des capacités occasionnant un contrecoup.', 'Reckless', 'Téméraire'),
(28, 'All status conditions heal when the Pokémon switches out.', 'Le Pokémon soigne ses altérations de statut en quittant le combat.', 'Natural Cure', 'Médic Nature'),
(29, 'The Pokémon shows moxie, and that boosts the Attack stat after knocking out any Pokémon.', 'Quand le Pokémon met un ennemi K.O., sa confiance en lui ne connaît plus de limite et son Attaque augmente.', 'Moxie', 'Impudence'),
(30, 'Physical attacks to the Pokémon lower its Defense stat but sharply raise its Speed stat.', 'Quand le Pokémon est touché par une capacité physique, sa Défense baisse mais sa Vitesse augmente beaucoup.', 'Weak Armor', 'Armurouillée'),
(31, 'Compares an opposing Pokémon’s Defense and Sp. Def stats before raising its own Attack or Sp. Atk stat—whichever will be more effective.', 'Le Pokémon compare la Défense et la Défense Spéciale de l’adversaire et augmente son Attaque ou son Attaque Spéciale en conséquence.', 'Download', 'Télécharge'),
(32, 'Prevents status conditions in harsh sunlight.', 'Protège le Pokémon contre les altérations de statut quand le soleil brille.', 'Leaf Guard', 'Feuille Garde'),
(33, 'By putting pressure on the opposing Pokémon, it raises their PP usage.', 'Force l’ennemi à dépenser plus de PP.', 'Pressure', 'Pression'),
(34, 'The Pokémon is suffering from insomnia and cannot fall asleep.', 'Le Pokémon est incapable de dormir.', 'Insomnia', 'Insomnia'),
(35, 'Powers up the Pokémon’s Fire-type moves if it’s hit by one.', 'Lorsque le Pokémon est touché par une capacité de type Feu, il absorbe la chaleur pour renforcer ses propres capacités Feu.', 'Flash Fire', 'Torche'),
(36, 'The immune system of the Pokémon prevents it from getting poisoned.', 'Le Pokémon est naturellement immunisé contre toute forme de poison.', 'Immunity', 'Vaccin'),
(37, 'Restores HP if hit by an Electric-type move, instead of taking damage.', 'Si le Pokémon est touché par une capacité Électrik, il ne subit aucun dégât et regagne des PV à la place.', 'Volt Absorb', 'Absorb Volt'),
(38, 'Reflects status moves, instead of getting hit by them.', 'Annule les effets des capacités de statut subies par le Pokémon et les retourne à l’envoyeur.', 'Magic Bounce', 'Miroir Magik'),
(39, 'Contact with the Pokémon may cause infatuation.', 'Peut séduire l’attaquant lorsque le Pokémon subit une attaque directe.', 'Cute Charm', 'Joli Sourire'),
(40, 'Boosts the Attack stat if hit by a Grass-type move, instead of taking damage.', 'Annule les attaques de type Plante subies par le Pokémon et augmente son Attaque.', 'Sap Sipper', 'Herbivore'),
(41, 'Boosts the Sp. Atk stat of the Pokémon if an ally with the Plus or Minus Ability is also in battle.', 'L’Attaque Spéciale du Pokémon augmente si un Pokémon allié a le talent Minus ou Plus.', 'Plus', 'Plus'),
(42, 'The Pokémon is so lucky that the critical-hit ratios of its moves are boosted.', 'Le Pokémon est tellement chanceux qu’il inflige plus fréquemment des coups critiques.', 'Super Luck', 'Chanceux'),
(43, 'Heals status conditions if it’s raining.', 'Soigne les altérations de statut du Pokémon quand il pleut.', 'Hydration', 'Hydratation'),
(44, 'The Pokémon makes it rain when it enters a battle.', 'Le Pokémon invoque la pluie quand il entre au combat.', 'Drizzle', 'Crachin'),
(45, 'The Pokémon’s compound eyes boost its accuracy.', 'Les yeux à facettes du Pokémon augmentent sa Précision.', 'Compound Eyes', 'Œil Composé'),
(46, 'Passes through the opposing Pokémon’s barrier, substitute, and the like and strikes.', 'Traverse les barrières et les clones de l’ennemi pour attaquer directement.', 'Infiltrator', 'Infiltration'),
(47, 'Protects the Pokémon from things like sand, hail, and powder.', 'Protège des dégâts occasionnés par les tempêtes de sable ou la grêle, et neutralise les attaques à base de poudre.', 'Overcoat', 'Envelocape'),
(48, 'Raises one stat sharply and lowers another every turn.', 'Augmente beaucoup une stat du Pokémon et en baisse une autre au hasard à chaque tour.', 'Moody', 'Lunatique'),
(49, 'Steals an item from an attacker that made direct contact.', 'Vole l’objet que tient l’attaquant quand le Pokémon subit une attaque directe.', 'Pickpocket', 'Pickpocket'),
(50, 'Sometimes heals an ally’s status condition.', 'Soigne parfois une altération de statut d’un allié proche.', 'Healer', 'Cœur Soin'),
(51, 'Powers up the Pokémon’s weaker moves.', 'Augmente la puissance des capacités les plus faibles.', 'Technician', 'Technicien'),
(52, 'Prevents the use of explosive moves such as Self-Destruct by dampening its surroundings.', 'Le Pokémon augmente l’humidité de l’air, ce qui empêche tous les Pokémon d’utiliser des capacités explosives telles que Destruction.', 'Damp', 'Moiteur'),
(53, 'This Pokémon has its own tempo, and that prevents it from becoming confused.', 'Le Pokémon vit sa vie à son propre rythme, ce qui l’immunise contre la confusion.', 'Own Tempo', 'Tempo Perso'),
(54, 'Its mysterious power only lets supereffective moves hit the Pokémon.', 'Une puissance mystérieuse protège le Pokémon contre toutes les capacités, sauf celles « super efficaces ».', 'Wonder Guard', 'Garde Mystik'),
(55, 'The Pokémon can’t use a move the following turn if it uses one.', 'Lorsque le Pokémon utilise une capacité, il passe le tour suivant à paresser.', 'Truant', 'Absentéisme'),
(56, 'Turns the sunlight harsh when the Pokémon enters a battle.', 'Le soleil se met à briller quand le Pokémon entre au combat.', 'Drought', 'Sécheresse'),
(57, 'The Pokémon can sense an opposing Pokémon’s dangerous moves.', 'Le Pokémon devine si l’adversaire connaît une capacité dangereuse pour lui.', 'Anticipation', 'Anticipation'),
(58, 'The Pokémon is protected by a layer of thick fat, which halves the damage taken from Fire- and Ice-type moves.', 'Le Pokémon est protégé par une épaisse couche de graisse qui diminue de moitié les dégâts qu’il subit des capacités de types Feu et Glace.', 'Thick Fat', 'Isograisse'),
(59, 'Doubles the Pokémon’s weight.', 'Double le poids du Pokémon.', 'Heavy Metal', 'Heavy Metal'),
(60, 'The Pokémon moves after all other Pokémon do.', 'Le Pokémon utilise toujours sa capacité en dernier.', 'Stall', 'Frein'),
(61, 'Gives priority to a status move.', 'Rend les capacités de statut prioritaires.', 'Prankster', 'Farceur'),
(62, 'Makes stat changes have an opposite effect.', 'Inverse les changements de stats  => les augmentations de stats se transforment en baisses, et vice-versa.', 'Contrary', 'Contestation'),
(63, 'The stat changes the Pokémon receives are doubled.', 'Les variations de stats sont deux fois plus importantes pour le Pokémon.', 'Simple', 'Simple'),
(64, 'This Pokémon inflicts damage with its rough skin to the attacker on contact.', 'Blesse l’attaquant lorsque le Pokémon subit une attaque directe.', 'Rough Skin', 'Peau Dure'),
(65, 'Restores HP if hit by a Water-type move, instead of taking damage.', 'Si le Pokémon est touché par une capacité Eau, il ne subit aucun dégât et regagne des PV à la place.', 'Water Absorb', 'Absorb Eau'),
(66, 'The Pokémon is covered with a water veil, which prevents the Pokémon from getting a burn.', 'Le voile qui recouvre le Pokémon le protège des brûlures.', 'Water Veil', 'Ignifu-Voile'),
(67, 'It’s so gutsy that having a status condition boosts the Pokémon’s Attack stat.', 'Augmente l’Attaque du Pokémon s’il est affecté par une altération de statut.', 'Guts', 'Cran'),
(68, 'Anticipates an ally’s attack and dodges it.', 'Le Pokémon anticipe et évite les attaques de ses alliés.', 'Telepathy', 'Télépathe'),
(69, 'The Pokémon only takes damage from attacks.', 'Seules les attaques peuvent blesser le Pokémon.', 'Magic Guard', 'Garde Magik'),
(70, 'By floating in the air, the Pokémon receives full immunity to all Ground-type moves.', 'Le Pokémon flotte, ce qui l’immunise contre les capacités de type Sol.', 'Levitate', 'Lévitation'),
(71, 'The Pokémon gradually regains HP in a hailstorm.', 'Régénère les PV du Pokémon lors des tempêtes de grêle.', 'Ice Body', 'Corps Gel'),
(72, 'The Pokémon transforms with the weather to change its type to Water, Fire, or Ice.', 'Le Pokémon prend le type Eau, Feu ou Glace en fonction de la météo.', 'Forecast', 'Météo'),
(73, 'Changes the Pokémon’s type to the type of the move it’s about to use.', 'Le Pokémon prend le type de la capacité qu’il utilise.', 'Protean', 'Protéen'),
(74, 'Hard armor protects the Pokémon from critical hits.', 'Le Pokémon est protégé des coups critiques par une solide carapace.', 'Battle Armor', 'Armurbaston'),
(75, 'The Pokémon summons a hailstorm when it enters a battle.', 'Déclenche une tempête de grêle quand le Pokémon entre au combat.', 'Snow Warning', 'Alerte Neige'),
(76, 'Eliminates the effects of weather.', 'Annule tous les effets de la météo.', 'Air Lock', 'Air Lock'),
(77, 'When attacking, the Pokémon ignores the target Pokémon’s stat changes.', 'Quand il attaque, le Pokémon ignore les changements de stats de l’ennemi.', 'Unaware', 'Inconscient'),
(78, 'Dark-, Ghost-, and Bug-type moves scare the Pokémon and boost its Speed stat.', 'Si le Pokémon est touché par une capacité de type Ténèbres, Spectre ou Insecte, sa phobie se révèle et sa Vitesse augmente.', 'Rattled', 'Phobique'),
(79, 'Contact with the Pokémon may poison the attacker.', 'Peut empoisonner l’attaquant lorsque le Pokémon subit une attaque directe.', 'Poison Point', 'Point Poison'),
(80, 'The Pokémon’s determination boosts the Speed stat each time the Pokémon flinches.', 'Augmente la Vitesse du Pokémon quand il a peur.', 'Steadfast', 'Impassible'),
(81, 'Makes the Pokémon eat a held Berry when its HP drops to half or less, which is sooner than usual.', 'Si le Pokémon tient une Baie à manger en cas de PV bas, il la mange dès qu’il a perdu la moitié de ses PV.', 'Gluttony', 'Gloutonnerie'),
(82, 'Powers up Bug-type moves when the Pokémon’s HP is low.', 'Augmente la puissance des capacités de type Insecte du Pokémon quand il a perdu une certaine quantité de PV.', 'Swarm', 'Essaim'),
(83, 'Soundproofing of the Pokémon itself gives full  immunity to all sound-based moves.', 'Protège le Pokémon de toutes les capacités sonores.', 'Soundproof', 'Anti-Bruit'),
(84, 'The Pokémon is full of vitality, and that prevents it from falling asleep.', 'Empêche le Pokémon de s’endormir.', 'Vital Spirit', 'Esprit Vital'),
(85, 'Maximizes the number of times multi-strike moves hit.', 'Les capacités pouvant frapper plusieurs fois frappent toujours le nombre maximum de coups.', 'Skill Link', 'Multi-Coups'),
(86, 'Restores HP in rain or when hit by Water-type moves. Reduces HP in harsh sunlight, and increases the damage received from Fire-type moves.', 'Le Pokémon regagne des PV sous la pluie ou s’il est touché par une capacité Eau, mais il déteste les capacités Feu ou quand le soleil brille.', 'Dry Skin', 'Peau Sèche'),
(87, 'Boosts the Speed stat if the Pokémon has a status condition.', 'Augmente la Vitesse du Pokémon en cas d’altération de statut.', 'Quick Feet', 'Pied Véloce'),
(88, 'The Pokémon can hit Ghost-type Pokémon with Normal- and Fighting-type moves.', 'Permet aux capacités de type Normal ou Combat du Pokémon de toucher les Pokémon de type Spectre.', 'Scrappy', 'Querelleur'),
(89, 'Moves can be used on the target regardless of its Abilities.', 'Le Pokémon ignore les talents adverses qui auraient un effet sur ses capacités.', 'Mold Breaker', 'Brise Moule'),
(90, 'May create another Berry after one is used.', 'Permet de réutiliser une même Baie plusieurs fois.', 'Harvest', 'Récolte'),
(91, 'When it enters a battle, the Pokémon can check an opposing Pokémon’s held item.', 'Permet de connaître l’objet tenu par l’ennemi quand le combat commence.', 'Frisk', 'Fouille'),
(92, 'Protects the Pokémon from recoil damage.', 'Le Pokémon peut utiliser des capacités occasionnant un contrecoup sans perdre de PV.', 'Rock Head', 'Tête de Roc'),
(93, 'Its Speed stat is boosted every turn.', 'La Vitesse du Pokémon augmente à chaque tour.', 'Speed Boost', 'Turbo'),
(94, 'The Pokémon may pick up the item an opposing Pokémon used during a battle. It may pick up items outside of battle, too.', 'Permet parfois au Pokémon de ramasser les objets que ses ennemis ont utilisés. Il lui arrive aussi d’en trouver hors des combats.', 'Pickup', 'Ramassage'),
(95, 'Prevents opposing Pokémon from fleeing.', 'Empêche l’ennemi de s’enfuir.', 'Arena Trap', 'Piège Sable'),
(96, 'Oozed liquid has strong stench, which damages attackers using any draining move.', 'Le Pokémon suinte un liquide toxique qui blesse tous ceux qui tentent de voler ses PV.', 'Liquid Ooze', 'Suintement'),
(97, 'The Pokémon is charged with static electricity, so contact with it may cause paralysis.', 'Le Pokémon charge son corps en électricité statique, et tout contact avec lui peut paralyser.', 'Static', 'Statik'),
(98, 'The attacker will receive the same status condition if it inflicts a burn, poison, or paralysis to the Pokémon.', 'Quand le Pokémon est brûlé, paralysé ou empoisonné par un autre Pokémon, il partage ce statut avec celui-ci.', 'Synchronize', 'Synchro'),
(99, 'Being hit by a Dark-type move boosts the Attack stat of the Pokémon, for justice.', 'Réveille la noblesse du Pokémon lorsqu’il subit une capacité de type Ténèbres, ce qui augmente son Attaque.', 'Justified', 'Cœur Noble'),
(100, 'The Pokémon’s marvelous scales boost the Defense stat if it has a status condition.', 'Les écailles mystérieuses du Pokémon réagissent aux altérations de statut en augmentant sa Défense.', 'Marvel Scale', 'Écaille Spéciale'),
(101, 'Removes additional effects to increase the power of moves when attacking.', 'Les capacités ayant un effet additionnel perdent celui-ci, mais leur puissance augmente.', 'Sheer Force', 'Sans Limite'),
(102, 'The Pokémon is protected by its white smoke, which prevents other Pokémon from lowering its stats.', 'Un écran de fumée empêche l’ennemi de baisser les stats du Pokémon.', 'White Smoke', 'Écran Fumée'),
(103, 'The Pokémon summons a sandstorm when it enters a battle.', 'Le Pokémon invoque une tempête de sable quand il entre au combat.', 'Sand Stream', 'Sable Volant'),
(104, 'This Pokémon steps on the opposing Pokémon’s shadow to prevent it from escaping.', 'Empêche le Pokémon ennemi de quitter le combat.', 'Shadow Tag', 'Marque Ombre'),
(105, 'Reduces the power of supereffective attacks taken.', 'Réduit les dégâts subis lorsque le Pokémon est touché par une capacité super efficace.', 'Filter', 'Filtre'),
(106, 'Powers up punching moves.', 'Augmente la puissance des capacités coups de poing.', 'Iron Fist', 'Poing de Fer'),
(107, 'Powers up physical attacks when the Pokémon is poisoned.', 'Augmente la puissance des capacités physiques quand le Pokémon est empoisonné.', 'Toxic Boost', 'Rage Poison'),
(108, 'Boosts the Sp. Atk stat of the Pokémon if an ally with the Plus or Minus Ability is also in battle.', 'L’Attaque Spéciale du Pokémon augmente si un Pokémon allié a le talent Minus ou Plus.', 'Minus', 'Minus'),
(109, 'All the Pokémon’s moves become Normal type. The power of those moves is boosted a little.', 'Toutes les capacités du Pokémon deviennent de type Normal, quel que soit leur type original. Leur puissance augmente légèrement.', 'Normalize', 'Normalise'),
(110, 'Draws in all Water-type moves. Instead of being hit  by Water-type moves, it boosts its Sp. Atk.', 'Le Pokémon détourne sur lui les capacités de type Eau et les neutralise, tout en montant son Attaque Spéciale.', 'Storm Drain', 'Lavabo'),
(111, 'Boosts evasion in a hailstorm.', 'Augmente l’Esquive du Pokémon durant les tempêtes de grêle.', 'Snow Cloak', 'Rideau Neige'),
(112, 'Powers up special attacks when the Pokémon is burned.', 'Augmente la puissance des capacités spéciales quand le Pokémon est brûlé.', 'Flare Boost', 'Rage Brûlure'),
(113, 'Boosts the Speed stat if the Pokémon’s held item is  used or lost.', 'Augmente la Vitesse du Pokémon s’il perd ou utilise l’objet qu’il tenait au début du combat.', 'Unburden', 'Délestage'),
(114, 'The Pokémon is covered with hot magma, which prevents the Pokémon from becoming frozen.', 'Le magma qui recouvre le corps du Pokémon le protège contre le gel.', 'Magma Armor', 'Armumagma'),
(115, 'Reduces the amount of damage the Pokémon takes when its HP is full.', 'Le Pokémon reçoit moins de dégâts quand ses PV sont au maximum.', 'Multiscale', 'Multiécaille'),
(116, 'Prevents other Pokémon’s moves or Abilities from lowering the Pokémon’s stats.', 'Empêche les stats du Pokémon de baisser à cause d’une capacité ou d’un talent.', 'Clear Body', 'Corps Sain'),
(117, 'Prevents Steel-type Pokémon from escaping using its magnetic force.', 'Attire les Pokémon Acier grâce à un champ magnétique, ce qui les empêche de fuir.', 'Magnet Pull', 'Magnépiège'),
(118, 'Boosts the Pokémon’s Attack stat sharply when its stats are lowered.', 'Augmente beaucoup l’Attaque du Pokémon quand ses stats baissent.', 'Defiant', 'Acharné'),
(119, 'Boosts the likelihood of additional effects occurring  when attacking.', 'Augmente les chances d’infliger des effets additionnels.', 'Serene Grace', 'Sérénité'),
(120, 'Protects the Pokémon from Defense-lowering effects.', 'Empêche les capacités adverses de baisser la Défense.', 'Big Pecks', 'Cœur de Coq'),
(121, 'Boosts the power of Rock-, Ground-, and Steel-type moves in a sandstorm.', 'Augmente la puissance des capacités de type Roche, Sol et Acier en cas de tempête de sable.', 'Sand Force', 'Force Sable'),
(122, 'Boosts the Attack and Sp. Def stats of itself and allies in harsh sunlight.', 'Augmente l’Attaque et la Défense Spéciale du Pokémon et de ses alliés lorsque le soleil brille.', 'Flower Gift', 'Don Floral'),
(123, 'By releasing stench when attacking, this Pokémon may cause the target to flinch.', 'Le Pokémon émet une odeur si nauséabonde qu’il peut effrayer sa cible.', 'Stench', 'Puanteur'),
(124, 'May disable a move used on the Pokémon.', 'Quand le Pokémon est touché par une capacité, il inflige parfois Entrave sur celle-ci.', 'Cursed Body', 'Corps Maudit'),
(125, 'The Pokémon transforms itself into the Pokémon it’s facing.', 'Donne l’apparence du Pokémon adverse.', 'Imposter', 'Imposteur'),
(126, 'Keen eyes prevent other Pokémon from lowering this Pokémon’s accuracy.', 'Les yeux perçants du Pokémon empêchent sa Précision de baisser.', 'Keen Eye', 'Regard Vif'),
(127, 'The heatproof body of the Pokémon halves the damage from Fire-type moves that hit it.', 'Diminue de moitié les dégâts infligés au Pokémon par les capacités de type Feu.', 'Heatproof', 'Ignifugé'),
(128, 'The Pokémon is oblivious, and that keeps it from being infatuated or falling for taunts.', 'Le Pokémon est un grand benêt, ce qui l’immunise contre l’attraction ou la provocation.', 'Oblivious', 'Benêt'),
(129, 'The Pokémon’s proud of its powerful pincers. They prevent other Pokémon from lowering its Attack stat.', 'Le Pokémon est armé de lames tranchantes qui font sa fierté et empêchent son Attaque de baisser.', 'Hyper Cutter', 'Hyper Cutter'),
(130, 'Items held by the Pokémon are stuck fast and cannot be removed by other Pokémon.', 'Les objets sont collés au corps gluant du Pokémon, ce qui empêche ses adversaires de les dérober.', 'Sticky Hold', 'Glue'),
(131, 'Restores HP if the Pokémon is poisoned, instead of losing HP.', 'Quand le Pokémon est empoisonné, il regagne des PV au lieu d’en perdre.', 'Poison Heal', 'Soin Poison'),
(132, 'The Pokémon can’t use any held items.', 'Le Pokémon ne peut utiliser aucun objet tenu.', 'Klutz', 'Maladresse'),
(133, 'Boosts its Speed stat if hit by an Electric-type move, instead of taking damage.', 'Si le Pokémon est touché par une capacité Électrik, il ne subit aucun dégât et sa Vitesse augmente.', 'Motor Drive', 'Motorisé'),
(134, 'Reduces the power of supereffective attacks taken.', 'Réduit les dégâts subis lorsque le Pokémon est touché par une capacité super efficace.', 'Solid Rock', 'Solide Roc'),
(135, 'The Pokémon may gather Honey after a battle.', 'Le Pokémon peut parfois trouver du Miel après un combat.', 'Honey Gather', 'Cherche Miel'),
(136, 'Boosts move power when the Pokémon moves last.', 'Augmente la puissance des capacités du Pokémon s’il attaque en dernier.', 'Analytic', 'Analyste'),
(137, 'Halves the Pokémon’s weight.', 'Divise par deux le poids du Pokémon.', 'Light Metal', 'Light Metal'),
(138, 'Its limber body protects the Pokémon from paralysis.', 'Le Pokémon s’est suffisamment échauffé, ce qui l’immunise contre la paralysie.', 'Limber', 'Échauffement');

-- --------------------------------------------------------

--
-- Structure de la table `fast_move`
--

CREATE TABLE `fast_move` (
  `id` int(3) UNSIGNED NOT NULL,
  `damage` int(3) UNSIGNED DEFAULT NULL,
  `dps` decimal(3,1) UNSIGNED DEFAULT NULL,
  `energy` int(3) UNSIGNED DEFAULT NULL,
  `eps` decimal(3,1) UNSIGNED DEFAULT NULL,
  `move_duration` int(4) UNSIGNED DEFAULT NULL,
  `name_en` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_fr` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sound_fx` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fast_move`
--

INSERT INTO `fast_move` (`id`, `damage`, `dps`, `energy`, `eps`, `move_duration`, `name_en`, `name_fr`, `sound_fx`, `type`) VALUES
(1, 35, '15.9', 0, '0.0', 2200, 'Struggle', 'Lutte', 'struggle.wav', 1),
(2, 11, '13.8', 6, '7.5', 800, 'Steel Wing', 'Aile d\'Acier', 'steel_wing.wav', 9),
(3, 15, '13.6', 9, '8.2', 1100, 'Dragon Tail', 'Draco-Queue', 'dragon_tail.wav', 16),
(4, 15, '13.6', 7, '6.4', 1100, 'Iron Tail', 'Queue de Fer', 'iron_tail.wav', 9),
(5, 12, '13.3', 7, '7.8', 900, 'Rock Throw', 'Jet-Pierres', 'rock_throw.wav', 6),
(6, 12, '13.3', 8, '8.9', 900, 'Counter', 'Riposte', 'counter.wav', 2),
(7, 16, '13.3', 8, '6.7', 1200, 'Waterfall', 'Cascade', 'waterfall.wav', 11),
(8, 16, '13.3', 8, '6.7', 1200, 'Smack Down', 'Anti-Air', 'smack_down.wav', 6),
(9, 13, '13.0', 7, '7.0', 1000, 'Razor Leaf', 'Tranch\'Herbe', 'razor_leaf.wav', 12),
(10, 9, '12.9', 6, '8.6', 700, 'Shadow Claw', 'Griffe Ombre', 'shadow_claw.wav', 8),
(11, 14, '12.7', 10, '9.1', 1100, 'Fire Spin', 'Danse Flamme', 'fire_spin.wav', 10),
(12, 10, '12.5', 7, '8.8', 800, 'Poison Jab', 'Direct Toxik', 'poison_jab.wav', 4),
(13, 20, '12.5', 15, '9.4', 1600, 'Confusion', 'Choc Mental', 'confusion.wav', 14),
(14, 11, '12.2', 8, '8.9', 900, 'Fire Fang', 'Crocs Feu', 'fire_fang.wav', 10),
(15, 6, '12.0', 4, '8.0', 500, 'Bite', 'Morsure', 'bite.wav', 17),
(16, 6, '12.0', 4, '8.0', 500, 'Dragon Breath', 'DracoSouffle', 'dragon_breath.wav', 16),
(17, 6, '12.0', 4, '8.0', 500, 'Scratch', 'Griffe', 'scratch.wav', 1),
(18, 7, '11.7', 6, '10.0', 600, 'Vine Whip', 'Fouet Lianes', 'vine_wrap.wav', 12),
(19, 7, '11.7', 6, '10.0', 600, 'Pound', 'écras\'Face', 'pound.wav', 1),
(20, 14, '11.7', 10, '8.3', 1200, 'Air Slash', 'Lame d\'Air', 'air_slash.wav', 3),
(21, 15, '11.5', 10, '7.7', 1300, 'Rock Smash', 'éclate-Roc', 'rock_smash.wav', 2),
(22, 8, '11.4', 7, '10.0', 700, 'Metal Claw', 'Griffe Acier', 'metal_claw.wav', 9),
(23, 9, '11.3', 8, '10.0', 800, 'Acid', 'Acide', 'acid.wav', 4),
(24, 10, '11.1', 8, '8.9', 900, 'Frost Breath', 'Souffle Glacé', 'frost_breath.wav', 15),
(25, 10, '11.1', 9, '10.0', 900, 'Feint Attack', 'Feinte', 'feint_attack.wav', 17),
(26, 12, '10.9', 10, '9.1', 1100, 'Zen Headbutt', 'Psykoud\'Boul', 'zen_headbutt.wav', 14),
(27, 12, '10.9', 12, '10.9', 1100, 'Extrasensory', 'Extrasenseur', 'extrasensory.wav', 14),
(28, 12, '10.9', 12, '10.9', 1100, 'Snarl', 'Aboiement', 'snarl.wav', 17),
(29, 15, '10.7', 12, '8.6', 1400, 'Mud-Slap', 'Coud\'Boue', 'mud_slap.wav', 5),
(30, 5, '10.0', 6, '12.0', 500, 'Bug Bite', 'Piqûre', 'bug_bite.wav', 7),
(31, 7, '10.0', 8, '11.4', 700, 'Sucker Punch', 'Coup Bas', 'sucker_punch.wav', 17),
(32, 6, '10.0', 6, '10.0', 600, 'Low Kick', 'Balayage', 'low_kick.wav', 2),
(33, 8, '10.0', 10, '12.5', 800, 'Karate Chop', 'Poing-Karaté', 'karate_chop.wav', 2),
(34, 10, '10.0', 10, '10.0', 1000, 'Ember', 'Flammèche', 'ember.wav', 10),
(35, 8, '10.0', 9, '11.3', 800, 'Wing Attack', 'Cru-Aile', 'wing_attack.wav', 3),
(36, 10, '10.0', 10, '10.0', 1000, 'Peck', 'Picpic', 'peck.wav', 3),
(37, 5, '10.0', 6, '12.0', 500, 'Lick', 'Léchouille', 'lick.wav', 8),
(38, 12, '10.0', 12, '10.0', 1200, 'Ice Shard', 'éclats Glace', 'ice_shard.wav', 15),
(39, 8, '10.0', 10, '12.5', 800, 'Quick Attack', 'Vive-Attaque', 'quick_attack.wav', 1),
(40, 5, '10.0', 5, '10.0', 500, 'Tackle', 'Charge', 'tackle.wav', 1),
(41, 5, '10.0', 5, '10.0', 500, 'Cut', 'Coupe', 'cut.wav', 1),
(42, 9, '10.0', 10, '11.1', 900, 'Bullet Punch', 'Pisto-Poing', 'bullet_punch.wav', 9),
(43, 5, '10.0', 5, '10.0', 500, 'Water Gun', 'Pistolet à Eau', 'water_gun.wav', 11),
(44, 12, '10.0', 14, '11.7', 1200, 'Bubble', 'écume', 'bubble.wav', 11),
(45, 15, '10.0', 15, '10.0', 1500, 'Struggle Bug', 'Survinsecte', 'struggle_bug.wav', 7),
(46, 15, '10.0', 15, '10.0', 1500, 'Hidden Power', 'Puissance Cachée', 'hidden_power.wav', 1),
(47, 10, '9.1', 14, '12.7', 1100, 'Infestation', 'Harcèlement', 'infestation.wav', 7),
(48, 20, '8.7', 25, '10.9', 2300, 'Volt Switch', 'Change éclair', 'volt_switch.wav', 13),
(49, 6, '8.6', 9, '12.9', 700, 'Spark', 'étincelle', 'spark.wav', 13),
(50, 5, '8.3', 8, '13.3', 600, 'Thunder Shock', 'éclair', 'thunder_shock.wav', 13),
(51, 5, '8.3', 7, '11.7', 600, 'Mud Shot', 'Tir de Boue', 'mud_shot.wav', 5),
(52, 5, '8.3', 8, '13.3', 600, 'Psycho Cut', 'Coupe Psycho', 'psycho_cut.wav', 14),
(53, 5, '8.3', 7, '11.7', 600, 'Poison Sting', 'Dard-Venin', 'poison_sting.wav', 4),
(54, 10, '8.3', 15, '12.5', 1200, 'Hex', 'Châtiment', 'hex.wav', 8),
(55, 3, '7.5', 6, '15.0', 400, 'Fury Cutter', 'Taillade', 'fury_cutter.wav', 7),
(56, 8, '7.3', 15, '13.6', 1100, 'Charge Beam', 'Rayon Chargé', 'charge_beam.wav', 13),
(57, 8, '7.3', 14, '12.7', 1100, 'Astonish', 'étonnement', 'astonish.wav', 8),
(58, 8, '7.3', 14, '12.7', 1100, 'Bullet Seed', 'Balle Graine', 'bullet_seed.wav', 12),
(59, 8, '6.7', 10, '8.3', 1200, 'Take Down', 'Bélier', 'take_down.wav', 1),
(60, 6, '6.0', 15, '15.0', 1000, 'Powder Snow', 'Poudreuse', 'powder_snow.wav', 15),
(61, 5, '3.8', 20, '15.4', 1300, 'Present', 'Cadeau', 'present.wav', 1),
(62, 0, '0.0', 20, '11.6', 1730, 'Splash', 'Trempette', 'splash.wav', 11),
(63, 0, '0.0', 0, '0.0', 2230, 'Transform', 'Morphing', 'transform.wav', 1),
(64, 0, '0.0', 15, '8.8', 1700, 'Yawn', 'Bâillement', 'yawn.wav', 1);

-- --------------------------------------------------------

--
-- Structure de la table `main_move`
--

CREATE TABLE `main_move` (
  `id` int(3) UNSIGNED NOT NULL,
  `damage` int(3) UNSIGNED DEFAULT NULL,
  `dps` decimal(3,1) UNSIGNED DEFAULT NULL,
  `energy` int(3) UNSIGNED DEFAULT NULL,
  `move_duration` int(4) UNSIGNED DEFAULT NULL,
  `name_en` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_fr` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slot` int(1) UNSIGNED DEFAULT NULL,
  `sound_fx` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `main_move`
--

INSERT INTO `main_move` (`id`, `damage`, `dps`, `energy`, `move_duration`, `name_en`, `name_fr`, `slot`, `sound_fx`, `type`) VALUES
(1, 130, '76.5', 100, 1700, 'Origin Pulse', 'Onde Originelle', 1, 'origin_pulse.wav', 11),
(2, 130, '76.5', 100, 1700, 'Precipice Blades', 'Lame Pangéenne', 1, 'precipice_blades.wav', 6),
(3, 90, '47.4', 50, 1900, 'Hydro Cannon', 'Hydroblast', 2, 'hydro_cannon.wav', 11),
(4, 80, '47.1', 50, 1700, 'Doom Desire', 'Carnareket', 2, 'doom_desire.wav', 9),
(5, 90, '45.0', 100, 2000, 'Brave Bird', 'Rapace', 1, 'brave_bird.wav', 3),
(6, 120, '44.4', 100, 2700, 'Future Sight', 'Prescience', 1, 'future_sight.wav', 14),
(7, 100, '43.5', 100, 2300, 'Stone Edge', 'Lame de Roc', 1, 'stone_edge.wav', 6),
(8, 100, '43.5', 100, 2300, 'Close Combat', 'Close Combat', 1, 'close_combat.wav', 2),
(9, 110, '42.3', 100, 2600, 'Petal Blizzard', 'Tempête Florale', 1, 'petal_blizzard.wav', 12),
(10, 130, '41.9', 100, 3100, 'Blizzard', 'Blizzard', 1, 'blizzard.wav', 15),
(11, 130, '41.9', 100, 3100, 'Gunk Shot', 'Détricanon', 1, 'gunk_shot.wav', 4),
(12, 100, '41.7', 100, 2400, 'Thunder', 'Fatal-Foudre', 1, 'thunder.wav', 13),
(13, 150, '41.7', 100, 3600, 'Draco Meteor', 'Draco Météore', 1, 'draco_meteor.wav', 16),
(14, 90, '40.9', 100, 2200, 'Megahorn', 'Mégacorne', 1, 'megahorn.wav', 7),
(15, 110, '40.7', 100, 2700, 'Hurricane', 'Vent Violent', 1, 'hurricane.wav', 3),
(16, 140, '40.0', 100, 3500, 'Focus Blast', 'Exploforce', 1, 'focus_blast.wav', 2),
(17, 80, '40.0', 50, 2000, 'Sky Attack', 'Piqué', 2, 'sky_attack.wav', 3),
(18, 160, '40.0', 100, 4000, 'Overheat', 'Surchauffe', 1, 'overheat.wav', 10),
(19, 150, '39.5', 100, 3800, 'Hyper Beam', 'Ultralaser', 1, 'hyper_beam.wav', 1),
(20, 130, '39.4', 100, 3300, 'Hydro Pump', 'Hydrocanon', 1, 'hydro_pump.wav', 11),
(21, 100, '38.5', 50, 2600, 'Frenzy Plant', 'Végé-Attack', 2, 'frenzy_plant.wav', 12),
(22, 100, '38.5', 50, 2600, 'Meteor Mash', 'Poing Météore', 2, 'meteor_mash.wav', 9),
(23, 65, '38.2', 50, 1700, 'Surf', 'Surf', 2, 'surf.wav', 11),
(24, 140, '37.8', 100, 3700, 'Zap Cannon', 'élecanon', 1, 'zap_cannon.wav', 13),
(25, 60, '37.5', 33, 1600, 'Weather Ball', 'Ball\'Météo', 3, 'weather_ball.wav', 10),
(26, 60, '37.5', 33, 1600, 'Weather Ball', 'Ball\'Météo', 3, 'weather_ball.wav', 15),
(27, 60, '37.5', 33, 1600, 'Weather Ball', 'Ball\'Météo', 3, 'weather_ball.wav', 6),
(28, 60, '37.5', 33, 1600, 'Weather Ball', 'Ball\'Météo', 3, 'weather_ball.wav', 11),
(29, 45, '37.5', 33, 1200, 'Blaze Kick', 'Blaze Kick', 3, 'blaze_kick.wav', 10),
(30, 100, '37.0', 100, 2700, 'Flash Cannon', 'Luminocanon', 1, 'flash_cannon.wav', 9),
(31, 180, '36.7', 100, 4900, 'Solar Beam', 'Lance-Soleil', 1, 'solar_beam.wav', 12),
(32, 100, '35.7', 100, 2800, 'Psychic', 'Psyko', 1, 'psychic.wav', 14),
(33, 70, '35.0', 50, 2000, 'Foul Play', 'Tricherie', 2, 'foul_play.wav', 17),
(34, 80, '34.8', 50, 2300, 'Sludge Bomb', 'Bomb-Beurk', 2, 'sludge_bomb.wav', 4),
(35, 90, '34.6', 50, 2600, 'Power Whip', 'Mégafouet', 2, 'power_hip.wav', 12),
(36, 90, '34.6', 50, 2600, 'Wild Charge', 'éclair Fou', 2, 'wild_charge.wav', 13),
(37, 90, '34.6', 50, 2600, 'Grass Knot', 'Noeud Herbe', 2, 'grass_knot.wav', 12),
(38, 110, '34.4', 100, 3200, 'Sludge Wave', 'Cradovague', 1, 'sludge_wave.wav', 4),
(39, 50, '33.3', 50, 1500, 'Cross Chop', 'Coup-Croix', 2, 'cross_chop.wav', 2),
(40, 120, '33.3', 100, 3600, 'Earthquake', 'Séisme', 1, 'earthquake.wav', 5),
(41, 100, '33.3', 50, 3000, 'Shadow Ball', 'Ball\'Ombre', 2, 'shadow_ball.wav', 8),
(42, 130, '33.3', 100, 3900, 'Moonblast', 'Pouvoir Lunaire', 1, 'moonblast.wav', 18),
(43, 140, '33.3', 100, 4200, 'Fire Blast', 'Déflagration', 1, 'fire_blast.wav', 10),
(44, 90, '33.3', 50, 2700, 'Dynamic Punch', 'Dynamopoing', 2, 'dynamic_punch.wav', 2),
(45, 90, '33.3', 50, 2700, 'Avalanche', 'Avalanche', 2, 'avalanche.wav', 15),
(46, 70, '33.3', 50, 2100, 'Heavy Slam', 'Tacle Lourd', 2, 'heavy_slam.wav', 9),
(47, 110, '33.3', 50, 3300, 'Blast Burn', 'Rafale Feu', 2, 'blast_burn.wav', 10),
(48, 55, '32.4', 50, 1700, 'Stomp', 'écrasement', 2, 'stomp.wav', 1),
(49, 80, '32.0', 50, 2500, 'Thunderbolt', 'Tonnerre', 2, 'thunderbolt.wav', 13),
(50, 80, '32.0', 50, 2500, 'Hyper Fang', 'Croc de Mort', 2, 'hyper_fang.wav', 1),
(51, 70, '31.8', 50, 2200, 'Flamethrower', 'Lance-Flammes', 2, 'flamethrower.wav', 10),
(52, 95, '31.7', 100, 3000, 'Heat Wave', 'Canicule', 1, 'heat_wave.wav', 10),
(53, 60, '31.6', 50, 1900, 'Iron Head', 'Tête de fer', 2, 'iron_head.wav', 9),
(54, 90, '31.0', 50, 2900, 'Play Rough', 'Câlinerie', 2, 'play_rough.wav', 18),
(55, 90, '31.0', 50, 2900, 'Last Resort', 'Dernier Recours', 2, 'last_resort.wav', 1),
(56, 80, '29.6', 50, 2700, 'Rock Slide', 'éboulement', 2, 'rock_slide.wav', 6),
(57, 50, '29.4', 33, 1700, 'Dragon Claw', 'Dracogriffe', 3, 'dragon_claw.wav', 16),
(58, 70, '29.2', 33, 2400, 'Leaf Blade', 'Lame-Feuille', 3, 'leaf_blade.wav', 12),
(59, 80, '28.6', 50, 2800, 'Drill Run', 'Tunnelier', 2, 'drill_run.wav', 5),
(60, 100, '28.6', 50, 3500, 'Dazzling Gleam', 'éclat Magique', 2, 'dazzling_gleam.wav', 18),
(61, 110, '28.2', 50, 3900, 'Outrage', 'Colère', 2, 'outrage.wav', 16),
(62, 45, '28.1', 33, 1600, 'X-Scissor', 'Plaie-Croix', 3, 'x_scissor.wav', 7),
(63, 100, '27.8', 50, 3600, 'Earth Power', 'Earth Power', 2, 'earth_power.wav', 5),
(64, 80, '27.6', 50, 2900, 'Power Gem', 'Rayon Gemme', 2, 'power_gem.wav', 6),
(65, 80, '27.3', 50, 3300, 'Ice Beam', 'Laser Glace', 2, 'ice_beam.wav', 6),
(66, 60, '27.3', 50, 2200, 'Submission', 'Sacrifice', 2, 'submission.wav', 2),
(67, 70, '26.9', 50, 2600, 'Flame Burst', 'Rebondifeu', 2, 'flame_burst.wav', 10),
(68, 80, '26.7', 50, 3000, 'Dark Pulse', 'Vibroscur', 2, 'dark_pulse.wav', 17),
(69, 40, '26.7', 33, 1500, 'Cross Poison', 'Poison-Croix', 3, 'cross_poison.wav', 4),
(70, 50, '26.3', 33, 1900, 'Ice Punch', 'Poing-Glace', 3, 'ice_punch.wav', 15),
(71, 50, '26.3', 33, 1900, 'Aqua Tail', 'Hydroqueue', 3, 'aqua_tail.wav', 11),
(72, 50, '26.3', 33, 1900, 'Body Slam', 'Plaquage', 3, 'body_slam.wav', 1),
(73, 55, '26.2', 33, 2100, 'Seed Bomb', 'Canon Graine', 3, 'seed_bomb.wav', 12),
(74, 60, '26.1', 33, 2300, 'Drill Peck', 'Bec Vrille', 3, 'drill_peck.wav', 3),
(75, 60, '26.1', 50, 2300, 'Brine', 'Saumure', 2, 'brine.wav', 11),
(76, 65, '26.0', 33, 2500, 'Discharge', 'Coup d\'Jus', 3, 'discharge.wav', 13),
(77, 75, '25.9', 50, 2900, 'Signal Beam', 'Rayon Signal', 2, 'signal_beam.wav', 7),
(78, 70, '25.0', 33, 2800, 'Magnet Bomb', 'Bombaimant', 3, 'magnet_bomb.wav', 9),
(79, 45, '25.0', 33, 1800, 'Thunder Punch', 'Poing-éclair', 3, 'thunder_punch.wav', 13),
(80, 90, '25.0', 50, 3600, 'Dragon Pulse', 'Dracochoc', 2, 'dragon_pulse.wav', 16),
(81, 40, '25.0', 33, 1600, 'Bone Club', 'Massd\'Os', 3, 'bone_club.wav', 5),
(82, 55, '25.0', 33, 2200, 'Fire Punch', 'Poing de Feu', 3, 'fire_punch.wav', 10),
(83, 40, '25.0', 33, 1600, 'Brick Break', 'Casse-Brique', 3, 'brick_break.wav', 2),
(84, 50, '25.0', 33, 2000, 'Power Up Punch', 'Power Up Punch', 3, 'power_up_punch.wav', 2),
(85, 90, '24.3', 50, 3700, 'Bug Buzz', 'Bourdon', 2, 'bug_buzz.wav', 7),
(86, 80, '24.2', 50, 3300, 'Gyro Ball', 'Gyroballe', 2, 'gyro_ball.wav', 9),
(87, 65, '24.1', 33, 2700, 'Psyshock', 'Choc Psy', 3, 'psyshock.wav', 14),
(88, 55, '23.9', 33, 2300, 'Mud Bomb', 'Boue-Bombe', 3, 'mud_bomb.wav', 5),
(89, 50, '23.8', 33, 2100, 'Sludge', 'Détritus', 3, 'sludge.wav', 4),
(90, 50, '23.8', 33, 2100, 'Rock Blast', 'Boule Roc', 3, 'rock_blast.wav', 6),
(91, 45, '23.7', 33, 1900, 'Bubble Beam', 'Bulles d\'O', 3, 'bubble_beam.wav', 11),
(92, 40, '23.5', 33, 1700, 'Shadow Punch', 'Poing Ombre', 3, 'shadow_punch.wav', 8),
(93, 60, '23.1', 50, 2600, 'Draining Kiss', 'Vampibaiser', 2, 'draining_kiss.wav', 18),
(94, 60, '23.1', 50, 2600, 'Night Shade', 'Ombre Nocturne', 2, 'night_shade.wav', 8),
(95, 90, '23.1', 50, 3900, 'Energy Ball', 'éco-Sphère', 2, 'energy_ball.wav', 12),
(96, 60, '23.1', 50, 2600, 'Mirror Coat', 'Voile Miroir', 2, 'mirror_coat.wav', 14),
(97, 55, '22.9', 33, 2400, 'Aerial Ace', 'Aéropique', 3, 'aerial_ace.wav', 3),
(98, 80, '22.9', 50, 3600, 'Bulldoze', 'Piétisol', 2, 'bulldoze.wav', 5),
(99, 50, '22.7', 33, 2200, 'Night Slash', 'Tranche-Nuit', 3, 'night_slash.wav', 17),
(100, 80, '22.5', 50, 3550, 'Aurora Beam', 'Onde Boréale', 2, 'aurora_beam.wav', 15),
(101, 60, '22.2', 50, 2700, 'Flame Wheel', 'Roue de Feu', 2, 'flame_wheel.wav', 10),
(102, 60, '22.2', 50, 2700, 'Air Cutter', 'Tranch\'Air', 2, 'air_cutter.wav', 3),
(103, 70, '21.9', 50, 3200, 'Psybeam', 'Rafale Psy', 2, 'psybeam.wav', 14),
(104, 70, '21.9', 50, 3200, 'Rock Tomb', 'Tomberoche', 2, 'rock_tomb.wav', 6),
(105, 70, '21.9', 50, 3200, 'Water Pulse', 'Vibraqua', 2, 'water_pulse.wav', 11),
(106, 70, '21.9', 33, 3200, 'Crunch', 'Mâchouille', 3, 'crunch.wav', 17),
(107, 50, '21.7', 33, 2300, 'Ominous Wind', 'Vent Mauvais', 3, 'ominus_wind.wav', 8),
(108, 80, '21.6', 50, 3700, 'Scald', 'ébulition', 2, 'scald.wav', 11),
(109, 40, '21.6', 33, 1850, 'Horn Attack', 'Koud\'Korne', 3, 'horn_attack.wav', 1),
(110, 60, '21.4', 50, 2800, 'Swift', 'Météores', 2, 'swift.wav', 1),
(111, 100, '21.3', 50, 4700, 'Dig', 'Tunnel', 2, 'dig.wav', 5),
(112, 40, '21.1', 33, 1900, 'Low Sweep', 'Balayette', 3, 'low_sweep.wav', 2),
(113, 60, '20.7', 33, 2900, 'Wrap', 'Ligotage', 3, 'wrap.wav', 1),
(114, 35, '20.6', 33, 1700, 'Poison Fang', 'Crochet Venin', 3, 'poison_fang.wav', 4),
(115, 70, '20.0', 33, 3500, 'Ancient Power', 'Pouvoir Antique', 3, 'ancient_power.wav', 6),
(116, 80, '20.0', 50, 4000, 'Sand Tomb', 'Tourbi-Sable', 2, 'sand_tomb.wav', 5),
(117, 70, '18.9', 33, 3700, 'Silver Wind', 'Vent Argenté', 3, 'silver_wind.wav', 7),
(118, 35, '18.4', 33, 1900, 'Vice Grip', 'Force Poigne', 3, 'vice_grip.wav', 1),
(119, 70, '18.4', 33, 3800, 'Flame Charge', 'Nitrocharge', 3, 'flame_charge.wav', 10),
(120, 60, '18.2', 33, 3300, 'Icy Wind', 'Vent Glace', 3, 'icy_wind.wav', 15),
(121, 70, '17.9', 33, 3900, 'Disarming Voice', 'Voix Enjôleuse', 3, 'disarming_voice.wav', 18),
(122, 70, '17.5', 50, 4000, 'Psycho Boost', 'Psycho Boost', 2, 'psycho_boost.wav', 14),
(123, 45, '17.3', 33, 2600, 'Aqua Jet', 'Aqua-Jet', 3, 'aqua_jet.wav', 11),
(124, 50, '17.2', 33, 2900, 'Shadow Sneak', 'Ombre Portée', 3, 'shadow_sneak.wav', 8),
(125, 45, '16.1', 33, 2800, 'Twister', 'Ouragan', 3, 'twister.wav', 16),
(126, 35, '15.9', 33, 2200, 'Struggle', 'Lutte', 3, 'struggle.wav', 1),
(127, 45, '14.5', 33, 3100, 'Leaf Tornado', 'Leaf Tornado', 3, 'leaf_tornado.wav', 12),
(128, 20, '6.7', 50, 3000, 'Acid Spray', 'Acid Spray', 2, 'acid_spray.wav', 4),
(129, 0, '0.0', 0, 0, 'Transform', 'Morphing', 0, 'morphing.wav', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pokeball`
--

CREATE TABLE `pokeball` (
  `id` int(3) UNSIGNED NOT NULL,
  `generation` int(2) UNSIGNED DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokeball`
--

INSERT INTO `pokeball` (`id`, `generation`, `name`, `img`) VALUES
(1, 1, 'poke ball', 'pokeball.png'),
(2, 1, 'super ball', 'superball.png'),
(3, 1, 'hyper ball', 'hyperball.png'),
(4, 1, 'master ball', 'masterball.png'),
(5, 1, 'safari ball', 'safariball.png'),
(6, 2, 'speed ball', 'speedball.png'),
(7, 2, 'lure ball', 'lureball.png'),
(8, 2, 'level ball', 'levelball.png'),
(9, 2, 'heavy ball', 'heavyball.png'),
(10, 2, 'love ball', 'loveball.png'),
(11, 2, 'friend ball', 'friendball.png'),
(12, 2, 'moon ball', 'moonball.png'),
(13, 2, 'sport ball', 'sportball.png'),
(14, 3, 'honor ball', 'honorball.png'),
(15, 3, 'net ball', 'netball.png'),
(16, 3, 'repeat ball', 'repeatball.png'),
(17, 3, 'dive ball', 'diveball.png'),
(18, 3, 'luxury ball', 'luxuryball.png'),
(19, 3, 'timer ball', 'timerball.png'),
(20, 3, 'nestball', 'nestball.png'),
(21, 4, 'heal ball', 'healball.png'),
(22, 4, 'dusk ball', 'duskball.png'),
(23, 4, 'quick ball', 'quickball.png'),
(24, 4, 'park ball', 'parkball.png'),
(25, 4, 'cherish ball', 'cherishball.png'),
(26, 5, 'dream ball', 'dreamball.png'),
(27, 7, 'ultra ball', 'ultraball.png');

-- --------------------------------------------------------

--
-- Structure de la table `pokedex`
--

CREATE TABLE `pokedex` (
  `id` int(2) UNSIGNED NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokedex`
--

INSERT INTO `pokedex` (`id`, `name`) VALUES
(1, 'Kanto'),
(2, 'Johto'),
(3, 'Hoenn'),
(4, 'Sinnoh');

-- --------------------------------------------------------

--
-- Structure de la table `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(4) UNSIGNED NOT NULL,
  `attack` int(3) UNSIGNED DEFAULT NULL,
  `attack_max` int(3) UNSIGNED DEFAULT NULL,
  `attack_spe` int(3) UNSIGNED DEFAULT NULL,
  `base_experience` int(3) UNSIGNED DEFAULT NULL,
  `base_happiness` int(3) UNSIGNED DEFAULT NULL,
  `buddy_walk` int(2) UNSIGNED DEFAULT NULL,
  `capture_rate` int(5) UNSIGNED DEFAULT NULL,
  `defense` int(3) UNSIGNED DEFAULT NULL,
  `defense_max` int(3) UNSIGNED DEFAULT NULL,
  `defense_spe` int(3) UNSIGNED DEFAULT NULL,
  `escape_rate` int(4) UNSIGNED DEFAULT NULL,
  `height` decimal(5,2) UNSIGNED DEFAULT NULL,
  `image` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_fr` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(4) UNSIGNED DEFAULT NULL,
  `pc_max` int(4) UNSIGNED DEFAULT NULL,
  `pv` int(4) UNSIGNED DEFAULT NULL,
  `pv_max` int(4) UNSIGNED DEFAULT NULL,
  `scream` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specie_en` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specie_fr` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speed` int(4) UNSIGNED DEFAULT NULL,
  `stamina_max` int(4) UNSIGNED DEFAULT NULL,
  `weight` decimal(5,2) UNSIGNED DEFAULT NULL,
  `abilitie_1` int(3) UNSIGNED DEFAULT NULL,
  `abilitie_2` int(3) UNSIGNED DEFAULT NULL,
  `abilitie_3` int(3) UNSIGNED DEFAULT NULL,
  `fast_move_1` int(3) UNSIGNED DEFAULT NULL,
  `fast_move_2` int(3) UNSIGNED DEFAULT NULL,
  `fast_move_3` int(3) UNSIGNED DEFAULT NULL,
  `main_move_1` int(3) UNSIGNED DEFAULT NULL,
  `main_move_2` int(3) UNSIGNED DEFAULT NULL,
  `main_move_3` int(3) UNSIGNED DEFAULT NULL,
  `main_move_4` int(3) UNSIGNED DEFAULT NULL,
  `pokedex` int(2) UNSIGNED DEFAULT NULL,
  `type_1` int(2) UNSIGNED DEFAULT NULL,
  `type_2` int(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`id`, `attack`, `attack_max`, `attack_spe`, `base_experience`, `base_happiness`, `buddy_walk`, `capture_rate`, `defense`, `defense_max`, `defense_spe`, `escape_rate`, `height`, `image`, `name_en`, `name_fr`, `order`, `pc_max`, `pv`, `pv_max`, `scream`, `specie_en`, `specie_fr`, `speed`, `stamina_max`, `weight`, `abilitie_1`, `abilitie_2`, `abilitie_3`, `fast_move_1`, `fast_move_2`, `fast_move_3`, `main_move_1`, `main_move_2`, `main_move_3`, `main_move_4`, `pokedex`, `type_1`, `type_2`) VALUES
(1, 49, 118, 65, 64, 70, 3, 20, 49, 111, 65, 10, '0.70', '001.png', 'Bulbasaur', 'Bulbizarre', 1, 1115, 45, 111, 'pv001.wav', 'Seed Pokémon', 'Pokémon Graine', 45, 128, '6.90', 5, 4, NULL, 18, 40, NULL, 73, 34, 35, NULL, 1, 4, 12),
(2, 62, 151, 80, 142, 70, 3, 10, 63, 143, 80, 7, '1.00', '002.png', 'Ivysaur', 'Herbizarre', 2, 1699, 60, 132, 'pv002.wav', 'Seed Pokémon', 'Pokémon Graine', 60, 155, '13.00', 5, 4, NULL, 18, 9, NULL, 34, 35, 31, NULL, 1, 4, 12),
(3, 82, 198, 100, 236, 70, 3, 5, 83, 189, 100, 5, '2.00', '003.png', 'Venusaur', 'Florizarre', 3, 2720, 80, 160, 'pv003.wav', 'Seed Pokémon', 'Pokémon Graine', 80, 190, '100.00', 5, 4, NULL, 18, 9, NULL, 34, 9, 31, 21, 1, 4, 12),
(4, 52, 116, 60, 62, 70, 3, 20, 43, 93, 50, 10, '0.60', '004.png', 'Charmander', 'Salamèche', 4, 980, 39, 103, 'pv004.wav', 'Lizard Pokémon', 'Pokémon Lézard', 65, 118, '8.50', NULL, NULL, NULL, 17, 34, NULL, 119, 67, 51, NULL, 1, 10, NULL),
(5, 64, 158, 80, 142, 70, 3, 10, 58, 126, 65, 7, '1.10', '005.png', 'Charmeleon', 'Reptincel', 5, 1653, 58, 129, 'pv005.wav', 'Flame Pokémon', 'Pokémon Flamme', 80, 151, '19.00', NULL, NULL, NULL, 34, 14, NULL, 82, 67, 51, NULL, 1, 10, NULL),
(6, 84, 223, 109, 240, 70, 3, 5, 78, 173, 85, 5, '1.70', '006.png', 'Charizard', 'Dracaufeu', 6, 2889, 78, 157, 'pv006.wav', 'Flame Pokémon', 'Pokémon Flamme', 100, 186, '90.50', 3, 2, NULL, 20, 11, NULL, 54, 43, 18, 47, 1, 3, 10),
(7, 48, 94, 50, 63, 70, 3, 20, 65, 121, 64, 10, '0.50', '007.png', 'Squirtle', 'Carapuce', 7, 946, 44, 111, 'pv007.wav', 'Tiny Turtle Pokémon', 'Pokémon Minitortue', 43, 127, '9.00', NULL, NULL, NULL, 40, 44, NULL, 123, 71, 105, NULL, 1, 11, NULL),
(8, 63, 126, 65, 142, 70, 3, 10, 80, 155, 80, 7, '1.00', '008.png', 'Wartortle', 'Carabaffe', 8, 1488, 59, 131, 'pv008.wav', 'Turtle Pokémon', 'Pokémon Tortue', 58, 153, '22.50', NULL, NULL, NULL, 43, 15, NULL, 123, 65, 20, NULL, 1, 11, NULL),
(9, 83, 171, 85, 239, 70, 3, 5, 100, 207, 105, 5, '1.60', '009.png', 'Blastoise', 'Tortank', 9, 2466, 79, 158, 'pv009.wav', 'Shellfish Pokémon', 'Pokémon Carapace', 78, 188, '85.50', NULL, NULL, NULL, 43, 15, NULL, 65, 30, 20, 3, 1, 11, NULL),
(10, 30, 55, 20, 39, 70, 1, 50, 35, 55, 20, 20, '0.30', '010.png', 'Caterpie', 'Chenipan', 10, 437, 45, 111, 'pv010.wav', 'Worm Pokémon', 'Pokémon Ver', 45, 128, '2.90', NULL, NULL, NULL, 30, 40, NULL, 126, NULL, NULL, NULL, 1, 7, NULL),
(11, 20, 45, 25, 72, 70, 1, 25, 55, 80, 25, 9, '0.70', '011.png', 'Metapod', 'Chrysacier', 11, 450, 50, 118, 'pv011.wav', 'Cocoon Pokémon', 'Pokémon Cocon', 30, 137, '9.90', NULL, NULL, NULL, 30, 40, NULL, 126, NULL, NULL, NULL, 1, 7, NULL),
(12, 45, 167, 90, 178, 70, 1, 13, 50, 137, 80, 6, '1.10', '012.png', 'Butterfree', 'Papilusion', 12, 1827, 60, 132, 'pv012.wav', 'Butterfly Pokémon', 'Pokémon Papillon', 70, 155, '32.00', 17, 45, NULL, 45, 13, NULL, 77, 85, 32, NULL, 1, 3, 7),
(13, 35, 63, 20, 39, 70, 1, 50, 30, 50, 20, 20, '0.30', '013.png', 'Weedle', 'Aspicot', 13, 456, 40, 105, 'pv013.wav', 'Hairy Bug Pokémon', 'Pokémon Insectopic', 50, 120, '3.20', 7, NULL, NULL, 30, 53, NULL, 126, NULL, NULL, NULL, 1, 4, 7),
(14, 25, 46, 25, 72, 70, 1, 25, 50, 75, 25, 29, '0.60', '014.png', 'Kakuna', 'Coconfort', 14, 432, 45, 111, 'pv014.wav', 'Cocoon Pokémon', 'Pokémon Cocon', 35, 128, '10.00', 16, NULL, NULL, 30, 53, NULL, 126, NULL, NULL, NULL, 1, 4, 7),
(15, 90, 169, 45, 178, 70, 1, 13, 40, 130, 80, 6, '1.00', '015.png', 'Beedrill', 'Dardargnan', 15, 1846, 65, 139, 'pv015.wav', 'Poison Bee Pokémon', 'Pokémon Guêpoison', 75, 163, '29.50', 12, 82, NULL, 12, 47, NULL, 62, 97, 34, NULL, 1, 4, 7),
(16, 45, 85, 35, 50, 70, 1, 50, 40, 73, 35, 20, '0.30', '016.png', 'Pidgey', 'Roucool', 16, 680, 40, 105, 'pv016.wav', 'Tiny Bird Pokémon', 'Pokémon Minoiseau', 56, 120, '1.80', 120, 15, 126, 40, 39, NULL, 125, 97, 102, NULL, 1, 3, 1),
(17, 60, 117, 50, 122, 70, 1, 25, 55, 105, 50, 9, '1.10', '017.png', 'Pidgeotto', 'Roucoups', 17, 1194, 63, 136, 'pv017.wav', 'Bird Pokémon', 'Pokémon Oiseau', 71, 160, '30.00', 120, 15, 126, 35, 2, NULL, 125, 97, 102, NULL, 1, 3, 1),
(18, 80, 166, 70, 216, 70, 1, 13, 75, 154, 70, 6, '1.50', '018.png', 'Pidgeot', 'Roucarnage', 18, 2129, 83, 164, 'pv018.wav', 'Bird Pokémon', 'Pokémon Oiseau', 101, 195, '39.50', 120, 15, 126, 2, 20, NULL, 5, 97, 15, NULL, 1, 3, 1),
(19, 56, 103, 25, 51, 70, 1, 50, 35, 70, 35, 20, '0.30', '019.png', 'Rattata', 'Rattata', 19, 734, 30, 91, 'pv019.wav', 'Mouse Pokémon', 'Pokémon Souris', 72, 102, '3.50', NULL, NULL, NULL, 40, 39, NULL, 72, 50, 111, NULL, 1, 1, NULL),
(20, 81, 161, 50, 145, 70, 1, 20, 60, 139, 70, 7, '0.70', '020.png', 'Raticate', 'Rattatac', 20, 1730, 55, 125, 'pv020.wav', 'Mouse Pokémon', 'Pokémon Souris', 97, 146, '18.50', NULL, NULL, NULL, 15, 39, NULL, 50, 111, 19, NULL, 1, 1, NULL),
(21, 60, 112, 31, 52, 70, 1, 50, 30, 60, 31, 15, '0.30', '021.png', 'Spearow', 'Piafabec', 21, 798, 40, 105, 'pv021.wav', 'Tiny Bird Pokémon', 'Pokémon Minoiseau', 70, 120, '2.00', 12, 126, NULL, 39, 36, NULL, 97, 74, 17, NULL, 1, 3, 1),
(22, 90, 182, 61, 155, 70, 1, 20, 65, 133, 61, 7, '1.20', '022.png', 'Fearow', 'Rapasdepic', 22, 1997, 65, 139, 'pv022.wav', 'Beak Pokémon', 'Pokémon Bec Oiseau', 100, 163, '38.00', 12, 126, NULL, 36, 2, NULL, 97, 59, 17, NULL, 1, 3, 1),
(23, 60, 110, 40, 58, 70, 3, 50, 44, 97, 54, 15, '2.00', '023.png', 'Ekans', 'Abo', 23, 927, 35, 98, 'pv023.wav', 'Snake Pokémon', 'Pokémon Serpent', 55, 111, '6.90', NULL, NULL, NULL, 53, 23, NULL, 114, 113, 34, NULL, 1, 4, NULL),
(24, 95, 167, 65, 157, 70, 3, 20, 69, 153, 79, 7, '3.50', '024.png', 'Arbok', 'Arbok', 24, 1921, 60, 132, 'pv024.wav', 'Cobra Pokémon', 'Pokémon Cobra', 80, 155, '65.00', NULL, NULL, NULL, 15, 23, 3, 128, 68, 38, 11, 1, 4, NULL),
(25, 55, 112, 50, 112, 70, 1, 20, 40, 96, 50, 10, '0.40', '025.png', 'Pikachu', 'Pikachu', 26, 938, 35, 98, 'pv025.wav', 'Mouse Pokémon', 'Pokémon Souris', 90, 111, '6.00', NULL, NULL, NULL, 50, 39, NULL, 76, 49, 36, NULL, 1, 13, NULL),
(26, 90, 193, 90, 218, 70, 1, 10, 55, 151, 80, 6, '0.80', '026.png', 'Raichu', 'Raichu', 27, 2182, 60, 132, 'pv026.wav', 'Mouse Pokémon', 'Pokémon Souris', 110, 155, '30.00', NULL, NULL, NULL, 49, 48, NULL, 83, 79, 36, NULL, 1, 13, NULL),
(27, 75, 126, 20, 60, 70, 3, 50, 85, 120, 30, 10, '0.60', '027.png', 'Sandshrew', 'Sabelette', 28, 1261, 50, 118, 'pv027.wav', 'Mouse Pokémon', 'Pokémon Souris', 40, 137, '12.00', NULL, NULL, NULL, 51, 17, NULL, 116, 56, 111, NULL, 1, 5, NULL),
(28, 100, 182, 45, 158, 70, 3, 20, 110, 175, 55, 6, '1.00', '028.png', 'Sandslash', 'Sablaireau', 29, 2374, 75, 153, 'pv028.wav', 'Mouse Pokémon', 'Pokémon Souris', 65, 181, '29.50', NULL, NULL, NULL, 51, 22, NULL, 104, 98, 40, NULL, 1, 5, NULL),
(29, 47, 86, 40, 55, 70, 3, 50, 52, 89, 40, 15, '0.40', '029.png', 'Nidoran♀', 'Nidoran♀', 30, 816, 55, 125, 'pv029.wav', 'Poison Pin Pokémon', 'Pokémon Vénépic', 41, 146, '7.00', NULL, NULL, NULL, 53, 15, NULL, 114, 72, 34, NULL, 1, 4, NULL),
(30, 62, 117, 55, 128, 70, 3, 25, 67, 120, 55, 7, '0.80', '030.png', 'Nidorina', 'Nidorina', 31, 1309, 70, 146, 'pv030.wav', 'Poison Pin Pokémon', 'Pokémon Vénépic', 56, 172, '20.00', NULL, NULL, NULL, 53, 15, NULL, 114, 34, 111, NULL, 1, 4, NULL),
(31, 92, 180, 75, 227, 70, 3, 13, 87, 173, 85, 5, '1.30', '031.png', 'Nidoqueen', 'Nidoqueen', 32, 2488, 90, 173, 'pv031.wav', 'Drill Pokémon', 'Pokémon Perceur', 76, 207, '60.00', 101, 10, 79, 15, 12, NULL, 63, 7, 38, 40, 1, 5, 4),
(32, 57, 105, 40, 55, 70, 3, 50, 40, 76, 40, 15, '0.50', '032.png', 'Nidoran♂', 'Nidoran♂', 33, 860, 46, 113, 'pv032.wav', 'Poison Pin Pokémon', 'Pokémon Vénépic', 50, 130, '9.00', NULL, NULL, NULL, 53, 36, NULL, 109, 72, 34, NULL, 1, 4, NULL),
(33, 72, 137, 55, 128, 70, 3, 25, 57, 111, 55, 7, '0.90', '033.png', 'Nidorino', 'Nidorino', 34, 1393, 61, 133, 'pv033.wav', 'Poison Pin Pokémon', 'Pokémon Vénépic', 65, 156, '19.50', NULL, NULL, NULL, 53, 12, NULL, 109, 34, 111, NULL, 1, 4, NULL),
(34, 102, 204, 85, 227, 70, 3, 13, 77, 156, 75, 5, '1.40', '034.png', 'Nidoking', 'Nidoking', 35, 2567, 81, 161, 'pv034.wav', 'Drill Pokémon', 'Pokémon Perceur', 85, 191, '62.00', 101, 10, 79, 12, 4, NULL, 14, 63, 38, 40, 1, 5, 4),
(35, 45, 107, 60, 113, 140, 1, 30, 48, 108, 65, 10, '0.60', '035.png', 'Clefairy', 'Mélofée', 37, 1155, 70, 146, 'pv035.wav', 'Fairy Pokémon', 'Pokémon Fée', 35, 172, '7.50', NULL, NULL, NULL, 19, 26, NULL, 72, 121, 42, NULL, 1, 18, NULL),
(36, 70, 178, 95, 217, 140, 1, 10, 73, 162, 90, 6, '1.30', '036.png', 'Clefable', 'Mélodelfe', 38, 2437, 95, 180, 'pv036.wav', 'Fairy Pokémon', 'Pokémon Fée', 60, 216, '40.00', NULL, NULL, NULL, 56, 26, NULL, 60, 32, 22, 42, 1, 18, NULL),
(37, 41, 96, 50, 60, 70, 3, 30, 40, 109, 65, 10, '0.60', '037.png', 'Vulpix', 'Goupix', 39, 883, 38, 102, 'pv037.wav', 'Fox Pokémon', 'Pokémon Renard', 65, 116, '9.90', NULL, NULL, NULL, 39, 34, NULL, 72, 119, 51, NULL, 1, 10, NULL),
(38, 76, 169, 81, 177, 70, 3, 10, 75, 190, 100, 6, '1.10', '038.png', 'Ninetales', 'Feunard', 40, 2279, 73, 150, 'pv038.wav', 'Fox Pokémon', 'Pokémon Renard', 100, 177, '19.90', NULL, NULL, NULL, 25, 11, NULL, 87, 52, 18, 31, 1, 10, NULL),
(39, 45, 80, 45, 95, 70, 1, 50, 20, 41, 25, 10, '0.50', '039.png', 'Jigglypuff', 'Rondoudou', 42, 724, 115, 207, 'pv039.wav', 'Balloon Pokémon', 'Pokémon Bouboule', 20, 251, '5.50', NULL, 13, 39, 19, 25, NULL, 121, 86, 54, 60, 1, 18, 1),
(40, 70, 156, 85, 196, 70, 1, 20, 45, 90, 50, 6, '1.00', '040.png', 'Wigglytuff', 'Grodoudou', 43, 1926, 140, 242, 'pv040.wav', 'Balloon Pokémon', 'Pokémon Bouboule', 45, 295, '12.00', 91, 13, 39, 19, 25, NULL, 65, 54, 60, 19, 1, 18, 1),
(41, 45, 83, 30, 49, 70, 1, 50, 35, 73, 40, 20, '0.80', '041.png', 'Zubat', 'Nosferapti', 44, 667, 40, 105, 'pv041.wav', 'Bat Pokémon', 'Pokémon Chovsouris', 55, 120, '7.50', 46, 18, NULL, 15, 39, NULL, 114, 110, 102, NULL, 1, 3, 4),
(42, 80, 161, 65, 159, 70, 1, 20, 70, 150, 75, 7, '1.60', '042.png', 'Golbat', 'Nosferalto', 45, 1976, 75, 153, 'pv042.wav', 'Bat Pokémon', 'Pokémon Chovsouris', 90, 181, '55.00', 46, 18, NULL, 15, 35, NULL, 114, 102, 41, NULL, 1, 3, 4),
(43, 50, 131, 75, 64, 70, 3, 60, 55, 112, 65, 15, '0.50', '043.png', 'Oddish', 'Mystherbe', 47, 1228, 45, 111, 'pv043.wav', 'Weed Pokémon', 'Pokémon Racine', 30, 128, '5.40', 7, 5, NULL, 23, 9, NULL, 73, 34, 42, NULL, 1, 4, 12),
(44, 65, 153, 85, 138, 70, 3, 30, 70, 136, 75, 7, '0.80', '044.png', 'Gloom', 'Ortide', 48, 1681, 60, 132, 'pv044.wav', 'Weed Pokémon', 'Pokémon Racine', 40, 155, '8.60', 123, 5, NULL, 23, 9, NULL, 34, 9, 42, NULL, 1, 4, 12),
(45, 80, 202, 110, 221, 70, 3, 15, 85, 167, 90, 5, '1.20', '045.png', 'Vileplume', 'Rafflesia', 49, 2559, 75, 153, 'pv045.wav', 'Flower Pokémon', 'Pokémon Fleur', 50, 181, '18.60', NULL, 5, NULL, 23, 9, NULL, 9, 42, 31, NULL, 1, 4, 12),
(46, 70, 121, 45, 57, 70, 3, 40, 55, 99, 55, 15, '0.30', '046.png', 'Paras', 'Paras', 51, 1018, 35, 98, 'pv046.wav', 'Mushroom Pokémon', 'Pokémon Champignon', 25, 111, '5.40', 52, 86, NULL, 30, 17, NULL, 69, 62, 73, NULL, 1, 12, 7),
(47, 95, 165, 60, 142, 70, 3, 20, 80, 146, 80, 7, '1.00', '047.png', 'Parasect', 'Parasect', 52, 1859, 60, 132, 'pv047.wav', 'Mushroom Pokémon', 'Pokémon Champignon', 30, 155, '29.50', 52, 86, NULL, 55, 45, NULL, 69, 62, 31, NULL, 1, 12, 7),
(48, 55, 100, 40, 61, 70, 3, 50, 50, 100, 55, 15, '1.00', '048.png', 'Venonat', 'Mimitoss', 53, 1004, 60, 132, 'pv048.wav', 'Insect Pokémon', 'Pokémon Vermine', 45, 155, '30.00', 7, 17, 45, 30, 13, NULL, 114, 103, 77, NULL, 1, 4, 7),
(49, 65, 179, 90, 158, 70, 3, 20, 60, 143, 75, 7, '1.50', '049.png', 'Venomoth', 'Aéromite', 54, 2082, 70, 146, 'pv049.wav', 'Poison Moth Pokémon', 'Pokémon Papipoison', 90, 172, '12.50', NULL, 17, NULL, 47, 13, NULL, 117, 85, 32, NULL, 1, 4, 7),
(50, 55, 109, 35, 53, 70, 3, 50, 25, 78, 45, 10, '0.20', '050.png', 'Diglett', 'Taupiqueur', 55, 676, 10, 64, 'pv050.wav', 'Mole Pokémon', 'Pokémon Taupe', 95, 67, '0.80', NULL, NULL, NULL, 51, 17, 29, 88, 104, 111, NULL, 1, 5, NULL),
(51, 100, 167, 50, 149, 70, 3, 20, 50, 134, 70, 6, '0.70', '051.png', 'Dugtrio', 'Triopikeur', 56, 1557, 35, 98, 'pv051.wav', 'Mole Pokémon', 'Pokémon Taupe', 120, 111, '33.30', NULL, NULL, NULL, 51, 31, 29, 88, 7, 40, NULL, 1, 5, NULL),
(52, 45, 92, 40, 58, 70, 3, 50, 35, 78, 40, 15, '0.40', '052.png', 'Meowth', 'Miaouss', 57, 748, 40, 105, 'pv052.wav', 'Scratch Cat Pokémon', 'Pokémon Chadégout', 90, 120, '4.20', NULL, NULL, NULL, 15, 17, NULL, 99, 33, 68, NULL, 1, 1, NULL),
(53, 70, 150, 65, 154, 70, 3, 20, 60, 136, 65, 7, '1.00', '053.png', 'Persian', 'Persian', 58, 1689, 65, 139, 'pv053.wav', 'Classy Cat Pokémon', 'Pokémon Chadeville', 115, 163, '32.00', NULL, NULL, NULL, 17, 25, NULL, 33, 64, 54, NULL, 1, 1, NULL),
(54, 52, 122, 65, 64, 70, 3, 50, 48, 95, 50, 10, '0.80', '054.png', 'Psyduck', 'Psykokwak', 59, 1106, 50, 118, 'pv054.wav', 'Duck Pokémon', 'Pokémon Canard', 55, 137, '19.60', NULL, NULL, NULL, 43, 26, NULL, 71, 39, 103, NULL, 1, 11, NULL),
(55, 82, 191, 95, 175, 70, 3, 20, 78, 162, 80, 6, '1.70', '055.png', 'Golduck', 'Akwakwak', 60, 2450, 80, 160, 'pv055.wav', 'Duck Pokémon', 'Pokémon Canard', 85, 190, '76.60', NULL, NULL, NULL, 43, 13, NULL, 65, 32, 20, NULL, 1, 11, NULL),
(56, 80, 148, 35, 61, 70, 3, 50, 35, 82, 45, 10, '0.50', '056.png', 'Mankey', 'Férosinge', 61, 1164, 40, 105, 'pv056.wav', 'Pig Monkey Pokémon', 'Pokémon Porsinge', 70, 120, '28.00', NULL, NULL, NULL, 17, 33, NULL, 112, 83, 39, NULL, 1, 2, NULL),
(57, 105, 207, 60, 159, 70, 3, 20, 60, 138, 70, 6, '1.00', '057.png', 'Primeape', 'Colossinge', 62, 2288, 65, 139, 'pv057.wav', 'Pig Monkey Pokémon', 'Pokémon Porsinge', 95, 163, '32.00', NULL, NULL, NULL, 32, 6, NULL, 112, 99, 8, NULL, 1, 2, NULL),
(58, 70, 136, 70, 70, 70, 3, 30, 45, 93, 50, 10, '0.70', '058.png', 'Growlithe', 'Caninos', 63, 1243, 55, 125, 'pv058.wav', 'Puppy Pokémon', 'Pokémon Chiot', 60, 146, '19.00', NULL, NULL, NULL, 15, 34, NULL, 72, 101, 51, NULL, 1, 10, NULL),
(59, 110, 227, 100, 194, 70, 3, 10, 80, 166, 80, 6, '1.90', '059.png', 'Arcanine', 'Arcanin', 64, 2029, 90, 173, 'pv059.wav', 'Legendary Pokémon', 'Pokémon Légendaire', 95, 207, '155.00', NULL, NULL, NULL, 14, 28, NULL, 106, 36, 43, NULL, 1, 10, NULL),
(60, 50, 101, 40, 60, 70, 3, 50, 40, 82, 40, 15, '0.60', '060.png', 'Poliwag', 'Ptitard', 65, 829, 40, 105, 'pv060.wav', 'Tadpole Pokémon', 'Pokémon Têtard', 90, 120, '12.40', NULL, NULL, NULL, 51, 44, NULL, 91, 72, 88, NULL, 1, 11, NULL),
(61, 65, 130, 50, 135, 70, 3, 25, 65, 123, 50, 7, '1.00', '061.png', 'Poliwhirl', 'Têtarte', 66, 1419, 65, 139, 'pv061.wav', 'Tadpole Pokémon', 'Pokémon Têtard', 90, 163, '20.00', NULL, NULL, NULL, 51, 44, NULL, 91, 88, 105, NULL, 1, 11, NULL),
(62, 95, 182, 70, 230, 70, 3, 13, 95, 184, 90, 5, '1.30', '062.png', 'Poliwrath', 'Tartard', 67, 2586, 90, 173, 'pv062.wav', 'Tadpole Pokémon', 'Pokémon Têtard', 70, 207, '54.00', 25, 52, 65, 44, 21, NULL, 70, 84, 44, 20, 1, 2, 11),
(63, 20, 195, 105, 62, 70, 3, 50, 15, 82, 55, 99, '0.90', '063.png', 'Abra', 'Abra', 69, 1342, 25, 84, 'pv063.wav', 'Psi Pokémon', 'Pokémon Psy', 90, 93, '19.50', NULL, NULL, NULL, 56, 26, NULL, 87, 77, 41, NULL, 1, 14, NULL),
(64, 35, 232, 120, 140, 70, 3, 25, 30, 117, 70, 7, '1.30', '064.png', 'Kadabra', 'Kadabra', 70, 2059, 40, 105, 'pv064.wav', 'Psi Pokémon', 'Pokémon Psy', 105, 120, '56.50', NULL, NULL, NULL, 52, 13, NULL, 103, 60, 41, NULL, 1, 14, NULL),
(65, 50, 271, 135, 225, 70, 3, 10, 45, 167, 95, 5, '1.50', '065.png', 'Alakazam', 'Alakazam', 71, 3057, 55, 125, 'pv065.wav', 'Psi Pokémon', 'Pokémon Psy', 120, 146, '48.00', NULL, NULL, NULL, 52, 13, NULL, 82, 41, 6, 16, 1, 14, NULL),
(66, 80, 137, 35, 61, 70, 3, 50, 50, 82, 35, 10, '0.80', '066.png', 'Machop', 'Machoc', 72, 1278, 70, 146, 'pv066.wav', 'Superpower Pokémon', 'Pokémon Colosse', 35, 172, '19.50', NULL, NULL, NULL, 33, 21, NULL, 112, 83, 39, NULL, 1, 2, NULL),
(67, 100, 177, 50, 142, 70, 3, 25, 70, 125, 60, 7, '1.50', '067.png', 'Machoke', 'Machopeur', 73, 2031, 80, 160, 'pv067.wav', 'Superpower Pokémon', 'Pokémon Colosse', 45, 190, '70.50', NULL, NULL, NULL, 32, 33, NULL, 83, 66, 44, NULL, 1, 2, NULL),
(68, 130, 234, 65, 227, 70, 3, 10, 80, 159, 85, 5, '1.60', '068.png', 'Machamp', 'Mackogneur', 74, 3056, 90, 173, 'pv068.wav', 'Superpower Pokémon', 'Pokémon Colosse', 55, 207, '130.00', NULL, NULL, NULL, 42, 6, NULL, 46, 56, 44, 8, 1, 2, NULL),
(69, 75, 139, 70, 60, 70, 3, 50, 35, 61, 30, 15, '0.70', '069.png', 'Bellsprout', 'Chétiflor', 75, 1033, 50, 118, 'pv069.wav', 'Flower Pokémon', 'Pokémon Fleur', 40, 137, '4.00', 81, 5, NULL, 18, 23, NULL, 113, 34, 35, NULL, 1, 4, 12),
(70, 90, 172, 85, 137, 70, 3, 25, 50, 92, 45, 7, '1.00', '070.png', 'Weepinbell', 'Boustiflor', 76, 1611, 65, 139, 'pv070.wav', 'Flycatcher Pokémon', 'Pokémon Carnivore', 55, 163, '6.40', 81, 5, NULL, 58, 23, NULL, 73, 34, 35, NULL, 1, 4, 12),
(71, 105, 207, 100, 221, 70, 3, 13, 65, 135, 70, 5, '1.70', '071.png', 'Victreebel', 'Empiflor', 77, 2431, 80, 160, 'pv071.wav', 'Flycatcher Pokémon', 'Pokémon Carnivore', 70, 190, '15.50', 81, 5, NULL, 23, 9, NULL, 127, 58, 34, 31, 1, 4, 12),
(72, 40, 97, 50, 67, 70, 3, 50, 35, 149, 100, 15, '0.90', '072.png', 'Tentacool', 'Tentacool', 78, 1040, 40, 105, 'pv072.wav', 'Jellyfish Pokémon', 'Pokémon Mollusque', 70, 120, '45.50', 1, 96, 116, 53, 44, NULL, 91, 113, 105, NULL, 1, 4, 11),
(73, 70, 166, 80, 180, 70, 3, 20, 65, 209, 120, 7, '1.60', '073.png', 'Tentacruel', 'Tentacruel', 79, 2422, 80, 160, 'pv073.wav', 'Jellyfish Pokémon', 'Pokémon Mollusque', 100, 190, '55.00', 1, 96, 116, 23, 12, NULL, 128, 38, 10, 20, 1, 4, 11),
(74, 80, 132, 30, 60, 70, 1, 50, 100, 132, 30, 10, '0.40', '074.png', 'Geodude', 'Racaillou', 80, 1293, 40, 105, 'pv074.wav', 'Rock Pokémon', 'Pokémon Roche', 20, 120, '20.00', 20, 22, 92, 40, 5, NULL, 104, 56, 111, NULL, 1, 5, 6),
(75, 95, 164, 45, 137, 70, 1, 25, 115, 164, 45, 7, '1.00', '075.png', 'Graveler', 'Gravalanch', 81, 1897, 55, 125, 'pv075.wav', 'Rock Pokémon', 'Pokémon Roche', 35, 146, '105.00', 20, 22, 92, 51, 5, 29, 90, 111, 7, NULL, 1, 5, 6),
(76, 120, 211, 55, 223, 70, 1, 13, 130, 198, 65, 5, '1.40', '076.png', 'Golem', 'Grolem', 82, 2949, 80, 160, 'pv076.wav', 'Megaton Pokémon', 'Pokémon Titanesque', 45, 190, '300.00', 20, 22, 92, 51, 5, 29, 90, 7, 40, NULL, 1, 5, 6),
(77, 85, 170, 65, 82, 70, 3, 40, 55, 127, 65, 10, '1.00', '077.png', 'Ponyta', 'Ponyta', 83, 1697, 50, 118, 'pv077.wav', 'Fire Horse Pokémon', 'Pokémon Cheval Feu', 90, 137, '30.00', NULL, NULL, NULL, 40, 34, NULL, 48, 101, 119, NULL, 1, 10, NULL),
(78, 100, 207, 80, 175, 70, 3, 15, 70, 162, 80, 6, '1.70', '078.png', 'Rapidash', 'Galopa', 84, 2461, 65, 139, 'pv078.wav', 'Fire Horse Pokémon', 'Pokémon Cheval Feu', 105, 163, '95.00', NULL, NULL, NULL, 32, 11, NULL, 59, 52, 43, NULL, 1, 10, NULL),
(79, 65, 109, 40, 63, 70, 3, 50, 65, 98, 40, 10, '1.20', '079.png', 'Slowpoke', 'Ramoloss', 85, 1226, 90, 173, 'pv079.wav', 'Dopey Pokémon', 'Pokémon Crétin', 15, 207, '36.00', 19, 53, 128, 43, 13, NULL, 87, 105, 32, NULL, 1, 14, 11),
(80, 75, 177, 100, 172, 70, 3, 20, 110, 180, 80, 6, '1.60', '080.png', 'Slowbro', 'Flagadoss', 86, 2545, 95, 180, 'pv080.wav', 'Hermit Crab Pokémon', 'Pokémon Symbiose', 30, 216, '78.50', 19, 53, 128, 43, 13, NULL, 105, 65, 32, NULL, 1, 14, 11),
(81, 35, 165, 95, 65, 70, 3, 50, 70, 121, 55, 10, '0.30', '081.png', 'Magnemite', 'Magnéti', 88, 1362, 25, 84, 'pv081.wav', 'Magnet Pokémon', 'Pokémon Magnétique', 45, 93, '6.00', 136, 22, 117, 50, 49, NULL, 76, 78, 49, NULL, 1, 9, 13),
(82, 60, 223, 120, 163, 70, 3, 20, 95, 169, 70, 6, '1.00', '082.png', 'Magneton', 'Magnéton', 89, 2485, 50, 118, 'pv082.wav', 'Magnet Pokémon', 'Pokémon Magnétique', 70, 137, '60.00', 136, 22, 117, 49, 56, NULL, 78, 30, 24, NULL, 1, 9, 13),
(83, 90, 124, 58, 132, 70, 3, 30, 55, 115, 62, 9, '0.80', '083.png', 'Farfetch’d', 'Canarticho', 91, 1236, 52, 121, 'pv083.wav', 'Wild Duck Pokémon', 'Pokémon Canard Fou', 60, 141, '15.00', 118, 18, 126, 55, 20, NULL, 97, 102, 58, NULL, 1, 3, 1),
(84, 85, 158, 35, 62, 70, 3, 50, 45, 83, 35, 10, '1.40', '084.png', 'Doduo', 'Doduo', 92, 1200, 35, 98, 'pv084.wav', 'Twin Bird Pokémon', 'Pokémon Duoiseau', 75, 111, '39.20', 15, 23, 7, 39, 36, NULL, 97, 74, 5, NULL, 1, 3, 1),
(85, 110, 218, 60, 165, 70, 3, 20, 70, 140, 60, 6, '1.80', '085.png', 'Dodrio', 'Dodrio', 93, 2362, 60, 132, 'pv085.wav', 'Triple Bird Pokémon', 'Pokémon Trioiseau', 110, 155, '85.20', 15, 23, 7, 25, 2, NULL, 97, 74, 5, NULL, 1, 3, 1),
(86, 45, 85, 45, 65, 70, 3, 50, 55, 121, 70, 9, '1.10', '086.png', 'Seel', 'Otaria', 94, 971, 65, 139, 'pv086.wav', 'Sea Lion Pokémon', 'Pokémon Otarie', 45, 163, '90.00', NULL, NULL, NULL, 37, 43, 38, 71, 120, 100, NULL, 1, 11, NULL),
(87, 70, 139, 70, 166, 70, 3, 20, 80, 177, 95, 6, '1.70', '087.png', 'Dewgong', 'Lamantine', 95, 1985, 90, 173, 'pv087.wav', 'Sea Lion Pokémon', 'Pokémon Otarie', 70, 207, '120.00', 71, 43, 58, 24, 4, NULL, 105, 100, 10, NULL, 1, 15, 11),
(88, 80, 135, 40, 65, 70, 3, 50, 50, 90, 50, 10, '0.90', '088.png', 'Grimer', 'Tadmorv', 96, 1374, 80, 160, 'pv088.wav', 'Sludge Pokémon', 'Pokémon Dégueu', 25, 190, '30.00', NULL, NULL, NULL, 23, 12, 29, 89, 88, 34, NULL, 1, 4, NULL),
(89, 105, 190, 65, 175, 70, 3, 20, 75, 172, 100, 6, '1.20', '089.png', 'Muk', 'Grotadmorv', 97, 2757, 105, 193, 'pv089.wav', 'Sludge Pokémon', 'Pokémon Dégueu', 50, 233, '30.00', NULL, NULL, NULL, 23, 47, 12, 79, 68, 38, 11, 1, 4, NULL),
(90, 65, 116, 45, 61, 70, 3, 50, 100, 134, 25, 10, '0.30', '090.png', 'Shellder', 'Kokiyas', 98, 1080, 30, 91, 'pv090.wav', 'Bivalve Pokémon', 'Pokémon Bivalve', 40, 102, '4.00', NULL, NULL, NULL, 40, 38, NULL, 91, 120, 105, NULL, 1, 11, NULL),
(91, 95, 186, 85, 184, 70, 3, 20, 180, 256, 45, 6, '1.50', '091.png', 'Cloyster', 'Crustabri', 99, 2547, 50, 118, 'pv091.wav', 'Bivalve Pokémon', 'Pokémon Bivalve', 70, 137, '132.50', 47, 85, 21, 24, 38, NULL, 100, 45, 20, NULL, 1, 15, 11),
(92, 35, 186, 100, 62, 70, 5, 20, 30, 67, 35, 9, '8.80', '092.png', 'Gastly', 'Fantominus', 100, 1229, 30, 91, 'pv092.wav', 'Gas Pokémon', 'Pokémon Gaz', 80, 102, '210.00', 70, NULL, NULL, 40, 5, NULL, 46, 116, 7, NULL, 1, 4, 8),
(93, 50, 223, 115, 142, 70, 3, 20, 45, 107, 55, 7, '1.60', '093.png', 'Haunter', 'Spectrum', 101, 1963, 45, 111, 'pv093.wav', 'Gas Pokémon', 'Pokémon Gaz', 95, 128, '0.10', 70, NULL, NULL, 57, 10, NULL, 92, 68, 34, NULL, 1, 4, 8),
(94, 65, 261, 130, 225, 70, 3, 10, 60, 149, 75, 5, '1.50', '094.png', 'Gengar', 'Ectoplasma', 102, 2878, 60, 132, 'pv094.wav', 'Shadow Pokémon', 'Pokémon Ombre', 110, 155, '40.50', 124, NULL, NULL, 37, 31, 54, 34, 41, 38, 16, 1, 4, 8),
(95, 45, 85, 30, 77, 70, 5, 20, 160, 232, 45, 9, '8.80', '095.png', 'Onix', 'Onix', 103, 1101, 35, 98, 'pv095.wav', 'Rock Snake Pokémon', 'Pokémon Serpenroc', 70, 111, '210.00', 30, 22, 92, 40, 5, NULL, 46, 116, 7, NULL, 1, 5, 6),
(96, 48, 89, 43, 66, 70, 3, 50, 45, 136, 90, 10, '1.00', '096.png', 'Drowzee', 'Soporifik', 105, 1040, 60, 132, 'pv096.wav', 'Hypnosis Pokémon', 'Pokémon Hypnose', 42, 155, '32.40', NULL, NULL, NULL, 19, 13, NULL, 87, 103, 32, NULL, 1, 14, NULL),
(97, 73, 144, 73, 169, 70, 3, 20, 70, 193, 115, 6, '1.60', '097.png', 'Hypno', 'Hypnomade', 106, 2090, 85, 166, 'pv097.wav', 'Hypnosis Pokémon', 'Pokémon Hypnose', 67, 198, '75.60', NULL, NULL, NULL, 26, 13, NULL, 32, 6, 16, NULL, 1, 14, NULL),
(98, 105, 181, 25, 65, 70, 3, 50, 90, 124, 25, 15, '0.40', '098.png', 'Krabby', 'Krabby', 107, 1561, 30, 91, 'pv098.wav', 'River Crab Pokémon', 'Pokémon Doux Crabe', 50, 102, '6.50', NULL, NULL, NULL, 51, 44, NULL, 118, 91, 105, NULL, 1, 11, NULL),
(99, 130, 240, 50, 166, 70, 3, 20, 115, 181, 50, 7, '1.30', '099.png', 'Kingler', 'Krabboss', 108, 2829, 55, 125, 'pv099.wav', 'Pincer Pokémon', 'Pokémon Pince', 75, 146, '60.00', NULL, NULL, NULL, 22, 44, NULL, 118, 62, 105, NULL, 1, 11, NULL),
(100, 30, 109, 55, 66, 70, 3, 50, 50, 111, 55, 10, '0.50', '100.png', 'Voltorb', 'Voltorbe', 109, 1010, 40, 105, 'pv100.wav', 'Ball Pokémon', 'Pokémon Balle', 100, 120, '10.40', NULL, NULL, NULL, 40, 49, NULL, 76, 86, 49, NULL, 1, 13, NULL),
(101, 50, 173, 80, 172, 70, 3, 20, 70, 173, 80, 6, '1.20', '101.png', 'Electrode', 'Électrode', 110, 2099, 60, 132, 'pv101.wav', 'Ball Pokémon', 'Pokémon Balle', 150, 155, '66.60', NULL, NULL, NULL, 49, 48, NULL, 76, 49, 19, NULL, 1, 13, NULL),
(102, 40, 107, 60, 65, 70, 3, 50, 80, 125, 45, 10, '0.40', '102.png', 'Exeggcute', 'Noeunoeuf', 111, 1175, 60, 132, 'pv102.wav', 'Egg Pokémon', 'Pokémon Œuf', 40, 155, '2.50', 90, 5, NULL, 58, 13, NULL, 73, 115, 32, NULL, 1, 14, 12),
(103, 95, 233, 125, 186, 70, 3, 20, 85, 149, 75, 6, '2.00', '103.png', 'Exeggutor', 'Noadkoko', 112, 3014, 95, 180, 'pv103.wav', 'Coconut Pokémon', 'Pokémon Fruitpalme', 55, 216, '120.00', 90, 5, NULL, 58, 27, NULL, 73, 32, 31, NULL, 1, 14, 12),
(104, 50, 90, 40, 64, 70, 3, 40, 95, 144, 50, 10, '0.40', '104.png', 'Cubone', 'Osselait', 113, 1019, 50, 118, 'pv104.wav', 'Lonely Pokémon', 'Pokémon Solitaire', 35, 137, '6.50', NULL, NULL, NULL, 21, 29, NULL, 81, 98, 111, NULL, 1, 5, NULL),
(105, 80, 144, 50, 149, 70, 3, 15, 110, 186, 80, 6, '1.00', '105.png', 'Marowak', 'Ossatueur', 114, 1835, 60, 132, 'pv105.wav', 'Bone Keeper Pokémon', 'Pokémon Gard’Os', 45, 155, '45.00', NULL, NULL, NULL, 21, 29, NULL, 81, 111, 40, NULL, 1, 5, NULL),
(106, 120, 224, 35, 159, 70, 5, 20, 53, 181, 110, 9, '1.50', '106.png', 'Hitmonlee', 'Kicklee', 116, 2576, 50, 118, 'pv106.wav', 'Kicking Pokémon', 'Pokémon Latteur', 87, 137, '49.80', NULL, NULL, NULL, 32, 21, NULL, 112, 48, 7, 8, 1, 2, NULL),
(107, 105, 193, 35, 159, 70, 5, 20, 79, 197, 110, 9, '1.40', '107.png', 'Hitmonchan', 'Tygnon', 117, 2332, 50, 118, 'pv107.wav', 'Punching Pokémon', 'Pokémon Puncheur', 76, 137, '50.20', NULL, NULL, NULL, 42, 6, NULL, 84, 79, 70, 82, 1, 2, NULL),
(108, 55, 108, 60, 77, 70, 3, 20, 75, 137, 75, 9, '1.20', '108.png', 'Lickitung', 'Excelangue', 119, 1411, 90, 173, 'pv108.wav', 'Licking Pokémon', 'Pokémon Lécheur', 30, 207, '65.50', NULL, NULL, NULL, 37, 26, NULL, 48, 35, 19, NULL, 1, 1, NULL),
(109, 65, 119, 60, 68, 70, 3, 50, 95, 141, 45, 10, '0.60', '109.png', 'Koffing', 'Smogo', 121, 1214, 40, 105, 'pv109.wav', 'Poison Gas Pokémon', 'Pokémon Gaz Mortel', 35, 120, '1.00', NULL, NULL, NULL, 40, 23, 47, 89, 68, 34, NULL, 1, 4, NULL),
(110, 90, 174, 85, 172, 70, 3, 20, 120, 197, 70, 6, '1.20', '110.png', 'Weezing', 'Smogogo', 122, 2293, 65, 139, 'pv110.wav', 'Poison Gas Pokémon', 'Pokémon Gaz Mortel', 60, 163, '9.50', NULL, NULL, NULL, 40, 23, 47, 68, 49, 34, 41, 1, 4, NULL),
(111, 85, 140, 30, 69, 70, 3, 50, 95, 127, 30, 10, '1.00', '111.png', 'Rhyhorn', 'Rhinocorne', 123, 1651, 80, 160, 'pv111.wav', 'Spikes Pokémon', 'Pokémon Piquant', 25, 190, '115.00', 27, 92, 8, 21, 29, NULL, 109, 48, 98, NULL, 1, 6, 5),
(112, 130, 222, 45, 170, 70, 3, 5, 120, 171, 45, 6, '1.90', '112.png', 'Rhydon', 'Rhinoféros', 124, 3179, 105, 193, 'pv112.wav', 'Drill Pokémon', 'Pokémon Perceur', 40, 233, '120.00', 27, 92, 8, 21, 29, NULL, 23, 7, 40, NULL, 1, 6, 5),
(113, 5, 60, 35, 395, 140, 5, 20, 5, 128, 105, 9, '1.10', '113.png', 'Chansey', 'Leveinard', 127, 1255, 250, 392, 'pv113.wav', 'Egg Pokémon', 'Pokémon Œuf', 50, 487, '34.60', NULL, NULL, NULL, 19, 26, NULL, 103, 60, 32, 19, 1, 1, NULL),
(114, 55, 183, 100, 87, 70, 3, 40, 115, 169, 40, 9, '1.00', '114.png', 'Tangela', 'Saquedeneu', 129, 2238, 65, 139, 'pv114.wav', 'Vine Pokémon', 'Pokémon Vigne', 60, 163, '35.00', NULL, NULL, NULL, 18, 47, NULL, 34, 37, 31, NULL, 1, 12, NULL),
(115, 95, 181, 40, 172, 70, 3, 20, 80, 165, 80, 9, '2.20', '115.png', 'Kangaskhan', 'Kangourex', 131, 2586, 105, 193, 'pv115.wav', 'Parent Pokémon', 'Pokémon Maternel', 90, 233, '80.00', NULL, NULL, NULL, 32, 29, NULL, 84, 106, 61, 40, 1, 1, NULL),
(116, 40, 129, 70, 59, 70, 3, 50, 70, 103, 25, 10, '0.40', '116.png', 'Horsea', 'Hypotrempe', 132, 1056, 30, 91, 'pv116.wav', 'Dragon Pokémon', 'Pokémon Dragon', 60, 102, '8.00', NULL, NULL, NULL, 43, 44, NULL, 91, 80, 30, NULL, 1, 11, NULL),
(117, 65, 187, 95, 154, 70, 3, 20, 95, 156, 45, 6, '1.20', '117.png', 'Seadra', 'Hypocéan', 133, 2093, 55, 125, 'pv117.wav', 'Dragon Pokémon', 'Pokémon Dragon', 85, 146, '25.00', NULL, NULL, NULL, 43, 16, NULL, 100, 80, 20, NULL, 1, 11, NULL),
(118, 67, 123, 35, 64, 70, 3, 50, 60, 110, 50, 15, '0.60', '118.png', 'Goldeen', 'Poissirène', 135, 1152, 45, 111, 'pv118.wav', 'Goldfish Pokémon', 'Pokémon Poisson', 63, 128, '15.00', NULL, NULL, NULL, 51, 36, NULL, 109, 71, 105, NULL, 1, 11, NULL),
(119, 92, 175, 65, 158, 70, 3, 20, 65, 147, 80, 7, '1.30', '119.png', 'Seaking', 'Poissoroy', 136, 2162, 80, 160, 'pv119.wav', 'Goldfish Pokémon', 'Pokémon Poisson', 68, 190, '39.00', NULL, NULL, NULL, 36, 7, NULL, 105, 65, 14, NULL, 1, 11, NULL),
(120, 45, 137, 70, 68, 70, 3, 50, 55, 112, 55, 15, '0.80', '120.png', 'Staryu', 'Stari', 137, 1157, 30, 91, 'pv120.wav', 'Star Shape Pokémon', 'Pokémon Étoile', 85, 102, '34.50', NULL, NULL, NULL, 40, 43, 39, 91, 110, 64, NULL, 1, 11, NULL),
(121, 75, 210, 100, 182, 70, 3, 20, 85, 184, 85, 6, '1.10', '121.png', 'Starmie', 'Staross', 138, 2584, 60, 132, 'pv121.wav', 'Mysterious Pokémon', 'Pokémon Mystérieux', 115, 155, '80.00', 136, 28, NULL, 43, 39, 46, 65, 12, 32, 20, 1, 14, 11),
(122, 45, 192, 100, 161, 70, 5, 30, 65, 205, 120, 9, '1.30', '122.png', 'Mr. Mime', 'M. Mime', 140, 2228, 40, 105, 'pv122.wav', 'Barrier Pokémon', 'Pokémon Bloqueur', 90, 120, '54.50', 51, 105, 83, 26, 13, NULL, 103, 41, 32, NULL, 1, 18, 14),
(123, 110, 218, 55, 100, 70, 5, 30, 80, 170, 80, 9, '1.50', '123.png', 'Scyther', 'Insécateur', 141, 2706, 70, 146, 'pv123.wav', 'Mantis Pokémon', 'Pokémon Mante', 105, 172, '56.00', 80, 51, 82, 55, 20, NULL, 62, 99, 97, NULL, 1, 3, 7),
(124, 50, 223, 115, 159, 70, 5, 30, 35, 151, 95, 9, '1.40', '124.png', 'Jynx', 'Lippoutou', 144, 2555, 65, 139, 'pv124.wav', 'Human Shape Pokémon', 'Pokémon Humanoïde', 95, 163, '40.60', 86, NULL, 128, 24, 13, NULL, 93, 87, 45, 16, 1, 14, 15),
(125, 83, 198, 95, 172, 70, 5, 20, 57, 158, 85, 9, '1.10', '125.png', 'Electabuzz', 'Élektek', 146, 2334, 65, 139, 'pv125.wav', 'Electric Pokémon', 'Pokémon Électrique', 105, 163, '30.00', NULL, NULL, NULL, 50, 32, NULL, 79, 49, 12, NULL, 1, 13, NULL),
(126, 95, 206, 100, 173, 70, 5, 20, 57, 154, 85, 9, '1.30', '126.png', 'Magmar', 'Magmar', 149, 2394, 65, 139, 'pv126.wav', 'Spitfire Pokémon', 'Pokémon Crache Feu', 93, 163, '44.50', NULL, NULL, NULL, 33, 34, NULL, 82, 51, 43, NULL, 1, 10, NULL),
(127, 125, 238, 55, 175, 70, 5, 30, 100, 182, 70, 9, '1.50', '127.png', 'Pinsir', 'Scarabrute', 151, 2959, 65, 139, 'pv127.wav', 'Stag Beetle Pokémon', 'Pokémon Scarabée', 85, 163, '55.00', NULL, NULL, NULL, 30, 21, NULL, 118, 62, 8, NULL, 1, 7, NULL),
(128, 100, 198, 40, 172, 70, 3, 30, 95, 183, 70, 9, '1.40', '128.png', 'Tauros', 'Tauros', 152, 2620, 75, 153, 'pv128.wav', 'Wild Bull Pokémon', 'Pokémon Buffle', 110, 181, '88.40', NULL, NULL, NULL, 40, 26, NULL, 109, 53, 40, NULL, 1, 1, NULL),
(129, 10, 29, 15, 40, 70, 1, 70, 55, 85, 20, 15, '0.90', '129.png', 'Magikarp', 'Magicarpe', 153, 274, 20, 78, 'pv129.wav', 'Fish Pokémon', 'Pokémon Poisson', 80, 85, '10.00', NULL, NULL, NULL, 62, NULL, NULL, 126, NULL, NULL, NULL, 1, 11, NULL),
(130, 125, 237, 60, 189, 70, 1, 10, 79, 186, 100, 7, '6.50', '130.png', 'Gyarados', 'Léviator', 154, 3391, 95, 180, 'pv130.wav', 'Atrocious Pokémon', 'Pokémon Terrifiant', 81, 216, '235.00', 29, 9, NULL, 15, 16, 7, 106, 61, 20, NULL, 1, 3, 11),
(131, 85, 165, 85, 187, 70, 5, 5, 80, 174, 95, 9, '2.50', '131.png', 'Lapras', 'Lokhlass', 155, 2641, 130, 228, 'pv131.wav', 'Transport Pokémon', 'Pokémon Transport', 60, 277, '220.00', 43, 21, 65, 43, 24, 38, 23, 65, 20, 10, 1, 15, 11),
(132, 48, 91, 48, 101, 70, 3, 20, 48, 91, 48, 10, '0.30', '132.png', 'Ditto', 'Métamorph', 156, 832, 48, 116, 'pv132.wav', 'Transform Pokémon', 'Pokémon Morphing', 48, 134, '4.00', NULL, NULL, NULL, 63, NULL, NULL, 126, NULL, NULL, NULL, 1, 1, NULL),
(133, 55, 104, 45, 65, 70, 5, 40, 50, 114, 65, 10, '0.30', '133.png', 'Eevee', 'Évoli', 157, 1071, 55, 125, 'pv133.wav', 'Evolution Pokémon', 'Pokémon Évolutif', 55, 146, '6.50', NULL, NULL, NULL, 40, 39, NULL, 110, 55, 111, NULL, 1, 1, NULL),
(134, 65, 205, 110, 184, 70, 5, 13, 60, 161, 95, 6, '1.00', '134.png', 'Vaporeon', 'Aquali', 158, 3114, 130, 228, 'pv134.wav', 'Bubble Jet Pokémon', 'Pokémon Bulleur', 65, 277, '29.00', NULL, NULL, NULL, 43, NULL, NULL, 71, 105, 55, 20, 1, 11, NULL),
(135, 65, 232, 110, 184, 70, 5, 13, 60, 182, 95, 6, '0.80', '135.png', 'Jolteon', 'Voltali', 159, 2888, 65, 139, 'pv135.wav', 'Lightning Pokémon', 'Pokémon Orage', 130, 163, '24.50', NULL, NULL, NULL, 50, 48, NULL, 76, 49, 55, 12, 1, 13, NULL),
(136, 130, 246, 95, 184, 70, 5, 13, 60, 179, 110, 6, '0.90', '136.png', 'Flareon', 'Pyroli', 160, 3029, 65, 139, 'pv136.wav', 'Flame Pokémon', 'Pokémon Flamme', 65, 163, '25.00', NULL, NULL, NULL, 34, 11, NULL, 51, 55, 43, 18, 1, 10, NULL),
(137, 60, 153, 85, 79, 70, 3, 40, 70, 136, 75, 9, '0.80', '137.png', 'Porygon', 'Porygon', 166, 1720, 65, 139, 'pv137.wav', 'Virtual Pokémon', 'Pokémon Virtuel', 40, 163, '36.50', NULL, NULL, NULL, 56, 39, 46, 24, 19, 31, NULL, 1, 1, NULL),
(138, 40, 155, 90, 71, 70, 5, 40, 100, 153, 55, 9, '0.40', '138.png', 'Omanyte', 'Amonita', 169, 1544, 35, 98, 'pv138.wav', 'Spiral Pokémon', 'Pokémon Spirale', 35, 111, '7.50', 30, 21, 25, 51, 43, NULL, 91, 90, 115, NULL, 1, 11, 6),
(139, 60, 207, 115, 173, 70, 5, 15, 125, 201, 70, 5, '1.00', '139.png', 'Omastar', 'Amonistar', 170, 2786, 70, 146, 'pv139.wav', 'Spiral Pokémon', 'Pokémon Spirale', 55, 172, '35.00', 30, 21, 25, 51, 43, 5, 90, 115, 20, NULL, 1, 11, 6),
(140, 80, 148, 55, 71, 70, 5, 40, 90, 140, 45, 9, '0.50', '140.png', 'Kabuto', 'Kabuto', 171, 1370, 30, 91, 'pv140.wav', 'Shellfish Pokémon', 'Pokémon Carapace', 55, 102, '11.50', 30, 74, 25, 51, 17, NULL, 123, 115, 104, NULL, 1, 11, 6),
(141, 115, 220, 65, 173, 70, 5, 15, 105, 186, 70, 5, '1.30', '141.png', 'Kabutops', 'Kabutops', 172, 2713, 60, 132, 'pv141.wav', 'Shellfish Pokémon', 'Pokémon Carapace', 80, 155, '40.50', 30, 74, 25, 51, 21, 7, 115, 105, 7, NULL, 1, 11, 6),
(142, 105, 221, 60, 180, 70, 5, 20, 65, 159, 75, 9, '1.80', '142.png', 'Aerodactyl', 'Ptéra', 173, 2783, 80, 160, 'pv142.wav', 'Fossil Pokémon', 'Pokémon Fossile', 130, 190, '59.00', 14, 33, 92, 15, 2, NULL, 115, 56, 63, 19, 1, 3, 6),
(143, 110, 190, 65, 189, 70, 5, 5, 65, 169, 110, 9, '2.10', '143.png', 'Snorlax', 'Ronflex', 175, 3225, 160, 269, 'pv143.wav', 'Sleeping Pokémon', 'Pokémon Pionceur', 30, 330, '460.00', NULL, NULL, NULL, 64, 37, 26, 46, 61, 40, 19, 1, 1, NULL),
(144, 85, 192, 95, 261, 35, 20, 3, 100, 236, 125, 10, '1.70', '144.png', 'Articuno', 'Artikodin', 176, 3051, 90, 173, 'pv144.wav', 'Freeze Pokémon', 'Pokémon Glaciaire', 85, 207, '55.40', 111, 33, NULL, 24, NULL, NULL, 120, 65, 15, 10, 1, 3, 15),
(145, 90, 253, 125, 261, 35, 20, 3, 85, 185, 90, 10, '1.60', '145.png', 'Zapdos', 'Électhor', 177, 3527, 90, 173, 'pv145.wav', 'Electric Pokémon', 'Pokémon Électrique', 100, 207, '52.60', 97, 33, NULL, 50, 56, NULL, 49, 12, 24, NULL, 1, 3, 13),
(146, 100, 251, 125, 261, 35, 20, 3, 90, 181, 85, 10, '2.00', '146.png', 'Moltres', 'Sulfura', 178, 3465, 90, 173, 'pv146.wav', 'Flame Pokémon', 'Pokémon Flamme', 90, 207, '60.00', 24, 33, NULL, 11, NULL, NULL, 17, 52, 43, 18, 1, 3, 10),
(147, 64, 119, 50, 60, 35, 5, 40, 45, 91, 50, 9, '1.80', '147.png', 'Dratini', 'Minidraco', 179, 1004, 41, 106, 'pv147.wav', 'Dragon Pokémon', 'Pokémon Dragon', 50, 121, '3.30', NULL, NULL, NULL, 16, 4, NULL, 125, 71, 113, NULL, 1, 16, NULL),
(148, 84, 163, 70, 147, 35, 5, 10, 65, 135, 70, 6, '4.00', '148.png', 'Dragonair', 'Draco', 180, 1780, 61, 133, 'pv148.wav', 'Dragon Pokémon', 'Pokémon Dragon', 70, 156, '16.50', NULL, NULL, NULL, 16, 4, NULL, 71, 113, 80, NULL, 1, 16, NULL),
(149, 134, 263, 100, 270, 35, 5, 5, 95, 198, 100, 5, '2.20', '149.png', 'Dragonite', 'Dracolosse', 181, 3792, 91, 175, 'pv149.wav', 'Dragon Pokémon', 'Pokémon Dragon', 80, 209, '210.00', 115, 18, NULL, 2, 3, NULL, 61, 15, 19, 13, 1, 3, 16),
(150, 110, 300, 154, 306, 0, 20, 6, 90, 182, 90, 10, '2.00', '150.png', 'Mewtwo', 'Mewtwo', 182, 4178, 106, 179, 'pv150.wav', 'Genetic Pokémon', 'Pokémon Génétique', 130, 214, '122.00', NULL, NULL, NULL, 52, 13, NULL, 49, 65, 32, 16, 1, 14, NULL),
(151, 100, 210, 100, 270, 100, 20, 10000, 100, 210, 100, 0, '0.40', '151.png', 'Mew', 'Mew', 183, 3265, 100, 187, 'pv151.wav', 'New Species Pokémon', 'Pokémon Nouveau', 100, 225, '4.00', NULL, NULL, NULL, 21, 7, 48, 16, 19, 18, 31, 1, 14, NULL),
(152, 49, 92, 49, 64, 70, 3, 20, 65, 122, 65, 10, '0.89', '152.png', 'Chikorita', 'Germignon', 184, 935, 45, 111, 'pv152.wav', 'Leaf Pokémon', 'Pokémon Feuille', 45, 128, '6.40', NULL, NULL, NULL, 40, 18, NULL, 72, 95, 37, NULL, 2, 12, NULL),
(153, 62, 122, 63, 142, 70, 3, 13, 80, 155, 80, 7, '1.19', '153.png', 'Bayleef', 'Macronium', 185, 1454, 60, 132, 'pv153.wav', 'Leaf Pokémon', 'Pokémon Feuille', 60, 155, '15.80', NULL, NULL, NULL, 40, 9, NULL, 115, 95, 37, NULL, 2, 12, NULL),
(154, 82, 168, 83, 236, 70, 3, 5, 100, 202, 100, 5, '1.80', '154.png', 'Meganium', 'Méganium', 186, 2410, 80, 160, 'pv154.wav', 'Herb Pokémon', 'Pokémon Herbe', 80, 190, '100.50', NULL, NULL, NULL, 18, 9, NULL, 21, 9, 40, 31, 2, 12, NULL),
(155, 52, 116, 60, 62, 70, 3, 20, 43, 93, 50, 10, '0.51', '155.png', 'Cyndaquil', 'Héricendre', 187, 980, 39, 103, 'pv155.wav', 'Fire Mouse Pokémon', 'Pokémon Souris Feu', 65, 118, '7.90', NULL, NULL, NULL, 40, 34, NULL, 110, 119, 51, NULL, 2, 10, NULL),
(156, 64, 158, 80, 142, 70, 3, 13, 58, 126, 65, 7, '0.89', '156.png', 'Quilava', 'Feurisson', 188, 1653, 58, 129, 'pv156.wav', 'Volcano Pokémon', 'Pokémon Volcan', 80, 151, '19.00', NULL, NULL, NULL, 40, 34, NULL, 119, 51, 111, NULL, 2, 10, NULL),
(157, 84, 223, 109, 240, 70, 3, 5, 78, 173, 85, 5, '1.70', '157.png', 'Typhlosion', 'Typhlosion', 189, 2889, 78, 157, 'pv157.wav', 'Volcano Pokémon', 'Pokémon Volcan', 100, 186, '79.50', NULL, NULL, NULL, 34, 10, NULL, 47, 43, 18, 31, 2, 10, NULL),
(158, 65, 117, 44, 63, 70, 3, 20, 64, 109, 48, 10, '0.61', '158.png', 'Totodile', 'Kaiminus', 190, 1131, 50, 118, 'pv158.wav', 'Big Jaw Pokémon', 'Pokémon Mâchoire', 43, 137, '9.50', NULL, NULL, NULL, 43, 17, NULL, 123, 106, 105, NULL, 2, 11, NULL),
(159, 80, 150, 59, 142, 70, 3, 13, 80, 142, 63, 7, '1.09', '159.png', 'Croconaw', 'Crocrodil', 191, 1722, 65, 139, 'pv159.wav', 'Big Jaw Pokémon', 'Pokémon Mâchoire', 58, 163, '25.00', NULL, NULL, NULL, 43, 17, NULL, 70, 106, 105, NULL, 2, 11, NULL),
(160, 105, 205, 79, 239, 70, 3, 5, 100, 188, 83, 5, '2.31', '160.png', 'Feraligatr', 'Aligatueur', 192, 2857, 85, 166, 'pv160.wav', 'Big Jaw Pokémon', 'Pokémon Mâchoire', 78, 198, '88.80', NULL, NULL, NULL, 15, 7, NULL, 106, 65, 20, 3, 2, 11, NULL),
(161, 46, 79, 35, 43, 70, 1, 50, 34, 73, 45, 20, '0.79', '161.png', 'Sentret', 'Fouinette', 193, 618, 35, 98, 'pv161.wav', 'Scout Pokémon', 'Pokémon Espion', 20, 111, '6.00', NULL, NULL, NULL, 17, 39, NULL, 83, 37, 111, NULL, 2, 1, NULL),
(162, 76, 148, 45, 145, 70, 1, 15, 64, 125, 55, 7, '1.80', '162.png', 'Furret', 'Fouinar', 194, 1758, 85, 166, 'pv162.wav', 'Long Body Pokémon', 'Pokémon Allongé', 90, 198, '32.50', NULL, NULL, NULL, 31, 39, NULL, 83, 111, 19, NULL, 2, 1, NULL),
(163, 30, 67, 36, 52, 70, 1, 50, 30, 88, 56, 15, '0.71', '163.png', 'Hoothoot', 'Hoothoot', 195, 677, 60, 132, 'pv163.wav', 'Owl Pokémon', 'Pokémon Hibou', 50, 155, '21.20', 17, 126, 34, 25, 36, NULL, 97, 94, 17, NULL, 2, 3, 1),
(164, 50, 145, 86, 158, 70, 1, 15, 50, 156, 96, 7, '1.60', '164.png', 'Noctowl', 'Noarfang', 196, 2024, 100, 187, 'pv164.wav', 'Owl Pokémon', 'Pokémon Hibou', 70, 225, '40.80', 17, 126, 34, 35, 27, NULL, 94, 17, 32, NULL, 2, 3, 1),
(165, 20, 72, 40, 53, 70, 1, 50, 30, 118, 80, 20, '0.99', '165.png', 'Ledyba', 'Coxy', 197, 728, 40, 105, 'pv165.wav', 'Five Star Pokémon', 'Pokémon 5 Étoiles', 55, 120, '10.80', 78, 23, 82, 40, 30, NULL, 97, 110, 117, NULL, 2, 3, 7),
(166, 35, 107, 55, 137, 70, 1, 15, 50, 179, 110, 7, '1.40', '166.png', 'Ledian', 'Coxyclaque', 198, 1346, 55, 125, 'pv166.wav', 'Five Star Pokémon', 'Pokémon 5 Étoiles', 85, 146, '35.60', 106, 23, 82, 30, 45, NULL, 97, 117, 85, NULL, 2, 3, 7),
(167, 60, 105, 40, 50, 70, 1, 50, 40, 73, 40, 20, '0.51', '167.png', 'Spinarak', 'Mimigal', 199, 816, 40, 105, 'pv167.wav', 'String Spit Pokémon', 'Pokémon Crache Fil', 30, 120, '8.50', 12, 34, 82, 53, 30, NULL, 69, 99, 77, NULL, 2, 4, 7),
(168, 90, 161, 60, 140, 70, 1, 15, 70, 124, 70, 7, '1.09', '168.png', 'Ariados', 'Migalos', 200, 1772, 70, 146, 'pv168.wav', 'Long Leg Pokémon', 'Pokémon Long Patte', 40, 172, '33.50', 12, 34, 82, 53, 47, NULL, 69, 124, 14, NULL, 2, 4, 7),
(169, 90, 194, 70, 241, 70, 1, 10, 80, 178, 80, 5, '1.80', '169.png', 'Crobat', 'Nostenfer', 46, 2646, 85, 166, 'pv169.wav', 'Bat Pokémon', 'Pokémon Chovsouris', 130, 198, '75.00', 46, 18, NULL, 15, 20, NULL, 102, 34, 41, NULL, 2, 3, 4),
(170, 38, 106, 56, 66, 70, 3, 40, 38, 97, 56, 10, '0.51', '170.png', 'Chinchou', 'Loupio', 201, 1119, 75, 153, 'pv170.wav', 'Angler Pokémon', 'Pokémon Poisson', 67, 181, '12.00', 65, NULL, 37, 49, 44, NULL, 91, 105, 49, NULL, 2, 13, 11),
(171, 58, 146, 76, 161, 70, 3, 15, 58, 137, 76, 7, '1.19', '171.png', 'Lanturn', 'Lanturn', 202, 2085, 125, 221, 'pv171.wav', 'Light Pokémon', 'Pokémon Lumière', 67, 268, '22.50', 65, NULL, 37, 43, 56, NULL, 49, 12, 20, NULL, 2, 13, 11),
(172, 40, 77, 35, 41, 70, 1, 0, 15, 53, 35, 5, '0.30', '172.png', 'Pichu', 'Pichu', 25, 473, 20, 78, 'pv172.wav', 'Tiny Mouse Pokémon', 'Pokémon Minisouris', 60, 85, '2.00', NULL, NULL, NULL, 50, NULL, NULL, 73, 121, 49, NULL, 2, 13, NULL),
(173, 25, 75, 45, 44, 140, 1, 0, 28, 79, 55, 5, '0.30', '173.png', 'Cleffa', 'Mélo', 36, 671, 50, 118, 'pv173.wav', 'Star Shape Pokémon', 'Pokémon Étoile', 15, 137, '3.00', NULL, NULL, NULL, 19, 26, NULL, 87, 77, 37, NULL, 2, 18, NULL),
(174, 30, 69, 40, 42, 70, 1, 0, 15, 32, 20, 5, '0.30', '174.png', 'Igglybuff', 'Toudoudou', 41, 535, 90, 173, 'pv174.wav', 'Balloon Pokémon', 'Pokémon Bouboule', 15, 207, '1.00', NULL, 13, 39, 19, 25, NULL, 36, 41, 32, NULL, 2, 18, 1),
(175, 20, 67, 40, 49, 70, 3, 0, 65, 116, 65, 5, '0.30', '175.png', 'Togepi', 'Togepi', 203, 657, 35, 98, 'pv175.wav', 'Spike Ball Pokémon', 'Pokémon Balle Pic', 20, 111, '1.50', NULL, NULL, NULL, 36, 46, NULL, 87, 115, 60, NULL, 2, 18, NULL),
(176, 40, 139, 80, 142, 70, 3, 5, 85, 181, 105, 5, '0.61', '176.png', 'Togetic', 'Togetic', 204, 1708, 55, 125, 'pv176.wav', 'Happiness Pokémon', 'Pokémon Bonheur', 40, 146, '3.20', 42, 119, NULL, 27, 46, NULL, 97, 115, 60, NULL, 2, 3, 18),
(177, 50, 134, 70, 64, 70, 3, 40, 45, 89, 45, 15, '0.20', '177.png', 'Natu', 'Natu', 206, 1102, 40, 105, 'pv177.wav', 'Tiny Bird Pokémon', 'Pokémon Minoiseau', 70, 120, '2.00', 38, 23, 98, 39, 36, NULL, 94, 74, 87, NULL, 2, 3, 14),
(178, 75, 192, 95, 165, 70, 3, 15, 70, 146, 70, 7, '1.50', '178.png', 'Xatu', 'Xatu', 207, 2188, 65, 139, 'pv178.wav', 'Mystic Pokémon', 'Pokémon Mystique', 95, 163, '15.00', 38, 23, 98, 25, 20, NULL, 107, 97, 6, NULL, 2, 3, 14),
(179, 40, 114, 65, 56, 70, 5, 50, 40, 79, 45, 10, '0.61', '179.png', 'Mareep', 'Wattouat', 208, 991, 55, 125, 'pv179.wav', 'Wool Pokémon', 'Pokémon Laine', 35, 146, '7.80', NULL, NULL, NULL, 40, 50, NULL, 72, 76, 49, NULL, 2, 13, NULL),
(180, 55, 145, 80, 128, 70, 5, 25, 55, 109, 60, 7, '0.79', '180.png', 'Flaaffy', 'Lainergie', 209, 1521, 70, 146, 'pv180.wav', 'Wool Pokémon', 'Pokémon Laine', 45, 172, '13.30', NULL, NULL, NULL, 40, 56, NULL, 76, 64, 49, NULL, 2, 13, NULL),
(181, 75, 211, 115, 230, 70, 5, 13, 85, 169, 90, 5, '1.40', '181.png', 'Ampharos', 'Pharamp', 210, 2852, 90, 173, 'pv181.wav', 'Light Pokémon', 'Pokémon Lumière', 55, 207, '61.50', NULL, NULL, NULL, 56, 48, NULL, 64, 12, 16, 24, 2, 13, NULL),
(182, 80, 169, 90, 221, 70, 3, 5, 95, 186, 100, 5, '0.41', '182.png', 'Bellossom', 'Joliflor', 50, 2281, 75, 153, 'pv182.wav', 'Flower Pokémon', 'Pokémon Fleur', 50, 181, '5.80', NULL, NULL, NULL, 23, 9, NULL, 58, 60, 9, NULL, 2, 12, NULL),
(183, 20, 37, 20, 88, 70, 3, 50, 50, 93, 50, 10, '0.41', '183.png', 'Marill', 'Marill', 212, 461, 70, 146, 'pv183.wav', 'Aqua Mouse Pokémon', 'Pokémon Aquasouris', 40, 172, '8.50', 40, NULL, 58, 40, 44, NULL, 91, 72, 71, NULL, 2, 18, 11),
(184, 50, 112, 60, 189, 70, 3, 15, 80, 152, 80, 7, '0.79', '184.png', 'Azumarill', 'Azumarill', 213, 1588, 100, 187, 'pv184.wav', 'Aqua Rabbit Pokémon', 'Pokémon Aqualapin', 50, 225, '28.50', 40, NULL, 58, 44, 21, NULL, 65, 54, 20, NULL, 2, 18, 11),
(185, 100, 167, 30, 144, 70, 5, 13, 115, 176, 65, 5, '1.19', '185.png', 'Sudowoodo', 'Simularbre', 215, 2148, 70, 146, 'pv185.wav', 'Imitation Pokémon', 'Pokémon Imitation', 30, 172, '38.00', NULL, NULL, NULL, 6, 5, NULL, 56, 7, 40, NULL, 2, 6, NULL),
(186, 75, 174, 90, 225, 70, 3, 10, 75, 179, 100, 5, '1.09', '186.png', 'Politoed', 'Tarpaud', 68, 2449, 90, 173, 'pv186.wav', 'Frog Pokémon', 'Pokémon Grenouille', 70, 207, '33.90', NULL, NULL, NULL, 51, 44, NULL, 23, 10, 20, NULL, 2, 11, NULL),
(187, 35, 67, 35, 50, 70, 3, 50, 40, 94, 55, 12, '0.41', '187.png', 'Hoppip', 'Granivol', 216, 600, 35, 98, 'pv187.wav', 'Cottonweed Pokémon', 'Pokémon Pissenlit', 50, 111, '0.50', 46, 32, 5, 40, 58, NULL, 73, 37, 60, NULL, 2, 3, 12),
(188, 45, 91, 45, 119, 70, 3, 25, 50, 120, 65, 7, '0.61', '188.png', 'Skiploom', 'Floravol', 217, 976, 55, 125, 'pv188.wav', 'Cottonweed Pokémon', 'Pokémon Pissenlit', 80, 146, '1.00', 46, 32, 5, 40, 58, NULL, 95, 37, 60, NULL, 2, 3, 12),
(189, 55, 118, 55, 207, 70, 3, 13, 70, 183, 95, 5, '0.79', '189.png', 'Jumpluff', 'Cotovol', 218, 1636, 75, 153, 'pv189.wav', 'Cottonweed Pokémon', 'Pokémon Pissenlit', 110, 181, '3.00', 46, 32, 5, 58, 47, NULL, 95, 60, 31, NULL, 2, 3, 12),
(190, 70, 136, 40, 72, 70, 3, 20, 55, 112, 55, 9, '0.79', '190.png', 'Aipom', 'Capumain', 219, 1348, 55, 125, 'pv190.wav', 'Long Tail Pokémon', 'Pokémon Longqueue', 85, 146, '11.50', NULL, NULL, NULL, 17, 57, NULL, 112, 97, 110, NULL, 2, 1, NULL),
(191, 30, 55, 30, 36, 70, 3, 50, 30, 55, 30, 9, '0.30', '191.png', 'Sunkern', 'Tournegrin', 221, 395, 30, 91, 'pv191.wav', 'Seed Pokémon', 'Pokémon Graine', 30, 102, '1.80', NULL, NULL, NULL, 41, 9, NULL, 73, 95, 37, NULL, 2, 12, NULL),
(192, 75, 185, 105, 149, 70, 3, 10, 55, 135, 85, 7, '0.79', '192.png', 'Sunflora', 'Héliatronc', 222, 2141, 75, 153, 'pv192.wav', 'Sun Pokémon', 'Pokémon Soleil', 30, 181, '8.50', NULL, NULL, NULL, 58, 9, NULL, 34, 9, 31, NULL, 2, 12, NULL),
(193, 65, 154, 75, 78, 70, 3, 30, 45, 94, 45, 10, '1.19', '193.png', 'Yanma', 'Yanma', 223, 1470, 65, 139, 'pv193.wav', 'Clear Wing Pokémon', 'Pokémon Translaile', 95, 163, '38.00', 91, 45, 93, 39, 35, NULL, 97, 115, 117, NULL, 2, 3, 7),
(194, 45, 75, 25, 42, 70, 3, 40, 45, 66, 25, 10, '0.41', '194.png', 'Wooper', 'Axoloto', 225, 641, 55, 125, 'pv194.wav', 'Water Fish Pokémon', 'Pokémon Poisson', 15, 146, '8.50', 77, 65, 52, 51, 43, NULL, 72, 88, 111, NULL, 2, 5, 11),
(195, 85, 152, 65, 151, 70, 3, 15, 85, 143, 65, 7, '1.40', '195.png', 'Quagsire', 'Maraiste', 226, 1992, 95, 180, 'pv195.wav', 'Water Fish Pokémon', 'Pokémon Poisson', 35, 216, '75.00', 77, 65, 52, 51, 43, NULL, 128, 34, 7, 40, 2, 5, 11),
(196, 65, 261, 130, 184, 70, 5, 13, 60, 175, 95, 5, '0.89', '196.png', 'Espeon', 'Mentali', 161, 3170, 65, 139, 'pv196.wav', 'Sun Pokémon', 'Pokémon Soleil', 110, 163, '26.50', NULL, NULL, NULL, 26, 13, NULL, 103, 55, 32, 6, 2, 14, NULL),
(197, 65, 126, 60, 184, 35, 5, 13, 110, 240, 130, 5, '0.99', '197.png', 'Umbreon', 'Noctali', 162, 2137, 95, 180, 'pv197.wav', 'Moonlight Pokémon', 'Pokémon Lune', 65, 216, '27.00', NULL, NULL, NULL, 25, 28, NULL, 33, 68, 55, NULL, 2, 17, NULL),
(198, 85, 175, 85, 81, 35, 3, 20, 42, 87, 42, 10, '0.51', '198.png', 'Murkrow', 'Cornèbre', 227, 1562, 60, 132, 'pv198.wav', 'Darkness Pokémon', 'Pokémon Obscurité', 91, 155, '2.10', 61, 42, 34, 36, 25, NULL, 74, 33, 68, NULL, 2, 3, 17),
(199, 75, 177, 100, 172, 70, 3, 10, 80, 180, 110, 5, '2.01', '199.png', 'Slowking', 'Roigada', 87, 2545, 95, 180, 'pv199.wav', 'Royal Pokémon', 'Pokémon Royal', 30, 216, '79.50', 19, 53, 128, 43, 13, NULL, 32, 10, 43, NULL, 2, 14, 11),
(200, 60, 167, 85, 87, 35, 3, 30, 60, 154, 85, 7, '0.71', '200.png', 'Misdreavus', 'Feuforêve', 229, 1926, 60, 132, 'pv200.wav', 'Screech Pokémon', 'Pokémon Strident', 85, 155, '1.00', NULL, NULL, NULL, 57, 54, NULL, 124, 107, 68, NULL, 2, 8, NULL),
(201, 72, 136, 72, 118, 70, 5, 30, 48, 91, 48, 10, '0.51', '201.png', 'Unown', 'Zarbi', 231, 1185, 48, 116, 'pv201.wav', 'Symbol Pokémon', 'Pokémon Symbolique', 48, 134, '5.00', NULL, NULL, NULL, 46, NULL, NULL, 126, NULL, NULL, NULL, 2, 14, NULL),
(202, 33, 60, 33, 142, 70, 3, 25, 58, 106, 58, 7, '1.30', '202.png', 'Wobbuffet', 'Qulbutoké', 233, 1026, 190, 310, 'pv202.wav', 'Patient Pokémon', 'Pokémon Patient', 33, 382, '28.50', NULL, NULL, NULL, 62, 6, NULL, 96, NULL, NULL, NULL, 2, 14, NULL),
(203, 80, 182, 90, 159, 70, 3, 30, 65, 133, 65, 7, '1.50', '203.png', 'Girafarig', 'Girafarig', 234, 2046, 70, 146, 'pv203.wav', 'Long Neck Pokémon', 'Pokémon Long Cou', 85, 172, '41.50', 40, 23, 18, 40, 13, NULL, 96, 49, 32, NULL, 2, 14, 1),
(204, 65, 108, 35, 58, 70, 5, 40, 90, 122, 35, 12, '0.61', '204.png', 'Pineco', 'Pomdepik', 235, 1108, 50, 118, 'pv204.wav', 'Bagworm Pokémon', 'Pokémon Ver Caché', 15, 137, '7.20', NULL, NULL, NULL, 40, 30, NULL, 104, 116, 86, NULL, 2, 7, NULL),
(205, 90, 161, 60, 163, 70, 5, 15, 140, 205, 60, 7, '1.19', '205.png', 'Forretress', 'Foretress', 236, 2282, 75, 153, 'pv205.wav', 'Bagworm Pokémon', 'Pokémon Ver Caché', 40, 181, '125.80', 47, 22, NULL, 30, 45, NULL, 104, 46, 40, NULL, 2, 9, 7),
(206, 70, 131, 65, 145, 70, 3, 30, 70, 128, 65, 20, '1.50', '206.png', 'Dunsparce', 'Insolourdo', 237, 1689, 100, 187, 'pv206.wav', 'Land Snake Pokémon', 'Pokémon Serpent', 45, 225, '14.00', NULL, NULL, NULL, 15, 57, NULL, 59, 56, 111, NULL, 2, 1, NULL);
INSERT INTO `pokemon` (`id`, `attack`, `attack_max`, `attack_spe`, `base_experience`, `base_happiness`, `buddy_walk`, `capture_rate`, `defense`, `defense_max`, `defense_spe`, `escape_rate`, `height`, `image`, `name_en`, `name_fr`, `order`, `pc_max`, `pv`, `pv_max`, `scream`, `specie_en`, `specie_fr`, `speed`, `stamina_max`, `weight`, `abilitie_1`, `abilitie_2`, `abilitie_3`, `fast_move_1`, `fast_move_2`, `fast_move_3`, `main_move_1`, `main_move_2`, `main_move_3`, `main_move_4`, `pokedex`, `type_1`, `type_2`) VALUES
(207, 75, 143, 35, 86, 70, 5, 20, 105, 184, 65, 7, '1.09', '207.png', 'Gligar', 'Scorplane', 238, 1857, 65, 139, 'pv207.wav', 'Fly Scorpion Pokémon', 'Pokémon Scorpivol', 85, 163, '64.80', 36, 20, 129, 55, 35, NULL, 99, 97, 111, NULL, 2, 3, 5),
(208, 85, 148, 55, 179, 70, 5, 10, 200, 272, 65, 5, '9.19', '208.png', 'Steelix', 'Steelix', 104, 2414, 75, 153, 'pv208.wav', 'Iron Snake Pokémon', 'Pokémon Serpenfer', 30, 181, '400.00', 101, 22, 92, 3, 4, NULL, 106, 46, 40, NULL, 2, 5, 9),
(209, 80, 137, 40, 60, 70, 3, 40, 50, 85, 40, 10, '0.61', '209.png', 'Snubbull', 'Snubbull', 240, 1237, 60, 132, 'pv209.wav', 'Fairy Pokémon', 'Pokémon Fée', 30, 155, '7.80', NULL, NULL, NULL, 40, 15, NULL, 83, 106, 60, NULL, 2, 18, NULL),
(210, 120, 212, 60, 158, 70, 3, 15, 75, 131, 60, 8, '1.40', '210.png', 'Granbull', 'Granbull', 241, 2552, 90, 173, 'pv210.wav', 'Fairy Pokémon', 'Pokémon Fée', 45, 207, '48.70', NULL, NULL, NULL, 15, 28, NULL, 106, 54, 8, NULL, 2, 18, NULL),
(211, 95, 184, 55, 88, 70, 3, 30, 85, 138, 55, 8, '0.51', '211.png', 'Qwilfish', 'Qwilfish', 242, 2051, 65, 139, 'pv211.wav', 'Balloon Pokémon', 'Pokémon Bouboule', 85, 163, '3.90', 9, 25, 79, 43, 53, NULL, 128, 71, 65, 38, 2, 4, 11),
(212, 130, 236, 55, 175, 70, 5, 5, 100, 181, 80, 5, '2.01', '212.png', 'Scizor', 'Cizayox', 142, 3001, 70, 146, 'pv212.wav', 'Pincer Pokémon', 'Pokémon Pince', 65, 172, '125.00', 137, 51, 82, 55, 42, NULL, 62, 99, 53, NULL, 2, 9, 7),
(213, 10, 17, 10, 177, 70, 3, 30, 230, 396, 230, 7, '0.61', '213.png', 'Shuckle', 'Caratroc', 243, 405, 20, 78, 'pv213.wav', 'Mold Pokémon', 'Pokémon Pourri', 5, 85, '20.50', 62, 81, 22, 5, 45, NULL, 90, 86, 7, NULL, 2, 6, 7),
(214, 125, 234, 40, 175, 70, 3, 30, 75, 179, 95, 9, '1.50', '214.png', 'Heracross', 'Scarhino', 244, 3101, 80, 160, 'pv214.wav', 'Single Horn Pokémon', 'Pokémon Unicorne', 85, 190, '54.00', 29, 67, 82, 6, 45, NULL, 14, 8, 40, NULL, 2, 2, 7),
(215, 95, 189, 35, 86, 35, 3, 20, 55, 146, 75, 7, '0.89', '215.png', 'Sneasel', 'Farfuret', 245, 2051, 55, 125, 'pv215.wav', 'Sharp Claw Pokémon', 'Pokémon Grifacérée', 115, 146, '28.00', 49, 126, 18, 25, 38, NULL, 70, 33, 45, NULL, 2, 15, 17),
(216, 80, 142, 50, 66, 70, 3, 50, 50, 93, 50, 20, '0.61', '216.png', 'Teddiursa', 'Teddiursa', 247, 1328, 60, 132, 'pv216.wav', 'Little Bear Pokémon', 'Pokémon Mini Ours', 40, 155, '8.80', NULL, NULL, NULL, 37, 17, NULL, 39, 106, 54, NULL, 2, 1, NULL),
(217, 130, 236, 75, 175, 70, 3, 15, 75, 144, 75, 7, '1.80', '217.png', 'Ursaring', 'Ursaring', 248, 2945, 90, 173, 'pv217.wav', 'Hibernator Pokémon', 'Pokémon Hibernant', 55, 207, '125.80', NULL, NULL, NULL, 22, 10, 6, 54, 8, 19, NULL, 2, 1, NULL),
(218, 40, 118, 70, 50, 70, 1, 30, 40, 71, 40, 10, '0.71', '218.png', 'Slugma', 'Limagma', 249, 895, 40, 105, 'pv218.wav', 'Lava Pokémon', 'Pokémon Lave', 20, 120, '35.00', NULL, NULL, NULL, 34, 5, NULL, 119, 67, 56, NULL, 2, 10, NULL),
(219, 50, 139, 90, 151, 70, 1, 13, 120, 191, 80, 6, '0.79', '219.png', 'Magcargo', 'Volcaropod', 250, 1702, 60, 118, 'pv219.wav', 'Lava Pokémon', 'Pokémon Lave', 30, 137, '55.00', 30, 24, 114, 34, 5, NULL, 52, 7, 18, NULL, 2, 6, 10),
(220, 50, 90, 30, 50, 70, 3, 30, 40, 69, 30, 10, '0.41', '220.png', 'Swinub', 'Marcacrin', 251, 741, 50, 118, 'pv220.wav', 'Pig Pokémon', 'Pokémon Cochon', 50, 137, '6.50', 58, 111, 128, 40, 60, NULL, 72, 120, 56, NULL, 2, 5, 15),
(221, 100, 181, 60, 158, 70, 3, 13, 80, 138, 60, 6, '1.09', '221.png', 'Piloswine', 'Cochignon', 252, 2345, 100, 187, 'pv221.wav', 'Swine Pokémon', 'Pokémon Porc', 50, 225, '55.80', 58, 111, 128, 60, 38, NULL, 98, 45, 7, NULL, 2, 5, 15),
(222, 55, 118, 65, 144, 70, 3, 30, 95, 156, 95, 12, '0.61', '222.png', 'Corsola', 'Corayon', 254, 1378, 65, 125, 'pv222.wav', 'Coral Pokémon', 'Pokémon Corail', 35, 146, '5.00', 19, 28, NULL, 40, 44, NULL, 91, 90, 64, NULL, 2, 6, 11),
(223, 65, 127, 65, 60, 70, 1, 50, 35, 69, 35, 10, '0.61', '223.png', 'Remoraid', 'Rémoraid', 255, 912, 35, 98, 'pv223.wav', 'Jet Pokémon', 'Pokémon Jet', 65, 111, '12.00', NULL, NULL, NULL, 51, 43, NULL, 90, 105, 100, NULL, 2, 11, NULL),
(224, 105, 197, 105, 168, 70, 1, 15, 75, 141, 75, 7, '0.89', '224.png', 'Octillery', 'Octillery', 256, 2315, 75, 153, 'pv224.wav', 'Jet Pokémon', 'Pokémon Jet', 45, 181, '28.50', NULL, NULL, NULL, 51, 43, NULL, 128, 105, 100, 11, 2, 11, NULL),
(225, 55, 128, 65, 116, 70, 5, 20, 45, 90, 45, 20, '0.89', '225.png', 'Delibird', 'Cadoizo', 257, 1094, 45, 111, 'pv225.wav', 'Delivery Pokémon', 'Pokémon Livraison', 75, 128, '16.00', 34, NULL, 84, 61, NULL, NULL, 70, 97, 120, NULL, 2, 3, 15),
(226, 40, 148, 80, 170, 70, 5, 30, 70, 226, 140, 7, '2.11', '226.png', 'Mantine', 'Démanta', 259, 2108, 85, 139, 'pv226.wav', 'Kite Pokémon', 'Pokémon Cervolant', 70, 163, '220.00', 66, 65, 25, 58, 35, 44, 97, 105, 65, NULL, 2, 3, 11),
(227, 80, 148, 40, 163, 70, 5, 20, 140, 226, 70, 9, '1.70', '227.png', 'Skarmory', 'Airmure', 260, 2108, 65, 139, 'pv227.wav', 'Armor Bird Pokémon', 'Pokémon Armoiseau', 70, 163, '50.50', 30, 22, 126, 2, 20, NULL, 17, 5, 30, NULL, 2, 3, 9),
(228, 60, 152, 80, 66, 35, 3, 40, 30, 83, 50, 10, '0.61', '228.png', 'Houndour', 'Malosse', 261, 1234, 45, 111, 'pv228.wav', 'Dark Pokémon', 'Pokémon Sombre', 65, 128, '10.80', 14, 35, 23, 34, 25, NULL, 106, 51, 68, NULL, 2, 10, 17),
(229, 90, 224, 110, 175, 35, 3, 15, 50, 144, 80, 6, '1.40', '229.png', 'Houndoom', 'Démolosse', 262, 2635, 75, 153, 'pv229.wav', 'Dark Pokémon', 'Pokémon Sombre', 95, 181, '35.00', 14, 35, 23, 14, 28, NULL, 106, 51, 33, 43, 2, 10, 17),
(230, 95, 194, 95, 243, 70, 3, 10, 95, 194, 95, 5, '1.80', '230.png', 'Kingdra', 'Hyporoi', 134, 2641, 75, 153, 'pv230.wav', 'Dragon Pokémon', 'Pokémon Dragon', 85, 181, '152.00', 52, 12, 25, 16, 7, NULL, 10, 61, 20, NULL, 2, 16, 11),
(231, 60, 107, 40, 66, 70, 3, 50, 60, 98, 40, 20, '0.51', '231.png', 'Phanpy', 'Phanpy', 263, 1206, 90, 173, 'pv231.wav', 'Long Nose Pokémon', 'Pokémon Long Nez', 40, 207, '33.50', NULL, NULL, NULL, 40, 21, NULL, 72, 98, 56, NULL, 2, 5, NULL),
(232, 120, 214, 60, 175, 70, 3, 13, 120, 185, 60, 7, '1.09', '232.png', 'Donphan', 'Donphan', 264, 3013, 90, 173, 'pv232.wav', 'Armor Pokémon', 'Pokémon Armure', 50, 207, '120.00', NULL, NULL, NULL, 40, 6, 29, 46, 56, 40, NULL, 2, 5, NULL),
(233, 80, 198, 105, 180, 70, 3, 5, 90, 180, 95, 5, '0.61', '233.png', 'Porygon2', 'Porygon2', 167, 2711, 85, 166, 'pv233.wav', 'Virtual Pokémon', 'Pokémon Virtuel', 60, 198, '32.50', NULL, NULL, NULL, 56, 46, NULL, 24, 19, 31, NULL, 2, 1, NULL),
(234, 95, 192, 85, 163, 70, 3, 30, 62, 131, 65, 8, '1.40', '234.png', 'Stantler', 'Cerfrousse', 265, 2164, 73, 150, 'pv234.wav', 'Big Horn Pokémon', 'Pokémon _maxi Corne', 85, 177, '71.20', NULL, NULL, NULL, 40, 26, NULL, 48, 36, 14, NULL, 2, 1, NULL),
(235, 20, 64, 20, 88, 70, 3, 25, 35, 64, 45, 7, '1.19', '235.png', 'Smeargle', 'Queulorior', 266, 492, 55, 98, 'pv235.wav', 'Painter Pokémon', 'Pokémon Peintre', 75, 111, '58.00', NULL, NULL, NULL, 40, NULL, NULL, 126, NULL, NULL, NULL, 2, 1, NULL),
(236, 35, 40, 35, 42, 70, 5, 0, 35, 83, 35, 20, '0.71', '236.png', 'Tyrogue', 'Debugant', 115, 431, 35, 127, 'pv236.wav', 'Scuffle Pokémon', 'Pokémon Bagarreur', 35, 146, '21.00', NULL, NULL, NULL, 40, 21, NULL, 112, 83, 56, NULL, 2, 2, NULL),
(237, 95, 173, 35, 159, 70, 5, 10, 95, 207, 110, 5, '1.40', '237.png', 'Hitmontop', 'Kapoera', 118, 2156, 50, 118, 'pv237.wav', 'Handstand Pokémon', 'Pokémon Poirier', 70, 137, '48.00', NULL, NULL, NULL, 6, 21, NULL, 86, 7, 8, NULL, 2, 2, NULL),
(238, 30, 153, 85, 61, 70, 5, 0, 15, 91, 65, 20, '0.41', '238.png', 'Smoochum', 'Lippouti', 143, 1291, 45, 111, 'pv238.wav', 'Kiss Pokémon', 'Pokémon Bisou', 65, 128, '6.00', 43, NULL, 128, 19, 60, NULL, 70, 87, 65, NULL, 2, 14, 15),
(239, 63, 135, 65, 72, 70, 5, 0, 37, 101, 55, 20, '0.61', '239.png', 'Elekid', 'Élekid', 145, 1206, 45, 111, 'pv239.wav', 'Electric Pokémon', 'Pokémon Électrique', 95, 128, '23.50', NULL, NULL, NULL, 50, 32, NULL, 83, 79, 76, NULL, 2, 13, NULL),
(240, 75, 151, 70, 73, 70, 5, 0, 37, 99, 55, 20, '0.71', '240.png', 'Magby', 'Magby', 148, 1323, 45, 111, 'pv240.wav', 'Live Coal Pokémon', 'Pokémon Charbon', 83, 128, '21.40', NULL, NULL, NULL, 33, 34, NULL, 83, 82, 67, NULL, 2, 10, NULL),
(241, 80, 157, 40, 172, 70, 5, 20, 105, 193, 70, 8, '1.19', '241.png', 'Miltank', 'Écrémeuh', 267, 2354, 95, 180, 'pv241.wav', 'Milk Cow Pokémon', 'Pokémon Vachalait', 100, 216, '75.50', NULL, NULL, NULL, 40, 26, NULL, 48, 86, 49, 65, 2, 1, NULL),
(242, 10, 129, 75, 608, 140, 5, 5, 10, 169, 135, 5, '1.50', '242.png', 'Blissey', 'Leuphorie', 128, 2757, 255, 399, 'pv242.wav', 'Happiness Pokémon', 'Pokémon Bonheur', 55, 496, '46.80', NULL, NULL, NULL, 19, 26, NULL, 60, 32, 19, NULL, 2, 1, NULL),
(243, 85, 241, 115, 261, 35, 20, 2, 75, 195, 100, 4, '1.91', '243.png', 'Raikou', 'Raikou', 268, 3452, 90, 173, 'pv243.wav', 'Thunder Pokémon', 'Pokémon Foudre', 115, 207, '178.00', NULL, NULL, NULL, 50, 48, NULL, 49, 36, 41, 12, 2, 13, NULL),
(244, 115, 235, 90, 261, 35, 20, 2, 85, 171, 75, 4, '2.11', '244.png', 'Entei', 'Entei', 269, 3473, 115, 207, 'pv244.wav', 'Volcano Pokémon', 'Pokémon Volcan', 100, 251, '198.00', NULL, NULL, NULL, 14, 11, NULL, 53, 51, 43, 18, 2, 10, NULL),
(245, 75, 180, 90, 261, 35, 20, 2, 115, 235, 115, 4, '2.01', '245.png', 'Suicune', 'Suicune', 270, 2983, 100, 187, 'pv245.wav', 'Aurora Pokémon', 'Pokémon Aurore', 85, 225, '187.00', NULL, NULL, NULL, 27, 28, NULL, 91, 105, 65, 20, 2, 11, NULL),
(246, 64, 115, 45, 60, 35, 5, 40, 50, 93, 50, 10, '0.61', '246.png', 'Larvitar', 'Embrylex', 271, 1040, 50, 118, 'pv246.wav', 'Rock Skin Pokémon', 'Pokémon Peaupierre', 41, 137, '72.00', 20, 67, NULL, 15, 21, NULL, 48, 106, 115, NULL, 2, 5, 6),
(247, 84, 155, 65, 144, 35, 5, 10, 70, 133, 70, 7, '1.19', '247.png', 'Pupitar', 'Ymphect', 272, 1766, 70, 146, 'pv247.wav', 'Hard Shell Pokémon', 'Pokémon Carapadure', 51, 172, '152.00', 16, NULL, NULL, 15, 21, NULL, 106, 115, 111, NULL, 2, 5, 6),
(248, 134, 251, 95, 270, 35, 5, 5, 110, 207, 100, 4, '2.01', '248.png', 'Tyranitar', 'Tyranocif', 273, 3834, 100, 187, 'pv248.wav', 'Armor Pokémon', 'Pokémon Armure', 61, 225, '202.00', 14, 103, NULL, 15, 4, 8, 106, 7, 43, NULL, 2, 17, 6),
(249, 90, 193, 90, 306, 0, 20, 2, 130, 310, 154, 4, '5.21', '249.png', 'Lugia', 'Lugia', 274, 3703, 106, 195, 'pv249.wav', 'Diving Pokémon', 'Pokémon Plongeon', 110, 235, '216.00', 115, 33, NULL, 27, 3, NULL, 17, 6, 20, NULL, 2, 3, 14),
(250, 130, 239, 110, 306, 0, 20, 2, 90, 244, 154, 4, '3.81', '250.png', 'Ho Oh', 'Ho Oh', 275, 3863, 106, 179, 'pv250.wav', 'Rainbow Pokémon', 'Pokémon Arcenciel', 90, 214, '199.00', 19, 33, NULL, 2, 27, 46, 5, 43, 31, NULL, 2, 3, 10),
(251, 100, 210, 100, 270, 100, 20, 10000, 100, 210, 100, 0, '0.61', '251.png', 'Celebi', 'Celebi', 276, 3265, 100, 187, 'pv251.wav', 'Time Travel Pokémon', 'Pokémon Temporel', 100, 225, '5.00', 28, NULL, NULL, 56, 13, NULL, 60, 32, 19, NULL, 2, 12, 14),
(252, 45, 124, 65, 62, 70, 3, 20, 35, 94, 55, 10, '0.51', '252.png', 'Treecko', 'Arcko', 277, 1053, 40, 105, 'pv252.wav', 'Wood Gecko Pokémon', 'Pokémon Bois Gecko', 70, 120, '5.00', NULL, NULL, NULL, 19, 58, NULL, 97, 95, 37, NULL, 3, 12, NULL),
(253, 65, 172, 85, 142, 70, 3, 10, 45, 120, 65, 7, '0.89', '253.png', 'Grovyle', 'Massko', 278, 1673, 50, 118, 'pv253.wav', 'Wood Gecko Pokémon', 'Pokémon Bois Gecko', 95, 137, '21.60', NULL, NULL, NULL, 58, 39, NULL, 97, 58, 37, NULL, 3, 12, NULL),
(254, 85, 223, 105, 239, 70, 3, 5, 65, 169, 85, 5, '1.70', '254.png', 'Sceptile', 'Jungko', 279, 2757, 70, 146, 'pv254.wav', 'Forest Pokémon', 'Pokémon Forêt', 120, 172, '52.20', NULL, NULL, NULL, 55, 58, NULL, 97, 58, 21, 40, 3, 12, NULL),
(255, 60, 130, 70, 62, 70, 3, 20, 40, 87, 50, 10, '0.41', '255.png', 'Torchic', 'Poussifeu', 280, 1093, 45, 111, 'pv255.wav', 'Chick Pokémon', 'Pokémon Poussin', 45, 128, '2.50', NULL, NULL, NULL, 17, 34, NULL, 104, 119, 51, NULL, 3, 10, NULL),
(256, 85, 163, 85, 142, 70, 3, 10, 60, 115, 60, 7, '0.89', '256.png', 'Combusken', 'Galifeu', 281, 1652, 60, 132, 'pv256.wav', 'Young Fowl Pokémon', 'Pokémon Poulet', 55, 155, '19.50', 93, 2, NULL, 36, 34, NULL, 119, 51, 56, NULL, 3, 2, 10),
(257, 120, 240, 110, 239, 70, 3, 5, 70, 141, 70, 5, '1.91', '257.png', 'Blaziken', 'Braségali', 282, 2848, 80, 160, 'pv257.wav', 'Blaze Pokémon', 'Pokémon Ardent', 80, 190, '52.00', 93, 2, NULL, 6, 11, NULL, 5, 47, 16, 18, 3, 2, 10),
(258, 70, 126, 50, 62, 70, 3, 20, 50, 93, 50, 10, '0.41', '258.png', 'Mudkip', 'Gobou', 283, 1128, 50, 118, 'pv258.wav', 'Mud Fish Pokémon', 'Pokémon Poissonboue', 40, 137, '7.60', NULL, NULL, NULL, 40, 43, NULL, 89, 48, 111, NULL, 3, 11, NULL),
(259, 85, 156, 60, 142, 70, 3, 10, 70, 133, 70, 7, '0.71', '259.png', 'Marshtomp', 'Flobio', 284, 1776, 70, 146, 'pv259.wav', 'Mud Fish Pokémon', 'Pokémon Poissonboue', 50, 172, '28.00', 52, 6, NULL, 51, 43, NULL, 89, 88, 23, NULL, 3, 5, 11),
(260, 110, 208, 85, 241, 70, 3, 5, 90, 175, 90, 5, '1.50', '260.png', 'Swampert', 'Laggron', 285, 2974, 100, 187, 'pv260.wav', 'Mud Fish Pokémon', 'Pokémon Poissonboue', 60, 225, '81.90', 52, 6, NULL, 51, 43, NULL, 23, 38, 40, NULL, 3, 5, 11),
(261, 55, 96, 30, 56, 70, 1, 50, 35, 61, 30, 20, '0.51', '261.png', 'Poochyena', 'Medhyèna', 286, 678, 35, 98, 'pv261.wav', 'Bite Pokémon', 'Pokémon Morsure', 35, 111, '13.60', NULL, NULL, NULL, 40, 28, NULL, 114, 106, 111, NULL, 3, 17, NULL),
(262, 90, 171, 60, 147, 70, 1, 20, 70, 132, 60, 7, '0.99', '262.png', 'Mightyena', 'Grahyèna', 287, 1926, 70, 146, 'pv262.wav', 'Bite Pokémon', 'Pokémon Morsure', 70, 172, '37.00', NULL, NULL, NULL, 15, 14, NULL, 114, 106, 54, NULL, 3, 17, NULL),
(263, 30, 58, 30, 56, 70, 1, 50, 41, 80, 41, 20, '0.41', '263.png', 'Zigzagoon', 'Zigzaton', 288, 508, 38, 102, 'pv263.wav', 'Tiny Raccoon Pokémon', 'Pokémon Petit Raton', 60, 116, '17.50', NULL, NULL, NULL, 40, 21, NULL, 49, 37, 111, NULL, 3, 1, NULL),
(264, 70, 142, 50, 147, 70, 1, 20, 61, 128, 61, 7, '0.51', '264.png', 'Linoone', 'Linéon', 289, 1662, 78, 157, 'pv264.wav', 'Rushing Pokémon', 'Pokémon Fonceur', 100, 186, '32.50', NULL, NULL, NULL, 40, 10, NULL, 37, 111, 12, NULL, 3, 1, NULL),
(265, 45, 75, 20, 56, 70, 1, 50, 35, 59, 30, 20, '0.30', '265.png', 'Wurmple', 'Chenipotte', 290, 578, 45, 111, 'pv265.wav', 'Worm Pokémon', 'Pokémon Ver', 20, 128, '3.60', NULL, NULL, NULL, 40, 30, NULL, 126, NULL, NULL, NULL, 3, 7, NULL),
(266, 35, 60, 25, 72, 70, 1, 25, 55, 77, 25, 9, '0.61', '266.png', 'Silcoon', 'Armulys', 291, 553, 50, 118, 'pv266.wav', 'Cocoon Pokémon', 'Pokémon Cocon', 15, 137, '10.00', NULL, NULL, NULL, 53, 30, NULL, 126, NULL, NULL, NULL, 3, 7, NULL),
(267, 70, 189, 100, 178, 70, 1, 13, 50, 98, 50, 6, '0.99', '267.png', 'Beautifly', 'Charmillon', 292, 1765, 60, 132, 'pv267.wav', 'Butterfly Pokémon', 'Pokémon Papillon', 65, 155, '28.40', 10, 82, NULL, 47, 45, NULL, 102, 117, 85, NULL, 3, 3, 7),
(268, 35, 60, 25, 72, 70, 1, 25, 55, 77, 25, 9, '0.71', '268.png', 'Cascoon', 'Blindalys', 293, 553, 50, 118, 'pv268.wav', 'Cocoon Pokémon', 'Pokémon Cocon', 15, 137, '11.50', NULL, NULL, NULL, 53, 30, NULL, 126, NULL, NULL, NULL, 3, 7, NULL),
(269, 50, 98, 50, 173, 70, 1, 13, 70, 162, 90, 6, '1.19', '269.png', 'Dustox', 'Papinox', 294, 1224, 60, 132, 'pv269.wav', 'Poison Moth Pokémon', 'Pokémon Papipoison', 65, 155, '31.60', 45, NULL, NULL, 45, 13, NULL, 117, 34, 85, NULL, 3, 4, 7),
(270, 30, 71, 40, 44, 70, 3, 50, 30, 77, 50, 20, '0.51', '270.png', 'Lotad', 'Nénupiot', 295, 598, 40, 105, 'pv270.wav', 'Water Weed Pokémon', 'Pokémon Aquaplante', 30, 120, '2.60', 53, 1, 25, 43, 9, NULL, 91, 95, NULL, NULL, 3, 12, 11),
(271, 50, 112, 60, 119, 70, 3, 25, 50, 119, 70, 9, '1.19', '271.png', 'Lombre', 'Lombre', 296, 1197, 60, 132, 'pv271.wav', 'Jolly Pokémon', 'Pokémon Jovial', 50, 155, '32.50', 53, 1, 25, 44, 9, NULL, 91, 65, 37, NULL, 3, 12, 11),
(272, 70, 173, 90, 216, 70, 3, 13, 70, 176, 100, 6, '1.50', '272.png', 'Ludicolo', 'Ludicolo', 297, 2323, 80, 160, 'pv272.wav', 'Carefree Pokémon', 'Pokémon Insouciant', 70, 190, '55.00', 53, 1, 25, 44, 9, NULL, 65, 10, 20, 31, 3, 12, 11),
(273, 40, 71, 30, 44, 70, 3, 50, 50, 77, 30, 20, '0.51', '273.png', 'Seedot', 'Grainipiot', 298, 598, 40, 105, 'pv273.wav', 'Acorn Pokémon', 'Pokémon Gland', 30, 120, '4.00', NULL, NULL, NULL, 58, 39, NULL, 33, 95, 37, NULL, 3, 12, NULL),
(274, 70, 134, 60, 119, 70, 3, 25, 40, 78, 40, 9, '0.99', '274.png', 'Nuzleaf', 'Pifeuil', 299, 1227, 70, 146, 'pv274.wav', 'Wily Pokémon', 'Pokémon Malin', 60, 172, '28.00', 49, 23, 5, 25, 9, NULL, 58, 33, 37, NULL, 3, 17, 12),
(275, 100, 200, 90, 216, 70, 3, 13, 60, 121, 60, 6, '1.30', '275.png', 'Shiftry', 'Tengalice', 300, 2333, 90, 173, 'pv275.wav', 'Wicked Pokémon', 'Pokémon Malveillant', 80, 207, '59.60', 49, 23, 5, 25, 9, NULL, 127, 58, 33, 15, 3, 17, 12),
(276, 55, 106, 30, 54, 70, 1, 50, 30, 61, 30, 20, '0.30', '276.png', 'Taillow', 'Nirondelle', 301, 765, 40, 105, 'pv276.wav', 'Tiny Swallow Pokémon', 'Pokémon Minirondel', 85, 120, '2.30', 88, 67, NULL, 39, 36, NULL, 97, NULL, NULL, NULL, 3, 3, 1),
(277, 85, 185, 75, 159, 70, 1, 20, 60, 124, 50, 7, '0.71', '277.png', 'Swellow', 'Hélédelle', 302, 1920, 60, 132, 'pv277.wav', 'Swallow Pokémon', 'Pokémon Hirondelle', 125, 155, '19.80', 88, 67, NULL, 35, 2, NULL, 97, 17, 5, NULL, 3, 3, 1),
(278, 30, 106, 55, 54, 70, 3, 50, 30, 61, 30, 20, '0.61', '278.png', 'Wingull', 'Goélise', 303, 765, 40, 105, 'pv278.wav', 'Seagull Pokémon', 'Pokémon Mouette', 85, 120, '9.50', 1, 43, 126, 43, 39, NULL, 102, 105, 65, NULL, 3, 3, 11),
(279, 50, 175, 95, 154, 70, 3, 20, 100, 174, 70, 7, '1.19', '279.png', 'Pelipper', 'Bekipan', 304, 2127, 60, 132, 'pv279.wav', 'Water Bird Pokémon', 'Pokémon Oiseaudo', 65, 155, '28.00', 1, 44, 126, 43, 35, NULL, 15, 10, 20, NULL, 3, 3, 11),
(280, 25, 79, 45, 40, 35, 5, 40, 25, 59, 35, 9, '0.41', '280.png', 'Ralts', 'Tarsal', 305, 539, 28, 89, 'pv280.wav', 'Feeling Pokémon', 'Pokémon Sentiment', 40, 99, '6.60', 68, NULL, 98, 56, 13, NULL, 124, 87, 121, NULL, 3, 18, 14),
(281, 35, 117, 65, 97, 35, 5, 10, 35, 90, 55, 6, '0.79', '281.png', 'Kirlia', 'Kirlia', 306, 966, 38, 102, 'pv281.wav', 'Emotion Pokémon', 'Pokémon Émotion', 50, 116, '20.20', 68, NULL, 98, 56, 13, NULL, 124, 121, 32, NULL, 3, 18, 14),
(282, 65, 237, 125, 233, 35, 5, 5, 65, 195, 115, 5, '1.60', '282.png', 'Gardevoir', 'Gardevoir', 307, 3093, 68, 143, 'pv282.wav', 'Embrace Pokémon', 'Pokémon Étreinte', 80, 169, '48.40', 68, NULL, 98, 56, 13, NULL, 41, 60, 32, NULL, 3, 18, 14),
(283, 30, 93, 50, 54, 70, 1, 50, 32, 87, 52, 20, '0.51', '283.png', 'Surskit', 'Arakdo', 309, 791, 40, 105, 'pv283.wav', 'Pond Skater Pokémon', 'Pokémon Maresurfeur', 65, 120, '1.70', 1, 25, NULL, 30, 44, NULL, 123, 91, 77, NULL, 3, 11, 7),
(284, 60, 192, 100, 159, 70, 1, 20, 62, 150, 82, 7, '0.79', '284.png', 'Masquerain', 'Maskadra', 310, 2270, 70, 146, 'pv284.wav', 'Eyeball Pokémon', 'Pokémon Boule Œil', 80, 172, '3.60', 14, 9, NULL, 47, 20, NULL, 107, 102, 117, NULL, 3, 3, 7),
(285, 40, 74, 40, 59, 70, 3, 50, 60, 110, 60, 20, '0.41', '285.png', 'Shroomish', 'Balignon', 311, 810, 60, 132, 'pv285.wav', 'Mushroom Pokémon', 'Pokémon Champignon', 35, 155, '4.50', NULL, NULL, NULL, 40, 58, NULL, 73, 95, 37, NULL, 3, 12, NULL),
(286, 130, 241, 60, 161, 70, 3, 20, 80, 144, 60, 7, '1.19', '286.png', 'Breloom', 'Chapignon', 312, 2628, 60, 132, 'pv286.wav', 'Mushroom Pokémon', 'Pokémon Champignon', 70, 155, '39.20', 51, 131, NULL, 58, 6, NULL, 73, 34, 44, 37, 3, 2, 12),
(287, 60, 104, 35, 56, 70, 5, 40, 60, 92, 35, 9, '0.79', '287.png', 'Slakoth', 'Parecool', 313, 1002, 60, 132, 'pv287.wav', 'Slacker Pokémon', 'Pokémon Flâneur', 30, 155, '24.00', NULL, NULL, NULL, 64, NULL, NULL, 83, 99, 72, NULL, 3, 1, NULL),
(288, 80, 159, 55, 154, 70, 5, 10, 80, 145, 55, 6, '1.40', '288.png', 'Vigoroth', 'Vigoroth', 314, 1968, 80, 160, 'pv288.wav', 'Wild Monkey Pokémon', 'Pokémon Turbusinge', 90, 190, '46.50', NULL, NULL, NULL, 17, 6, NULL, 83, 72, 98, NULL, 3, 1, NULL),
(289, 160, 290, 95, 252, 70, 5, 5, 100, 166, 65, 5, '2.01', '289.png', 'Slaking', 'Monaflèmit', 315, 4431, 150, 233, 'pv289.wav', 'Lazy Pokémon', 'Pokémon Fainéant', 100, 284, '130.50', NULL, NULL, NULL, 64, NULL, NULL, 54, 40, 19, NULL, 3, 1, NULL),
(290, 45, 80, 30, 53, 70, 5, 20, 90, 126, 30, 10, '0.51', '290.png', 'Nincada', 'Ningale', 316, 768, 31, 94, 'pv290.wav', 'Trainee Pokémon', 'Pokémon Apprenti', 40, 104, '5.50', 7, 45, NULL, 30, 17, NULL, 99, 97, 85, NULL, 3, 5, 7),
(291, 90, 199, 50, 160, 70, 5, 10, 45, 112, 50, 7, '0.79', '291.png', 'Ninjask', 'Ninjask', 317, 1969, 61, 135, 'pv291.wav', 'Ninja Pokémon', 'Pokémon Ninja', 160, 156, '12.00', 46, 93, NULL, 55, 22, NULL, 97, 85, 41, NULL, 3, 3, 7),
(292, 90, 153, 30, 83, 70, 5, 5, 45, 73, 30, 5, '0.79', '292.png', 'Shedinja', 'Munja', 318, 393, 1, 12, 'pv292.wav', 'Shed Pokémon', 'Pokémon Exuvie', 40, 1, '1.20', 54, NULL, NULL, 30, 10, NULL, 124, 97, 111, NULL, 3, 8, 7),
(293, 51, 92, 51, 48, 70, 1, 50, 23, 42, 23, 20, '0.61', '293.png', 'Whismur', 'Chuchmur', 319, 671, 64, 138, 'pv293.wav', 'Whisper Pokémon', 'Pokémon Chuchoteur', 28, 162, '16.30', NULL, NULL, NULL, 19, 57, NULL, 48, 121, 51, NULL, 3, 1, NULL),
(294, 71, 134, 71, 126, 70, 1, 25, 43, 81, 43, 9, '0.99', '294.png', 'Loudred', 'Ramboum', 320, 1327, 84, 165, 'pv294.wav', 'Big Voice Pokémon', 'Pokémon Grosse Voix', 48, 197, '40.50', NULL, NULL, NULL, 15, 21, NULL, 48, 121, 51, NULL, 3, 1, NULL),
(295, 91, 179, 91, 221, 70, 1, 13, 63, 137, 73, 6, '1.50', '295.png', 'Exploud', 'Brouhabam', 321, 2347, 104, 193, 'pv295.wav', 'Loud Noise Pokémon', 'Pokémon Bruit Sourd', 68, 232, '84.00', NULL, NULL, NULL, 15, 57, NULL, 121, 106, 43, NULL, 3, 1, NULL),
(296, 60, 99, 20, 47, 70, 3, 50, 30, 54, 30, 10, '0.99', '296.png', 'Makuhita', 'Makuhita', 322, 817, 72, 149, 'pv296.wav', 'Guts Pokémon', 'Pokémon Tenace', 25, 176, '86.40', NULL, NULL, NULL, 40, 21, NULL, 112, 39, 46, NULL, 3, 2, NULL),
(297, 120, 209, 40, 166, 70, 3, 20, 60, 114, 60, 6, '2.31', '297.png', 'Hariyama', 'Hariyama', 323, 2829, 144, 247, 'pv297.wav', 'Arm Thrust Pokémon', 'Pokémon Cogneur', 50, 302, '253.80', NULL, NULL, NULL, 42, 6, NULL, 46, 44, 8, NULL, 3, 2, NULL),
(298, 20, 36, 20, 38, 70, 3, 10, 40, 71, 40, 4, '0.20', '298.png', 'Azurill', 'Azurill', 211, 364, 50, 118, 'pv298.wav', 'Polka Dot Pokémon', 'Pokémon Point Polka', 20, 137, '2.00', 40, NULL, 58, 62, 44, NULL, 91, 72, 65, NULL, 3, 18, 1),
(299, 45, 82, 45, 75, 70, 3, 20, 135, 215, 90, 9, '0.99', '299.png', 'Nosepass', 'Tarinor', 324, 993, 30, 91, 'pv299.wav', 'Compass Pokémon', 'Pokémon Boussole', 30, 102, '97.00', NULL, NULL, NULL, 49, 5, NULL, 90, 49, 56, NULL, 3, 6, NULL),
(300, 45, 84, 35, 52, 70, 3, 50, 45, 79, 35, 10, '0.61', '300.png', 'Skitty', 'Skitty', 326, 739, 50, 118, 'pv300.wav', 'Kitten Pokémon', 'Pokémon Chaton', 50, 137, '11.00', NULL, NULL, NULL, 40, 25, NULL, 121, 36, 111, NULL, 3, 1, NULL),
(301, 65, 132, 55, 140, 70, 3, 20, 65, 127, 55, 6, '1.09', '301.png', 'Delcatty', 'Delcatty', 327, 1496, 70, 146, 'pv301.wav', 'Prim Pokémon', 'Pokémon Guindé', 90, 172, '32.60', NULL, NULL, NULL, 25, 26, NULL, 121, 54, 36, NULL, 3, 1, NULL),
(302, 75, 141, 65, 133, 35, 5, 20, 75, 136, 65, 7, '0.51', '302.png', 'Sableye', 'Ténéfix', 328, 1476, 50, 118, 'pv302.wav', 'Darkness Pokémon', 'Pokémon Obscurité', 50, 137, '11.00', 61, 60, 126, 10, 25, NULL, 124, 33, 64, NULL, 3, 8, 17),
(303, 85, 155, 55, 133, 70, 5, 50, 85, 141, 55, 9, '0.61', '303.png', 'Mawile', 'Mysdibule', 329, 1634, 50, 118, 'pv303.wav', 'Deceiver Pokémon', 'Pokémon Trompeur', 50, 137, '11.50', 101, 9, 129, 15, 57, NULL, 118, 53, 54, NULL, 3, 18, 9),
(304, 70, 121, 40, 66, 35, 1, 50, 100, 141, 40, 20, '0.41', '304.png', 'Aron', 'Galekid', 330, 1307, 50, 118, 'pv304.wav', 'Iron Armor Pokémon', 'Pokémon Armurfer', 30, 137, '60.00', 59, 92, 22, 40, 22, NULL, 72, 53, 104, NULL, 3, 6, 9),
(305, 90, 158, 50, 151, 35, 1, 25, 140, 198, 50, 9, '0.89', '305.png', 'Lairon', 'Galegon', 331, 2056, 60, 132, 'pv305.wav', 'Iron Armor Pokémon', 'Pokémon Armurfer', 40, 155, '120.00', 59, 92, 22, 22, 4, NULL, 72, 46, 56, NULL, 3, 6, 9),
(306, 110, 198, 60, 239, 35, 1, 13, 180, 257, 60, 6, '2.11', '306.png', 'Aggron', 'Galeking', 332, 3000, 70, 146, 'pv306.wav', 'Iron Armor Pokémon', 'Pokémon Armurfer', 50, 172, '360.00', 59, 92, 22, 3, 4, NULL, 46, 12, 7, NULL, 3, 6, 9),
(307, 40, 78, 40, 56, 70, 3, 50, 55, 107, 55, 10, '0.61', '307.png', 'Meditite', 'Méditikka', 333, 693, 30, 91, 'pv307.wav', 'Meditate Pokémon', 'Pokémon Méditation', 60, 102, '11.20', 68, NULL, NULL, 21, 13, NULL, 112, 70, 87, NULL, 3, 14, 2),
(308, 60, 121, 60, 144, 70, 3, 20, 75, 152, 75, 6, '1.30', '308.png', 'Medicham', 'Charmina', 334, 1431, 60, 132, 'pv308.wav', 'Meditate Pokémon', 'Pokémon Méditation', 80, 155, '31.50', 68, NULL, NULL, 52, 6, NULL, 70, 84, 44, 32, 3, 14, 2),
(309, 45, 123, 65, 59, 70, 3, 50, 40, 78, 40, 10, '0.61', '309.png', 'Electrike', 'Dynavolt', 335, 965, 40, 105, 'pv309.wav', 'Lightning Pokémon', 'Pokémon Orage', 65, 120, '15.20', NULL, NULL, NULL, 49, 39, NULL, 110, 76, 49, NULL, 3, 13, NULL),
(310, 75, 215, 105, 166, 70, 3, 20, 60, 127, 60, 6, '1.50', '310.png', 'Manectric', 'Élecsprint', 336, 2340, 70, 146, 'pv310.wav', 'Discharge Pokémon', 'Pokémon Décharge', 105, 172, '40.20', NULL, NULL, NULL, 56, 28, NULL, 67, 36, 12, NULL, 3, 13, NULL),
(311, 50, 167, 85, 142, 70, 3, 30, 40, 129, 75, 9, '0.41', '311.png', 'Plusle', 'Posipi', 337, 1778, 60, 132, 'pv311.wav', 'Cheering Pokémon', 'Pokémon Acclameur', 95, 155, '4.20', NULL, NULL, NULL, 49, 39, NULL, 110, 76, 49, NULL, 3, 13, NULL),
(312, 40, 147, 75, 142, 70, 3, 30, 50, 150, 85, 9, '0.41', '312.png', 'Minun', 'Négapi', 338, 1694, 60, 132, 'pv312.wav', 'Cheering Pokémon', 'Pokémon Acclameur', 95, 155, '4.20', NULL, NULL, NULL, 49, 39, NULL, 110, 76, 49, NULL, 3, 13, NULL),
(313, 73, 143, 47, 151, 70, 3, 30, 75, 166, 85, 9, '0.71', '313.png', 'Volbeat', 'Muciole', 339, 1771, 65, 139, 'pv313.wav', 'Firefly Pokémon', 'Pokémon Luciole', 85, 163, '17.70', NULL, NULL, NULL, 40, 45, NULL, 77, 49, 85, NULL, 3, 7, NULL),
(314, 47, 143, 73, 151, 70, 3, 30, 75, 166, 85, 9, '0.71', '314.png', 'Illumise', 'Lumivole', 340, 1771, 65, 139, 'pv314.wav', 'Firefly Pokémon', 'Pokémon Luciole', 85, 163, '17.70', NULL, NULL, NULL, 40, 45, NULL, 117, 85, 60, NULL, 3, 7, NULL),
(315, 60, 186, 100, 140, 70, 3, 30, 45, 131, 80, 9, '0.30', '315.png', 'Roselia', 'Rosélia', 342, 1870, 50, 118, 'pv315.wav', 'Thorn Pokémon', 'Pokémon Épine', 65, 137, '2.00', 32, 79, 28, 12, 9, NULL, 34, 60, 9, NULL, 3, 4, 12),
(316, 43, 80, 43, 60, 70, 1, 50, 53, 99, 53, 10, '0.41', '316.png', 'Gulpin', 'Gloupti', 344, 866, 70, 146, 'pv316.wav', 'Stomach Pokémon', 'Pokémon Estomac', 40, 172, '10.30', NULL, NULL, NULL, 19, 21, NULL, 89, 65, 11, NULL, 3, 4, NULL),
(317, 73, 140, 73, 163, 70, 1, 20, 83, 159, 83, 6, '1.70', '317.png', 'Swalot', 'Avaltout', 345, 1978, 100, 187, 'pv317.wav', 'Poison Bag Pokémon', 'Pokémon Sac Poison', 55, 225, '80.00', NULL, NULL, NULL, 47, 21, NULL, 128, 34, 65, 11, 3, 4, NULL),
(318, 90, 171, 65, 61, 35, 3, 50, 20, 39, 20, 10, '0.79', '318.png', 'Carvanha', 'Carvanha', 346, 1020, 45, 111, 'pv318.wav', 'Savage Pokémon', 'Pokémon Féroce', 65, 128, '20.80', 93, 64, NULL, 15, 28, NULL, 114, 123, 106, NULL, 3, 17, 11),
(319, 120, 243, 95, 161, 35, 3, 20, 40, 83, 40, 6, '1.80', '319.png', 'Sharpedo', 'Sharpedo', 347, 2181, 70, 146, 'pv319.wav', 'Brutal Pokémon', 'Pokémon Brutal', 95, 172, '88.80', 93, 64, NULL, 15, 7, NULL, 114, 106, 20, NULL, 3, 17, 11),
(320, 70, 136, 70, 80, 70, 1, 50, 35, 68, 35, 10, '2.01', '320.png', 'Wailmer', 'Wailmer', 348, 1468, 130, 228, 'pv320.wav', 'Ball Whale Pokémon', 'Pokémon Baleinboule', 60, 277, '130.00', NULL, NULL, NULL, 62, 43, NULL, 72, 105, 46, NULL, 3, 11, NULL),
(321, 90, 175, 90, 175, 70, 1, 20, 45, 87, 45, 6, '14.50', '321.png', 'Wailord', 'Wailord', 349, 2280, 170, 283, 'pv321.wav', 'Float Whale Pokémon', 'Pokémon Cachabouée', 60, 347, '398.00', NULL, NULL, NULL, 43, 26, NULL, 23, 10, 19, NULL, 3, 11, NULL),
(322, 60, 119, 65, 61, 70, 3, 50, 40, 79, 45, 10, '0.71', '322.png', 'Numel', 'Chamallot', 350, 1057, 60, 132, 'pv322.wav', 'Numb Pokémon', 'Pokémon Engourdi', 35, 155, '24.00', 53, 63, 128, 40, 34, NULL, 48, 98, 52, NULL, 3, 5, 10),
(323, 100, 194, 105, 161, 70, 3, 20, 70, 136, 75, 6, '1.91', '323.png', 'Camerupt', 'Camérupt', 351, 2193, 70, 146, 'pv323.wav', 'Eruption Pokémon', 'Pokémon Éruption', 40, 172, '220.00', NULL, 134, 114, 34, 21, NULL, 63, 40, 18, 31, 3, 5, 10),
(324, 85, 151, 85, 165, 70, 3, 30, 140, 203, 70, 9, '0.51', '324.png', 'Torkoal', 'Chartor', 352, 2093, 70, 146, 'pv324.wav', 'Coal Pokémon', 'Pokémon Charbon', 20, 172, '80.40', NULL, NULL, NULL, 34, 11, NULL, 40, 18, 31, NULL, 3, 10, NULL),
(325, 25, 125, 70, 66, 70, 1, 50, 35, 122, 80, 10, '0.71', '325.png', 'Spoink', 'Spoink', 353, 1334, 60, 132, 'pv325.wav', 'Bounce Pokémon', 'Pokémon Rebond', 60, 155, '30.60', NULL, NULL, NULL, 62, 26, NULL, 96, 103, 41, NULL, 3, 14, NULL),
(326, 45, 171, 90, 165, 70, 1, 20, 65, 188, 110, 6, '0.89', '326.png', 'Grumpig', 'Groret', 354, 2369, 80, 160, 'pv326.wav', 'Manipulate Pokémon', 'Pokémon Magouilleur', 80, 190, '71.50', NULL, NULL, NULL, 56, 27, NULL, 96, 41, 32, NULL, 3, 14, NULL),
(327, 60, 116, 60, 126, 70, 3, 30, 60, 116, 60, 9, '1.09', '327.png', 'Spinda', 'Spinda', 355, 1220, 60, 132, 'pv327.wav', 'Spot Panda Pokémon', 'Pokémon Panda Tache', 60, 155, '5.00', NULL, NULL, NULL, 52, 31, NULL, 120, 104, 111, NULL, 3, 1, NULL),
(328, 100, 162, 45, 58, 70, 5, 40, 45, 78, 45, 9, '0.71', '328.png', 'Trapinch', 'Kraknoix', 356, 1274, 45, 111, 'pv328.wav', 'Ant Pit Pokémon', 'Pokémon Piégeur', 10, 128, '15.00', NULL, NULL, NULL, 51, 45, NULL, 106, 116, 111, NULL, 3, 5, NULL),
(329, 70, 134, 50, 119, 70, 5, 10, 50, 99, 50, 6, '1.09', '329.png', 'Vibrava', 'Vibraninf', 357, 1225, 50, 118, 'pv329.wav', 'Vibration Pokémon', 'Pokémon Vibration', 70, 137, '15.30', 70, NULL, NULL, 51, 16, NULL, 116, 85, 98, NULL, 3, 16, 5),
(330, 100, 205, 80, 234, 70, 5, 5, 80, 168, 80, 5, '2.01', '330.png', 'Flygon', 'Libégon', 358, 2661, 80, 160, 'pv330.wav', 'Mystic Pokémon', 'Pokémon Mystique', 100, 190, '82.00', 70, NULL, NULL, 51, 16, NULL, 57, 7, 40, NULL, 3, 16, 5),
(331, 85, 156, 85, 67, 35, 3, 50, 40, 74, 40, 10, '0.41', '331.png', 'Cacnea', 'Cacnea', 359, 1242, 50, 118, 'pv331.wav', 'Cactus Pokémon', 'Pokémon Cactus', 35, 137, '51.30', NULL, NULL, NULL, 53, 31, NULL, 83, 73, 37, NULL, 3, 12, NULL),
(332, 115, 221, 115, 166, 35, 3, 20, 60, 115, 60, 6, '1.30', '332.png', 'Cacturne', 'Cacturne', 360, 2298, 70, 146, 'pv332.wav', 'Scarecrow Pokémon', 'Pokémon Épouvantail', 55, 172, '77.40', 65, 20, NULL, 31, 12, NULL, 68, 44, 37, NULL, 3, 17, 12),
(333, 40, 76, 40, 62, 70, 1, 50, 60, 132, 75, 10, '0.41', '333.png', 'Swablu', 'Tylton', 361, 824, 45, 111, 'pv333.wav', 'Cotton Bird Pokémon', 'Pokémon Oiseaucoton', 50, 128, '1.20', NULL, 28, NULL, 57, 36, NULL, 97, 121, 65, NULL, 3, 3, 1),
(334, 70, 141, 70, 172, 70, 1, 20, 90, 201, 105, 6, '1.09', '334.png', 'Altaria', 'Altaria', 362, 2004, 75, 153, 'pv334.wav', 'Humming Pokémon', 'Pokémon Virevolteur', 80, 181, '20.60', NULL, 28, NULL, 16, 36, NULL, 17, 80, 60, NULL, 3, 3, 16),
(335, 115, 222, 60, 160, 70, 3, 30, 60, 124, 60, 9, '1.30', '335.png', 'Zangoose', 'Mangriff', 363, 2418, 73, 150, 'pv335.wav', 'Cat Ferret Pokémon', 'Pokémon Chat Furet', 90, 177, '40.30', NULL, NULL, NULL, 55, 10, NULL, 99, 111, 8, NULL, 3, 1, NULL),
(336, 100, 196, 100, 160, 70, 3, 30, 60, 118, 60, 9, '2.69', '336.png', 'Seviper', 'Séviper', 364, 2105, 73, 150, 'pv336.wav', 'Fang Snake Pokémon', 'Pokémon Serpacroc', 65, 177, '52.50', NULL, NULL, NULL, 12, 4, NULL, 114, 113, 106, NULL, 3, 4, NULL),
(337, 55, 178, 95, 161, 70, 3, 30, 65, 153, 85, 9, '0.99', '337.png', 'Lunatone', 'Séléroc', 365, 2327, 90, 173, 'pv337.wav', 'Meteorite Pokémon', 'Pokémon Météorite', 70, 207, '168.00', 70, NULL, NULL, 5, 13, NULL, 56, 32, 42, NULL, 3, 14, 6),
(338, 95, 178, 55, 161, 70, 3, 30, 85, 153, 65, 9, '1.19', '338.png', 'Solrock', 'Solaroc', 366, 2327, 90, 173, 'pv338.wav', 'Meteorite Pokémon', 'Pokémon Météorite', 70, 207, '154.00', 70, NULL, NULL, 5, 13, NULL, 56, 32, 31, NULL, 3, 14, 6),
(339, 48, 93, 46, 58, 70, 1, 50, 43, 82, 41, 10, '0.41', '339.png', 'Barboach', 'Barloche', 367, 819, 50, 118, 'pv339.wav', 'Whiskers Pokémon', 'Pokémon Barbillon', 60, 137, '1.90', 43, 57, 128, 51, 43, NULL, 71, 88, 65, NULL, 3, 5, 11),
(340, 78, 151, 76, 164, 70, 1, 20, 73, 141, 71, 6, '0.89', '340.png', 'Whiscash', 'Barbicha', 368, 2075, 110, 200, 'pv340.wav', 'Whiskers Pokémon', 'Pokémon Barbillon', 60, 242, '23.60', 43, 57, 128, 51, 43, NULL, 88, 105, 10, NULL, 3, 5, 11),
(341, 80, 141, 50, 62, 70, 3, 50, 65, 99, 35, 10, '0.61', '341.png', 'Corphish', 'Écrapince', 369, 1230, 43, 109, 'pv341.wav', 'Ruffian Pokémon', 'Pokémon Brute', 35, 125, '11.50', NULL, NULL, NULL, 44, 21, NULL, 118, 123, 91, NULL, 3, 11, NULL),
(342, 120, 224, 90, 164, 70, 3, 20, 85, 142, 55, 6, '1.09', '342.png', 'Crawdaunt', 'Colhomard', 370, 2474, 63, 136, 'pv342.wav', 'Rogue Pokémon', 'Pokémon Crapule', 55, 160, '32.80', NULL, 21, 129, 28, 7, NULL, 118, 91, 99, NULL, 3, 17, 11),
(343, 40, 77, 40, 60, 70, 3, 50, 55, 124, 70, 10, '0.51', '343.png', 'Baltoy', 'Balbuto', 371, 787, 40, 105, 'pv343.wav', 'Clay Doll Pokémon', 'Pokémon Poupargile', 55, 120, '21.50', 70, NULL, NULL, 27, 13, NULL, 103, 86, 111, NULL, 3, 14, 5),
(344, 70, 140, 70, 175, 70, 3, 20, 105, 229, 120, 6, '1.50', '344.png', 'Claydol', 'Kaorine', 372, 1971, 60, 132, 'pv344.wav', 'Clay Doll Pokémon', 'Pokémon Poupargile', 75, 155, '108.00', 70, NULL, NULL, 27, 13, NULL, 86, 63, 32, 40, 3, 14, 5),
(345, 41, 105, 61, 71, 70, 3, 50, 77, 150, 87, 10, '0.99', '345.png', 'Lileep', 'Lilia', 373, 1291, 66, 140, 'pv345.wav', 'Sea Lily Pokémon', 'Pokémon Lis d’Eau', 23, 165, '23.80', 110, NULL, NULL, 23, 47, NULL, 96, 115, 37, NULL, 3, 12, 6),
(346, 81, 152, 81, 173, 70, 3, 20, 97, 194, 107, 6, '1.50', '346.png', 'Cradily', 'Vacilys', 374, 2211, 86, 168, 'pv346.wav', 'Barnacle Pokémon', 'Pokémon Bernacle', 43, 200, '60.40', 110, NULL, NULL, 23, 47, NULL, 98, 37, 7, NULL, 3, 12, 6),
(347, 95, 176, 40, 71, 70, 3, 50, 50, 100, 50, 10, '0.71', '347.png', 'Anorith', 'Anorith', 375, 1529, 45, 111, 'pv347.wav', 'Old Shrimp Pokémon', 'Pokémon Crustage', 75, 128, '12.50', 25, 74, NULL, 17, 45, NULL, 69, 123, 115, NULL, 3, 7, 6),
(348, 125, 222, 70, 173, 70, 3, 20, 100, 174, 80, 6, '1.50', '348.png', 'Armaldo', 'Armaldo', 376, 2848, 75, 153, 'pv348.wav', 'Plate Pokémon', 'Pokémon Blindage', 45, 181, '68.20', 25, 74, NULL, 55, 45, NULL, 69, 90, 105, NULL, 3, 7, 6),
(349, 15, 29, 10, 40, 70, 5, 70, 20, 85, 55, 15, '0.61', '349.png', 'Feebas', 'Barpau', 377, 274, 20, 78, 'pv349.wav', 'Fish Pokémon', 'Pokémon Poisson', 80, 85, '7.40', NULL, NULL, NULL, 62, 40, NULL, 96, NULL, NULL, NULL, 3, 11, NULL),
(350, 60, 192, 100, 189, 70, 5, 10, 79, 219, 125, 7, '6.20', '350.png', 'Milotic', 'Milobellus', 378, 3005, 95, 180, 'pv350.wav', 'Tender Pokémon', 'Pokémon Tendre', 81, 216, '162.00', NULL, NULL, NULL, 3, 7, NULL, 23, 10, 19, NULL, 3, 11, NULL),
(351, 70, 139, 70, 147, 70, 5, 30, 70, 139, 70, 10, '0.30', '351.png', 'Castform', 'Morphéo', 379, 1632, 70, 146, 'pv351.wav', 'Weather Pokémon', 'Pokémon Climat', 70, 172, '0.80', NULL, NULL, NULL, 40, 54, NULL, 27, 95, 15, NULL, 3, 1, NULL),
(352, 90, 161, 60, 154, 70, 5, 30, 70, 189, 120, 10, '0.99', '352.png', 'Kecleon', 'Kecleon', 380, 2047, 60, 134, 'pv352.wav', 'Color Swap Pokémon', 'Pokémon Multicolor', 40, 155, '22.00', NULL, NULL, NULL, 37, 31, NULL, 33, 51, 65, 12, 3, 1, NULL),
(353, 75, 138, 63, 59, 35, 3, 40, 35, 65, 33, 10, '0.61', '353.png', 'Shuppet', 'Polichombr', 381, 1018, 44, 111, 'pv353.wav', 'Puppet Pokémon', 'Pokémon Poupée', 45, 127, '2.30', NULL, NULL, NULL, 57, 25, NULL, 124, 107, 94, NULL, 3, 8, NULL),
(354, 115, 218, 83, 159, 35, 7, 20, 65, 126, 63, 7, '1.09', '354.png', 'Banette', 'Branette', 382, 2298, 64, 138, 'pv354.wav', 'Marionette Pokémon', 'Pokémon Marionnette', 65, 162, '12.50', NULL, NULL, NULL, 10, 54, NULL, 60, 41, 12, NULL, 3, 8, NULL),
(355, 40, 70, 30, 59, 35, 3, 40, 90, 162, 90, 10, '0.79', '355.png', 'Duskull', 'Skelénox', 383, 706, 20, 78, 'pv355.wav', 'Requiem Pokémon', 'Pokémon Requiem', 25, 85, '15.00', NULL, NULL, NULL, 10, 54, NULL, 124, 107, 94, NULL, 3, 8, NULL),
(356, 70, 124, 60, 159, 35, 3, 20, 130, 234, 130, 7, '1.60', '356.png', 'Dusclops', 'Téraclope', 384, 1591, 40, 105, 'pv356.wav', 'Beckon Pokémon', 'Pokémon Appel', 25, 120, '30.60', NULL, NULL, NULL, 54, 25, NULL, 92, 70, 82, NULL, 3, 8, NULL),
(357, 68, 136, 72, 161, 70, 5, 30, 83, 163, 87, 10, '2.01', '357.png', 'Tropius', 'Tropius', 386, 1941, 99, 186, 'pv357.wav', 'Fruit Pokémon', 'Pokémon Fruit', 51, 223, '100.00', 90, 3, 5, 9, 20, NULL, 97, 48, 58, NULL, 3, 3, 12),
(358, 50, 175, 95, 159, 70, 5, 30, 80, 170, 90, 10, '0.61', '358.png', 'Chimecho', 'Éoko', 388, 2259, 75, 153, 'pv358.wav', 'Wind Chime Pokémon', 'Pokémon Carillon', 65, 181, '1.00', NULL, NULL, NULL, 57, 27, NULL, 87, 95, 41, NULL, 3, 14, NULL),
(359, 130, 246, 75, 163, 35, 5, 50, 60, 120, 60, 10, '1.19', '359.png', 'Absol', 'Absol', 389, 2526, 65, 139, 'pv359.wav', 'Disaster Pokémon', 'Pokémon Désastre', 75, 163, '47.00', NULL, NULL, NULL, 52, 28, NULL, 68, 14, 12, NULL, 3, 17, NULL),
(360, 23, 41, 23, 52, 70, 3, 30, 48, 86, 48, 10, '0.61', '360.png', 'Wynaut', 'Okéoké', 232, 534, 95, 180, 'pv360.wav', 'Bright Pokémon', 'Pokémon Ravi', 23, 216, '14.00', NULL, NULL, NULL, 62, 6, NULL, 96, NULL, NULL, NULL, 3, 14, NULL),
(361, 50, 95, 50, 60, 70, 3, 50, 50, 95, 50, 10, '0.71', '361.png', 'Snorunt', 'Stalgamin', 390, 888, 50, 118, 'pv361.wav', 'Snow Hat Pokémon', 'Pokémon Capuche', 50, 137, '16.80', NULL, NULL, NULL, 60, 54, NULL, 120, 45, 41, NULL, 3, 15, NULL),
(362, 80, 162, 80, 168, 70, 3, 20, 80, 162, 80, 6, '1.50', '362.png', 'Glalie', 'Oniglali', 391, 2105, 80, 160, 'pv362.wav', 'Face Pokémon', 'Pokémon Face', 80, 190, '256.50', NULL, NULL, NULL, 24, 38, NULL, 86, 45, 41, NULL, 3, 15, NULL),
(363, 40, 95, 55, 58, 70, 3, 50, 50, 90, 50, 10, '0.79', '363.png', 'Spheal', 'Obalie', 393, 962, 70, 146, 'pv363.wav', 'Clap Pokémon', 'Pokémon Clap Clap', 25, 172, '39.50', 128, 71, 58, 43, 21, NULL, 72, 105, 100, NULL, 3, 11, 15),
(364, 60, 137, 75, 144, 70, 3, 25, 70, 132, 70, 7, '1.09', '364.png', 'Sealeo', 'Phogleur', 394, 1714, 90, 173, 'pv364.wav', 'Ball Roll Pokémon', 'Pokémon Roule Boule', 45, 207, '87.60', 128, 71, 58, 43, 60, NULL, 72, 105, 100, NULL, 3, 11, 15),
(365, 80, 182, 95, 239, 70, 3, 13, 90, 176, 90, 5, '1.40', '365.png', 'Walrein', 'Kaimorse', 395, 2726, 110, 200, 'pv365.wav', 'Ice Break Pokémon', 'Pokémon Brise Glace', 65, 242, '150.60', 128, 71, 58, 24, 7, NULL, 105, 40, 10, NULL, 3, 11, 15),
(366, 64, 133, 74, 69, 70, 3, 50, 85, 135, 55, 10, '0.41', '366.png', 'Clamperl', 'Coquiperl', 396, 1270, 35, 99, 'pv366.wav', 'Bivalve Pokémon', 'Pokémon Bivalve', 32, 111, '52.50', NULL, NULL, NULL, 43, NULL, NULL, 72, 105, 65, NULL, 3, 11, NULL),
(367, 104, 197, 94, 170, 70, 3, 20, 105, 179, 75, 6, '1.70', '367.png', 'Huntail', 'Serpang', 397, 2340, 55, 127, 'pv367.wav', 'Deep Sea Pokémon', 'Pokémon Abysse', 52, 146, '27.00', NULL, NULL, NULL, 43, 15, NULL, 106, 71, 65, NULL, 3, 11, NULL),
(368, 84, 211, 114, 170, 70, 3, 20, 105, 179, 75, 6, '1.80', '368.png', 'Gorebyss', 'Rosabyss', 398, 2494, 55, 127, 'pv368.wav', 'South Sea Pokémon', 'Pokémon Mer du Sud', 52, 146, '22.60', NULL, NULL, NULL, 43, 13, NULL, 93, 105, 32, NULL, 3, 11, NULL),
(369, 90, 162, 45, 170, 70, 5, 90, 130, 203, 65, 1, '0.99', '369.png', 'Relicanth', 'Relicanth', 399, 2528, 100, 187, 'pv369.wav', 'Longevity Pokémon', 'Pokémon Longévité', 55, 225, '23.40', 22, 92, 25, 43, 26, NULL, 71, 115, 20, NULL, 3, 6, 11),
(370, 30, 81, 40, 116, 70, 3, 30, 55, 128, 65, 10, '0.61', '370.png', 'Luvdisc', 'Lovdisc', 400, 848, 43, 109, 'pv370.wav', 'Rendezvous Pokémon', 'Pokémon Rendezvous', 97, 125, '8.70', NULL, NULL, NULL, 62, 43, NULL, 123, 93, 105, NULL, 3, 11, NULL),
(371, 75, 134, 40, 60, 35, 5, 40, 60, 93, 30, 9, '0.61', '371.png', 'Bagon', 'Draby', 401, 1156, 45, 111, 'pv371.wav', 'Rock Head Pokémon', 'Pokémon Tête de Roc', 50, 128, '42.10', NULL, NULL, NULL, 15, 34, NULL, 125, 106, 51, NULL, 3, 16, NULL),
(372, 95, 172, 60, 147, 35, 5, 10, 100, 155, 50, 6, '1.09', '372.png', 'Shelgon', 'Drackhaus', 402, 2031, 65, 139, 'pv372.wav', 'Endurance Pokémon', 'Pokémon Endurant', 50, 163, '110.50', NULL, NULL, NULL, 16, 34, NULL, 125, 51, 80, NULL, 3, 16, NULL),
(373, 135, 277, 110, 270, 35, 5, 5, 80, 168, 80, 5, '1.50', '373.png', 'Salamence', 'Drattak', 403, 3749, 95, 180, 'pv373.wav', 'Dragon Pokémon', 'Pokémon Dragon', 100, 216, '102.60', 29, 9, NULL, 15, 14, 3, 61, 20, 43, 13, 3, 3, 16),
(374, 55, 96, 35, 60, 35, 5, 40, 80, 132, 60, 9, '0.61', '374.png', 'Beldum', 'Terhal', 404, 976, 40, 105, 'pv374.wav', 'Iron Ball Pokémon', 'Pokémon Boulefer', 30, 120, '95.20', 137, 116, NULL, 59, NULL, NULL, 126, NULL, NULL, NULL, 3, 14, 9),
(375, 75, 138, 55, 147, 35, 5, 10, 100, 176, 80, 6, '1.19', '375.png', 'Metang', 'Métang', 405, 1721, 60, 132, 'pv375.wav', 'Iron Claw Pokémon', 'Pokémon Pincefer', 50, 155, '202.50', 137, 116, NULL, 22, 26, NULL, 87, 86, 32, NULL, 3, 14, 9),
(376, 135, 257, 95, 270, 35, 5, 5, 130, 228, 90, 5, '1.60', '376.png', 'Metagross', 'Métalosse', 406, 3791, 80, 160, 'pv376.wav', 'Iron Leg Pokémon', 'Pokémon Pattefer', 70, 190, '550.00', 137, 116, NULL, 42, 26, NULL, 40, 30, 22, 32, 3, 14, 9),
(377, 100, 179, 50, 261, 35, 20, 2, 200, 309, 100, 1, '1.70', '377.png', 'Regirock', 'Regirock', 407, 3122, 80, 160, 'pv377.wav', 'Rock Peak Pokémon', 'Pokémon Pic Rocheux', 50, 190, '230.00', NULL, NULL, NULL, 5, 21, NULL, 7, 24, 16, NULL, 3, 6, NULL),
(378, 50, 179, 100, 261, 35, 20, 2, 100, 309, 200, 1, '1.80', '378.png', 'Regice', 'Regice', 408, 3122, 80, 160, 'pv378.wav', 'Iceberg Pokémon', 'Pokémon Iceberg', 50, 190, '175.00', NULL, NULL, NULL, 24, 21, NULL, 40, 10, 16, NULL, 3, 15, NULL),
(379, 75, 143, 75, 261, 35, 20, 2, 150, 285, 150, 1, '1.91', '379.png', 'Registeel', 'Registeel', 409, 2447, 80, 162, 'pv379.wav', 'Iron Pokémon', 'Pokémon Fer', 50, 190, '205.00', NULL, NULL, NULL, 22, 21, NULL, 30, 16, 19, NULL, 3, 9, NULL),
(380, 80, 228, 110, 270, 90, 20, 2, 90, 246, 130, 1, '1.40', '380.png', 'Latias', 'Latias', 410, 3510, 80, 160, 'pv380.wav', 'Eon Pokémon', 'Pokémon Éon', 110, 190, '40.00', 70, NULL, NULL, 16, 26, NULL, 12, 32, 61, NULL, 3, 14, 16),
(381, 90, 268, 130, 270, 90, 20, 2, 80, 212, 110, 1, '2.01', '381.png', 'Latios', 'Latios', 411, 3812, 80, 160, 'pv381.wav', 'Eon Pokémon', 'Pokémon Éon', 110, 190, '60.00', 70, NULL, NULL, 16, 26, NULL, 57, 32, 31, NULL, 3, 14, 16),
(382, 100, 270, 150, 302, 0, 20, 2, 90, 228, 140, 1, '4.50', '382.png', 'Kyogre', 'Kyogre', 412, 4115, 100, 171, 'pv382.wav', 'Sea Basin Pokémon', 'Pokémon Bassinmarin', 90, 205, '352.00', NULL, NULL, NULL, 7, NULL, NULL, 12, 10, 20, NULL, 3, 11, NULL),
(383, 150, 270, 100, 302, 0, 20, 2, 140, 228, 90, 1, '3.51', '383.png', 'Groudon', 'Groudon', 413, 4115, 100, 171, 'pv383.wav', 'Continent Pokémon', 'Pokémon Continent', 90, 205, '950.00', NULL, NULL, NULL, 51, 3, NULL, 40, 43, 31, NULL, 3, 5, NULL),
(384, 150, 284, 150, 306, 0, 20, 2, 90, 170, 90, 1, '7.01', '384.png', 'Rayquaza', 'Rayquaza', 414, 3835, 105, 178, 'pv384.wav', 'Sky High Pokémon', 'Pokémon Cieux', 95, 213, '206.50', 76, NULL, NULL, 20, 3, NULL, 97, 115, 61, NULL, 3, 3, 16),
(385, 100, 210, 100, 270, 100, 20, 2, 100, 210, 100, 0, '0.30', '385.png', 'Jirachi', 'Jirachi', 415, 3265, 100, 189, 'pv385.wav', 'Wish Pokémon', 'Pokémon Souhait', 100, 225, '1.10', 119, NULL, NULL, 56, 13, NULL, 4, 60, 32, NULL, 3, 14, 9),
(386, 150, 345, 150, 270, 0, 20, 6, 50, 115, 50, 1, '1.70', '386.png', 'Deoxys', 'Deoxys', 416, 3160, 50, 118, 'pv386.wav', 'DNA Pokémon', 'Pokémon ADN', 150, 137, '60.80', NULL, NULL, NULL, 56, 26, NULL, 122, 49, 19, NULL, 3, 14, NULL),
(387, 68, 119, 45, 64, 70, 3, 20, 64, 110, 55, 10, '0.40', '387.png', 'Turtwig', 'Tortipouss', 417, 1187, 55, 125, 'pv387.wav', 'Tiny Leaf Pokémon', 'Pokémon Minifeuille', 31, 146, '10.20', NULL, NULL, NULL, 40, 9, NULL, 72, 73, 95, NULL, 4, 12, NULL),
(388, 89, 157, 55, 142, 70, 3, 10, 85, 143, 65, 7, '1.10', '388.png', 'Grotle', 'Boskara', 418, 1890, 75, 153, 'pv388.wav', 'Grove Pokémon', 'Pokémon Bosquet', 36, 181, '97.00', NULL, NULL, NULL, 15, 9, NULL, 72, 95, 31, NULL, 4, 12, NULL),
(389, 109, 202, 75, 236, 70, 3, 5, 105, 188, 85, 5, '2.20', '389.png', 'Torterra', 'Torterra', 419, 2934, 95, 180, 'pv389.wav', 'Continent Pokémon', 'Pokémon Continent', 56, 216, '310.00', 21, 4, NULL, 15, 9, NULL, 7, 40, 31, NULL, 4, 5, 12),
(390, 58, 113, 58, 62, 70, 3, 20, 44, 86, 44, 10, '0.50', '390.png', 'Chimchar', 'Ouisticram', 420, 957, 44, 111, 'pv390.wav', 'Chimp Pokémon', 'Pokémon Chimpanzé', 61, 127, '6.20', NULL, NULL, NULL, 17, 34, NULL, 101, 119, 51, NULL, 4, 10, NULL),
(391, 78, 158, 78, 142, 70, 3, 10, 52, 105, 52, 7, '0.90', '391.png', 'Monferno', 'Chimpenfeu', 421, 1574, 64, 138, 'pv391.wav', 'Playful Pokémon', 'Pokémon Garnement', 81, 162, '22.00', 106, 2, NULL, 34, 21, NULL, 112, 101, 51, NULL, 4, 2, 10),
(392, 104, 222, 104, 240, 70, 3, 5, 71, 151, 71, 5, '1.20', '392.png', 'Infernape', 'Simiabraz', 422, 2683, 76, 154, 'pv392.wav', 'Flame Pokémon', 'Pokémon Flamme', 108, 183, '55.00', 106, 2, NULL, 11, 21, NULL, 51, 8, 31, NULL, 4, 2, 10),
(393, 51, 112, 61, 63, 70, 3, 20, 53, 102, 56, 10, '0.40', '393.png', 'Piplup', 'Tiplouf', 423, 1075, 53, 122, 'pv393.wav', 'Penguin Pokémon', 'Pokémon Pingouin', 40, 142, '5.20', NULL, NULL, NULL, 19, 44, NULL, 91, 120, 74, NULL, 4, 11, NULL),
(394, 66, 150, 81, 142, 70, 3, 10, 68, 139, 76, 7, '0.80', '394.png', 'Prinplup', 'Prinplouf', 424, 1701, 64, 138, 'pv394.wav', 'Penguin Pokémon', 'Pokémon Pingouin', 50, 162, '23.00', NULL, NULL, NULL, 22, 44, NULL, 91, 120, 20, NULL, 4, 11, NULL),
(395, 86, 210, 111, 239, 70, 3, 5, 88, 186, 101, 5, '1.70', '395.png', 'Empoleon', 'Pingoléon', 425, 2900, 84, 165, 'pv395.wav', 'Emperor Pokémon', 'Pokémon Empereur', 60, 197, '84.50', 118, 6, NULL, 22, 7, NULL, 30, 10, 20, NULL, 4, 9, 11),
(396, 55, 101, 30, 49, 70, 1, 50, 30, 58, 30, 20, '0.30', '396.png', 'Starly', 'Étourmi', 426, 719, 40, 105, 'pv396.wav', 'Starling Pokémon', 'Pokémon Étourneau', 60, 120, '2.00', 27, 126, NULL, 40, 39, NULL, 97, 5, NULL, NULL, 4, 3, 1),
(397, 75, 142, 40, 119, 70, 1, 25, 50, 94, 40, 9, '0.60', '397.png', 'Staravia', 'Étourvol', 427, 1299, 55, 125, 'pv397.wav', 'Starling Pokémon', 'Pokémon Étourneau', 80, 146, '15.50', 27, 9, NULL, 35, 39, NULL, 97, 5, 52, NULL, 4, 3, 1),
(398, 120, 234, 50, 218, 70, 1, 13, 70, 140, 60, 6, '1.20', '398.png', 'Staraptor', 'Étouraptor', 428, 2825, 85, 166, 'pv398.wav', 'Predator Pokémon', 'Pokémon Rapace', 100, 198, '24.90', 27, 9, NULL, 35, 39, NULL, 5, 52, 8, NULL, 4, 3, 1),
(399, 45, 80, 35, 50, 70, 1, 50, 40, 73, 40, 20, '0.50', '399.png', 'Bidoof', 'Keunotor', 429, 721, 59, 131, 'pv399.wav', 'Plump Mouse Pokémon', 'Pokémon Souridodue', 31, 153, '20.00', NULL, NULL, NULL, 40, 59, NULL, 106, 50, 37, NULL, 4, 1, NULL),
(400, 85, 162, 55, 144, 70, 1, 20, 60, 119, 60, 7, '1.00', '400.png', 'Bibarel', 'Castorno', 430, 1823, 79, 158, 'pv400.wav', 'Beaver Pokémon', 'Pokémon Castor', 71, 188, '31.50', 48, 77, 63, 43, 59, NULL, 23, 50, 19, NULL, 4, 11, 1),
(401, 25, 45, 25, 39, 70, 1, 50, 41, 74, 41, 20, '0.30', '401.png', 'Kricketot', 'Crikzik', 431, 401, 37, 100, 'pv401.wav', 'Cricket Pokémon', 'Pokémon Criquet', 25, 114, '2.20', NULL, NULL, NULL, 30, 45, NULL, 126, NULL, NULL, NULL, 4, 7, NULL),
(402, 85, 160, 55, 134, 70, 1, 20, 51, 100, 51, 7, '1.00', '402.png', 'Kricketune', 'Mélokrik', 432, 1653, 77, 155, 'pv402.wav', 'Cricket Pokémon', 'Pokémon Criquet', 65, 184, '25.50', NULL, NULL, NULL, 55, 45, NULL, 62, 97, 85, NULL, 4, 7, NULL),
(403, 65, 117, 40, 53, 70, 5, 50, 34, 64, 34, 10, '0.50', '403.png', 'Shinx', 'Lixy', 433, 876, 45, 111, 'pv403.wav', 'Flash Pokémon', 'Pokémon Flash', 45, 128, '9.50', NULL, NULL, NULL, 40, 49, NULL, 110, 76, 49, NULL, 4, 13, NULL),
(404, 85, 159, 60, 127, 100, 5, 25, 49, 95, 49, 7, '0.90', '404.png', 'Luxio', 'Luxio', 434, 1486, 60, 132, 'pv404.wav', 'Spark Pokémon', 'Pokémon Étincelle', 60, 155, '30.50', NULL, NULL, NULL, 49, 15, NULL, 106, 49, 36, NULL, 4, 13, NULL),
(405, 120, 232, 95, 235, 70, 5, 13, 79, 156, 79, 5, '1.40', '405.png', 'Luxray', 'Luxray', 435, 2888, 80, 160, 'pv405.wav', 'Gleam Eyes Pokémon', 'Pokémon Brillœil', 70, 190, '42.00', NULL, NULL, NULL, 49, 28, 46, 106, 36, 19, NULL, 4, 13, NULL),
(406, 30, 91, 50, 56, 70, 3, 10, 35, 109, 70, 4, '0.20', '406.png', 'Budew', 'Rozbouton', 341, 856, 40, 105, 'pv406.wav', 'Bud Pokémon', 'Pokémon Bourgeon', 55, 120, '1.20', 32, 79, 28, 9, 46, NULL, 95, 37, NULL, NULL, 4, 4, 12),
(407, 70, 243, 125, 232, 70, 3, 15, 65, 185, 105, 7, '0.90', '407.png', 'Roserade', 'Roserade', 343, 2971, 60, 132, 'pv407.wav', 'Bouquet Pokémon', 'Pokémon Bouquet', 90, 155, '14.50', 51, 79, 28, 12, 9, NULL, 34, 37, 60, 31, 4, 4, 12),
(408, 125, 218, 30, 70, 70, 5, 50, 40, 71, 30, 10, '0.90', '408.png', 'Cranidos', 'Kranidos', 436, 1820, 67, 142, 'pv408.wav', 'Head Butt Pokémon', 'Pokémon Coud’Boule', 58, 167, '31.50', NULL, NULL, NULL, 59, 26, NULL, 115, 104, 98, NULL, 4, 6, NULL),
(409, 165, 295, 65, 173, 70, 5, 20, 60, 109, 50, 6, '1.60', '409.png', 'Rampardos', 'Charkos', 437, 3298, 97, 182, 'pv409.wav', 'Head Butt Pokémon', 'Pokémon Coud’Boule', 58, 219, '102.50', NULL, NULL, NULL, 26, 8, NULL, 51, 56, 61, NULL, 4, 6, NULL),
(410, 42, 76, 42, 70, 70, 5, 50, 118, 195, 88, 10, '0.50', '410.png', 'Shieldon', 'Dinoclier', 438, 890, 30, 91, 'pv410.wav', 'Shield Pokémon', 'Pokémon Bouclier', 30, 102, '57.00', 83, 22, NULL, 40, 4, NULL, 115, 104, 46, NULL, 4, 9, 6),
(411, 52, 94, 47, 173, 70, 5, 20, 168, 286, 138, 6, '1.30', '411.png', 'Bastiodon', 'Bastiodon', 439, 1539, 60, 132, 'pv411.wav', 'Shield Pokémon', 'Pokémon Bouclier', 30, 155, '149.50', 83, 22, NULL, 4, 8, NULL, 51, 30, 7, NULL, 4, 9, 6);
INSERT INTO `pokemon` (`id`, `attack`, `attack_max`, `attack_spe`, `base_experience`, `base_happiness`, `buddy_walk`, `capture_rate`, `defense`, `defense_max`, `defense_spe`, `escape_rate`, `height`, `image`, `name_en`, `name_fr`, `order`, `pc_max`, `pv`, `pv_max`, `scream`, `specie_en`, `specie_fr`, `speed`, `stamina_max`, `weight`, `abilitie_1`, `abilitie_2`, `abilitie_3`, `fast_move_1`, `fast_move_2`, `fast_move_3`, `main_move_1`, `main_move_2`, `main_move_3`, `main_move_4`, `pokedex`, `type_1`, `type_2`) VALUES
(412, 29, 53, 29, 45, 70, 1, 50, 45, 83, 45, 20, '0.20', '412.png', 'Burmy', 'Cheniti', 440, 488, 40, 105, 'pv412.wav', 'Bagworm Pokémon', 'Pokémon Ver Caché', 36, 120, '3.40', NULL, NULL, NULL, 40, 30, NULL, 126, NULL, NULL, NULL, 4, 7, NULL),
(413, 59, 141, 79, 148, 70, 1, 15, 85, 180, 105, 7, '0.50', '413.png', 'Wormadam', 'Cheniselle', 441, 1773, 60, 132, 'pv413.wav', 'Bagworm Pokémon', 'Pokémon Ver Caché', 36, 155, '6.50', 47, 57, NULL, 30, 13, NULL, 103, 95, 85, NULL, 4, 12, 7),
(414, 94, 185, 94, 148, 70, 1, 15, 50, 98, 50, 7, '0.90', '414.png', 'Mothim', 'Papilord', 442, 1815, 70, 146, 'pv414.wav', 'Moth Pokémon', 'Pokémon Phalène', 66, 172, '23.30', 17, 82, NULL, 30, 20, NULL, 97, 103, 85, NULL, 4, 3, 7),
(415, 30, 59, 30, 49, 70, 3, 15, 42, 83, 42, 7, '0.30', '415.png', 'Combee', 'Apitrini', 443, 494, 30, 91, 'pv415.wav', 'Tiny Bee Pokémon', 'Pokémon Miniabeille', 70, 102, '5.50', NULL, 135, NULL, 30, NULL, NULL, 85, NULL, NULL, NULL, 4, 3, 7),
(416, 80, 149, 80, 166, 70, 3, 15, 102, 190, 102, 7, '1.20', '416.png', 'Vespiquen', 'Apireine', 444, 2005, 70, 146, 'pv416.wav', 'Beehive Pokémon', 'Pokémon Ruche', 40, 172, '38.50', 14, 33, NULL, 53, 30, NULL, 62, 64, 85, NULL, 4, 3, 7),
(417, 45, 94, 45, 142, 100, 5, 30, 70, 172, 90, 9, '0.40', '417.png', 'Pachirisu', 'Pachirisu', 445, 1213, 60, 132, 'pv417.wav', 'EleSquirrel Pokémon', 'Pokémon Écurélec', 95, 155, '3.90', NULL, NULL, NULL, 49, 48, NULL, 79, 49, 12, NULL, 4, 13, NULL),
(418, 65, 132, 60, 66, 70, 3, 50, 35, 67, 30, 10, '0.70', '418.png', 'Buizel', 'Mustébouée', 446, 1054, 55, 125, 'pv418.wav', 'Sea Weasel Pokémon', 'Pokémon Aquabelette', 85, 146, '29.50', NULL, NULL, NULL, 43, 39, NULL, 123, 110, 105, NULL, 4, 11, NULL),
(419, 105, 221, 85, 173, 70, 3, 20, 55, 114, 50, 6, '1.10', '419.png', 'Floatzel', 'Mustéflott', 447, 2443, 85, 166, 'pv419.wav', 'Sea Weasel Pokémon', 'Pokémon Aquabelette', 115, 198, '33.50', NULL, NULL, NULL, 43, 7, NULL, 123, 110, 20, NULL, 4, 11, NULL),
(420, 35, 108, 62, 55, 70, 1, 50, 45, 92, 53, 9, '0.40', '420.png', 'Cherubi', 'Ceribou', 448, 950, 45, 111, 'pv420.wav', 'Cherry Pokémon', 'Pokémon Cerise', 35, 128, '3.30', NULL, NULL, NULL, 40, 58, NULL, 73, 60, 9, NULL, 4, 12, NULL),
(421, 60, 170, 87, 158, 70, 1, 10, 70, 153, 78, 7, '0.50', '421.png', 'Cherrim', 'Ceriflor', 449, 2048, 70, 146, 'pv421.wav', 'Blossom Pokémon', 'Pokémon Floraison', 85, 172, '9.30', NULL, NULL, NULL, 58, 9, NULL, 60, 19, 31, NULL, 4, 12, NULL),
(422, 48, 103, 57, 65, 70, 3, 50, 48, 105, 62, 10, '0.30', '422.png', 'Shellos', 'Sancoki', 450, 1136, 76, 154, 'pv422.wav', 'Sea Slug Pokémon', 'Pokémon Aqualimace', 34, 183, '6.30', NULL, NULL, NULL, 29, 46, NULL, 72, 88, 105, NULL, 4, 11, NULL),
(423, 83, 169, 92, 166, 70, 3, 20, 68, 143, 82, 6, '0.90', '423.png', 'Gastrodon', 'Tritosor', 451, 2324, 111, 202, 'pv423.wav', 'Sea Slug Pokémon', 'Pokémon Aqualimace', 39, 244, '29.90', 121, 110, 130, 29, 46, NULL, 72, 105, 63, NULL, 4, 5, 11),
(424, 100, 205, 60, 169, 100, 3, 20, 66, 143, 66, 6, '1.20', '424.png', 'Ambipom', 'Capidextre', 220, 2418, 75, 153, 'pv424.wav', 'Long Tail Pokémon', 'Pokémon Longqueue', 115, 181, '20.30', NULL, NULL, NULL, 17, 57, NULL, 112, 97, 19, NULL, 4, 1, NULL),
(425, 50, 117, 60, 70, 70, 5, 40, 34, 80, 44, 10, '0.40', '425.png', 'Drifloon', 'Baudrive', 452, 1197, 90, 173, 'pv425.wav', 'Balloon Pokémon', 'Pokémon Bouboule', 70, 207, '1.20', 112, 113, NULL, 57, 54, NULL, 107, 120, 41, NULL, 4, 3, 8),
(426, 80, 180, 90, 174, 70, 5, 20, 44, 102, 54, 7, '1.20', '426.png', 'Drifblim', 'Grodrive', 453, 2382, 150, 255, 'pv426.wav', 'Blimp Pokémon', 'Pokémon Ballon', 80, 312, '15.00', 112, 113, NULL, 57, 54, NULL, 107, 120, 41, NULL, 4, 3, 8),
(427, 66, 130, 44, 70, 0, 3, 50, 44, 105, 56, 10, '0.40', '427.png', 'Buneary', 'Laporeille', 454, 1258, 55, 125, 'pv427.wav', 'Rabbit Pokémon', 'Pokémon Lapin', 85, 146, '5.50', NULL, NULL, NULL, 19, 39, NULL, 82, 110, NULL, NULL, 4, 1, NULL),
(428, 76, 156, 54, 168, 140, 3, 20, 84, 194, 96, 6, '1.20', '428.png', 'Lopunny', 'Lockpin', 455, 2059, 65, 139, 'pv428.wav', 'Rabbit Pokémon', 'Pokémon Lapin', 105, 163, '33.30', NULL, NULL, NULL, 32, 19, NULL, 82, 16, 19, NULL, 4, 1, NULL),
(429, 60, 211, 105, 173, 35, 3, 10, 60, 187, 105, 7, '0.90', '429.png', 'Mismagius', 'Magirêve', 230, 2615, 60, 132, 'pv429.wav', 'Magical Pokémon', 'Pokémon Magique', 105, 155, '4.40', NULL, NULL, NULL, 31, 54, NULL, 68, 60, 41, NULL, 4, 8, NULL),
(430, 125, 243, 105, 177, 35, 3, 10, 52, 103, 52, 7, '0.90', '430.png', 'Honchkrow', 'Corboss', 228, 2711, 100, 187, 'pv430.wav', 'Big Boss Pokémon', 'Pokémon Big Boss', 71, 225, '27.30', 29, 42, 34, 36, 28, NULL, 68, 17, 5, 32, 4, 3, 17),
(431, 55, 109, 42, 62, 70, 3, 40, 42, 82, 37, 10, '0.50', '431.png', 'Glameow', 'Chaglam', 456, 934, 49, 117, 'pv431.wav', 'Catty Pokémon', 'Pokémon Chafouin', 85, 135, '3.90', NULL, NULL, NULL, 17, 39, NULL, 97, 49, 54, NULL, 4, 1, NULL),
(432, 82, 172, 64, 158, 70, 3, 15, 64, 133, 59, 8, '1.00', '432.png', 'Purugly', 'Chaffreux', 457, 1953, 71, 147, 'pv432.wav', 'Tiger Cat Pokémon', 'Pokémon Chatigre', 112, 174, '43.80', NULL, NULL, NULL, 17, 10, NULL, 97, 54, 12, NULL, 4, 1, NULL),
(433, 30, 114, 65, 57, 70, 5, 10, 50, 94, 50, 4, '0.20', '433.png', 'Chingling', 'Korillon', 387, 1005, 45, 111, 'pv433.wav', 'Bell Pokémon', 'Pokémon Clochette', 45, 128, '0.60', NULL, NULL, NULL, 57, 26, NULL, 113, 87, 41, NULL, 4, 14, NULL),
(434, 63, 121, 41, 66, 70, 3, 50, 47, 90, 41, 10, '0.40', '434.png', 'Stunky', 'Moufouette', 458, 1151, 63, 136, 'pv434.wav', 'Skunk Pokémon', 'Pokémon Moufette', 74, 160, '19.20', 126, NULL, 123, 17, 15, NULL, 106, 51, 34, NULL, 4, 17, 4),
(435, 93, 184, 71, 168, 70, 3, 20, 67, 132, 61, 6, '1.00', '435.png', 'Skuntank', 'Moufflair', 459, 2358, 103, 191, 'pv435.wav', 'Skunk Pokémon', 'Pokémon Moufette', 84, 230, '38.00', 126, NULL, 123, 15, 12, NULL, 106, 51, 34, NULL, 4, 17, 4),
(436, 24, 43, 24, 60, 70, 3, 50, 86, 154, 86, 10, '0.50', '436.png', 'Bronzor', 'Archéomire', 460, 603, 57, 128, 'pv436.wav', 'Bronze Pokémon', 'Pokémon Bronze', 23, 149, '60.50', 59, 127, 70, 40, 13, NULL, 87, 46, 86, NULL, 4, 14, 9),
(437, 89, 161, 79, 175, 70, 3, 20, 116, 213, 116, 6, '1.30', '437.png', 'Bronzong', 'Archéodong', 461, 2239, 67, 142, 'pv437.wav', 'Bronze Bell Pokémon', 'Pokémon Clochebronze', 33, 167, '187.00', 59, 127, 70, 25, 13, NULL, 46, 32, 30, NULL, 4, 14, 9),
(438, 80, 124, 10, 58, 70, 5, 10, 95, 133, 45, 4, '0.50', '438.png', 'Bonsly', 'Manzaï', 214, 1302, 50, 118, 'pv438.wav', 'Bonsai Pokémon', 'Pokémon Bonsaï', 10, 137, '15.00', NULL, NULL, NULL, 6, 5, NULL, 104, 56, 40, NULL, 4, 6, NULL),
(439, 25, 125, 70, 62, 70, 5, 10, 45, 142, 90, 4, '0.60', '439.png', 'Mime Jr.', 'Mime Jr.', 139, 1095, 20, 78, 'pv439.wav', 'Mime Pokémon', 'Pokémon Mime', 60, 85, '13.00', 51, 105, 83, 19, 13, NULL, 87, 103, 32, NULL, 4, 18, 14),
(440, 5, 25, 15, 110, 140, 5, 10, 5, 77, 65, 4, '0.60', '440.png', 'Happiny', 'Ptiravi', 126, 371, 100, 187, 'pv440.wav', 'Playhouse Pokémon', 'Pokémon Maisonjouet', 30, 225, '24.40', NULL, NULL, NULL, 19, 26, NULL, 32, NULL, NULL, NULL, 4, 1, NULL),
(441, 65, 183, 92, 144, 35, 5, 30, 45, 91, 42, 9, '0.50', '441.png', 'Chatot', 'Pijako', 462, 1791, 76, 154, 'pv441.wav', 'Music Note Pokémon', 'Pokémon Note Musique', 91, 183, '1.90', 120, 15, 126, 36, 2, NULL, 94, 17, 52, NULL, 4, 3, 1),
(442, 92, 169, 92, 170, 70, 5, 10, 108, 199, 108, 4, '1.00', '442.png', 'Spiritomb', 'Spiritomb', 463, 2072, 50, 118, 'pv442.wav', 'Forbidden Pokémon', 'Pokémon Interdit', 35, 137, '108.00', 46, 33, NULL, 31, 25, NULL, 124, 107, 41, NULL, 4, 17, 8),
(443, 70, 124, 40, 60, 70, 5, 40, 45, 84, 45, 9, '0.70', '443.png', 'Gible', 'Griknot', 464, 1112, 58, 129, 'pv443.wav', 'Land Shark Pokémon', 'Pokémon Terrequin', 42, 151, '20.50', 64, 20, NULL, 51, 59, NULL, 125, 72, 111, NULL, 4, 5, 16),
(444, 90, 172, 50, 144, 70, 5, 10, 65, 125, 55, 6, '1.40', '444.png', 'Gabite', 'Carmache', 465, 1874, 68, 143, 'pv444.wav', 'Cave Pokémon', 'Pokémon Caverne', 82, 169, '56.00', 64, 20, NULL, 51, 59, NULL, 125, 51, 111, NULL, 4, 5, 16),
(445, 130, 261, 80, 270, 70, 5, 5, 95, 193, 85, 5, '1.90', '445.png', 'Garchomp', 'Carchacrok', 466, 3962, 108, 198, 'pv445.wav', 'Mach Pokémon', 'Pokémon Supersonic', 102, 239, '95.00', 64, 20, NULL, 51, 3, NULL, 61, 40, 43, NULL, 4, 5, 16),
(446, 85, 137, 40, 78, 70, 5, 10, 40, 117, 85, 4, '0.60', '446.png', 'Munchlax', 'Goinfrex', 174, 1892, 135, 235, 'pv446.wav', 'Big Eater Pokémon', 'Pokémon Goinfre', 5, 286, '105.00', NULL, NULL, NULL, 37, 40, NULL, 72, 98, 11, NULL, 4, 1, NULL),
(447, 70, 127, 35, 57, 70, 5, 0, 40, 78, 40, 20, '0.70', '447.png', 'Riolu', 'Riolu', 467, 993, 40, 105, 'pv447.wav', 'Emanation Pokémon', 'Pokémon Émanation', 60, 120, '20.20', NULL, NULL, NULL, 39, 6, NULL, 112, 83, 39, NULL, 4, 2, NULL),
(448, 110, 236, 115, 184, 70, 5, 10, 70, 144, 70, 5, '1.20', '448.png', 'Lucario', 'Lucario', 468, 2703, 70, 146, 'pv448.wav', 'Aura Pokémon', 'Pokémon Aura', 90, 172, '54.00', 99, 18, 80, 42, 6, NULL, 84, 41, 30, 8, 4, 9, 2),
(449, 72, 124, 38, 66, 70, 3, 40, 78, 118, 42, 10, '0.80', '449.png', 'Hippopotas', 'Hippopotas', 469, 1358, 68, 143, 'pv449.wav', 'Hippo Pokémon', 'Pokémon Hippo', 32, 169, '49.50', NULL, NULL, NULL, 40, 15, NULL, 72, 104, 111, NULL, 4, 5, NULL),
(450, 112, 201, 68, 184, 70, 3, 15, 118, 191, 72, 8, '2.00', '450.png', 'Hippowdon', 'Hippodocus', 470, 3085, 108, 198, 'pv450.wav', 'Heavyweight Pokémon', 'Pokémon Poids Lourd', 47, 239, '300.00', NULL, NULL, NULL, 15, 14, NULL, 72, 63, 7, 40, 4, 5, NULL),
(451, 50, 93, 30, 66, 70, 5, 40, 90, 151, 55, 10, '0.80', '451.png', 'Skorupi', 'Rapion', 471, 1009, 40, 105, 'pv451.wav', 'Scorpion Pokémon', 'Pokémon Scorpion', 65, 120, '12.00', 126, 12, 74, 53, 47, NULL, 69, 71, 34, NULL, 4, 7, 4),
(453, 61, 116, 61, 60, 100, 3, 40, 40, 76, 40, 12, '0.70', '453.png', 'Croagunk', 'Cradopaud', 473, 952, 48, 116, 'pv453.wav', 'Toxic Mouth Pokémon', 'Pokémon Toxique', 50, 134, '23.00', 26, 86, 57, 53, 12, NULL, 112, 83, 34, NULL, 4, 2, 4),
(454, 106, 211, 86, 172, 70, 3, 15, 65, 133, 65, 7, '1.30', '454.png', 'Toxicroak', 'Coatox', 474, 2488, 83, 164, 'pv454.wav', 'Toxic Mouth Pokémon', 'Pokémon Toxique', 85, 195, '44.40', 26, 86, 57, 12, 6, NULL, 88, 34, 44, NULL, 4, 2, 4),
(455, 100, 187, 90, 159, 70, 5, 90, 72, 136, 72, 1, '1.40', '455.png', 'Carnivine', 'Vortente', 475, 2159, 74, 151, 'pv455.wav', 'Bug Catcher Pokémon', 'Pokémon Chopinsecte', 46, 179, '27.00', NULL, NULL, NULL, 15, 18, NULL, 106, 95, 35, NULL, 4, 12, NULL),
(456, 49, 96, 49, 66, 70, 3, 50, 56, 116, 61, 10, '0.40', '456.png', 'Finneon', 'Écayon', 476, 971, 49, 117, 'pv456.wav', 'Wing Fish Pokémon', 'Pokémon Poisson Ailé', 66, 135, '7.00', NULL, NULL, NULL, 43, 19, NULL, 117, 105, 65, NULL, 4, 11, NULL),
(457, 69, 142, 69, 161, 70, 3, 20, 76, 170, 86, 6, '1.20', '457.png', 'Lumineon', 'Luminéon', 477, 1814, 69, 144, 'pv457.wav', 'Neon Pokémon', 'Pokémon Néon', 91, 170, '24.00', NULL, NULL, NULL, 43, 7, NULL, 117, 105, 10, NULL, 4, 11, NULL),
(458, 20, 105, 60, 69, 70, 5, 10, 50, 179, 120, 4, '1.00', '458.png', 'Mantyke', 'Babimanta', 258, 1248, 45, 111, 'pv458.wav', 'Kite Pokémon', 'Pokémon Cervolant', 50, 128, '65.00', 66, 65, 25, 40, 44, NULL, 97, 105, 65, NULL, 4, 3, 11),
(459, 62, 115, 62, 67, 70, 3, 30, 50, 105, 60, 10, '1.00', '459.png', 'Snover', 'Blizzi', 478, 1159, 60, 132, 'pv459.wav', 'Frost Tree Pokémon', 'Pokémon Arbregelé', 40, 155, '50.50', 83, 75, NULL, 60, 38, NULL, 48, 95, 65, NULL, 4, 15, 12),
(460, 92, 178, 92, 173, 70, 3, 13, 75, 158, 85, 6, '2.20', '460.png', 'Abomasnow', 'Blizzaroi', 479, 2362, 90, 173, 'pv460.wav', 'Frost Tree Pokémon', 'Pokémon Arbregelé', 60, 207, '135.50', 83, 75, NULL, 60, 9, NULL, 95, 61, 10, NULL, 4, 15, 12),
(461, 120, 243, 45, 179, 35, 3, 15, 65, 171, 85, 9, '1.10', '461.png', 'Weavile', 'Dimoret', 246, 3005, 70, 146, 'pv461.wav', 'Sharp Claw Pokémon', 'Pokémon Grifacérée', 125, 172, '34.00', 49, 33, NULL, 25, 38, NULL, 33, 45, 16, NULL, 4, 15, 17),
(462, 70, 238, 130, 241, 70, 3, 13, 115, 205, 90, 5, '1.20', '462.png', 'Magnezone', 'Magnézone', 90, 3205, 70, 146, 'pv462.wav', 'Magnet Area Pokémon', 'Pokémon Aimant', 60, 172, '180.00', 136, 22, 117, 49, 56, NULL, 36, 30, 24, NULL, 4, 9, 13),
(463, 85, 161, 80, 180, 70, 3, 15, 95, 181, 95, 9, '1.70', '463.png', 'Lickilicky', 'Coudlangue', 120, 2467, 110, 200, 'pv463.wav', 'Licking Pokémon', 'Pokémon Lécheur', 50, 242, '240.00', NULL, NULL, NULL, 37, 26, NULL, 40, 19, 31, NULL, 4, 1, NULL),
(464, 140, 241, 55, 241, 70, 3, 5, 130, 190, 55, 5, '2.40', '464.png', 'Rhyperior', 'Rhinastoc', 125, 3733, 115, 207, 'pv464.wav', 'Drill Pokémon', 'Pokémon Perceur', 40, 251, '282.80', 27, 134, 8, 29, 8, NULL, 40, 19, 31, NULL, 4, 6, 5),
(465, 100, 207, 110, 187, 70, 3, 15, 125, 184, 50, 10, '2.00', '465.png', 'Tangrowth', 'Bouldeneu', 130, 3030, 100, 187, 'pv465.wav', 'Vine Pokémon', 'Pokémon Vigne', 50, 225, '128.60', NULL, NULL, NULL, 18, 47, NULL, 115, 34, 31, NULL, 4, 12, NULL),
(466, 123, 249, 95, 243, 70, 5, 15, 67, 163, 85, 10, '1.80', '466.png', 'Electivire', 'Élekable', 147, 3079, 75, 153, 'pv466.wav', 'Thunderbolt Pokémon', 'Pokémon Foudrélec', 95, 181, '138.60', NULL, NULL, NULL, 50, 32, NULL, 79, 36, 12, NULL, 4, 13, NULL),
(467, 95, 247, 125, 243, 70, 5, 15, 67, 172, 95, 10, '1.60', '467.png', 'Magmortar', 'Maganon', 150, 3132, 75, 153, 'pv467.wav', 'Blast Pokémon', 'Pokémon Explosion', 83, 181, '68.00', NULL, NULL, NULL, 33, 11, NULL, 83, 82, 32, 43, 4, 10, NULL),
(468, 50, 225, 120, 245, 70, 3, 1, 95, 217, 115, 5, '1.50', '468.png', 'Togekiss', 'Togekiss', 205, 3332, 85, 166, 'pv468.wav', 'Jubilee Pokémon', 'Pokémon Célébration', 80, 198, '38.00', 42, 119, NULL, 20, 46, NULL, 97, 115, 51, 60, 4, 3, 18),
(469, 76, 231, 116, 180, 70, 3, 18, 86, 156, 56, 5, '1.90', '469.png', 'Yanmega', 'Yanmega', 224, 2946, 86, 168, 'pv469.wav', 'Ogre Darner Pokémon', 'Pokémon Libellogre', 95, 200, '51.50', 91, 17, 93, 30, 35, NULL, 97, 115, 85, NULL, 4, 3, 7),
(470, 110, 216, 60, 184, 35, 5, 13, 130, 219, 65, 6, '1.00', '470.png', 'Leafeon', 'Phyllali', 163, 2944, 65, 139, 'pv470.wav', 'Verdant Pokémon', 'Pokémon Verdoyant', 95, 163, '25.50', NULL, NULL, NULL, 39, 9, NULL, 58, 95, 31, NULL, 4, 12, NULL),
(471, 60, 238, 130, 184, 35, 5, 13, 110, 205, 95, 6, '0.80', '471.png', 'Glaceon', 'Givrali', 164, 3126, 65, 139, 'pv471.wav', 'Fresh Snow Pokémon', 'Pokémon Poudreuse', 65, 163, '25.90', NULL, NULL, NULL, 24, 38, NULL, 120, 65, 45, NULL, 4, 15, NULL),
(473, 130, 247, 70, 239, 70, 3, 5, 80, 146, 60, 5, '2.50', '473.png', 'Mamoswine', 'Mammochon', 253, 3328, 110, 200, 'pv473.wav', 'Twin Tusk Pokémon', 'Pokémon Deudéfenses', 80, 242, '291.00', 58, 111, 128, 60, 29, NULL, 115, 98, 45, 7, 4, 5, 15),
(474, 80, 264, 135, 241, 70, 3, 5, 70, 150, 75, 5, '0.90', '474.png', 'Porygon Z', 'Porygon Z', 168, 3266, 85, 166, 'pv474.wav', 'Virtual Pokémon', 'Pokémon Virtuel', 90, 198, '34.00', NULL, NULL, NULL, 56, 46, NULL, 10, 24, 19, 31, 4, 1, NULL),
(475, 125, 237, 65, 233, 35, 5, 50, 65, 195, 115, 5, '1.60', '475.png', 'Gallade', 'Gallame', 308, 3093, 68, 143, 'pv475.wav', 'Blade Pokémon', 'Pokémon Lame', 80, 169, '52.00', 99, 80, NULL, 32, 13, NULL, 58, 32, 8, NULL, 4, 2, 14),
(476, 55, 135, 75, 184, 70, 3, 10, 145, 275, 150, 7, '1.40', '476.png', 'Probopass', 'Tarinorme', 325, 2080, 60, 132, 'pv476.wav', 'Compass Pokémon', 'Pokémon Boussole', 40, 155, '340.00', 121, 117, 22, 49, 5, NULL, 78, 49, 56, NULL, 4, 9, 6),
(477, 100, 180, 65, 236, 35, 3, 10, 135, 254, 135, 5, '2.20', '477.png', 'Dusknoir', 'Noctunoir', 385, 2388, 45, 111, 'pv477.wav', 'Gripper Pokémon', 'Pokémon Mainpince', 45, 128, '106.60', NULL, NULL, NULL, 57, 54, NULL, 107, 68, 32, NULL, 4, 8, NULL),
(478, 80, 171, 80, 168, 70, 3, 20, 70, 150, 70, 7, '1.30', '478.png', 'Froslass', 'Momartik', 392, 2040, 70, 146, 'pv478.wav', 'Snow Land Pokémon', 'Pokémon Enneigement', 110, 172, '26.60', 124, 111, NULL, 60, 54, NULL, 106, 45, 41, NULL, 4, 8, 15),
(479, 50, 185, 95, 154, 70, 5, 30, 77, 159, 77, 10, '0.30', '479.png', 'Rotom', 'Motisma', 480, 2031, 50, 118, 'pv479.wav', 'Plasma Pokémon', 'Pokémon Plasma', 91, 137, '0.30', 70, NULL, NULL, 50, 57, NULL, 107, 49, 12, NULL, 4, 8, 13),
(480, 75, 156, 75, 261, 140, 20, 2, 130, 270, 130, 0, '0.30', '480.png', 'Uxie', 'Créhelf', 481, 2524, 75, 154, 'pv480.wav', 'Knowledge Pokémon', 'Pokémon Savoir', 95, 181, '0.30', NULL, NULL, NULL, 27, 13, NULL, 110, 12, 6, NULL, 4, 14, NULL),
(481, 105, 212, 105, 261, 140, 20, 2, 105, 212, 105, 0, '0.30', '481.png', 'Mesprit', 'Créfollet', 482, 3058, 80, 162, 'pv481.wav', 'Emotion Pokémon', 'Pokémon Émotion', 80, 190, '0.30', NULL, NULL, NULL, 27, 13, NULL, 110, 6, 10, NULL, 4, 14, NULL),
(482, 125, 270, 125, 261, 140, 20, 2, 70, 151, 70, 0, '0.30', '482.png', 'Azelf', 'Créfadet', 483, 3210, 75, 154, 'pv482.wav', 'Willpower Pokémon', 'Pokémon Volonté', 115, 181, '0.30', NULL, NULL, NULL, 27, 13, NULL, 110, 6, 43, NULL, 4, 14, NULL),
(483, 120, 275, 150, 306, 0, 20, 2, 120, 211, 100, 4, '5.40', '483.png', 'Dialga', 'Dialga', 484, 4038, 100, 171, 'pv483.wav', 'Temporal Pokémon', 'Pokémon Temps', 90, 205, '683.00', 68, 33, NULL, 16, 22, NULL, 53, 12, 13, NULL, 4, 16, 9),
(484, 120, 280, 150, 306, 0, 20, 2, 100, 215, 120, 4, '4.20', '484.png', 'Palkia', 'Palkia', 485, 3991, 90, 161, 'pv484.wav', 'Spatial Pokémon', 'Pokémon Espace', 100, 189, '336.00', 68, 33, NULL, 16, 3, NULL, 20, 43, 13, NULL, 4, 16, 11),
(485, 90, 251, 130, 270, 100, 20, 2, 106, 213, 106, 4, '1.70', '485.png', 'Heatran', 'Heatran', 486, 3754, 91, 177, 'pv485.wav', 'Lava Dome Pokémon', 'Pokémon Caldeira', 77, 209, '430.00', 24, 35, NULL, 30, 11, NULL, 53, 7, 43, NULL, 4, 9, 10),
(486, 160, 287, 80, 302, 0, 20, 2, 110, 210, 110, 4, '3.70', '486.png', 'Regigigas', 'Regigigas', 487, 4346, 110, 186, 'pv486.wav', 'Colossal Pokémon', 'Pokémon Prodigieux', 100, 221, '420.00', NULL, NULL, NULL, 26, 21, NULL, 46, 45, 7, NULL, 4, 1, NULL),
(487, 100, 187, 100, 306, 0, 20, 2, 120, 225, 120, 4, '4.50', '487.png', 'Giratina', 'Giratina', 488, 3379, 150, 233, 'pv487.wav', 'Renegade Pokémon', 'Pokémon Renégat', 90, 284, '750.00', 68, 33, NULL, 16, 10, NULL, 124, 57, 115, NULL, 4, 16, 8),
(488, 70, 152, 75, 270, 100, 20, 2, 120, 258, 130, 4, '1.50', '488.png', 'Cresselia', 'Cresselia', 489, 2857, 120, 214, 'pv488.wav', 'Lunar Pokémon', 'Pokémon Lunaire', 85, 260, '85.60', NULL, NULL, NULL, 52, 13, NULL, 100, 6, 42, NULL, 4, 14, NULL),
(489, 80, 162, 80, 216, 70, 20, 2, 80, 162, 80, 0, '0.40', '489.png', 'Phione', 'Phione', 490, 2105, 80, 162, 'pv489.wav', 'Sea Drifter Pokémon', 'Pokémon Dérivenmer', 80, 190, '3.10', NULL, NULL, NULL, 44, 7, NULL, 91, 23, 105, NULL, 4, 11, NULL),
(490, 100, 210, 100, 270, 70, 20, 2, 100, 210, 100, 0, '0.30', '490.png', 'Manaphy', 'Manaphy', 491, 3265, 100, 189, 'pv490.wav', 'Seafaring Pokémon', 'Pokémon Voyagenmer', 100, 225, '1.40', NULL, NULL, NULL, 44, 7, NULL, 91, 23, 32, NULL, 4, 11, NULL),
(491, 90, 285, 135, 270, 0, 20, 2, 90, 198, 90, 0, '1.50', '491.png', 'Darkrai', 'Darkrai', 492, 3739, 70, 147, 'pv491.wav', 'Pitch Black Pokémon', 'Pokémon Noirtotal', 125, 172, '50.50', NULL, NULL, NULL, 25, 28, NULL, 68, 41, 16, NULL, 4, 17, NULL),
(492, 100, 210, 100, 270, 100, 20, 2, 100, 210, 100, 0, '0.20', '492.png', 'Shaymin', 'Shaymin', 493, 3265, 100, 189, 'pv492.wav', 'Gratitude Pokémon', 'Pokémon Gratitude', 100, 225, '2.10', NULL, NULL, NULL, 26, 46, NULL, 95, 37, 31, NULL, 4, 12, NULL),
(493, 120, 238, 120, 324, 0, 20, 2, 120, 238, 120, 0, '3.20', '493.png', 'Arceus', 'Arceus', 494, 3989, 120, 199, 'pv493.wav', 'Alpha Pokémon', 'Pokémon Alpha', 120, 237, '320.00', NULL, NULL, NULL, 10, 4, NULL, 61, 6, 19, NULL, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE `team` (
  `id` int(2) UNSIGNED NOT NULL,
  `color_en` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_fr` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_player` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_pngXl` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_pngXs` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_svg` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_fr` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `player_en` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `player_fr` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `team`
--

INSERT INTO `team` (`id`, `color_en`, `color_fr`, `img_player`, `img_pngXl`, `img_pngXs`, `img_svg`, `name_en`, `name_fr`, `player_en`, `player_fr`) VALUES
(1, 'blue', 'bleu', 'Team_Mystic_Blanche.png', 'Team_Mystic_Emblem_xl.png', 'Team_Mystic_Emblem_xs.png', 'Team_Mystic_Emblem.svg', 'mystic', 'sagesse', 'blanche', 'blanche'),
(2, 'red', 'rouge', 'Team_Valor_Candela.png', 'Team_Valor_Emblem_xl.png', 'Team_Valor_Emblem_xs.png', 'Team_Valor_Emblem.svg', 'valor', 'bravoure', 'candela', 'candela'),
(3, 'yellow', 'jaune', 'Team_Instinct_Spark.png', 'Team_Instinct_Emblem_xl.png', 'Team_Instinct_Emblem_xs.png', 'Team_Instinct_Emblem.svg', 'instinct', 'intuition', 'candela', 'candela');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int(2) UNSIGNED NOT NULL,
  `img` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_fr` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `img`, `name_en`, `name_fr`) VALUES
(1, 'normal.png', 'normal', 'normal'),
(2, 'fighting.png', 'fighting', 'combat'),
(3, 'flying.png', 'flying', 'vol'),
(4, 'poison.png', 'poison', 'poison'),
(5, 'ground.png', 'ground', 'sol'),
(6, 'rock.png', 'rock', 'roche'),
(7, 'bug.png', 'bug', 'insecte'),
(8, 'ghost.png', 'ghost', 'spectre'),
(9, 'steel.png', 'steel', 'metal'),
(10, 'fire.png', 'fire', 'feu'),
(11, 'water.png', 'water', 'eau'),
(12, 'grass.png', 'grass', 'plante'),
(13, 'electric.png', 'electric', 'electrik'),
(14, 'psychic.png', 'psychic', 'psy'),
(15, 'ice.png', 'ice', 'glace'),
(16, 'dragon.png', 'dragon', 'dragon'),
(17, 'dark.png', 'dark', 'tenebres'),
(18, 'fairy.png', 'fairy', 'fee');

-- --------------------------------------------------------

--
-- Structure de la table `version`
--

CREATE TABLE `version` (
  `version` decimal(3,1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `version`
--

INSERT INTO `version` (`version`) VALUES
('1.0');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abilitie`
--
ALTER TABLE `abilitie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fast_move`
--
ALTER TABLE `fast_move`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Index pour la table `main_move`
--
ALTER TABLE `main_move`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Index pour la table `pokeball`
--
ALTER TABLE `pokeball`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pokedex`
--
ALTER TABLE `pokedex`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pokedex` (`pokedex`),
  ADD KEY `idx_name_en` (`name_en`),
  ADD KEY `idx_name_fr` (`name_fr`),
  ADD KEY `idx_order` (`order`),
  ADD KEY `abilitie_1` (`abilitie_1`),
  ADD KEY `abilitie_2` (`abilitie_2`),
  ADD KEY `abilitie_3` (`abilitie_3`),
  ADD KEY `fast_move_1` (`fast_move_1`),
  ADD KEY `fast_move_2` (`fast_move_2`),
  ADD KEY `fast_move_3` (`fast_move_3`),
  ADD KEY `main_move_1` (`main_move_1`),
  ADD KEY `main_move_2` (`main_move_2`),
  ADD KEY `main_move_3` (`main_move_3`),
  ADD KEY `main_move_4` (`main_move_4`),
  ADD KEY `type_1` (`type_1`),
  ADD KEY `type_2` (`type_2`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name_en` (`name_en`),
  ADD KEY `idx_name_fr` (`name_fr`),
  ADD KEY `idx_color_en` (`color_en`),
  ADD KEY `idx_color_fr` (`color_fr`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`version`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fast_move`
--
ALTER TABLE `fast_move`
  ADD CONSTRAINT `fast_move_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`);

--
-- Contraintes pour la table `main_move`
--
ALTER TABLE `main_move`
  ADD CONSTRAINT `main_move_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`);

--
-- Contraintes pour la table `pokemon`
--
ALTER TABLE `pokemon`
  ADD CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`abilitie_1`) REFERENCES `abilitie` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_10` FOREIGN KEY (`main_move_4`) REFERENCES `main_move` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_11` FOREIGN KEY (`pokedex`) REFERENCES `pokedex` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_12` FOREIGN KEY (`type_1`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_13` FOREIGN KEY (`type_2`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_2` FOREIGN KEY (`abilitie_2`) REFERENCES `abilitie` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_3` FOREIGN KEY (`abilitie_3`) REFERENCES `abilitie` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_4` FOREIGN KEY (`fast_move_1`) REFERENCES `fast_move` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_5` FOREIGN KEY (`fast_move_2`) REFERENCES `fast_move` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_6` FOREIGN KEY (`fast_move_3`) REFERENCES `fast_move` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_7` FOREIGN KEY (`main_move_1`) REFERENCES `main_move` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_8` FOREIGN KEY (`main_move_2`) REFERENCES `main_move` (`id`),
  ADD CONSTRAINT `pokemon_ibfk_9` FOREIGN KEY (`main_move_3`) REFERENCES `main_move` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
