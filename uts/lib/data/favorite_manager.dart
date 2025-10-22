import 'package:uts/data/models/product_model.dart';

class FavoriteManager {
  static final List<ProductModel> _favorites = [];

  static List<ProductModel> get favorites => _favorites;

  static void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      _favorites.removeWhere((item) => item.id == product.id);
    } else {
      _favorites.add(product);
    }
  }

  static bool isFavorite(ProductModel product) {
    return _favorites.any((item) => item.id == product.id);
  }
}
