part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final List<ProductModel>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final CheckoutModel checkout;
  final PaymentMethod paymentMethod;

  CheckoutLoaded({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.paymentMethod = PaymentMethod.googlePay,
  }) : checkout = CheckoutModel(
          fullName: fullName,
          email: email,
          address: address,
          city: city,
          country: country,
          products: products,
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
        );

  @override
  List<Object> get props => [
        fullName ?? '',
        email ?? '',
        address ?? '',
        city ?? '',
        country ?? '',
        products ?? '',
        subtotal ?? '',
        deliveryFee ?? '',
        total ?? '',
        checkout,
        paymentMethod,
      ];
}
