import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_navbar.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INFORMACIÓN USUARIO',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFormField(emailController, context, 'Email'),
            _buildTextFormField(nameController, context, 'Nombre Completo'),
            Text(
              'INFORMACIÓN ENVIO',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFormField(addressController, context, 'Dirección'),
            _buildTextFormField(cityController, context, 'Ciudad'),
            Text(
              'RESUMEN PEDIDO',
              style: Theme.of(context).textTheme.headline3,
            ),
            OrderSummary(),
            /*  Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: Text(
                      'HACER PEDIDO',
                      style: Theme.of(context).textTheme.headline3!,
                    ),
                  )
                ],
              ),
            ) */
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
