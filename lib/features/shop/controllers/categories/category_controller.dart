import 'package:gabon_meuble_app/data/categoriy_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategorieController extends GetxController {
  final box = GetStorage();

  var categories = <Categorie>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  void loadCategories() {
    final categoriesMap = box.read('categories') as List<dynamic>;
    categories.value = categoriesMap.map((e) => Categorie.fromMap(e)).toList();
  }

  Categorie? getCategorieById(int id) {
    return categories.firstWhereOrNull((c) => c.id == id);
  }
}
