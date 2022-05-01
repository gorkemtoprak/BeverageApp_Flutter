import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePayWidget extends StatelessWidget {
  const GooglePayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _paymentItems = const [
      PaymentItem(
        label: 'Total',
        amount: '99.99',
        status: PaymentItemStatus.final_price,
      ),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: GooglePayButton(
        paymentConfigurationAsset: 'google_pay.json',
        onPaymentResult: onGooglePayResult,
        paymentItems: _paymentItems,
        style: GooglePayButtonStyle.black,
        type: GooglePayButtonType.pay,
        margin: const EdgeInsets.only(top: 10),
        loadingIndicator: const CircularProgressIndicator(),
      ),
    );
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }
}
