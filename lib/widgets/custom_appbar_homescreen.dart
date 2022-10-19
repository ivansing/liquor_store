import 'package:flutter/material.dart';

class CustomAppBarHomeScreen extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;

  const CustomAppBarHomeScreen(
      {Key? key, required this.title, this.automaticallyImplyLeading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
            )),
        iconTheme: const IconThemeData(color: Colors.black),
        /* actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/wishlist',
              );
            },
          )
        ], */
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
