import 'package:e_commerce_full/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/cart/cart_bloc.dart';

class CartProductWidget extends StatelessWidget {
  final ProductModel? productModel;
  final int? quantity;
  const CartProductWidget({
    Key? key,
    this.productModel,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.network(
            productModel!.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel!.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '\$${productModel!.price}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(RemoveProduct(productModel!));
                    },
                    icon: const Icon(Icons.remove_circle_outline_rounded),
                  ),
                  Text(
                    '$quantity',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddProduct(productModel!));
                    },
                    icon: const Icon(Icons.add_circle_outline_rounded),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
