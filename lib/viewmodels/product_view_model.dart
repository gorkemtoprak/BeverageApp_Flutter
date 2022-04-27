import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_full/core/base/base_view_models.dart';
import 'package:e_commerce_full/models/product_model.dart';

class ProductViewModel extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductViewModel({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<ProductModel>> getAllProducts() {
    return _firebaseFirestore.collection('products').snapshots().map(
      (snapshot) {
        return snapshot.docs
            .map((doc) => ProductModel.fromSnapshot(doc))
            .toList();
      },
    );
  }
}
