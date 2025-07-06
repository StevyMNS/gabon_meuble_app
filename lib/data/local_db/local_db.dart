import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/data/artisan_model.dart';
import 'package:gabon_meuble_app/data/categoriy_model.dart';
import 'package:gabon_meuble_app/data/commande_model.dart';
import 'package:gabon_meuble_app/data/message_model.dart';
import 'package:gabon_meuble_app/data/product_model.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:get_storage/get_storage.dart';

class LocalDB {
  static final box = GetStorage();
  static final productImages = [
    GMImages.productImage1,
    GMImages.productImage2,
    GMImages.productImage3,
    GMImages.productImage4,
    GMImages.productImage5,
    GMImages.productImage6,
    GMImages.productImage7,
    GMImages.productImage8,
    GMImages.productImage9,
    GMImages.productImage10,
    GMImages.productImage11,
    GMImages.productImage12,
    GMImages.productImage13,
    GMImages.productImage14,
    GMImages.productImage15,
    GMImages.productImage16,
    GMImages.productImage17,
    GMImages.productImage18,
    GMImages.productImage19,
    GMImages.productImage20,
    GMImages.productImage21,
    GMImages.productImage22,
    GMImages.productImage23,
    GMImages.productImage24,
    GMImages.productImage25,
    GMImages.productImage26,
    GMImages.productImage27,
    GMImages.productImage28,
    GMImages.productImage29,
    GMImages.productImage30,
    GMImages.productImage31,
    GMImages.productImage32,
    GMImages.productImage33,
    GMImages.productImage34,
    GMImages.productImage35,
    GMImages.productImage36,
    GMImages.productImage37,
    GMImages.productImage38,
    GMImages.productImage39,
    GMImages.productImage40,
    GMImages.productImage41,
    GMImages.productImage42,
    GMImages.productImage43,
    GMImages.productImage44,
    GMImages.productImage45,
    GMImages.productImage46,
    GMImages.productImage47,
    GMImages.productImage48,
    GMImages.productImage49,
  ];

  static final artisansImages = [
    GMImages.artisan1,
    GMImages.artisan2,
    GMImages.artisan3,
    GMImages.artisan4,
    GMImages.artisan5,
    GMImages.artisan6,
    GMImages.artisan7,
    GMImages.artisan8,
    GMImages.artisan9,
    GMImages.artisan10,
    GMImages.artisan11,
    GMImages.artisan12,
    GMImages.artisan13,
    GMImages.artisan14,
    GMImages.artisan15,
    GMImages.artisan16,
    GMImages.artisan17,
    GMImages.artisan18,
    GMImages.artisan19,
    GMImages.artisan20,
  ];

  static final artisanNames = [
    "Jean Mavoungou",
    "Pierre Ndong",
    "Pauline Obiang",
    "Aristide Mba",
    "Sylvie Mounguengui",
    "Brice Ella",
    "Chantal Biyogo",
    "Germain Essono",
    "Josiane Nguema",
    "Alain Boulingui",
    "Patricia Nzengue",
    "Serge Moussavou",
    "Clarisse Oyono",
    "Richard Nziengui",
    "Estelle Mbadinga",
    "Benoît Moukagni",
    "Nadine Minko",
    "Fabrice Nguéma",
    "Marie-Louise Boussougou",
    "Stéphane Mebale",
  ];

  static void initDemoData() {
    // Artisans
    if (box.read('artisans') == null) {
      final artisans = List.generate(
        20,
        (i) =>
            Artisan(
              id: i + 1,
              nom: artisanNames[i],
              specialite:
                  ['Menuisier', 'Soudeur', 'Décorateur', 'Tapissier'][i % 4],
              ville:
                  ['Libreville', 'Port-Gentil', 'Franceville', 'Oyem'][i % 4],
              image: LocalDB.artisansImages[i % LocalDB.artisansImages.length],
            ).toMap(),
      );
      box.write('artisans', artisans);
    }

    // Catégories
    if (box.read('categories') == null) {
      final categories = [
        Categorie(id: 1, nom: 'Menuiserie', icone: Icons.chair_alt).toMap(),
        Categorie(id: 2, nom: 'Soudure', icone: Icons.settings).toMap(),
        Categorie(id: 3, nom: 'Meubles', icone: Icons.weekend).toMap(),
        Categorie(id: 4, nom: 'Décoration', icone: Icons.brush).toMap(),
        Categorie(id: 5, nom: '100% local', icone: Icons.star).toMap(),
        Categorie(
          id: 6,
          nom: 'Mobilier personnalisé',
          icone: Icons.build,
        ).toMap(),
      ];
      box.write('categories', categories);
    }

    // Produits (50 par catégorie)
    // Produits (50 par catégorie)
    if (box.read('produits') == null) {
      final artisans = box.read('artisans') as List<dynamic>;
      final produits = <Map<String, dynamic>>[];
      final categoryNames = [
        'Menuiserie',
        'Soudure',
        'Meubles',
        'Décoration',
        '100% local',
        'Mobilier personnalisé',
      ];

      final productNames = [
        'Grand portail vert à motifs dorés de 3 mètres',
        'Salon 8 places gris',
        'Grilles de fenêtres en acier idéale pour vos fenêtres',
        'Grand portail noir avec motifs multi-couleurs',
        'Grand portail blanc avec du rouge au milieur',
        'Grille de terasses avec jolis motifs',
        'Grille de fenêtre à motifs élegants',
        'Grand portail bordeau avec son portillon',
        'Portail noir avec motif H argenté',
        'Canapé en L',
        'Grand portail vert argenté avec lignes horizontalles',
        'Salon bleu 8 places',
        'Bureau modern',
        'Pouff en bois avec motifs',
        'Cultures traditionnelles',
        'Grille de fenêtres robustres pour une meilleure protection',
        'Geand portail en grilles de 2.5 mètres de haut',
        'Harpe traditionnelle Ngombi',
        'Barbecue robuste et sur mesure, fabriqué à partir de fûts en acier soudés',
        'Bnsemble de barreaux de fenêtre décoratifs au design complexe inspiré des motifs traditionnels africains',
        'Cheval en bois',
        'Coffre en bois local',
        'Un ensemble de coussins décoratifs fabriqués à partir de tissu wax traditionnel',
        'Un ensemble de bols et d\'ustensiles en bois de padouk poli',
        'Un escalier en métal sur mesure avec une structure en acier soudé et des marches en bois',
        'Ensemble d\'étagères métalliques robustes pour une cuisine de style industriel',
        'Fauteuil magistralement fabriqué à la main en bois d\'okoumé',
        'Collection de figurines d\'animaux en bois sculptées à la main',
        'Pierre de Mbigou vibrante et peinte à la main du Gabon',
        'Lit à baldaquin en bois sombre et lourd, avec des poteaux sculptés à la main',
        'Masque en bois sculpté à la main de la tradition Fang',
        'Portail de sécurité en fer forgé orné pour une villa',
        'Porte en bois magnifiquement conçue pour une maison moderne',
        'Canapé blanc de luxe',
        'Dressing modern en bois',
        'Plan de cuisine en bois blanc',
        'Table à manger en bois verni',
        'Grande tenture murale en raphia tissée à la main avec des motifs complexes et de longues franges',
        'Fauteil confortable avec bois poli',
        'Chaise moderne et elegante en accier',
        'Grand bureau en bois',
        'Bureau élegant en bois',
        'Grand lit en bois de couleur noir',
        'Lit blanc de deux places',
        'Lit avec design simple de deux places',
        'Lit Luxeux en bois',
        '',
        'Table de salle à manger moderne fabriquée à partir d\'une seule plaque de bois de kevazingo',
        'Table basse minimaliste en acier avec une finition brute et industrielle',
      ];
      for (var catId = 1; catId <= 6; catId++) {
        final categoryName = categoryNames[catId - 1];
        for (var i = 0; i < 50; i++) {
          final artisanIndex = ((i + catId) % artisans.length);
          final artisanMap = artisans[artisanIndex];
          final artisanNom = artisanMap['nom'];
          final productName = productNames[i % productNames.length];

          produits.add(
            Produit(
              id: ((catId - 1) * 50) + i + 1,
              titre: '$productName - $categoryName',
              prix: 10000 + (i * 1000) + catId * 500,
              image: LocalDB.productImages[i % LocalDB.productImages.length],
              categorie: catId.toString(),
              description:
                  'Description du produit ${i + 1} de la catégorie $categoryName.',
              artisanId: artisanIndex + 1,
              artisanNom: artisanNom,
            ).toMap(),
          );
        }
      }
      box.write('produits', produits);
    }

    // Commandes
    if (box.read('commandes') == null) {
      final commandes = List.generate(
        10,
        (i) =>
            Commande(
              id: i + 1,
              produitId: (i % 300) + 1,
              statut: ['En fabrication', 'En livraison', 'Livrée'][i % 3],
              date: '2024-07-${(i % 28) + 1}',
            ).toMap(),
      );
      box.write('commandes', commandes);
    }

    // Messages
    if (box.read('messages') == null) {
      final messages = List.generate(
        10,
        (i) =>
            Message(
              id: i + 1,
              artisanId: ((i % 20) + 1),
              utilisateur: 'Client ${(i % 5) + 1}',
              contenu: 'Message de démo numéro ${i + 1}',
              date: '2024-07-${(i % 28) + 1} 10:${10 + i}',
            ).toMap(),
      );
      box.write('messages', messages);
    }
  }
}
