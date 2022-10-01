import 'package:equatable/equatable.dart';

class TestProductModel extends Equatable {

  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommeded;
  final bool isPopular;

  TestProductModel({
   
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

    static List<TestProductModel> products = [
    TestProductModel(
      
      name: 'Nectar Verde',
      category: 'Aguardientes',
      imageUrl: 'https://catmartini.co/wp-content/uploads/Aguardiente-Nectar-Verde-750ml.jpg',
      price: 45000,
      isRecommeded: true,
      isPopular: false
    ),
    TestProductModel(
    
      name: 'Sello Negro',
      category: 'Whiskey', 
      imageUrl: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      price: 110000,
      isRecommeded: true,
      isPopular: false
      ),
    TestProductModel(
      
      name: 'Poker', 
      category: 'Cervezas',
      imageUrl: 'https://i.pinimg.com/236x/0f/0d/3e/0f0d3e2fdfe9bf817e6160f335efbf01.jpg',
      price: 25000,
      isRecommeded: true,
      isPopular: false
      ), 
      TestProductModel(
     
      name: 'Nectar Azul',
      category: 'Aguardientes',
      imageUrl: 'https://http2.mlstatic.com/D_NQ_NP_636607-MCO48126695332_112021-V.webp',
      price: 50000,
      isRecommeded: true,
      isPopular: true
    ),
    TestProductModel(
      
      name: 'Sello Rojo',
      category: 'Whiskey', 
      imageUrl: 'https://st.depositphotos.com/2121815/4953/i/450/depositphotos_49530735-stock-photo-johnnie-walker-red-label-blended.jpg',
      price: 82000,
      isRecommeded: true,
      isPopular: true
      ),
    TestProductModel(
      
      name: 'Aguila', 
      category: 'Cervezas',
      imageUrl: 'https://www.cervezaaguila.com/sites/g/files/yrakuj311/files/2022-02/aguila-original.png',
      price: 20000,
      isRecommeded: true,
      isPopular: true
      ), 
  ];
}