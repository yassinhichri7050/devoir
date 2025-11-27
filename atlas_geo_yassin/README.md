# Atlas Géographique

Projet Flutter réalisé pour l’examen de développement mobile cross‑plateforme.  
L’application joue le rôle d’un petit atlas : elle permet de parcourir une liste de pays et de consulter leurs informations de base.

## Fonctionnalités

- Écran d’accueil avec AppBar **"Atlas Géographique"**, image du globe et bouton **Explorer** pour entrer dans l’application.
- Écran **Liste des Pays** :
  - AppBar **"Liste des Pays"**.
  - Drawer avec les options : **Accueil**, **À propos**, **Quitter**.
  - Liste de 9 pays (France, Tunisie, Brésil, Italie, Canada, Australie, Allemagne, Espagne, Afrique du Sud) avec nom et drapeau.
- Écran **Détails du pays** :
  - Affichage du drapeau en grand.
  - Informations : capitale, population (en millions d’habitants), superficie (km²), langue(s) officielle(s).
- Données des pays stockées en dur dans `countries_data.dart` (aucune base de données utilisée).

## Structure principale

- `lib/main.dart` : point d’entrée, configuration de `MaterialApp`, routes (`/`, `/countries`, détail avec `CountryDetailPage`).
- `lib/welcome_page.dart` : page d’accueil avec image du globe et navigation vers la liste.
- `lib/countries_page.dart` : liste des pays, Drawer de navigation, et AboutPage intégrée.
- `lib/country_detail_page.dart` : écran de détail pour un pays sélectionné.
- `lib/countries_data.dart` : liste des pays sous forme de `List<Map<String, String>>`.
- `assets/images/` : images du globe et des drapeaux, déclarées dans `pubspec.yaml`.

## Lancement

Dans le dossier du projet :

