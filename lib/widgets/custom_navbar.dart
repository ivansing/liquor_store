import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black87,
      child: SizedBox(
        height: 70,
        child: (screen == '/product')
            ? AddToCartNavBar(product: product!)
            : (screen == '/cart')
                ?  const GoToCheckoutNavBar()
                : (screen == '/checkout')
                    ? const OrderNowNavBar()
                    : const HomeNavBar(),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon:const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/user');
            },
          )
        ]);
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {}),
        BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            return IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(
                      content: Text('Se agrego a tu lista de deseos'),
                    ),
                  );
                  context
                      .read<WishlistBloc>()
                      .add(AddtWishlistProduct(product));
                });
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                context.read<CartBloc>().add(AddProduct(product));
                const snackBar =  SnackBar(content: Text('Agregado al Carro'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pushNamed(context, '/cart');
              },
              child: Text(
                'Agregar al Carro',
                style: Theme.of(context).textTheme.headline3!,
              ),
            );
          },
        )
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          child: Text(
            'HACER EL CHECKOUT',
            style: Theme.of(context).textTheme.headline3!,
          ),
        )
      ],
    );
  }
}

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape:const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  context
                      .read<CheckoutBloc>()
                      .add(ConfirmCheckout(checkout: state.checkout));

                  Navigator.pushNamed(context, '/payment-selection');
                },
                child: Text(
                  'METODO DE PAGO',
                  style: Theme.of(context).textTheme.headline3!,
                ),
              );
            } else {
              return const Text('Algo salio mal.');
            }
          },
        )
      ],
    );
  }
}
