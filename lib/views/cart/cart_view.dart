import 'package:e_commerce_full/views/cart/widgets/cart_product_widget.dart';
import 'package:e_commerce_full/views/cart/widgets/order_summary_widget.dart';
import 'package:e_commerce_full/views/checkout/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../shared/error_widget.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
                bottom: 120,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.cartModel.freeDeliveryString,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutView(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: const RoundedRectangleBorder(),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Go to Checkout',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.receipt_long_sharp,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cartModel
                          .productQuantity(state.cartModel.products)
                          .keys
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartProductWidget(
                          productModel: state.cartModel
                              .productQuantity(state.cartModel.products)
                              .keys
                              .elementAt(index),
                          quantity: state.cartModel
                              .productQuantity(state.cartModel.products)
                              .values
                              .elementAt(index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const OrderSummaryWidget(),
                ],
              ),
            );
          } else {
            return const CustomErrorWidget();
          }
        },
      ),
    );
  }
}
