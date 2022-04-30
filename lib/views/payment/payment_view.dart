import 'package:e_commerce_full/core/enums/payment_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pay/pay.dart';

import '../../blocs/payment/payment_bloc.dart';
import '../../shared/apple_pay.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

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
          'Payment',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 10,
          bottom: 120,
        ),
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is PaymentLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            if (state is PaymentLoaded) {
              return ListView(
                children: const [
                  // RawApplePayButton(
                  //   style: ApplePayButtonStyle.black,
                  //   type: ApplePayButtonType.buy,
                  //   onPressed: () {
                  //     context.read<PaymentBloc>().add(const SelectPaymentMethod(
                  //         paymentMethod: PaymentMethod.applePay));
                  //   },
                  // ),
                  // const ApplePayWidget(
                  //     // products: ProductModel.products,
                  //     // total: '10',
                  //     ),
                  SizedBox(
                    height: 20,
                  ),
                  // RawGooglePayButton(
                  //   style: GooglePayButtonStyle.black,
                  //   type: GooglePayButtonType.buy,
                  //   onPressed: () {
                  //     context.read<PaymentBloc>().add(const SelectPaymentMethod(
                  //         paymentMethod: PaymentMethod.googlePay));
                  //   },
                  // ),
                  // GooglePayWidget()
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
