import 'package:bloc/bloc.dart';
import 'package:e_commerce_full/models/cart_model.dart';
import 'package:e_commerce_full/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(AddProduct event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cartModel: CartModel(
              products: List.from((state as CartLoaded).cartModel.products)
                ..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cartModel: CartModel(
              products: List.from((state as CartLoaded).cartModel.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }
}
