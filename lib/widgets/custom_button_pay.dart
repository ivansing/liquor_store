import 'package:flutter/material.dart';


class CustomButtonPay extends StatelessWidget {
  final String title;
  const CustomButtonPay({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.bottomCenter,
      decoration:const BoxDecoration(color: Colors.black),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '');
                  
                },
                
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
     
  }

  
}

