import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/blocs/category/category_bloc.dart';
import 'package:ecommerce_app/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/repositories/product/product_repository.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  ProductRepository productRepository = ProductRepository();
  final Stream<QuerySnapshot> productFirebase =
      FirebaseFirestore.instance.collection('products').snapshots();

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'LICORERIA'),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.8,
                      viewportFraction: 0.7,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: state.categories
                        .map((category) => CarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return Text('Algo salio mal.');
                }
              },
            ),
          ),
          SectionTitle(title: 'Recomendados'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
               /* if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }  */

              //if (state is ProductLoaded) {
                return ProductCarousel(
                  products: Product.products
                      .where((product) => product.isRecommended)
                      .toList(),
                );
            /*  } else {
                return Text('Algo salio mal.');
              }  */
            },
          ),
          SectionTitle(title: 'Mas Populares'),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList()),
        ],
      ),
    );
  }
}
