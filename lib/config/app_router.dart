
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

import '../screens/category/category_screen.dart';
import '../screens/product/product_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Esta es la ruta: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route(); 

      case CartScreen.routeName:
        return CartScreen.route();  

      case ProductScreen.routeName:
        return ProductScreen.route();

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case CategoryScreen.routeName:
        return CategoryScreen.route();      

      default:
        return _errorRoute();
    }
  }
  
  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error')),
      )
      );
  }
} 