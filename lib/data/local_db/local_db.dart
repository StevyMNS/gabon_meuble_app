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
  ];

  static void initDemoData() {
    // Artisans
    if (box.read('artisans') == null) {
      final artisans = List.generate(
        20,
        (i) =>
            Artisan(
              id: i + 1,
              nom: 'Artisan ${i + 1}',
              specialite:
                  ['Menuisier', 'Soudeur', 'Décorateur', 'Tapissier'][i % 4],
              ville:
                  ['Libreville', 'Port-Gentil', 'Franceville', 'Oyem'][i % 4],
              image: LocalDB.productImages[i % LocalDB.productImages.length],
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
    if (box.read('produits') == null) {
      final produits = <Map<String, dynamic>>[];
      for (var catId = 1; catId <= 6; catId++) {
        for (var i = 0; i < 50; i++) {
          produits.add(
            Produit(
              id: ((catId - 1) * 50) + i + 1,
              titre: 'Produit ${i + 1} Catégorie $catId',
              prix: 10000 + (i * 1000) + catId * 500,
              image: LocalDB.productImages[i % LocalDB.productImages.length],
              categorie: catId.toString(),
              description:
                  'Description du produit ${i + 1} de la catégorie $catId.',
              artisanId: ((i + catId) % 20) + 1,
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
