import 'package:e_commerce_full/models/category_model.dart';
import 'package:e_commerce_full/models/product_model.dart';

import '../../models/checkout_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<CategoryModel>> getAllCategories();
}

abstract class BaseProductRepository {
  Stream<List<ProductModel>> getAllProducts();
}

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(CheckoutModel checkout);
}
