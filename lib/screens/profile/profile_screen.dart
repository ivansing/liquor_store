import 'package:ecommerce_app/models/models.dart';

import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarProfile(title: 'Perfil'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'INFORMACIÓN CUENTA',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const SizedBox(height: 10),
            Text('Nombre: Ivan Duarte', style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 10),
            Text('Email: ivan@ivan.com', style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 10),
            Text('Dirección: Cra 81 23g-80 Modelia', style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 10),
            Text('Ciudad: Bogota', style: Theme.of(context).textTheme.headline3),
          ],
        ),
      ),
    );
  }
}
