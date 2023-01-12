import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;

  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,
  });

  @override
  int get typeId => 0;

  @override
  List<Object?> get props =>
      [id, name, category, imageUrl, price, isPopular, isRecommended];

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    //  If data is null, check the data type
    return Product(
        id: data.containsKey('id') ? data['id'] : '',
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
