import 'package:e_commerce_full/models/product_model.dart';
import 'package:e_commerce_full/views/cart/widgets/order_summary_widget.dart';
import 'package:e_commerce_full/views/home/home_view.dart';
import 'package:flutter/material.dart';

import 'widgets/order_summary_product.dart';

class ConfirmOrdersView extends StatelessWidget {
  const ConfirmOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Text(
          'Confirm Order',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 10,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Gorkem,',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 10),
              Text(
                'Thank you for purchasing!',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              Text(
                'ORDER CODE: #k321-ekd3',
                style: Theme.of(context).textTheme.headline5,
              ),
              const OrderSummaryWidget(),
              const SizedBox(height: 20),
              Text(
                'ORDER DETAILS',
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(thickness: 2),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  OrderSummaryProductWidget(
                    productModel: ProductModel.products[0],
                    quantity: 2,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                  child: Text(
                    'Order Now',
                    textAlign: TextAlign.center,
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
      ),
    );
  }
}
