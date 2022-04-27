import 'package:e_commerce_full/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProductWidget extends StatelessWidget {
  final ProductModel? productModel;
  const CartProductWidget({Key? key, this.productModel}) : super(key: key);

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
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_circle_outline_rounded),
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline_rounded),
              ),
            ],
          )
        ],
      ),
    );
  }
}
