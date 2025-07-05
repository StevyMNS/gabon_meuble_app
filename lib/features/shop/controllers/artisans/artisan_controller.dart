import 'package:gabon_meuble_app/data/artisan_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArtisanController extends GetxController {
  final box = GetStorage();

  var artisans = <Artisan>[].obs;
  final RxString selectedFilter = 'Tous'.obs;

  @override
  void onInit() {
    super.onInit();
    loadArtisans();
  }

  void loadArtisans() {
    final artisansMap = box.read('artisans') as List<dynamic>;
    artisans.value = artisansMap.map((e) => Artisan.fromMap(e)).toList();
  }

  List<Artisan> artisansParSpecialite(String specialite) {
    return artisans.where((a) => a.specialite == specialite).toList();
  }

  Artisan? getArtisanById(int id) {
    return artisans.firstWhereOrNull((a) => a.id == id);
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;

    if (filter == 'Tous') {
      final artisansMap = box.read('artisans') as List<dynamic>;
      artisans.value = artisansMap.map((e) => Artisan.fromMap(e)).toList();
    } else {
      artisans.value = artisansParSpecialite(filter);
    }
  }
}
