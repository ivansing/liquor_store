import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({
    Key? key,
    required this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
       height: 165,
       child: ListView.builder(
         shrinkWrap: true,
         padding: const EdgeInsets.symmetric(
           horizontal: 20.0, 
           vertical: 10.0,
         ),
         scrollDirection: Axis.horizontal,
         itemCount: products.length,
         itemBuilder: (context, index) {
             return Padding(
               padding: const EdgeInsets.only(right: 5.0),
               child: ProductCard.category(product: products[index],),
             );
           }),
      ),
    );
  }
}
