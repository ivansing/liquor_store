import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

import '../models/test_product_model.dart';

class OrderSummaryProductCart extends StatelessWidget {
  const OrderSummaryProductCart({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final TestProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Cant. $quantity',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
