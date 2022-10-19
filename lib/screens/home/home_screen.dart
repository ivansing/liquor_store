import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/blocs/auth/auth_bloc.dart';
import 'package:ecommerce_app/blocs/category/category_bloc.dart';
import 'package:ecommerce_app/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/repositories/product/product_repository.dart';

import 'package:ecommerce_app/screens/screens.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  ProductRepository productRepository = ProductRepository();
  final Stream<QuerySnapshot> productFirebase =
      FirebaseFirestore.instance.collection('products').snapshots();

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) =>  HomeScreen() /*  (context) {
        // testing dev
          print(
            'From home_screen routee ${BlocProvider.of<AuthBloc>(context).state.status}');
        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated
            ? const LoginScreen()
            : HomeScreen(); 
      }   */
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarHomeScreen(title: 'LICORERIA'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(
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
                    return const Text('Algo salio mal.');
                  }
                },
              ),
            ),
            const SectionTitle(title: 'Recomendados'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommended)
                        .toList(),
                  );
                } else {
                  return const Text('Algo salio mal.');
                }
              },
            ),
            const SectionTitle(title: 'Mas Populares'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList());
                } else {
                  return const Text('Algo salio mal.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
