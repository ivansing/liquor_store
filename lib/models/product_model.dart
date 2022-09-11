import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isPopular,
      required this.isRecommended});

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    // TODO: Si data es nulo, que se debe hacer?

    return Product(
        name: data.containsKey('name') ? data['name'] : '',
        category: data.containsKey('category') ? data['category'] : '',
        imageUrl: data.containsKey('imageUrl') ? data['imageUrl'] : '',
        price: double.parse(
            (data.containsKey('price') ? data['price'] : 0).toString()),
        isPopular: data.containsKey('isPopular') ? data['isPopular'] : false,
        isRecommended:
            data.containsKey('isRecommended') ? data['isRecommended'] : false);
  }
}
