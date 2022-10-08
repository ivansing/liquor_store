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
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(
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
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 20),
                    Text(
                      'INFORMACIÓN ENVIO',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    const SizedBox(height: 30),
                    Text(
                      'RESUMEN PEDIDO',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const OrderSummary(),
                  ],
                );
              } else {
                return const Text('Algo salio mal.');
              }
            },
          ),
        ),
      ),
    );
  }
}
