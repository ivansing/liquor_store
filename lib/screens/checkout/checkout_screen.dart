import 'package:ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'INFORMACIÓN USUARIO',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 30),
                    CustomTextFormField(
                        onChanged: (value) {
                          context.read<CheckoutBloc>().add(
                                UpdateCheckout(email: value),
                              );
                        },
                        context: context,
                        title: 'Email'),
                        
                    CustomTextFormField(
                        onChanged: (value) {
                          context.read<CheckoutBloc>().add(
                                UpdateCheckout(fullName: value),
                              );
                        },
                        context: context,
                        title: 'Nombre Completo'),
                    SizedBox(height: 20),
                    Text(
                      'INFORMACIÓN ENVIO',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                        onChanged: (value) {
                          context.read<CheckoutBloc>().add(
                                UpdateCheckout(address: value),
                              );
                        },
                        context: context,
                        title: 'Dirección'),
                    CustomTextFormField(
                        onChanged: (value) {
                          context.read<CheckoutBloc>().add(
                                UpdateCheckout(city: value),
                              );
                        },
                        context: context,
                        title: 'Ciudad'),
                    SizedBox(height: 20),
                    /* Container(
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(color: Colors.black),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/payment-selection');
                                },
                                child: Text(
                                  'SELECIONAR UN METODO DE PAGO',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), */
                    SizedBox(height: 30),
                    Text(
                      'RESUMEN PEDIDO',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    OrderSummary(),
                  ],
                );
              } else {
                return Text('Algo salio mal.');
              }
            },
          ),
        ),
      ),
    );
  }
}
