import 'package:get/get.dart';

class CompareController extends GetxController {
  var selectedProducts = <Map<String, dynamic>>[].obs;

  void toggleProduct(Map<String, dynamic> product) {
    if (selectedProducts.contains(product)) {
      selectedProducts.remove(product);
    } else if (selectedProducts.length < 2) {
      selectedProducts.add(product);
    }
  }

  bool isSelected(Map<String, dynamic> product) {
    return selectedProducts.contains(product);
  }
}