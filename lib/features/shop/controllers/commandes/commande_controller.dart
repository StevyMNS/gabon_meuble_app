import 'package:gabon_meuble_app/data/commande_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CommandeController extends GetxController {
  final box = GetStorage();

  var commandes = <Commande>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCommandes();
  }

  void loadCommandes() {
    final commandesMap = box.read('commandes') as List<dynamic>;
    commandes.value = commandesMap.map((e) => Commande.fromMap(e)).toList();
  }

  Commande? getCommandeById(int id) {
    return commandes.firstWhereOrNull((c) => c.id == id);
  }
}
