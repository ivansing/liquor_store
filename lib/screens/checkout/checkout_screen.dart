import 'package:ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
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

                // if user object is nullable have to pass empty user object
                var user = state.user ?? User.empty;
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
                      title: 'Email',
                      initialValue: user.email,
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                              UpdateCheckout(
                                user:
                                    state.checkout.user!.copyWith(email: value),
                              ),
                            );
                      },
                    ),
                    CustomTextFormField(
                      title: 'Nombre Completo',
                      initialValue: user.fullName,
                        onChanged: (value) {
                          context.read<CheckoutBloc>().add(
                                UpdateCheckout(
                                  user: state.checkout.user!
                                      .copyWith(fullName: value),
                                ),
                              );
                        },
                        ),
                    const SizedBox(height: 20),
                    Text(
                      'INFORMACIÓN ENVIO',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      title: 'Dirección',
                      initialValue: user.address,
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                              UpdateCheckout(
                                user: state.checkout.user!
                                    .copyWith(address: value),
                              ),
                            );
                      },
                    ),
                    CustomTextFormField(
                      title: 'Ciudad',
                      initialValue: user.city,
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                              UpdateCheckout(
                                user:
                                    state.checkout.user!.copyWith(city: value),
                              ),
                            );
                      },
                    ),
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
