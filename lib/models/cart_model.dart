import 'dart:ffi';

import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  // Total sum total available in the Cart
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 200000) {
      return 0.0;
    } else {
    
      return 8000;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  // Getters
  String get subtotalString => subtotal.toStringAsFixed(0);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(0);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(0);


 
  @override
  List<Object?> get props => [products];
}
