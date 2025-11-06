import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/loaders/loaders.dart';
import 'package:shopping_app/data/repositories/products/product_repository.dart';
import 'package:shopping_app/features/shop/models/product_model.dart';
import 'package:shopping_app/utils/local_storage/storage_utility.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;
@override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method to initialize favourites by reading from storage
Future<void> initFavourites() async {
  final json = RLocalStorage.instance().readData('favorites');
  if (json != null) {
    final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
    favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
  }
}

bool isFavorite(String productId) {
  return favorites[productId] ?? false;
}

void toggleFavorite(String productId) {
  if(!favorites.containsKey(productId)){
    favorites[productId] = true;
    saveFavoriteToStorage();
    RLoaders.customToast(message: 'Product has been added to the wishlist.');
  } else {
    RLocalStorage.instance().removeData(productId);
    favorites.remove(productId);
    saveFavoriteToStorage();
    favorites.refresh();
    RLoaders.customToast(message: 'Product has been removed from the wishlist.');
  }
}

 void saveFavoriteToStorage(){
  final encodedFavorites = json.encode(favorites);
  RLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
  return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}