import 'package:flutter/material.dart';
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
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
           CustomButtonPay(title: 'Tarjeta'),
           SizedBox(height: 10),
           CustomButtonPay(title: 'Contraentrega'),
        ],
      ),
    );
  }
}
