// import 'package:e_commerce_full/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';

// class ApplePayWidget extends StatelessWidget {
//   final List<ProductModel>? products;
//   final String? total;

//   const ApplePayWidget({
//     Key? key,
//     this.products,
//     this.total,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var _paymentItems = const [
//       PaymentItem(
//         label: 'Total',
//         amount: '99.99',
//         status: PaymentItemStatus.final_price,
//       ),
//     ];

//     return SizedBox(
//       width: MediaQuery.of(context).size.width - 50,
//       child: ApplePayButton(
//         paymentConfigurationAsset: 'apple_pay.json',
//         onPaymentResult: onApplePayResult,
//         paymentItems: _paymentItems,
//         style: ApplePayButtonStyle.black,
//         type: ApplePayButtonType.inStore,
//         margin: const EdgeInsets.only(top: 10),
//         loadingIndicator: const CircularProgressIndicator(),
//       ),
//     );
//   }

//   void onApplePayResult(paymentResult) {
//     debugPrint(paymentResult.toString());
//   }
// }
