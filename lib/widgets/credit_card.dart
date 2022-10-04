import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:pay/pay.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.total,
    required this.products,
  }) : super(key: key);

  final String total;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    var _paymentItems = products
        .map((product) => PaymentItem(
            label: product.name,
            amount: product.price.toString(),
            type: PaymentItemType.item,
            status: PaymentItemStatus.final_price))
        .toList();

    _paymentItems.add(
      PaymentItem(
        label: "Total",
        amount: total,
        type: PaymentItemType.total,
        status: PaymentItemStatus.final_price,
      ),
    );

    void onCreditCardResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: const CreditCard(products: [], total: '',),
    );
  }
}
