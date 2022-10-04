import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ExpansionDetailsText extends StatelessWidget {
  const ExpansionDetailsText({
    Key? key,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            initiallyExpanded: false,
            title: Text(title1, style: Theme.of(context).textTheme.headline3),
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      title2,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      child: submitBotton(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ElevatedButton submitBotton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: () {
          context.read()<PaymentBloc>().add(SelectPaymentMethod(paymentMethod: PaymentMethod.credit_card));
          Navigator.pushNamed(context, '/order-confirmation');
        },
        child: Text(
          'Pagar',
          style: Theme.of(context).textTheme.headline3!,
        ));
  }
}
