import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_full/core/base/base_view_models.dart';
import 'package:e_commerce_full/models/category_model.dart';

class CategoryViewModel extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryViewModel({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<CategoryModel>> getAllCategories() {
    return _firebaseFirestore.collection('categories').snapshots().map(
      (snapshot) {
        return snapshot.docs
            .map((doc) => CategoryModel.fromSnapshot(doc))
            .toList();
      },
    );
  }
}
