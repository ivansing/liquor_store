import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  Checkout(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.city,
      required this.products,
      required this.subtotal,
      required this.deliveryFee,
      required this.total});

  @override
  List<Object?> get props =>
      [fullName, email, address, city, products, subtotal, deliveryFee, total];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'develiryFee': deliveryFee!,
      'total': total!
    };
  }
}
