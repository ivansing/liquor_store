import 'package:ecommerce_app/models/category_model.dart';


import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Esta es la ruta: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      /* case HomeScreen.routeName:
        return HomeScreen.route(); */

      case SplashScreen.routeName:
        return SplashScreen.route();

      case SignupScreen.routeName:
        return SignupScreen.route();  

      case LoginScreen.routeName:
        return LoginScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case CategoryScreen.routeName:
        return CategoryScreen.route(category: settings.arguments as Category);

      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      case OrderConfirmation.routeName:
        return OrderConfirmation.route();

      case PaymentSelection.routeName:
        return PaymentSelection.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text('Error')),
            ));
  }
}
