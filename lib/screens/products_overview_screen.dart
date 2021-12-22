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
          'https://shmultu.ru/wp-content/uploads/2021/12/file_177022Dec2021082405090232.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://shmultu.ru/wp-content/uploads/2021/12/file_176121Dec2021070345541816.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://shmultu.ru/wp-content/uploads/2021/12/file_175921Dec2021052347931678.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://shmultu.ru/wp-content/uploads/2021/12/file_174118Dec2021003958419346.jpg',
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
