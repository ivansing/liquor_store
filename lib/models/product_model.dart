import 'package:equatable/equatable.dart';

class Product extends Equatable {

  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommeded;
  final bool isPopular;

  Product({
   
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommeded
  });


  @override
  List<Object?> get props => [
    
    name, 
    category, 
    imageUrl, 
    price, 
    isPopular, 
    isRecommeded
    ];

    static List<Product> products = [
    Product(
      
      name: 'Nectar Verde',
      category: 'Aguardientes',
      imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price: 32.000,
      isRecommeded: true,
      isPopular: false
    ),
    Product(
    
      name: 'Sello Negro',
      category: 'Whiskey', 
      imageUrl: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      price: 82.000,
      isRecommeded: true,
      isPopular: false
      ),
    Product(
      
      name: 'Poker', 
      category: 'Cervezas',
      imageUrl: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      price: 20.000,
      isRecommeded: true,
      isPopular: false
      ), 
      Product(
     
      name: 'Nectar Azul',
      category: 'Aguardientes',
      imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price: 36.000,
      isRecommeded: true,
      isPopular: true
    ),
    Product(
      
      name: 'Sello Rojo',
      category: 'Whiskey', 
      imageUrl: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      price: 82.000,
      isRecommeded: true,
      isPopular: true
      ),
    Product(
      
      name: 'Aguila', 
      category: 'Cervezas',
      imageUrl: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      price: 20.000,
      isRecommeded: true,
      isPopular: true
      ), 
  ];
}