import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final User? user;
  /* final String? fullName;
  final String? email;
  final String? address;
  final String? city; */
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    this.user = User.empty,
    /* required this.fullName,
    required this.email,
    required this.address,
    required this.city, */
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props => [
        user,
        products,
        subtotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    /*  Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['email'] = email; */

    return {
      /* 'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!, */
      'user': user?.toDocument() ?? User.empty.toDocument(),
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'develiryFee': deliveryFee!,
      'total': total!
    };
  }
}
