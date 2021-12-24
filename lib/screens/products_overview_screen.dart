import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../models/product.dart';
//import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://sc02.alicdn.com/kf/H8be982659e7645e7aa9369dca8db18a0o.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://ae01.alicdn.com/kf/Hc5d05efba5d6481aadc169ebb548b827z/Sexy-Low-Waist-Exotic-Latex-Leather-Pants-Zipper-Red-PU-Trousers-Lace-up-Hole-Dance-Bodycon.jpg_Q90.jpg_.webp',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ProductItem(
          loadedProducts[i].id,
          loadedProducts[i].title,
          loadedProducts[i].imageUrl,
        ),
      ),
    );
  }
}
