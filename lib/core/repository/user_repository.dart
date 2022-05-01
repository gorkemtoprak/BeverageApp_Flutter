// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_full/models/user_model.dart';

import '../base/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  Stream<UserModel> getUser(String userId) {
    print('Getting user data from Cloud Firestore');
    return _firebaseFirestore.collection('users').doc(userId).snapshots().map(
      (snap) {
        return UserModel.fromSnapshot(snap);
      },
    );
  }

  @override
  Future<void> updateUser(UserModel user) async {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then(
          (value) => print('User document updated.'),
        );
  }
}
