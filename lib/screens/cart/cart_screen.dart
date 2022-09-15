import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Carrito'),
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(),
                                  elevation: 0),
                              child: Text(
                                'Agregar mas Articulos',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            itemCount: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                product: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .elementAt(index),
                                quantity: state.cart
                                    .productQuantity(state.cart.products)
                                    .values
                                    .elementAt(index),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    OrderSummary(),
                  ],
                ),
              ),
            );
          } else {
            return Text('Algo salio mal');
          }
        },
      ),
    );
  }
}
