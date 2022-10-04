import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

class PaymentSelection extends StatelessWidget {
  static const String routeName = '/payment-selection';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => PaymentSelection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Selección Pago'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PaymentLoaded) {
            return ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    title: Text('Tarjeta Credito',
                        style: Theme.of(context).textTheme.headline3),
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.read<PaymentBloc>().add(
                                      SelectPaymentMethod(
                                          paymentMethod:
                                              PaymentMethod.credit_card),
                                    );
                                Navigator.pop(context);
                              },
                              child: Text('Pagar'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    title: Text('Nequi',
                        style: Theme.of(context).textTheme.headline3),
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            ElevatedButton(
                              onPressed: null,
                              child: Text('Pagar'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    title: Text('Daviplata',
                        style: Theme.of(context).textTheme.headline3),
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            ElevatedButton(
                              onPressed: null,
                              child: Text('Pagar'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    title: Text('Paypal',
                        style: Theme.of(context).textTheme.headline3),
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            ElevatedButton(
                              onPressed: null,
                              child: Text('Pagar'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Text('Algo salio mal');
          }
        },
      ),
    );
  }
}

/* ElevatedButton submitBotton(BuildContext context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.blue),
      onPressed: () {
        Navigator.pushNamed(context, '/order-confirmation');
      },
      child: Text(
        'Pagar',
        style: Theme.of(context).textTheme.headline3!,
      ));
} */
