import 'dart:ffi';

import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Cart extends Equatable {
  Cart();

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



 

  static List<Product> products = [
    Product(
        name: 'Nectar Verde',
        category: 'Aguardientes',
        imageUrl:
            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        price: 33000,
        isRecommeded: true,
        isPopular: false),
    Product(
        name: 'Nectar Azul',
        category: 'Aguardientes',
        imageUrl:
            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
        price: 35000,
        isRecommeded: true,
        isPopular: true),
    Product(
        name: 'Sello Negro',
        category: 'Whiskey',
        imageUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 82000,
        isRecommeded: true,
        isPopular: false
        ),
        Product(
        name: 'Sello Negro',
        category: 'Whiskey',
        imageUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 82000,
        isRecommeded: true,
        isPopular: false
        ),
        Product(
        name: 'Sello Negro',
        category: 'Whiskey',
        imageUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 82000,
        isRecommeded: true,
        isPopular: false
        ),
        
        
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
