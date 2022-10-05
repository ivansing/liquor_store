import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
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

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Nectar Verde',
      category: 'Aguardientes',
      imageUrl: 'https://catmartini.co/wp-content/uploads/Aguardiente-Nectar-Verde-750ml.jpg',
      price: 45000,
      isRecommended: true,
      isPopular: false
    ),
    Product(
    id: '2',
      name: 'Sello Negro',
      category: 'Whiskey', 
      imageUrl: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      price: 110000,
      isRecommended: true,
      isPopular: false
      ),
    Product(
      id: '3',
      name: 'Poker', 
      category: 'Cervezas',
      imageUrl: 'https://i.pinimg.com/236x/0f/0d/3e/0f0d3e2fdfe9bf817e6160f335efbf01.jpg',
      price: 25000,
      isRecommended: true,
      isPopular: false
      ), 
      Product(
     id: '4',
      name: 'Nectar Azul',
      category: 'Aguardientes',
      imageUrl: 'https://http2.mlstatic.com/D_NQ_NP_636607-MCO48126695332_112021-V.webp',
      price: 50000,
      isRecommended: true,
      isPopular: true
    ),
    Product(
      id: '5',
      name: 'Sello Rojo',
      category: 'Whiskey', 
      imageUrl: 'https://st.depositphotos.com/2121815/4953/i/450/depositphotos_49530735-stock-photo-johnnie-walker-red-label-blended.jpg',
      price: 82000,
      isRecommended: true,
      isPopular: true
      ),
    Product(
      id: '6',
      name: 'Aguila', 
      category: 'Cervezas',
      imageUrl: 'https://www.cervezaaguila.com/sites/g/files/yrakuj311/files/2022-02/aguila-original.png',
      price: 20000,
      isRecommended: true,
      isPopular: true
      ), 
  ];
}
