import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class OrderSummaryProductWidget extends StatelessWidget {
  final ProductModel? productModel;
  final int? quantity;
  const OrderSummaryProductWidget({
    Key? key,
    this.productModel,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          productModel!.imageUrl,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel!.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Qty. $quantity',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            '\$${productModel!.price}',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }
}
