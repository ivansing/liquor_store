import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/models/test_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => OrderConfirmation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Confirma Orden'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset('assets/svgs/order_image.svg'),
                ),
                Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Tu orden se completo',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CODIGO DE ORDEN: 345346',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Gracias por su compra en nuestra tienda.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'CODIGO DE ORDEN: 345346',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const OrderSummary(),
                  const SizedBox(height: 20),
                  Text(
                    'DETALLES DE LA ORDEN',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 5),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CartLoaded) {
                        Map cart =
                            state.cart.productQuantity(state.cart.products);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [],
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1.0,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: cart.keys.length,
                                        itemBuilder: (context, index) {
                                          return ProductCard.orderDetails(
                                            product: cart.keys.elementAt(index),
                                            quantity:
                                                cart.values.elementAt(index),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Text('Algo salio mal');
                      }
                    },
                  ),
                  /* BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return Center(child: CircularProgressIndicator(),);
                      } 
                      if (state is CartLoaded) {
                        
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          itemCount: cart.keys.length,
                          itemBuilder: (context, index) {
                            return ProductCard.cart(
                              product: cart.keys.elementAt(index),
                              quantity: cart.values.elementAt(index),
                            );
                          },
                        ),
                      );
                    },
                  ), */

                  /* ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProductCard.summary(
                        product: Product.products[1],
                        quantity: 2,
                      ),
                      ProductCard.summary(
                        product: Product.products[2],
                        quantity: 2,
                      )
                    ],
                  )  */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
