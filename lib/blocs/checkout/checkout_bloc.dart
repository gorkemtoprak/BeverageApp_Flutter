import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_full/models/cart_model.dart';
import 'package:e_commerce_full/models/checkout_model.dart';
import 'package:e_commerce_full/models/product_model.dart';
import 'package:e_commerce_full/viewmodels/checkout_view_model.dart';
import 'package:equatable/equatable.dart';

import '../../core/enums/payment_enums.dart';
import '../cart/cart_bloc.dart';
import '../payment/payment_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final PaymentBloc _paymentBloc;
  final CheckOutViewModel _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _paymentSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required PaymentBloc paymentBloc,
    required CheckOutViewModel checkoutRepository,
  })  : _cartBloc = cartBloc,
        _paymentBloc = paymentBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutLoaded(
                  products: (cartBloc.state as CartLoaded).cartModel.products,
                  deliveryFee: (cartBloc.state as CartLoaded)
                      .cartModel
                      .deliveryFeeString,
                  subtotal:
                      (cartBloc.state as CartLoaded).cartModel.subtotalString,
                  total: (cartBloc.state as CartLoaded).cartModel.totalString,
                )
              : CheckoutLoading(),
        ) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);

    _cartSubscription = _cartBloc.stream.listen(
      (state) {
        if (state is CartLoaded) {
          add(
            UpdateCheckout(cart: state.cartModel),
          );
        }
      },
    );

    _paymentSubscription = _paymentBloc.stream.listen((state) {
      if (state is PaymentLoaded) {
        add(
          UpdateCheckout(paymentMethod: state.paymentMethod),
        );
      }
    });
  }

  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState> emit) {
    if (state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subtotal: event.cart?.subtotalString ?? state.subtotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          paymentMethod: event.paymentMethod ?? state.paymentMethod,
        ),
      );
    }
  }

  void _onConfirmCheckout(
      ConfirmCheckout event, Emitter<CheckoutState> emit) async {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
