import 'package:gabon_meuble_app/data/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  final box = GetStorage();

  // Liste observable de produits
  var produits = <Produit>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProduits();
  }

  void loadProduits() {
    final produitsMap = box.read('produits') as List<dynamic>;
    produits.value = produitsMap.map((e) => Produit.fromMap(e)).toList();
  }

  // Filtrer par catégorie
  List<Produit> produitsParCategorie(String categorieId) {
    return produits.where((p) => p.categorie == categorieId).toList();
  }

  // Récupérer un produit par id
  Produit? getProduitById(int id) {
    return produits.firstWhereOrNull((p) => p.id == id);
  }
}
