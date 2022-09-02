
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen()
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
                  child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.6,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,        
                ),
                items: Category.categories.map((category) => CarouselCard(category: category)).toList(),
              )
           ),
            SectionTitle(title: 'Recomendados'),
           ProductCarousel(products: Product.products
                      .where((product) => product.isRecommeded)
                      .toList()), 
           SectionTitle(title: 'Mas Populares'),
           ProductCarousel(products: Product.products
                      .where((product) => product.isPopular)
                      .toList()),           
        ],
      ),
    ); 
  }
}






