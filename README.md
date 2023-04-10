# Edition numérique
Édition en XML-TEI de la Guerre du Péloponnèse dans le manuscrit Laurentianus 69.2 (BML ms. plut. 69.2, f 2r-3v)

Ce projet consiste en l'édition en `XML TEI` des premiers feuillets du manuscrit Laurentianus 69.2 de la collection Plutei (folios 2r à 3v) conservé à la Biblioteca Medicea Laurenziana et disponible en [version numérisée](http://mss.bmlonline.it/s.aspx?Id=AWOItqraI1A4r7GxMMPB&c=Thucydides#/book).

## Consignes générales

* Structurer en XML-TEI votre texte en vue d’une édition et en respectant le genre auquel appartient votre extrait **(`/6`)** ;

* Compléter de la manière la plus précise possible le `teiHeader` de votre édition, en fonction des éléments nécessaires à son établissement et à la compréhension du texte **(`/4`)** ;

* Écrire une ODD adaptée à votre encodage et documentée **(`/10`)** :
	- Générer une ODD à partir de `Roma` ou de `oddbyexample` (`/1`) ;
	- Votre ODD doit contenir au moins une règle **fonctionnelle** (et ne faisant pas partie des exemples du cours) et **documentée** (une description *a minima* en commentaire explicitant la fonction de la règle de validation) :
		- Une règle contraignant l’usage d’un attribut et sa ou ses valeurs (`<attDef>`) (`/1`) ;
		- Une règle contraignant l’enchaînement de certains éléments (`<content>`) (`/1`) ;
		- Une règle contraignant la valeur d’un attribut ou l’usage d’un élément ou d’un attribut en fonction de son environnement (`<constraint>`) (`/1`).
	- À partir de votre ODD, générer la documentation HTML de votre projet :
		- Présenter en introduction votre projet éditorial et ses exploitations possibles (`/3`) ;
		- Documenter le fonctionnement de votre encodage et vos choix de balises (`/3`).

* Déposer l'ensemble des documents sur un *repository* GitHub

## Transformation XSLT
La feuille de style ```XSL```, réalisée pour l'évaluation du cours d'```XSLT``` du M2, prend en entrée le fichier ```XML TEI``` et renvoie en sortie cinq fichiers ```HTML```. 

Ces fichiers constituent un site navigable dédié à l'édition numérique, qui comprend une **page d'accueil**, la **page d'informations**  relatives au manuscrit, une **transcription fac-similaire et une traduction**, un **fac-similé** et un **index des noms, lieux et peuples**.
