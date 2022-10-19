import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard.category({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isWishlist = false,
    this.isCategory = true,
    this.isCart = false,
    this.isSummary = false,
    this.isOrderDetails = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const ProductCard.cart({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isWishlist = false,
    this.isCategory = false,
    this.isCart = true,
    this.isSummary = false,
    this.isOrderDetails = false,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  const ProductCard.wishlist({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 1.1,
    this.height = 150,
    this.isWishlist = true,
    this.isCategory = false,
    this.isCart = false,
    this.isSummary = false,
    this.isOrderDetails = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const ProductCard.orderDetails({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isWishlist = false,
    this.isCategory = false,
    this.isCart = false,
    this.isSummary = false,
    this.isOrderDetails = true,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  const ProductCard.summary({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isWishlist = false,
    this.isCategory = false,
    this.isCart = false,
    this.isSummary = true,
    this.isOrderDetails = false,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  final Product product;
  final int? quantity;
  final double widthFactor;
  final double height;
  final bool isCategory;
  final bool isCart;
  final bool isWishlist;
  final bool isSummary;
  final bool isOrderDetails;
  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double adjWidth = width / widthFactor;

    return InkWell(
      onTap: () {
        if (isCategory || isWishlist) {
          Navigator.pushNamed(
            context,
            '/product',
            arguments: product,
          );
        }
      },
      child: isCart || isSummary 
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ProductImage(
                    adjWidth: 100,
                    product: product,
                    height: height,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: ProductInformation(
                        product: product,
                        fontColor: fontColor,
                        quantity: quantity,
                        isOrderSummary: isSummary ? true : false,
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ProductActions(
                    product: product,
                    quantity: quantity,
                    isCart: isCart,
                    isCategory: isCategory,
                    isWishlist: isWishlist,
                    iconColor: iconColor,
                  ),
                ],
              ),
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ProductImage(
                  adjWidth: adjWidth,
                  product: product,
                  height: height,
                ),
                ProductBackground(
                  adjWidth: adjWidth,
                  widgets: [
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: ProductInformation(
                          product: product,
                          quantity: quantity,
                          fontColor: fontColor,
                          isOrderSummary: isSummary ? true : false,
                          
                        ),
                      ),
                    ),
                    ProductActions(
                      product: product,
                      isCart: isCart,
                      isCategory: isCategory,
                      isWishlist: isWishlist,
                      iconColor: iconColor,
                    ),
                  ],
                ),
                /* Positioned(
            top: 60,
            left: 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.2 - 10,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
              ),
            ),
          ) */
              ],
            ),
    );
  }
}

class ProductActions extends StatelessWidget {
  const ProductActions({
    Key? key,
    required this.product,
    required this.isCategory,
    required this.isWishlist,
    required this.isCart,
    required this.iconColor,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final bool isCategory;
  final bool isWishlist;
  final bool isCart;
  final int? quantity;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        if (state is CartLoaded) {
          IconButton addProduct = IconButton(
            icon: Icon(
              Icons.add_circle,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Agregado a tu carro!'),
                ),
              );
              context.read<CartBloc>().add(AddProduct(product));
            },
          );

          IconButton removeProduct = IconButton(
            icon: Icon(
              Icons.remove_circle,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Borrado del carro!'),
                ),
              );
              context.read<CartBloc>().add(RemovedProduct(product));
            },
          );

          IconButton removeFromWishlist = IconButton(
            icon: Icon(
              Icons.delete,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Borrado de la lista de deseos!'),
                ),
              );
              context.read<WishlistBloc>().add(RemovetWishlistProduct(product));
            },
          );

          Text productQuantity = Text(
            '$quantity',
            style: Theme.of(context).textTheme.headline4,
          );

          if (isCategory) {
            return Row(children: [addProduct]);
          } else if (isWishlist) {
            return Row(children: [addProduct, removeFromWishlist]);
          } else if (isCart) {
            return Row(children: [removeProduct, productQuantity, addProduct]);
          } else {
            return const SizedBox();
          }
        } else {
          return const Text('Algo salio mal.');
        }
      },
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    Key? key,
    required this.product,
    this.isOrderSummary = false,
    this.quantity,
    required Color fontColor,
  }) : super(key: key);

  final Product product;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        isOrderSummary
            ? Text(
                'Cant. $quantity',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              )
            : const SizedBox(),
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.adjWidth,
    required this.product,
    required this.height,
  }) : super(key: key);

  final double adjWidth;
  final double height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: adjWidth,
      height: height,
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductBackground extends StatelessWidget {
  const ProductBackground({
    Key? key,
    required this.adjWidth,
    required this.widgets,
  }) : super(key: key);

  final double adjWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: Colors.black38,
      ),
      child: Container(
        width: adjWidth - 20,
        height: 70,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(color: Colors.black38),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...widgets],
          ),
        ),
      ),
    );
  }
}
