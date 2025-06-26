import 'package:get/get.dart';
import '../models/artisan_model.dart';

class ArtisanController extends GetxController {
  final RxList<Artisan> allArtisans = <Artisan>[].obs;
  final RxString selectedFilter = 'Tous'.obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyArtisans(); // à remplacer par un appel Firebase plus tard
  }

  void loadDummyArtisans() {
    allArtisans.value = [
      Artisan(
        id: '1',
        name: 'Jean Mbadinga',
        city: 'Libreville',
        specialty: 'Menuiserie',
        image: 'assets/artisan1.jpg',
      ),
      Artisan(
        id: '2',
        name: 'Sarah Ndong',
        city: 'Port-Gentil',
        specialty: 'Soudure',
        image: 'assets/artisan2.jpg',
      ),
      Artisan(
        id: '3',
        name: 'Kevin Mba',
        city: 'Franceville',
        specialty: 'Menuiserie',
        image: 'assets/artisan3.jpg',
      ),
    ];
  }

  List<Artisan> get filteredArtisans {
    if (selectedFilter.value == 'Tous') return allArtisans;
    return allArtisans
        .where(
          (artisan) =>
              artisan.city == selectedFilter.value ||
              artisan.specialty == selectedFilter.value,
        )
        .toList();
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }
}
