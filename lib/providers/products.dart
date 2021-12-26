import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0533/6757/0604/products/1_6cacff69-18f1-4544-ba68-9092457ab351.jpg?v=1612360572',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://ae01.alicdn.com/kf/HTB1GqIczQCWBuNjy0Faq6xUlXXaj/FQLWL-Sexy-PU-Leather-Pants-Women-Trousers-Black-High-Waist-Pants-Female-Hip-Push-Up-Stretch.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F33%2F44%2F33440a7876d046605062e5f608c2cf464198bd57.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_accessories_hatsscarvesgloves_scarves%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://i.pinimg.com/236x/9d/86/4b/9d864b9b6b7cfd9825cc69e9be334bd9.jpg',
    ),
  ];

  //var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite == true).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  //
  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
