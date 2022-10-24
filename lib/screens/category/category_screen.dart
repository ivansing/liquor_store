import 'package:ecommerce_app/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CategoryScreen(category: category));
  }

  final Category category;

  const CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            const SizedBox(height: 10),
            SearchBox(category: category),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  final List<Product> categoryProducts = state.products
                      .where((product) => product.category == category.name)
                      .toList();
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16.0,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.15,
                    ),
                    itemCount: categoryProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: ProductCard.category(
                          product: categoryProducts[index],
                          widthFactor: 2.2,
                        ),
                      );
                    },
                  );
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
