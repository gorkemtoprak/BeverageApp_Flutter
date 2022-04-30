import 'package:e_commerce_full/views/checkout/checkout_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckoutView(),
                  ));
            },
            icon: const Icon(
              Icons.receipt_long_sharp,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(),
    );
  }
}
