              iWs                                 ,W[
              W@@W.                              g@@[
             i@@@@@s                           g@@@@W
             @@@@@@@W.                       ,W@@@@@@
            ]@@@@@@@@@W.   ,_______.       ,m@@@@@@@@i
           ,@@@@@@@@@@@@W@@@@@@@@@@@@@@mm_g@@@@@@@@@@[
           d@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          i@@@@@@@A*~~~~~VM@@@@@@@@@@Af~~~~V*@@@@@@@@@i
          @@@@@A~          'M@@@@@@A`         'V@@@@@@b
         d@@@*`              Y@@@@f              V@@@@@.
        i@@A`                 M@@P                 V@@@b
       ,@@A                   '@@                   !@@@.
       W@P                     @[                    '@@W
      d@@            ,         ]!                     ]@@b
     g@@[          ,W@@s       ]       ,W@@s           @@@i
    i@@@[          W@@@@i      ]       W@@@@i          @@@@i
   i@@@@[          @@@@@[      ]       @@@@@[          @@@@@i
  g@@@@@[          @@@@@!      @[      @@@@@[          @@@@@@i
 d@@@@@@@          !@@@P      iAW      !@@@A          ]@@@@@@@i
W@@@@@@@@b          '~~      ,Z Yi      '~~          ,@@@@@@@@@
'*@@@@@@@@s                  Z`  Y.                 ,W@@@@@@@@A
  'M@@@*f**W.              ,Z     Vs               ,W*~~~M@@@f
    'M@    'Vs.          ,z~       'N_           ,Z~     d@P
   M@@@       ~\-__  __z/` ,gmW@@mm_ '+e_.   __=/`      ,@@@@
    'VMW                  g@@@@@@@@@W     ~~~          ,WAf
       ~N.                @@@@@@@@@@@!                ,Z`
         V.               !M@@@@@@@@f                gf-
          'N.               '~***f~                ,Z`
            Vc.                                  _Zf
              ~e_                             ,gY~
                'V=_          -@@D         ,gY~ '
                    ~\=__.           ,__z=~`
                         '~~~*==Y*f~~~

Projet : Création de mon commerce                
Auteur: Mattis Lefranc-Adam
Version : 1.0                       
Date:  26/11/2024                       
Desc:  project do in class




-- Suppression de la base de données si elle existe
DROP DATABASE IF EXISTS bibliotheques_db;
-- Création de la base de données
CREATE DATABASE bibliotheques_db;

-- Utiliser la base de données 'bibliotheques_db' pour les requêtes suivantes
USE bibliotheques_db;

SET default_storage_engine=InnoDB;
-- Suppression et création des tables ainsi que leurs colonnes avec les clés primaires
-- Créations Tables
CREATE TABLE IF NOT EXISTS pays(
idPays VARCHAR(3) NOT NULL,
nomPays VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (idPays));
-- ---------------------------------
CREATE TABLE IF NOT EXISTS clients(
idClient INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,
rue VARCHAR(50) NOT NULL,
noRue VARCHAR(10) NULL,
npa VARCHAR(10) NOT NULL,
localite VARCHAR(50) NOT NULL,
idPays VARCHAR(3) NOT NULL,
PRIMARY KEY (idClient));
-- ---------------------------------
CREATE TABLE IF NOT EXISTS commandes(
idCommande INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
dateCommande DATETIME NOT NULL,
idClient INT(10) UNSIGNED NOT NULL,
PRIMARY KEY(idCommande));
-- ---------------------------------
CREATE TABLE IF NOT EXISTS factures(
idFacture INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
dateFacture DATE NOT NULL,
montant DECIMAL(10,2) NOT NULL,
idCommande INT(10) UNSIGNED NOT NULL,
idClient INT(10) UNSIGNED NULL,
datePaiement DATETIME NULL,
PRIMARY KEY(idFacture));
-- ---------------------------------
CREATE TABLE IF NOT EXISTS articles (
idArticle INT(10) UNSIGNED AUTO_INCREMENT  NOT NULL,
titre VARCHAR(100) NOT NULL,
description TEXT NULL,
prixUnitaire DECIMAL(10,2) NOT NULL,
PRIMARY KEY(idArticle));
-- ---------------------------------
CREATE TABLE IF NOT EXISTS commandes_articles(
idCommande INT(10) UNSIGNED NOT NULL,
idArticle INT(10) UNSIGNED NOT NULL,
quantite TINYINT(3) NOT NULL,
PRIMARY KEY(idArticle, idCommande));
-- ---------------------------------
ALTER TABLE clients
ADD CONSTRAINT fk_clients_pays
FOREIGN KEY (idPays)
REFERENCES pays (idPays)
ON UPDATE CASCADE
ON DELETE RESTRICT;
-- ---------------------------------
ALTER TABLE commandes
ADD CONSTRAINT fk_commande_clients
FOREIGN KEY (idClient)
REFERENCES clients (idClient)
ON UPDATE RESTRICT
ON DELETE RESTRICT;
-- ---------------------------------
ALTER TABLE factures
ADD CONSTRAINT fk_facture_commande
FOREIGN KEY (idClient)
REFERENCES clients (idClient)
ON UPDATE RESTRICT
ON DELETE RESTRICT;
-- ---------------------------------
ALTER TABLE commandes_articles
ADD CONSTRAINT fk_commandeArticle_commandes
FOREIGN KEY (idCommande)
REFERENCES commandes (idCommande)
ON UPDATE RESTRICT
ON DELETE RESTRICT;
-- ---------------------------------
ALTER TABLE commandes_articles
ADD CONSTRAINT fk_commande_commandeArticle
FOREIGN KEY (idArticle)
REFERENCES articles (idArticle)
ON UPDATE RESTRICT
ON DELETE CASCADE;

-------------------------


ALTER TABLE clients
MODIFY nom VARCHAR(100);
MODIFY prenom VARCHAR(100);

-----------------------------------
ALTER TABLE articles
MODIFY ADD UNIQUE (titre);
------------------------------------
ALTER TABLE articles
MODIFY description NOT NULL;