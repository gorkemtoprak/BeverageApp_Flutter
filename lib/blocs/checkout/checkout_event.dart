part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final CartModel? cart;
  final PaymentMethod? paymentMethod;

  const UpdateCheckout({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.cart,
    this.paymentMethod,
  });

  @override
  List<Object> get props => [
        fullName ?? '',
        email ?? '',
        address ?? '',
        city ?? '',
        country ?? '',
        cart ?? '',
        paymentMethod ?? '',
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final CheckoutModel checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object> get props => [checkout];
}
