-- Suppression de la base de données si elle existe
DROP DATABASE IF EXISTS moncommerce_db;
-- Création de la base de données
CREATE DATABASE moncommerce_db;

USE moncommerce_db; 

CREATE TABLE pays(
    'Idpays' VARCHAR (3) PRIMARY KEY NOT NULL AUTO_INCREMENT;
    'nomPays' VARCHAR (50) NOT NULL UNIQUE 
     ENGINE = InnoDB;
);
CREATE TABLE clients (
    'Idclients' INT (10) UNSIGNED PRIMARY KEY NOT NULL  AUTO_INCREMENT;
    'nom' VARCHAR (256) NOT NULL ;
    'prenom' VARCHAR (256) NOT NULL ;
    'rue' VARCHAR (50) NOT NULL ;
    'noRue' VARCHAR (10) NULL ;
    'npa' VARCHAR (10) NOT NULL ;
    'localite' VARCHAR (50) NOT NULL ;
    '#Idpays' VARCHAR (3) FOREIGN KEY
    ENGINE = InnoDB;
);

CREATE TABLE commandes(
    'IdCommande' int (10) UNSIGNED NOT NULL AUTO_INCREMENT;
    'dateCommande' datetime NOT NULL;
    'IdClient' int (10) UNSIGNED FOREIGN KEY NOT NULL
    ENGINE = InnoDB;
);
CREATE TABLE factures (
    'IdFacture' INT (10) UNSIGNED PRIMARY KEY NOT NULL  AUTO_INCREMENT;
    'dateFacture' DATE NOT NULL ;
    'montant' DECIMAL (10,2) NOT NULL ;
    '#IdCommande' INT (10) UNSIGNED FOREIGN KEY UNIQUE; 
    '#idClient' INT (10) UNSIGNED FOREIGN KEY NULL; 
    'datePaiement' DATETIME NULL
    ENGINE = InnoDB;
);


CREATE TABLE articles (
    'IdArticle' INT (10) UNSIGNED PRIMARY KEY NOT NULL  AUTO_INCREMENT;
    'titre' VARCHAR (100) NOT NULL ;
    'description' TEXT NULL
    'prixUnitaire' DECIMAL (10,2)
    ENGINE = InnoDB;
)
CREATE TABLE commandes_articles (
    idCommande
)

